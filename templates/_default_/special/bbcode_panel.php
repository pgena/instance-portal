<?php
    if(!defined('VALID_CMS')) { die('ACCESS DENIED'); }
	$inUser = cmsUser::getInstance();
?>

<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[b]', '[/b]')" title="Жирный">
	<img src="/includes/bbcode/images/b.png" border="0" alt="Жирный" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[i]', '[/i]')" title="Курсив">
	<img src="/includes/bbcode/images/i.png" border="0" alt="Курсив" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[u]', '[/u]')"  title="Подчеркнутый">
	<img src="/includes/bbcode/images/u.png" border="0" alt="Подчеркнутый" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[s]', '[/s]')"  title="Зачеркнутый">
	<img src="/includes/bbcode/images/s.png" border="0" alt="Зачеркнутый" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[align=left]', '[/align]')" title="По левому краю">
	<img src="/includes/bbcode/images/align_left.png" border="0" alt="По левому краю" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[align=center]', '[/align]')" title="По центру">
	<img src="/includes/bbcode/images/align_center.png" border="0" alt="По центру" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[align=right]', '[/align]')" title="По правому краю">
	<img src="/includes/bbcode/images/align_right.png" border="0" alt="По правому краю" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[h2]', '[/h2]')" title="Средний заголовок">
	<img src="/includes/bbcode/images/h2.png" border="0" alt="Средний заголовок" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[h3]', '[/h3]')" title="Маленький заголовок">
	<img src="/includes/bbcode/images/h3.png" border="0" alt="Маленький заголовок" />
</a>
<a class="usr_bb_button" href="javascript:addTagQuote('<?php echo $field_id ?>')" title="Цитата">
	<img src="/includes/bbcode/images/quote.png" border="0" alt="Цитата" />
</a>
<a class="usr_bb_button" href="javascript:addTagUrl('<?php echo $field_id ?>')" title="Вставить ссылку">
	<img src="/includes/bbcode/images/url.png" border="0" alt="Вставить ссылку" />
</a>
<a class="usr_bb_button" href="javascript:addTagEmail('<?php echo $field_id ?>')" title="Вставить email">
	<img src="/includes/bbcode/images/email.png" border="0" alt="Вставить email" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[code=php]', '[/code]')" title="Вставить код">
	<img src="/includes/bbcode/images/code.png" border="0" alt="Вставить код" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[hide]', '[/hide]')" title="Вставить скрытый текст">
	<img src="/includes/bbcode/images/hide.png" border="0" alt="Вставить скрытый текст" />
</a>
<a class="usr_bb_button" href="javascript:addTag('<?php echo $field_id ?>', '[spoiler=Спойлер]', '[/spoiler]')" title="Вставить спойлер">
	<img src="/includes/bbcode/images/spoiler.png" border="0" alt="Вставить спойлер" />
</a>
<a class="usr_bb_button" href="javascript:void(0)" onclick="$('#smilespanel-<?php echo $field_id ?>').slideToggle('fast')" title="Вставить смайл">
	<img src="/includes/bbcode/images/smiles.png" border="0" alt="Вставить смайл" />
</a>

<a class="usr_bb_button" href="javascript:addTagVideo('<?php echo $field_id ?>')" title="Вставить видео из сети">
	<img src="/includes/bbcode/images/video.png" border="0" alt="Вставить видео" />
</a>
<a class="usr_bb_button" href="javascript:addTagAudio('<?php echo $field_id ?>')" title="Вставить аудио из сети">
	<img src="/includes/bbcode/images/audio.png" border="0" alt="Вставить mp3" />
</a>
<a class="usr_bb_button" href="javascript:addTagImage('<?php echo $field_id ?>')" title="Вставить картинку из Сети">
	<img src="/includes/bbcode/images/image_link.png" border="0" alt="Вставить картинку из Сети" />
</a>


<?php if ($component=='blogs'){ ?>
	
	<?php if ($inUser->id) { ?>
		
		<?php if ($videos){ ?>
			<a class="usr_bb_button" href="javascript:addVideo('<?php echo $field_id ?>')" title="Загрузить и вставить видео">
				<img src="/includes/bbcode/images/video_add.png" border="0" alt="Загрузить и вставить видео" />
			</a>
		<?php } ?>
		
		<?php if ($audios){ ?>
			<a class="usr_bb_button" href="javascript:addAudio('<?php echo $field_id ?>')" title="Загрузить и вставить аудио">
				<img src="/includes/bbcode/images/audio_add.png" border="0" alt="Загрузить и вставить аудио" />
			</a>
		<?php } ?>
		
		<?php if ($images){ ?>
			<a class="usr_bb_button" href="javascript:addImage('<?php echo $field_id ?>')" title="Загрузить и вставить фото">
				<img src="/includes/bbcode/images/image.png" border="0" alt="Загрузить и вставить фото" />
			</a>
		<?php } ?>
	
		<?php if ($videos){ ?>
			<div class="bb_add_photo" id="videoinsert" style="display:none;">
				<strong>Загрузить видео:</strong>
				<span id="fileInputContainerVideo">
					<input type="file" id="attach_video" name="attach_video"/>
				</span>
				<input type="button" name="goinsertvideo" value="Вставить" onclick="loadVideo('<?php echo $field_id ?>', '<?php echo $component ?>', '<?php echo $target ?>', '<?php echo $target_id ?>')" />
			</div>
		<?php } ?>
	
		<?php if ($audios){ ?>
			<div class="bb_add_photo" id="audioinsert" style="display:none;">
				<strong>Загрузить аудио:</strong>
				<span id="fileInputContainerAudio">
					<input type="file" id="attach_audio" name="attach_audio"/>
				</span>
				<input type="button" name="goinsertaudio" value="Вставить" onclick="loadAudio('<?php echo $field_id ?>', '<?php echo $component ?>', '<?php echo $target ?>', '<?php echo $target_id ?>')" />
			</div>
		<?php } ?>
	
		<?php if ($images){ ?>
			<div class="bb_add_photo" id="imginsert" style="display:none;">
				<strong>Загрузить фото:</strong>
				<span id="fileInputContainer">
					<input type="file" id="attach_img" name="attach_img"/>
				</span>
				<input type="button" name="goinsert" value="Вставить" onclick="loadImage('<?php echo $field_id ?>', '<?php echo $component ?>', '<?php echo $target ?>', '<?php echo $target_id ?>')" />
			</div>
		<?php } ?>
		
		<span class="ajax-loader" style="display:none">&nbsp;</span>
		
	<?php } ?>
<?php } ?>