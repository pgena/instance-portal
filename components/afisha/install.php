<?php

// ========================================================================== //
//                                                                            //
//                         Программа телепередач, v1.0                        //
//                                                                            //
//                      Copyright (C) 2012 Preventiva LLC                     //
//                     http://www.instantcms.ru/users/Anor                    //
//                                                                            //
// ========================================================================== //

if (!defined('VALID_CMS')) {
    die('ACCESS DENIED');
}

function info_component_afisha() {

    $_component['title'] = 'Афиша';
    $_component['description'] = 'Афиша';
    $_component['link'] = 'afisha';
    $_component['author'] = 'asa_ua';
    $_component['internal'] = '0';
    $_component['version'] = '1.0';

    return $_component;
}

function install_component_afisha() {

    return true;
}

?>