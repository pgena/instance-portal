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

    function routes_banners(){

        $routes[] = array(
                            '_uri'  => '/^banners\/([0-9]+)$/i',
                            'do'    => 'click',
                            1       => 'id'
                         );

        return $routes;

    }

?>
