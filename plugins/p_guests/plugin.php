<?php

class p_guests extends cmsPlugin {

    public function __construct(){

        parent::__construct();

        $this->info['plugin']           = 'p_guests';
        $this->info['title']            = 'Мои гости';
        $this->info['description']      = 'Добавляет вкладку со списком гостей';
        $this->info['author']           = 'HolyGun && MaiX';
        $this->info['version']          = '2.3';
        $this->info['tab']              = 'Мои гости';
        $this->events[]                 = 'USER_PROFILE';

		$this->config['limit']          = 30;
		$this->config['tab']            = 'Мои гости';

    }

    public function install(){
        $inCore	= cmsCore::getInstance();
        $inDB	= cmsDatabase::getInstance();

		$sql = "
				CREATE TABLE IF NOT EXISTS `cms_user_guests` (
				`id` int(11) NOT NULL auto_increment,
				`user_id` int(11) NOT NULL default '0',
				`guest_id` int(11) NOT NULL default '0',
				`date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
				UNIQUE KEY `user_id` (`user_id`,`guest_id`),
				KEY `id` (`id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ;
		";
		$inDB->query($sql);

        return parent::install();

    }

    public function upgrade(){
        return parent::upgrade();
    }

    public function execute($event, $user){
        parent::execute();

		$this->info['tab'] = $this->config['tab'];

		global $_LANG;

		$inCore	= cmsCore::getInstance();
		$inDB	= cmsDatabase::getInstance();
		$inUser	= cmsUser::getInstance();

		$is_admin = $inUser->is_admin;

		if (!$id) {
			$login = $inCore->request('login', 'str', '');
			$login = urldecode($login);
			$id    = $inDB->get_field('cms_users', "`login`='{$login}' ORDER BY is_deleted ASC", 'id');
			//return 'my id: ' .$login;
		}

		$myprofile  = ($inUser->id == $id);

		if(!$myprofile && $inUser->id) {
			$sql = "REPLACE INTO cms_user_guests SET user_id = ".$id.", guest_id = ".$inUser->id;
			$inDB->query($sql);
			if ($is_admin != 1){
				return;
			}
		}

		if ($myprofile || $is_admin == 1){

			$is_send = $inCore->inRequest('guestssbros');
			if ($is_send) {
				$sql = "DELETE FROM cms_user_guests WHERE user_id = '{$id}'" ;
				$inDB->query($sql);
			}

			$limit = $this->config['limit'] ;
			$sql = "SELECT DISTINCT u.id, u.login, u.nickname, p.imageurl AS avatar, o.user_id AS status, ug.date
					FROM cms_user_guests ug
					LEFT JOIN cms_online o ON (o.user_id = ug.guest_id)
					LEFT JOIN cms_users u ON (u.id = ug.guest_id)
					LEFT JOIN cms_user_profiles p ON (p.user_id = u.id)
					WHERE (u.is_locked = 0 and u.is_deleted = 0) and ug.user_id = ".$id." ORDER BY ug.date DESC LIMIT ".$limit." ";
			$result = $inDB->query($sql);
			$total  = $this->inDB->num_rows($result);
			if ($total){
				while ($usr=$inDB->fetch_assoc($result)) {
					$usr['avatar'] = $inUser->getUserAvatarUrl($usr['id'], 'small', $usr['avatar'], $usr['is_deleted']);
					$usr['date'] = $inCore->dateFormat($usr['date'], true, true);
					$guests[] = $usr;
				}
			}

			ob_start();

			$smarty= $this->inCore->initSmarty('plugins', 'p_guests.tpl');
			$smarty->assign('total', $total);
			$smarty->assign('guests', $guests);
			$smarty->display('p_guests.tpl');

			$html = ob_get_clean();

			return $html;

		}else{
			return;
		}
	}
}

?>