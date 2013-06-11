<?php

	$_SERVER['HTTP_X_REQUESTED_WITH'] = 'XMLHttpRequest';

	define('PATH', $_SERVER['DOCUMENT_ROOT']);
	include(PATH.'/core/ajax/ajax_core.php');

    if (!$inUser->id) {	cmsCore::halt(); }

	$component = cmsCore::request('component', 'str', '');

	if(!$inCore->isComponentInstalled($component)) { cmsCore::halt(); }

	$cfg = $inCore->loadComponentConfig($component);

	if(!$cfg['component_enabled']) { cmsCore::halt(); }

	$target_id = cmsCore::request('target_id', 'int', 0);

	$target = cmsCore::request('target', 'str', '');

	if (!isset($cfg['img_max'])) { $cfg['img_max'] = 50; }
	if (!isset($cfg['img_on'])) { $cfg['img_on'] = 1; }

	if (!$cfg['video_on']){ cmsCore::jsonOutput(array('error' => 'Загрузка видео запрещена!', 'msg' => ''), false); }

	if (cmsCore::getTargetCount($target_id) >= $cfg['img_max']){ cmsCore::jsonOutput(array('error' => 'Достигнут предел количества видео!', 'msg' => ''), false); }

	cmsCore::loadClass('upload_media');
	$inUploadMedia = cmsUploadMedia::getInstance();
	$inUploadMedia->upload_dir = PATH.'/upload/blogs/video/';
	$inUploadMedia->input_name = 'attach_video';
	$inUploadMedia->array_format = array('flv','mp4','mov','3gp','avi');

	$file = $inUploadMedia->uploadMedia();

	if (!$file){ cmsCore::jsonOutput(array('error' => 'Файл не загружен! Проверьте его тип, размер и права на запись в папку /upload/'.$component.'/video', 'msg' => ''), false); }

	$fileurl = '/upload/'.$component.'/video/'.$file['filename'];

	cmsCore::registerUploadImages($target_id, $target, $fileurl, $component);

	cmsCore::jsonOutput(array('error' => '', 'msg' => $fileurl), false);

?>