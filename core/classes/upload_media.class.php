<?php

class cmsUploadMedia {

    private static $instance;

	public $upload_dir    = '';			// директория загрузки
	public $filename      = '';	        // имя файла
	public $input_name    = 'Filedata';	// название поля загрузки файла
	public $array_format  = array();	// массив разрешенных форматов

// ============================================================================ //

	private function __construct(){}

    private function __clone() {}

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }

// ============================================================================ //

    public function uploadMedia($old_file=''){

		if (!$this->upload_dir) { return false; }

		if ($_FILES[$this->input_name]['name']){

			$realfile = cmsDatabase::escape_string($_FILES[$this->input_name]['name']);

			$path_parts = pathinfo($realfile);
			$ext = mb_strtolower($path_parts['extension']);

			$realfile = mb_substr($realfile, 0, mb_strrpos($realfile, '.'));

			if (!in_array($ext, $this->array_format)) { return false; }

			$this->filename = $this->filename ? $this->filename : md5(time().$realfile).'.'.$ext;

			$uploadfile	= $this->upload_dir . $realfile;
			$uploadphoto = $this->upload_dir . $this->filename;

			$source	= $_FILES[$this->input_name]['tmp_name'];
			$errorCode = $_FILES[$this->input_name]['error'];

			if (cmsCore::moveUploadedFile($source, $uploadphoto, $errorCode)) {
				$this->deleteMediaFile($old_file);
				$file['filename'] = $this->filename;
				$file['realfile'] = $realfile;
			} else {
				return false;
			}

		} else {
			return false;
		}

        return $file;

    }

// ============================================================================ //

	public function deleteMediaFile($file=''){

		if (!($file && $this->upload_dir)) { return false; }

		@chmod($this->upload_dir . $file, 0777);
		@unlink($this->upload_dir . $file);

        return true;

    }

// ============================================================================ //

}
?>