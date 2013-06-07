<input type="hidden" name="target_id" value="{$target_id}" />
<input type="hidden" name="component" value="{$component}" />

{if $total}

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
				<td width="" valign="top" style="display:none;" class="usr_wall_text full">{$record.content}</td>
				<td width="" valign="top" class="usr_wall_text short">{$record.content|truncate:500}</td>
            </tr>
            </table>
			{if (($record.content|strlen > 500) || (strpos($record.content, '<img')))}<span class="toggelator">Развернуть</span>{/if}
        </div>
    {/foreach}

	{$pagebar}

{else}
    <p>{$LANG.NOT_POSTS_ON_WALL_TEXT}</p>
{/if}
{literal}
<script type="text/javascript">
	$('document').ready(function(){
		$('span.toggelator').click(function(event){
			var element = $(event.target);
			$('table td.usr_wall_text', $(element).parent()).toggle();
		})
	});
</script>
<style>
	.usr_wall_text.full { max-width:550px;}
	.usr_wall_text.short { max-height:150px; max-width:550px; overflow:hidden; display: inline-block;}
</style>
{/literal}