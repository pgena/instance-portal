function getCaretPos(obj) {
	obj.focus();
	if (document.selection) { // IE
    var sel = document.selection.createRange();
    var clone = sel.duplicate();
    sel.collapse(true);
    clone.moveToElementText(obj);
    clone.setEndPoint('EndToEnd', sel);
    return clone.text.length;
  } else if (obj.selectionStart!==false) return obj.selectionStart; // Gecko
  else return 0;
}

function replaceSelectedText(obj,cbFunc,s_open, s_close){
	obj.focus();
	if (document.selection) {
		var s = document.selection.createRange();
		if (s.text) {
			eval("s.text="+cbFunc+"(s.text,s_open, s_close);");
			return true;
		}
	} else if (typeof(obj.selectionStart)=="number") {
        var start = obj.selectionStart;
        var end = obj.selectionEnd;
        eval("var rs = "+cbFunc+"(obj.value.substr(start,end-start),s_open, s_close);");
        obj.value = obj.value.substr(0,start)+rs+obj.value.substr(end);
		return true;
	} else {

    }
	return false;
}

function insertTag(s,s_open, s_close){
	return s_open + s + s_close;
}

function addSmile(tag, field_id){
	var txtarea = document.getElementById(field_id);
	var pos = getCaretPos(txtarea);
	txtarea.value = txtarea.value.substring(0,pos) + ' :' + tag + ': ' + txtarea.value.substring(pos,txtarea.value.length);
	$('#smilespanel-' + field_id).hide();
}

function addTag(field_id, s_open, s_close){
   var txtarea = document.getElementById(field_id);
   replaceSelectedText(txtarea,'insertTag',s_open, s_close);
   return;
}

function addTagUrl(field_id){
   var txtarea = document.getElementById(field_id);
   var link_url = prompt('Адрес ссылки (URL):');
   var link_name = prompt('Название ссылки (не обязательно):');
   var pos = getCaretPos(txtarea);
   if (link_url.length == 0) { return; }
   if (link_name.length > 0){txtarea.value = txtarea.value.substring(0,pos) + '[url='+link_url+']' + link_name + '[/url]'+ txtarea.value.substring(pos,txtarea.value.length);}
   else {txtarea.value = txtarea.value.substring(0,pos) +  '[url]' + link_url + '[/url]'+ txtarea.value.substring(pos,txtarea.value.length);}
   return;
}

function addTagImage(field_id){
   var txtarea = document.getElementById(field_id);
   var link_url = prompt('Адрес картинки (URL):');
   var pos = getCaretPos(txtarea);
   if (link_url.length == 0) { return; }
   txtarea.value = txtarea.value.substring(0,pos) +  '[img]' + link_url + '[/img]'+ txtarea.value.substring(pos+1,txtarea.value.length);
   return;
}

function addTagEmail(field_id){
   var txtarea = document.getElementById(field_id);
   var s_open = '[email]';
   var s_close = '[/email]';
   replaceSelectedText(txtarea,'insertTag',s_open, s_close);
   return;
}

function addNickname(obj){
   nickname = $(obj).attr('rel');
   var txtarea = document.getElementById('message');
   var pos = getCaretPos(txtarea);
   txtarea.value = txtarea.value.substring(0,pos) + ' [b]' + nickname + '[/b], ' + txtarea.value.substring(pos,txtarea.value.length);
   return;
}

function addTagAudio(field_id){
   var txtarea = document.getElementById(field_id);
   var link_url = prompt('Ссылка на файл:');
   var pos = getCaretPos(txtarea);
   if (link_url.length == 0) { return; }
   txtarea.value = txtarea.value.substring(0,pos) +  '[audio]' + link_url + '[/audio]'+ txtarea.value.substring(pos,txtarea.value.length);
   return;
}

function addTagVideo(field_id){
   var txtarea = document.getElementById(field_id);
   var link_url = prompt('Код видео или ссылка на файл:');
   var pos = getCaretPos(txtarea);
   if (link_url.length > 0){txtarea.value = txtarea.value.substring(0,pos) + '[video]' + link_url + '[/video]' + txtarea.value.substring(pos,txtarea.value.length);}
	return;

}


function addVideo(){
	$('#albumimginsert').hide();
	$('#imginsert').hide();
	$('#audioinsert').hide();
	$('#videoinsert').toggle();
}

function loadVideo(field_id, component, target, target_id){

	$(".ajax-loader").ajaxStart(function(){
		$(this).fadeIn();
		$('#videoinsert').hide();
	})
	.ajaxComplete(function(){
		$(this).hide();
	});

	$.ajaxFileUpload({

		url:'/core/ajax/videoinsert.php?component='+component+'&target='+target+'&target_id='+target_id,
		secureuri:false,
		fileElementId:'attach_video',
		dataType: 'json',
		success: function (data, status){
			$('#fileInputContainerVideo').html($('#fileInputContainerVideo').html());
			if(typeof(data.error) != 'undefined'){
				if(data.error != ''){
					alert('Ошибка: '+data.error);
				} else {
					videoLoaded(field_id, data.msg);
					alert('Видео добавлено');
				}
			}
		},
		error: function (data, status, e){
			alert('Ошибка! ' + e);
		}

	})

	return false;

}

function videoLoaded(field_id, data){
   var txtarea = document.getElementById(field_id);
   var txtval = txtarea.value;
   var pos = getCaretPos(txtarea);
   txtarea.value = txtval.substring(0,pos) + '[video]'+data+'[/video]' + txtval.substring(pos,txtval.length);
   return;
}


function addAudio(){
	$('#albumimginsert').hide();
	$('#imginsert').hide();
	$('#videoinsert').hide();
	$('#audioinsert').toggle();
}

function loadAudio(field_id, component, target, target_id){

	$(".ajax-loader").ajaxStart(function(){
		$(this).fadeIn();
		$('#audioinsert').hide();
	})
	.ajaxComplete(function(){
		$(this).hide();
	});

	$.ajaxFileUpload({

		url:'/core/ajax/audioinsert.php?component='+component+'&target='+target+'&target_id='+target_id,
		secureuri:false,
		fileElementId:'attach_audio',
		dataType: 'json',
		success: function (data, status){
			$('#fileInputContainerAudio').html($('#fileInputContainerAudio').html());
			if(typeof(data.error) != 'undefined'){
				if(data.error != ''){
					alert('Ошибка: '+data.error);
				} else {
					audioLoaded(field_id, data.msg);
					alert('Аудио добавлено');
				}
			}
		},
		error: function (data, status, e){
			alert('Ошибка! ' + e);
		}

	})

	return false;

}

function audioLoaded(field_id, data){
   var txtarea = document.getElementById(field_id);
   var txtval = txtarea.value;
   var pos = getCaretPos(txtarea);
   txtarea.value = txtval.substring(0,pos) + '[audio]'+data+'[/audio]' + txtval.substring(pos,txtval.length);
   return;
}


function addImage(){
	$('#albumimginsert').hide();
	$('#videoinsert').hide();
	$('#audioinsert').hide();
	$('#imginsert').toggle();
}

function loadImage(field_id, component, target, target_id){

	$(".ajax-loader").ajaxStart(function(){
		$(this).fadeIn();
		$('#imginsert').hide();
	})
	.ajaxComplete(function(){
		$(this).hide();
	});

	$.ajaxFileUpload({

		url:'/core/ajax/imginsert.php?component='+component+'&target='+target+'&target_id='+target_id,
		secureuri:false,
		fileElementId:'attach_img',
		dataType: 'json',
		success: function (data, status){
			$('#fileInputContainer').html($('#fileInputContainer').html());
			if(typeof(data.error) != 'undefined'){
				if(data.error != ''){
					alert('Ошибка: '+data.error);
				} else {
					imageLoaded(field_id, data.msg);
					alert('Изображение добавлено');
				}
			}
		},
		error: function (data, status, e){
			alert('Ошибка! ' + e);
		}

	})

	return false;

}

function imageLoaded(field_id, data){
   var txtarea = document.getElementById(field_id);
   var txtval = txtarea.value;
   var pos = getCaretPos(txtarea);
   txtarea.value = txtval.substring(0,pos) + '[IMG]'+data+'[/IMG]' + txtval.substring(pos,txtval.length);
   return;
}


function addTagQuote(field_id){
   var txtarea = document.getElementById(field_id);
   var q_text = '';
   q_text = prompt('Текст цитаты:');
   var q_user = prompt('Автор цитаты (не обязательно):');
   var pos = getCaretPos(txtarea);
   if (q_text=='') { return; }
   if (q_user.length > 0){txtarea.value = txtarea.value.substring(0,pos) + '[quote='+q_user+']' + q_text + '[/quote]' + txtarea.value.substring(pos+1,txtarea.value.length);}
   else {txtarea.value = txtarea.value.substring(0,pos) + '[quote]' + q_text + '[/quote]' + txtarea.value.substring(pos,txtarea.value.length);}
   return;

}

function insertAlbumImage(field_id){
   var path = $("#photolist option:selected").val();
   if (path){
       var txtarea = document.getElementById(field_id);
       var txtval = txtarea.value;
       var pos = getCaretPos(txtarea);
       txtarea.value = txtval.substring(0,pos) + '[IMG]/images/users/photos/medium/'+path+'[/IMG]' + txtval.substring(pos,txtval.length);
   }
   $('#albumimginsert').hide();
   return;

}

function addAlbumImage(){
	$('#imginsert').hide();
	$('#videoinsert').hide();
	$('#audioinsert').hide();
	$('#albumimginsert').toggle();
}

function addTagCut(field_id){
   var txtarea = document.getElementById(field_id);
   var cut_text = prompt('Заголовок ссылки на полный текст поста:', 'Читать далее...');
   var pos = getCaretPos(txtarea);
   if (cut_text.length > 0){ txtarea.value = txtarea.value.substring(0,pos) + '[cut=' + cut_text + ']' + txtarea.value.substring(pos,txtarea.value.length);}
	return;
}
