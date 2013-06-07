<input type="hidden" name="target_id" value="{$target_id}" />
<input type="hidden" name="component" value="{$component}" />

{if $total}

		<a class="myButton" onclick="$('#one').slideToggle(1);$('#two').slideToggle(1);$('#usr_wall_text').slideToggle(1);$('#usr_wall_textmini').slideToggle(1);" href="javascript://" id="two">{$LANG.UNFOLDWALL}</a>
		<a class="myButton" style="display:none" onclick="$('#one').slideToggle(1);$('#two').slideToggle(1);$('#usr_wall_text').slideToggle(1);$('#usr_wall_textmini').slideToggle(1);" id="one" href="javascript://">{$LANG.FOLDWALL}</a> 
		
    {foreach key=id item=record from=$records}
        <div class="usr_wall_entry" id="wall_entry_{$record.id}">
            <div class="usr_wall_title"><a href="{profile_url login=$record.author_login}">{$record.author}</a>, {$record.fpubdate}{if $record.is_today} {$LANG.BACK}{/if}:</div>
            {if $my_profile || $record.author_id==$user_id || $is_admin}
                <div class="usr_wall_delete"><a class="ajaxlink" href="javascript:void(0)" onclick="deleteWallRecord('{$component}', '{$target_id}', '{$record.id}', '{csrf_token}');return false;">{$LANG.DELETE}</a></div>
            {/if}

            <table style="width:100%; margin-bottom:2px;" cellspacing="0" cellpadding="0">
            <tr>
                <td width="70" valign="top" align="center" style="text-align:center">
                    <div class="usr_wall_avatar">
                        <a href="{profile_url login=$record.author_login}"><img border="0" class="usr_img_small" src="{$record.avatar}" /></a>
                    </div>
                </td>
					<td id="usr_wall_text" style="display:none" width="" valign="top" class="usr_wall_text">{$record.content}</td>
					<td id="usr_wall_textmini" width="" valign="top" class="usr_wall_text">{$record.content|truncate:500}</td>
            </tr>
            </table>
        </div>
    {/foreach}

	{$pagebar}

{else}
    <p>{$LANG.NOT_POSTS_ON_WALL_TEXT}</p>
{/if}