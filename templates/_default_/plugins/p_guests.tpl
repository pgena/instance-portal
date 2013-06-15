{if $total}
		<div style="text-align: left;">
		{foreach key=id item=usr from=$guests}
			<div style="display: inline-block; text-align: center; padding: 10px;">
				<div><a href="{profile_url login=$usr.login}"><img src="{$usr.avatar}"></a></div>
				<div><a href="{profile_url login=$usr.login}">{$usr.nickname}</a></div>
				<div>{$usr.date}</div>
			</div>
		{/foreach}
		</div>
		<form action="" method="post" enctype="multipart/form-data" name="">
			<input type="submit" name="guestssbros" value="Очистить список" />
		</form>
{else}
	<h5>Ваш профиль еще никто не посещал, либо он был очищен.</h5>
{/if}