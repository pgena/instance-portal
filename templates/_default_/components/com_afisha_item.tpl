{* ================================================================================ *}
{* ==================== Просмотр объявления (на доске объявлений) ================= *}
{* ================================================================================ *}
<h1 class="con_heading">{$item.title}</h1>
<div class="af_item_details_full">
    {if $item.is_vip}
        <span class="af_item_is_vip">{$LANG.VIP_ITEM}</span>
    {/if}
	<span class="af_item_date">{$item.pubdate}</span>
    <span class="af_item_hits">{$item.hits}</span>
	{if $item.city}
		<span class="af_item_city">
			<a href="/afisha/city/{$item.enc_city}">{$item.city}</a>
		</span>
	{/if}
	{if $item.user}
		<span class="af_item_user">
			<a href="{profile_url login=$item.user_login}">{$item.user}</a>
		</span>
	{else}
    	<span class="af_item_user">{$LANG.BOARD_GUEST}</span>
	{/if}
	{if $item.moderator}
		<span class="af_item_edit"><a href="/afisha/edit{$item.id}.html">{$LANG.EDIT}</a></span>
        {if !$item.published && ($is_admin || $is_moder)}
        	<span class="af_item_publish"><a href="/afisha/publish{$item.id}.html">{$LANG.PUBLISH}</a></span>
        {/if}
		<span class="af_item_delete"><a href="/afisha/delete{$item.id}.html">{$LANG.DELETE}</a></span>
	{/if}
</div>

<table width="100%" height="" cellspacing="" cellpadding="0" class="af_item_full">
	<tr>
		{if $item.file && $cfg.photos}
			<td width="64">
					<img class="af_image_small" src="/images/afisha/medium/{$item.file}" border="0" alt="{$item.title|escape:'html'}"/>
			 </td>
		{/if}
		<td valign="top">
			<div class="af_text_full">
            	<p>{$item.content}</p>
                {if $formsdata}
                    <table width="100%" cellspacing="0" cellpadding="2" style="border-top:1px solid #C3D6DF; margin:5px 0 0 0">
                        {foreach key=tid item=form from=$formsdata}
                        {if $form.field}
                            <tr>
                                <td valign="top" width="140px">
                                    <strong>{$form.title}:</strong>
                                </td>
                                <td valign="top">
                                    {$form.field}
                                </td>
                            </tr>
                        {/if}
                        {/foreach}
                     </table>
                {/if}
            </div>
		</td>
	</tr>
</table>

<div class="af_links">
	{if $user_id}
		{if $item.user_id && $item.user_id != $user_id}
            {add_js file='components/users/js/profile.js'}
			<span class="af_message"><a class="ajaxlink" title="{$LANG.WRITE_MESS_TO_AVTOR}" href="javascript:void(0)" onclick="users.sendMess('{$item.user_id}', 0, this);return false;">{$LANG.WRITE_MESS_TO_AVTOR}</a></span>
		{/if}
	{/if}
    {if $item.user_login}
	<span class="af_author"><a href="/afisha/by_user_{$item.user_login}">{$LANG.ALL_AVTOR_ADVS}</a></span>
    {/if}
</div>

{if $cfg.comments}
    {comments target='afishaitem' target_id=$item.id}
{/if}
