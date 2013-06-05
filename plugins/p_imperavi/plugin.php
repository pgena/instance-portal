<?php

class p_imperavi extends cmsPlugin {

// ==================================================================== //

    public function __construct(){
        
        parent::__construct();

        $this->info['plugin']           = 'p_imperavi';
        $this->info['title']            = 'Imperavi';
        $this->info['description']      = 'Визуальный редактор';
        $this->info['author']           = 'Имперави';
        $this->info['version']          = '6.1.1';
        $this->info['type']             = 'wysiwyg';

        $this->events[]                 = 'INSERT_WYSIWYG';

    }

// ==================================================================== //

    public function install(){

        return parent::install();

    }

// ==================================================================== //

    public function upgrade(){

        return parent::upgrade();

    }

// ==================================================================== //

    public function execute($event, $item){

        parent::execute();
		$inUser = cmsUser::getInstance();
		ob_start();
		if (!$item['width']) { $item['width'] = '100%'; }
		if (!$item['height']) { $item['height'] = '300px'; }
		
		if (!preg_match('/([^0-9])/i', $item['width'])) { $item['width'] = $item['width'].'%'; }
		if (!preg_match('/([^0-9])/i', $item['height'])) { $item['height'] = $item['height'].'px'; }

		echo '<script type="text/javascript" src="/plugins/p_imperavi/imperavi/redactor.js"></script><link rel="stylesheet" href="/plugins/p_imperavi/imperavi/css/redactor.css" type="text/css" />';
		
        if (!$inUser->is_admin){
			echo '<script type="text/javascript">
					$(document).ready(
						function()
						{
							$(\'#'.$item['name'].'\').redactor({ focus: true, upload: \'/plugins/p_imperavi/imperavi/imginsert.php\', toolbar: \'classic\', resize: false });
						}
					);
				</script>';
        } else {
			echo '<script type="text/javascript">
					$(document).ready(
						function()
						{
							$(\'#'.$item['name'].'\').redactor({ focus: true, upload: \'/plugins/p_imperavi/imperavi/imginsert.php\', toolbar: \'original\' });
						}
					);
				</script>';
		}

		echo '<textarea id="'.$item['name'].'" name="'.$item['name'].'" style="width: '.$item['width'].'; height: '.$item['height'].';">'.$item['text'].'</textarea>';

		return ob_get_clean();
        
    }


// ==================================================================== //

}

?>
