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

	define('VALID_CMS', 1);

    define('PATH', $_SERVER['DOCUMENT_ROOT']);
    define('HOST', 'http://' . $_SERVER['HTTP_HOST']);

    header('Content-Type: text/html; charset=utf-8');
    include('../core/cms.php');

    cmsCore::loadClass('config');
    $inConf = cmsConfig::getInstance();

    //Минимальная версия PHP
    $php_req = array();
    $php_req['major']   = '5';
    $php_req['minor']   = '2';
    $php_req['release'] = '0';

    $php_req_ver = $php_req['major'] * 10000 + $php_req['minor'] * 100 + $php_req['release'];

    //Список необходимых расширений PHP
    $ext_req = array();
    $ext_req['mbstring']  = 'mbstring';
    $ext_req['iconv']     = 'iconv';
    $ext_req['GD']        = 'gd';
    $ext_req['SimpleXML'] = 'simplexml';

	if (cmsCore::inRequest('install')){

		$msg = '';

        $_CFG['sitename']  = cmsCore::request('sitename', 'html', 'Мой сайт');
        $_CFG['db_host']   = cmsCore::request('db_server', 'html', '');
        $_CFG['db_base']   = cmsCore::request('db_base', 'html', '');
        $_CFG['db_user']   = cmsCore::request('db_user', 'html', '');
        $_CFG['db_pass']   = cmsCore::request('db_password', 'html', '');
        $_CFG['db_prefix'] = cmsCore::request('db_prefix', 'html', '');

        $admin_login    = cmsCore::request('admin_login', 'html', '');
        $admin_password = cmsCore::request('admin_password', 'html', '');

		if(!$_CFG['db_host']) { $msg .= 'Необходимо указать сервер БД!<br/>'; }
		if(!$_CFG['db_base']) { $msg .= 'Необходимо указать название БД!<br/>'; }
		if(!$_CFG['db_user']) { $msg .= 'Необходимо указать пользователя БД!<br/>'; }
		if(!$_CFG['db_prefix']) { $msg .= 'Необходимо указать префикс БД!<br/>'; }

		if(mb_strlen($admin_login) < 3) { $msg .= 'Необходимо указать логин администратора, не менее 3-х символов!<br/>'; }
		if(mb_strlen($admin_password) < 6) { $msg .= 'Необходимо указать пароль администратора, не менее 6-ти символов!<br/>'; }

		if(!$msg){

			//INSTALL SYSTEM

			$d_cfg = $inConf->getDefaultConfig();

			$_CFG = array_merge($d_cfg, $_CFG);

            $inConf->saveToFile($_CFG);

			$GLOBALS['db'] = @mysql_connect($_CFG['db_host'], $_CFG['db_user'], $_CFG['db_pass']);

            @mysql_set_charset('utf8');

			if (mysql_error()) {
				$msg .= 'Не удалось установить соединение c MySQL.<br/>
						 Проверьте адрес сервера MySQL и правильность пользователя и пароля БД.<br/>
						 За уточнением этих параметров вы можете обратиться к своему хостеру.';
			} else {
				@mysql_select_db($_CFG['db_base'], $GLOBALS['db']);
				if (mysql_error()) {
					$msg .= 'Не удалось открыть БД MySQL.<br/>
							 База данных "'.$_CFG['db_base'].'" не найдена на указанном сервере.<br/>
						 	 За уточнением этих параметров вы можете обратиться к своему хостеру.';
				}
			}

			if(!$msg){

                $sql_file = ((int)$_REQUEST['demodata']==1 ?'sqldumpdemo.sql' : 'sqldumpempty.sql');

                include(PATH.'/includes/dbimport.inc.php');

                dbRunSQL(PATH.'/install/'.$sql_file, $_CFG['db_prefix']);

                $sql = "UPDATE {$_CFG['db_prefix']}_users
                        SET password = md5('{$admin_password}'),
                            login = '{$admin_login}'
                        WHERE id = 1";

                mysql_query($sql);

                $installed = (mysql_error() ? 0 : 1);

                $sql = "UPDATE {$_CFG['db_prefix']}_users
                        SET password = md5('{$admin_password}')
                        WHERE id > 1";

                mysql_query($sql);

			}

		}

	}

// =================================================================================================== //

function getPHPVersion(){
    $version['text'] = phpversion();
    $version['int']  = $version['text'][0] * 10000 + $version['text'][2] * 100 + $version['text'][4];
    return $version;
}

function installCheckFolders(){
	$folders = array();
	$folders[] = '/images';
	$folders[] = '/upload';
	$folders[] = '/includes';
    $folders[] = '/cache';

	echo '<table align="center">';
		echo '<tr>';
			echo '<th width="260">Папка</th>';
			echo '<th style="text-align:center" width="170">Доступна для записи</th>';
		echo '</tr>';

	foreach($folders as $key=>$folder){
		$right = true;
		if(!@is_writable(PATH.$folder)){
			if (!@chmod(PATH.$folder, 0777)){
				$right = false;;
			}
		}
		echo '<tr>';
			echo '<td class="folder">'.$folder.'</td>';
			echo '<td style="text-align:center">'.($right ? '<span style="color:green">Да</span>' : '<span style="color:red">Нет</span>').'</td>';
		echo '</tr>';
	}

	echo '</table>';
}

// =================================================================================================== //

function installCheckExtensions(){

    global $ext_req;
    global $php_req;
    global $php_req_ver;

	echo '<table align="center">';
		echo '<tr>';
			echo '<th width="300">Расширение PHP</th>';
			echo '<th style="text-align:center" width="70">Установлено</th>';
		echo '</tr>';

    $all_right = true;

	foreach($ext_req as $name=>$ext){
		$right = true;
		if(!extension_loaded($ext)){
            $right = false;
            $all_right = false;
		}
		echo '<tr>';
			echo '<td class="extension"><a href="http://ru.php.net/manual/ru/book.'.$ext.'.php" title="Посмотреть описание на сайте PHP">'.$name.'</td>';
			echo '<td style="text-align:center">'.($right ? '<span style="color:green">Да</span>' : '<span style="color:red">Нет</span>').'</td>';
		echo '</tr>';
	}

	echo '</table>';

    if (!$all_right){
        echo '<p>Для установки отсутствующих расширений обратитесь к вашему хостеру.</p>';
        echo '<p><a href="http://www.instantcms.ru/forum/thread1345-1.html">Как установить mbstring на Денвер</a> читайте на нашем форуме.</p>';
    }

    $php_ver = getPHPVersion();

    $right = true;
    $php53 = false;

    if ($php_ver['int'] < $php_req_ver) { $right=false; }

    echo '<p><strong>Версия PHP:</strong> '.$php_ver['text'].' &mdash; '.($right ? '<span style="color:green">Оk</span>' : '<span style="color:red">требуется '.$php_req['major'].'.'.$php_req['minor'].'.'.$php_req['release'].' или выше</span>').'</p>';

    if (!$right){
        echo '<p>Для обновления PHP обратитесь к своему хостеру.</p>';
    }

}

// =================================================================================================== //
?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>InstantCMS - Установка</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src='/includes/jquery/jquery.js' type='text/javascript'></script>
	<script src='/install/js/jquery.wizard.js' type='text/javascript'></script>
	<script src='/install/js/install.js' type='text/javascript'></script>
	<link type='text/css' href='/install/css/styles.css' rel='stylesheet' media='screen' />
</head>

<body>

	<table id="wrapper" align="center">
	<tr><td>

		<h1 id="header">
			Установка InstantCMS <?php echo CORE_VERSION; ?>
		</h1>

		<?php if(!isset($msg)){ ?>

		<form class="wizard" action="#" method="post" >
			<div class="wizard-nav"  align="center">
				<a href="#start">Начало</a>
				<a href="#php">Проверка PHP</a>
				<a href="#folders">Проверка прав</a>
				<a href="#install">Установка</a>
			</div>
			<!-- ================================================================ -->

			<div id="start" class="wizardpage">
				<h2>Добро пожаловать</h2>
				<img src="/install/images/start.gif" border="0" />
				<p>
					Cкрипт установки проверит сервер на соответствие техническим требованиям и совершит все
					необходимые действия для начала работы с InstantCMS.
				</p>
                <p>Устанавливать InstantCMS можно только в корневую директорию сайта.</p>
				<p>
					Перед началом установки создайте новую базу данных MySQL на вашем хостинге. Сравнение (COLLATION) должно быть любое из utf8_* согласно ваших потребностей. В большинстве случаев это utf8_general_ci.
				</p>
				<p>Как установить систему на локальный компьютер с ОС Windows&trade; для тестирования, читайте в <a href="http://www.instantcms.ru/wiki/doku.php/локальная_установка_денвер" target="_blank">инструкции</a> на официальном сайте.</p>

                <p>InstantCMS распространяется по лицензии GNU/GPL версии 2. Вы должны согласиться с условиями этой лицензии для установки системы.</p>

                <table cellpadding="2" cellspacing="0" border="0">
                    <tr>
                        <td width="20" valign="top"><input type="checkbox" id="license_agree" onClick="checkAgree()" /></td>
                        <td>
                            <label for="license_agree">Я согласен с условиями</label>
                            <a target="_blank" href="/license.rus.txt">лицензии GNU/GPL</a>
                            (<a target="_blank" href="http://www.gnu.org/licenses/gpl-2.0.html">оригинал на английском</a>)</p></td>
                    </tr>
                </table>

			</div>

			<!-- ================================================================ -->

			<div id="php" class="wizardpage">

                <h2>Проверка расширений PHP</h2>
                <img src="/install/images/extensions.gif" border="0" />

                <p>
					Для корректной работы InstantCMS необходимо чтобы PHP на вашем сервере имел установленные расширения, перечисленные ниже.
				</p>

                <?php installCheckExtensions(); ?>

			</div>

			<!-- ================================================================ -->

			<div id="folders" class="wizardpage">
				<h2>Проверка прав на папки</h2>
				<img src="/install/images/folders.gif" border="0" />

                <p>
					Для корректной работы InstantCMS указанные ниже папки должны быть доступны для записи.
					Сменить права на папки можно с помощью FTP-клиента, например Total Commander или FAR.
				</p>

				<?php installCheckFolders(); ?>

				<p>
					Если вы не знаете или сомневаетесь какие права нужно установить, чтобы сделать папку доступной для записи, обратитесь
                    в техническую поддержку вашего хостинга.
				</p>

				<p>
					Установку можно произвести и не выставляя права, но полноценное функционирование системы при этом не гарантируется.
				</p>

			</div>

			<!-- ================================================================ -->

		  <div id="install" class="wizardpage">
                <h2>Установка</h2>
                <p>Заполните форму и нажмите "Установить" для завершения процесса.</p>

                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td width="140" valign="top">
                            <img src="/install/images/install.gif" border="0" />
                        </td>
                        <td valign="top">
                            <table width="" border="0" cellpadding="4" cellspacing="0" style="margin-bottom:10px">
                              <tr>
                                <td width="220">Название сайта:</td>
                                <td width="" align="center"><input name="sitename" type="text" class="txt" value="Моя социальная сеть"></td>
                              </tr>
                              <tr>
                                <td>Логин администратора сайта:</td>
                                <td align="center"><input name="admin_login" type="text" class="txt" value="admin"></td>
                              </tr>
                              <tr>
                                <td>Пароль администратора сайта (не менее 6-ти символов):</td>
                                <td align="center"><input name="admin_password" type="password" class="txt"></td>
                              </tr>
                            </table>
                            <table width="" border="0" cellpadding="4" cellspacing="0" style="margin-bottom:0px">
                              <tr>
                                <td width="220">Сервер MySQL: </td>
                                <td align="center"><input name="db_server" type="text" class="txt" value="localhost"></td>
                              </tr>
                              <tr>
                                <td>База данных: </td>
                                <td align="center"><input name="db_base" type="text" class="txt"></td>
                              </tr>
                              <tr>
                                <td>Пользователь БД: </td>
                                <td align="center"><input name="db_user" type="text" class="txt" value="root"></td>
                              </tr>
                              <tr>
                                <td>Пароль пользователя БД: </td>
                                <td align="center"><input name="db_password" type="password" class="txt"></td>
                              </tr>
                              <tr>
                                <td>Префикс таблиц в базе данных: </td>
                                <td align="center"><input name="db_prefix" type="text" class="txt" value="cms"></td>
                              </tr>
                              <tr>
                                <td>Демо-данные:</td>
                                <td align="center" valign="top">
                                    <label><input name="demodata" type="radio" value="1" checked /> Да</label>
                                    <label><input name="demodata" type="radio" value="0" /> Нет</label>
                                </td>
                              </tr>
                            </table>
                        </td>
                    </tr>
                </table>

				<p style="color:gray">
                    При установке с демо-данными всем пользователям будет установлен одинаковый пароль, совпадающий с паролем администратора.
                    Логин каждого пользователя можно узнать из адреса его профиля или из панели управления.
                </p>

                <p>Установка может занять от секунд до нескольких минут, в зависимости от скорости вашего сервера.</p>

				</div>
		</form>

		<?php }

			if (isset($msg) && @$msg != ''){
				echo '<div style="margin-left:52px;_margin-left:0px">';
				echo '<h2>Обнаружена ошибка!</h2>';
				echo '<p style="color:red">'.$msg.'</p>';
				echo '<p><a href="index.php">Повторить ввод данных</a></p>';
				echo '</div>';
			}

			if (isset($installed)){
				if($installed){
					echo '<div style="margin-left:52px;_margin-left:0px">';
					echo '<h2>Установка завершена!</h2>';
					echo '<div>';
					echo '<p>Система установлена и готова к работе.</p>';
					echo '<div style="background:url(/install/images/cron.png) no-repeat;padding-left:24px;margin-top:30px;margin-bottom:30px;">
                            <div style="margin-bottom:6px;"><strong>Создайте задание для CRON</strong></div>
                            <div>
                                Добавьте файл <strong>/cron.php</strong> в расписание заданий CRON в панели вашего хостинга.<br/>
                                Интервал выполнения &mdash; 24 часа. Это позволит системе выполнять периодические сервисные задачи.
                                Возможная команда, которую нужно добавить в CRON, выглядит так:
                                <pre class="cron">  php -f '.PATH.'/cron.php > /dev/null</pre>
                            </div>
                            <div>
                                В случае затруднений обратитесь в техническую поддержку хостинга.
                            </div>
                          </div>';
					echo '<div style="background:url(/install/images/warning.png) no-repeat;padding-left:24px;margin-top:30px;margin-bottom:30px;">
                            <div style="margin-bottom:6px;"><strong>Внимание!</strong></div>
                            До перехода на сайт необходимо удалить каталоги "install" и "migrate"<br/>
                            на сервере вместе со всеми находящимися в них файлами!
                          </div>';
					echo '<p style="font-size:18px"><a href="/">Перейти на сайт</a> | <a href="/admin">Перейти в панель управления</a></p>';
					echo '<p>
                            <a id="tutorial" href="http://www.instantcms.ru/articles/quickstart.html">Учебник для начинающих</a>
                            <a id="video" href="http://www.instantcms.ru/video-lessons.html">Видео-уроки</a>
                          </p>';
					echo '</div>';
					echo '</div>';
				}
			}
		?>

		<div id="footer">
			<a href="http://www.instantcms.ru/" target="_blank"><strong>InstantCMS</strong></a> &copy; 2007-<?php echo date('Y'); ?>
		</div>

	</div>
	</td></tr></table>
</body>
</html>
