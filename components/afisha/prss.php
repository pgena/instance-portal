<?php
/******************************************************************************/
//                                                                            //
//                             InstantCMS v1.10                               //
//                        http://www.instantcms.ru/                           //
//                                                                            //
//                   written by InstantCMS Team, 2007-2012                    //
//                produced by InstantSoft, (www.instantsoft.ru)               //
//                                                                            //
//                        LICENSED BY GNU/GPL v2                              //
//                                                                            //
/******************************************************************************/

if(!defined('VALID_CMS')) { die('ACCESS DENIED'); }
	
function rss_afisha($item_id, $cfg){

	$inDB = cmsDatabase::getInstance();

    cmsCore::loadModel('afisha');
    $model = new cms_model_afisha();

	if(!$model->config['component_enabled']) { return false; }

    global $_LANG;

	$channel = array();
	$items   = array();

	if ($item_id && preg_match('/^([0-9]+)$/ui', $item_id)) {

		$cat = $model->getCategory($item_id);
		if(!$cat) { return false; }

		$model->whereCatIs($cat['id']);

		$channel['title']       = $cat['title'];
		$channel['description'] = preg_replace ("'&([a-z]{2,5});'iu", '', $cat['description']);
		$channel['link']        = HOST.'/afisha/'.$cat['id'];

	} else {

		$channel['title'] = $_LANG['AFISHA'];
		$channel['description'] = $_LANG['AFISHA'];
		$channel['link'] = HOST;

	}

	$inDB->orderBy('pubdate', 'DESC');

	$inDB->limit($cfg['maxitems']);

	$advs = $model->getAdverts(false, false, false, true);

	if($advs){
		foreach($advs as $item){
	
			$item['link']     = HOST.'/afisha/read'.$item['id'].'.html';
			$item['comments'] = $item['link'].'#c';				
			$item['category'] = $item['cat_title'];
			$item['description'] = mb_substr(strip_tags($item['content']), 0, 250). '...';
			$image_file = PATH.'/images/afisha/medium/'.$item['file'];
			$image_url  = HOST.'/images/afisha/medium/'.$item['file'];
			$item['image'] = file_exists($image_file) ? $image_url : '';
			$item['size']  = round(filesize($image_file));
			$items[] = $item;
	
		}
	}

	return array('channel' => $channel,
				 'items' => $items);

}


?>