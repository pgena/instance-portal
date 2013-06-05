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

function mod_latestafisha($module_id){

    $inCore = cmsCore::getInstance();
    $inDB   = cmsDatabase::getInstance();
    $cfg    = $inCore->loadModuleConfig($module_id);

    cmsCore::loadModel('afisha');
    $model = new cms_model_afisha();

    if (!isset($cfg['shownum'])){ $cfg['shownum'] = 5; }
    if (!isset($cfg['onlyvip'])){ $cfg['onlyvip'] = 0; }

    if ($cfg['cat_id'] != '-1') {
        if (!$cfg['subs']){
            $model->whereCatIs($cfg['cat_id']);
        } else {
            $cat = $inDB->get_fields('cms_afisha_cats', "id='{$cfg['cat_id']}'", 'NSLeft, NSRight');
            if(!$cat) { return false; }
            $model->whereThisAndNestedCats($cat['NSLeft'], $cat['NSRight']);
        }
    }
    // только ВИП
    if($cfg['onlyvip'] && !$cfg['butvip']){
        $model->whereVip(1);
    }
    // кроме ВИП
    if($cfg['butvip'] && !$cfg['onlyvip']){
        $model->whereVip(0);
    }
    $inDB->orderBy('i.is_vip', 'DESC, i.pubdate DESC');
    $inDB->limitPage(1, $cfg['shownum']);

    $items = $model->getAdverts(false, true, false, true);

    $smarty = $inCore->initSmarty('modules', 'mod_latestafisha.tpl');
    $smarty->assign('items', $items);
    $smarty->assign('cfg', $cfg);
    $smarty->display('mod_latestafisha.tpl');

    return true;

}
?>