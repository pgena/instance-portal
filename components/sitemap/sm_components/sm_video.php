<?php
if(!defined('VALID_CMS')) { die('ACCESS DENIED'); }
/******************************************************************************/
//                              Карта Сайта v2.1                              //
//          Разработка Компонентов, Плагинов и Модулей для Instant CMS:       //
//                      instantcms-development@ds-soft.ru                     //
/******************************************************************************/

class video_map extends comMaps{
    public $title = "Видео";
    public $link = "video";
    protected $google_maps_file;
    protected $googlemaps = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">';

    public function __construct() {
        $this->inDB = cmsDatabase::getInstance();
        $this->total = $this->inDB->rows_count("cms_video_movie", "published = 1");
        $this->total = $this->total + $this->inDB->rows_count("cms_video_category", "published = 1");
    }

    public function FillMapsArray($html=FALSE){
        $this->map_start();
        $inCore = cmsCore::getInstance();
        $cfg = $inCore->loadComponentConfig("video");
        if (!$this->generateMap and !$html){ return FALSE; }
        $cats = $this->getCategoryTree("cms_video_category", $this->host . "/video");
        foreach ($cats as $cat){
            if ($cat['id']==1){
                $cat['title'] = "Главная страница видео каталога";
                $cat['seolink'] = $this->host . "/video";
            }else{
                $cat['seolink'] = $cfg['is_seo_url']==1 ? $cat['seolink'] : $this->host . "/video/" . $cat['id'];
            }
            if ($this->generateMap){ $this->set_map_url(array($cat['seolink'], "daily", "0.9")); }
            if ($html){ $this->set_html_cat($cat['title'], $cat['seolink'], ($cat['NSLevel']-1)*20); }
            $sql = "SELECT m.id, m.pubdate, m.img, m.duration, m.title, m.provider, m.description, m.hits, m.user_id, m.seolink, u.login as login, u.nickname as nickname FROM cms_video_movie m LEFT JOIN cms_users u ON u.id = m.user_id WHERE cat_id = '".$cat['id']."' AND published = 1";
            $result = $this->inDB->query($sql);
            if ($html){ $this->set_html_item_start(); }
            while($item = $this->inDB->fetch_assoc($result)){
                if ($cfg['is_seo_url']==1){
                    if ($cfg['short_seo_url']==1){
                        $item['seolink'] = $this->host . "/video/" . $item['seolink'] . ".html";
                    }else{
                        $item['seolink'] = $cat['seolink'] . "/" . $item['seolink'] . ".html";
                    }
                }else{
                    $item['seolink'] = $this->host . "/video/movie" . $item['id'] . ".html";
                }
                $item['pubdate'] = strtotime($item['pubdate']);
                if ($this->generateMap){
                    $this->set_map_url(array(
                        $item['seolink'],
                        $item['pubdate'] >= strtotime("-1 week") ? "daily" : "weekly",
                        $item['pubdate'] >= strtotime("-1 week") ? "0.9" : "0.8",
                        date("Y-m-d", $item['pubdate']),
                        "id" => $item['id'],
                        "img" => $item['img'],
                        "title" => $item['title'],
                        "description" => $item['description'],
                        "duration" => $item['duration'],
                        "hits" => $item['hits'],
                        "seolink" => $item['seolink'],
                        "cat_title" => $cat['title'],
                        "cat_seolink" => $cat['seolink'],
                        "login" => $item['login'],
                        "nickname" => $item['nicname']
                    ));
                }
                if ($html){ $this->set_html_item($item['title'], $item['seolink']); }
            }
            if ($html){ $this->set_html_item_end(); }
        }
    }
    
    public function user_map_start(){
        $prefix = ($this->page == 1) ? "" : "_".$this->page;
        $this->google_maps_file = fopen(PATH . "/sitemaps/go" . $this->link . $prefix . ".xml", "w");
    }
    public function user_re_map_start(){
        $this->googlemaps = '<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">';
        $prefix = ($this->page == 1) ? "" : "_".$this->page;
        $this->google_maps_file = fopen(PATH . "/sitemaps/go" . $this->link . $prefix . ".xml", "w");
    }
    public function user_set_map_url($item){
        if (!isset($item['id'])){
            if (!isset($item[3])){ $item[3] = date('Y-m-d'); }
            $this->googlemaps .= '<url><loc>'.$item[0].'</loc><lastmod>'.$item[3].'</lastmod><changefreq>'.$item[1].'</changefreq><priority>'.$item[2].'</priority></url>';
        }else{
            $this->googlemaps .= "<url><loc>" . $item['seolink'] . "</loc>";
            $this->googlemaps .= "<video:video>";
            $this->googlemaps .= "<video:thumbnail_loc>" . $this->host . "/upload/video/thumbs/medium/" . $item['img'] . "</video:thumbnail_loc>";
            $this->googlemaps .= "<video:title><![CDATA[" . substr($item['title'], 0, 99) . "]]></video:title>";
            $this->googlemaps .= "<video:description>";
            if ($item['description']){
                $this->googlemaps .= "<![CDATA[" . strip_tags($item['description']) . "]]>";
            }else{
                $this->googlemaps .= "<![CDATA[" . $item['title'] . "]]>";
            }
            $this->googlemaps .= "</video:description>";
            $this->googlemaps .= '<video:player_loc allow_embed="yes">' . $this->host . '/components/video/ajax/get_movie_code.php?id=' . $item['id'] . '</video:player_loc>';
            $this->googlemaps .= "<video:duration>" . $item['duration'] . "</video:duration>";
            $this->googlemaps .= "<video:view_count>" . $item['hits'] . "</video:view_count>";
            $this->googlemaps .= "<video:publication_date>" . $item[3] . "</video:publication_date>";
            if ($this->config['config']['tags']){
                $result = $this->inDB->query("SELECT tag FROM cms_tags WHERE item_id = '".$item['id']."' AND target = 'video' LIMIT 10");
                while ($tag = $this->inDB->fetch_assoc($result)){
                    $this->googlemaps .= '<video:tag>' . $tag['tag'] . '</video:tag>';
                }
            }
            $this->googlemaps .= '<video:gallery_loc title="' . $item['cat_title'] . '">'.$item['cat_seolink'].'</video:gallery_loc>';
            $this->googlemaps .= '<video:uploader info="' . $this->host . '/users/' . $item['login'] . '">' . $item['nickname'] . '</video:uploader>';
            $this->googlemaps .= '</video:video>';
            $this->googlemaps .= '</url>';
        }
    }
    public function user_map_end(){
        if ($this->google_maps_file){
            $this->googlemaps .= "</urlset>";
            fwrite($this->google_maps_file, $this->googlemaps);
            unset($this->googlemaps);
            fclose($this->google_maps_file);
        }
    }
    public function user_genMapsList(){
        $page = 1;
        while ($page <= $this->total_page){
            $prefix = ($page == 1) ? "" : "_".$page;
            $this->google_maps_list .= '<sitemap><loc>' . $this->host . '/sitemaps/go' . $this->link . $prefix . '.xml</loc><lastmod>' . date('Y-m-d') . '</lastmod></sitemap>';
            $page++;
        }
    }
}
?>