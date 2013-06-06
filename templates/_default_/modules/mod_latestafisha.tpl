{if $items}
<ul class="new_afisha_items">
	{foreach key=tid item=item from=$items}
		<li {if $item.is_vip}class="vip"{/if}>
            <a href="/afisha/read{$item.id}.html">{$item.title}</a> &mdash; {$item.fpubdate} {if $cfg.showcity}- <span class="board_city">{$item.city}</span>{/if}
		</li>
	{/foreach}
</ul>
{else}
<p>{$LANG.LATESTBOARD_NOT_ADV}</p>
{/if}
