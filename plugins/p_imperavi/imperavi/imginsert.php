<?php

    session_start();

	define("VALID_CMS", 1);
    define('PATH', $_SERVER['DOCUMENT_ROOT']);
    define('HOST', 'http://' . $_SERVER['HTTP_HOST']);

	include(PATH.'/core/cms.php');

    $inCore = cmsCore::getInstance();
	$inCore->loadClass('page');
    $inCore->loadClass('user');
	$inUser = cmsUser::getInstance();
	
    $inCore->loadClass('config');       //������������

	if (!$inUser->update()) { $inCore->halt(); }
	
	if(isset($_FILES['file'])) {
		
				$uploaddir  = PATH.'/images/photos/';
				$realfile   = $_FILES['file']['name'];
			
				$path_parts = pathinfo($realfile);
                $ext        = strtolower($path_parts['extension']);
				
				if ($ext == 'jpg' || $ext == 'jpeg' || $ext == 'gif' || $ext == 'bmp' || $ext == 'png'){
		
					$filename       = md5($realfile.time()).'imp.'.$ext;
					
					$uploadfile     = $uploaddir . $realfile;
					$uploadphoto    = $uploaddir . $filename;
			
					if (@move_uploaded_file($_FILES['file']['tmp_name'], $uploadphoto)) {		
						$inCore->includeGraphics();

					    $filepath	= $uploaddir . $filename;
						$filedir 	= $uploaddir;
						@img_add_watermark($filepath);
	                    @chmod(dirname($filedir), 0755);
						echo HOST.'/images/photos/'.$filename;
					} else { 
						echo	'������: ���� �� ��������! ��������� ��� ��� � ������';
					} 
					
				} else { 
						echo	'������: �������� ��� �����! ���������� ����: jpg, jpeg, gif, png, bmp';
				} //filetype

	} else { 	
			echo '������: ���� �� ��������';
	 }
	
	return;
?>