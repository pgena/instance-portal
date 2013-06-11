$(function(){
	users = {
        cleanCat: function(link) {
            core.confirm('Вы действительно хотите очистить эту папку?', null, function(){
                window.location.href = link;
            });
        },
		sendMess: function(user_id, reply_id, link){
            name = $(link).attr('title');
			core.message(name);
			link = reply_id ? '/users/'+user_id+'/reply'+reply_id+'.html' : '/users/'+user_id+'/sendmessage.html';
			$.post(link, { }, function(data) {
				if(data.error == false) {
					$('#popup_ok').val(core.send).show();
					$('#popup_message').html(data.html);
					$('#popup_progress').hide();
				}
			}, 'json');
			$('#popup_ok').click(function(){
                to_id = $('#user_id option:selected').val();
                to_all   = $('input[name=massmail]:checked').length;
                to_group = $('input[name=send_to_group]').val();
                if (to_all==1 || to_group==1){ to_id = 1; }
                if(to_id > 0){
                    $('#send_msgform').attr('action', '/users/'+to_id+'/sendmessage.html');
                    $('#popup_ok').attr('disabled', 'disabled');
                    $('.ajax-loader').show();
                        var options = {
                            success: users.doSendMess
                        };
                    $('#send_msgform').ajaxSubmit(options);
                } else {
                    alert('Выберите адресата!');
                }
			});
		},
		doSendMess: function(result, statusText, xhr, $form){
			$('.ajax-loader').hide();
			$('.sess_messages').fadeOut();
			if(statusText == 'success'){
				if(result.error == false){
					$('#popup_message').html(result.text);
					$('#popup_ok, #popup_cancel').hide();
					$('#popup_close').show();
				} else {
					$('#error_mess').html(result.text);
					$('.sess_messages').fadeIn();
					$('#popup_ok').attr('disabled', '');
				}
			} else {
				core.alert(statusText, 'Ошибка');
			}
		},
		deleteMessage: function(msg_id) {
            $.post('/users/delmsg'+msg_id+'.html', { }, function(result){
                if(result.error == false){
                    $('#usr_msg_entry_id_'+msg_id).css('background', '#FFAEAE').fadeOut();
                    total_page = Number($('#msg_count').html());
					$('#msg_count').html(total_page-1);
                }
            }, 'json');
        },
		addFriend: function(user_id, link) {
            name = $(link).attr('title');
            core.message('Предложение дружбы');
            $('#popup_message').html('Отправить пользователю ' + name + ' предложение дружбы?');
            $('#popup_progress').hide();
            $('#popup_ok').show();
            $('#popup_ok').click(function() {
                $('#popup_panel span.ajax-loader').show();
                $('#popup_ok').attr('disabled','disabled');
                $.post('/users/'+user_id+'/friendship.html', { }, function(data) {
                    $('#popup_message').html(data.text);
                $('#popup_panel span.ajax-loader, #popup_ok, #popup_cancel').hide();
                $('#popup_close').show();
                }, 'json');
            });
        },
		acceptFriend: function(user_id, link) {
            msg_id = $(link).parents('div.usr_msg_entry').attr('id').replace('usr_msg_entry_id_','');
            $.post('/users/'+user_id+'/friendship.html', { }, function(data){
                users.deleteMessage(msg_id);
                if(data.error == false) {
                    core.alert(data.text, 'Уведомление');
                } else {
                    core.alert(data.text, 'Предупреждение');
                }
            }, 'json');
        },
		rejectFriend: function(user_id, link) {
            msg_id = $(link).parents('div.usr_msg_entry').attr('id').replace('usr_msg_entry_id_','');
            $.post('/users/'+user_id+'/nofriends.html', { }, function(data) {
                if(data.error == false) {
                    users.deleteMessage(msg_id);
                    core.alert(data.text, 'Уведомление');
                }
            }, 'json');
        },
		delFriend: function(user_id, link) {
            name = $(link).attr('title');
            core.message('Прекращение дружбы');
            $('#popup_message').html('Вы желаете прекратить дружбу с пользователем ' + name + '?');
            $('#popup_progress').hide();
            $('#popup_ok').show();
            $('#popup_ok').click(function() {
                $('.ajax-loader').show();
                $('#popup_ok').attr('disabled','disabled');
                $.post('/users/'+user_id+'/nofriends.html', { }, function(data) {
                    if (data.error == false) {
                        $('#popup_message').html(data.text);
                        $('.add_friend_ajax').show();
                        $('.del_friend_ajax').hide();
                        $('#friend_id_'+user_id).remove();
                    }
                    $('#popup_panel span.ajax-loader, #popup_ok, #popup_cancel').hide();
                    $('#popup_close').show();
                }, 'json');
            });
		},
		changeKarma: function(to_user_id, sign) {
			$.post('/users/karma/'+sign+'/'+to_user_id, { }, function(data) {
				$("#u_karma_cont").removeClass();
				$(".sign_link a").hide();
				if(data >= 0) {
					$("#u_karma_cont").addClass('value-positive');
				} else {
					$("#u_karma_cont").addClass('value-negative');
				}
				$("#u_karma").html(data).fadeOut().fadeIn();
			});
		}
	}
});


function userProfile(id, isOwner)
{
    this.cfg = {
        user: id,
        owner: isOwner,
        status:{
            wrapStatusId: '#usr_status_link',
            wrapTime: '.usr_status_date',
            wrapEditor: '#status_editor',
            textStatus: '#status_text',
            setTextInput: '#set_text',
            SaveElement: '#save_status',
            noStatus: 'изменить статус',
            noStatusClass: 'no_status',
            timeChanged: '// Только что'
        }
    }

    if(id){
        this.init();
    }

}

userProfile.prototype = {
    data: {
        status: ''
    },
    init: function(){
        if(this.cfg.owner){
            this.setStatus();
        } else {

        }
    },
    setStatus: function(){
        var that = this;
        $(this.cfg.status.wrapStatusId).click(function(){
            $(that.cfg.status.wrapEditor).fadeIn({duration: 120});
            $(that.cfg.status.setTextInput)[0].value = $(that.cfg.status.wrapStatusId).hasClass(that.cfg.status.noStatusClass) ? '' : $($(that.cfg.status.wrapStatusId)[0]).html();

            var firstClick = true;
            $(document).bind('click.changeStatus', function(e) {
                if (!firstClick && $(e.target).closest(that.cfg.status.wrapEditor).length == 0) {
                    $(that.cfg.status.wrapEditor).fadeOut();
                    $(document).unbind('click.changeStatus');
                }
                firstClick = false;
            });
        });

        $(this.cfg.status.SaveElement).click(function(){
            $.post('/components/users/ajax/status.php', {'status': $(that.cfg.status.setTextInput)[0].value, 'id': that.cfg.user});
            var newStatus = $(that.cfg.status.setTextInput)[0].value;
                if(newStatus){
                    $($(that.cfg.status.wrapStatusId)[0]).html(newStatus);
                    $(that.cfg.status.wrapStatusId).removeClass(that.cfg.status.noStatusClass);
                    $(that.cfg.status.wrapTime).html(that.cfg.status.timeChanged);
                } else {
                    $($(that.cfg.status.wrapStatusId)[0]).html(that.cfg.status.noStatus);
                    $(that.cfg.status.wrapStatusId).addClass(that.cfg.status.noStatusClass);
                    $(that.cfg.status.wrapTime).html('');
                }
                $(that.cfg.status.wrapEditor).fadeOut();
        });

    }

}
