{* ================================================================================ *}
{* ========================== Cписок [под]рубрик афиши ============================ *}
{* ================================================================================ *}
{if $category.is_can_add || $root_id==$category.id}
<div class="float_bar">
	<table cellpadding="2" cellspacing="0">
		<tr><td><img src="/components/afisha/images/add.gif" border="0"/></td>
		<td><a href="/afisha/{if $root_id!=$category.id}{$category.id}/{/if}add.html">{$LANG.ADD_ADV}</a></td></tr>
	</table>
</div>
{/if}

<h1 class="con_heading">{$pagetitle} <a href="/rss/afisha/{if $root_id==$category.id}all{else}{$category.id}{/if}/feed.rss" title="{$LANG.RSS}"><img src="/images/markers/rssfeed.png" border="0" alt="{$LANG.RSS}"/></a></h1>

{if $cats}
	<table class="afisha_categorylist" cellspacing="3" width="100%" border="0">
		{assign var="col" value="1"}	
		{foreach key=tid item=cat from=$cats}			
			{if $col==1} <tr> {/if}
				<td width="30" valign="top">
                    <img class="af_cat_main_icon" src="/upload/afisha/cat_icons/{$cat.icon}" border="0" />
                </td>
				<td valign="top" class="af_cat_cell">
					<div class="af_cat_main_title"><a href="/afisha/{$cat.id}">{$cat.title}</a> ({$cat.content_count})</div>					
					{if $cat.description} 
						<div class="af_cat_main_desc">{$cat.description}</div>
					{/if}					
					<div class="af_cat_main_obtypes">{$cat.ob_links}</div>
				</td>
			{if $col==$maxcols} </tr> {assign var="col" value="1"} {else} {math equation="x + 1" x=$col assign="col"} {/if}
		{/foreach}
		
		{if $col>1} 
			<td colspan="{math equation="x - y + 1" x=$col y=$maxcols}">&nbsp;</td></tr>
		{/if}
	</table>
{/if}
{if $category.description}
<p class="usr_photos_notice">{$category.description}</p>
{/if}