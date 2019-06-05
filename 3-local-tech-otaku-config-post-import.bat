# USAGE: /Applications/MAMP/Library/bin/mysql -u root -p < /Users/steve/Developer/GitHub/mysql-batch-files/local-tech-otaku-config-b.bat

USE tech_otaku;

# READING SETTINGS

	# Set homepage to a static page 
	UPDATE wp_options
	SET option_value='page'
	WHERE option_name='show_on_front';

	# Set static page to 'Home'
	SET @homepage := (SELECT ID FROM wp_posts WHERE post_title='Home' AND post_type='page' AND post_status='publish');
    
	UPDATE wp_options
	SET option_value=@homepage
	WHERE option_name='page_on_front';
	
	#  Discourage search engines from indexing this site [Unchecked]
	UPDATE wp_options
	SET option_value=''
	WHERE option_name='blog_public';
	
	
	
	
# MENU SETTINGS

	# Menus > Manage Locations tab
	
		# Set 'Main Menu' to 'header'
		SET @name='theme_mods_typology-descendant',
		@value='a:1:{s:18:"nav_menu_locations";a:2:{s:18:"typology_main_menu";i:82;s:20:"typology_social_menu";i:0;}}',
		@auto='yes';
	
		INSERT INTO wp_options (option_name, option_value, autoload) 
		VALUES (@name, @value, @auto) 
		ON DUPLICATE KEY UPDATE option_name=@name, option_value=@value, autoload=@auto;
	
	
	# Menus > Edit Menus tab
	
		# 'Menu Settings' 
		SET @name='nav_menu_options',
		@value='a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}',
		@auto='yes';
	
		INSERT INTO wp_options (option_name, option_value, autoload) 
		VALUES (@name, @value, @auto) 
		ON DUPLICATE KEY UPDATE option_name=@name, option_value=@value, autoload=@auto;
	
	
		# Set URL for 'Home' menu item to 'http://local.tech-otaku/'
		SET @postid=(SELECT ID FROM wp_posts WHERE post_name='home-2' AND post_type='nav_menu_item' AND post_status='publish');
		SET @metaid=(SELECT meta_id FROM wp_postmeta WHERE post_id=@postid AND meta_key='_menu_item_url'),
		@key='_menu_item_url',
		@value='http://local.tech-otaku/';
	
		INSERT INTO wp_postmeta (meta_id, post_id, meta_key, meta_value) 
		VALUES (@metaid, @postid, @key, @value) 
		ON DUPLICATE KEY UPDATE meta_id=@metaid, post_id=@postid, meta_key=@key, meta_value=@value;
	
	
		# Set 'Select a menu to edit:' to 'header (Main Menu)'
		SET @userid=(SELECT ID FROM wp_users WHERE user_login='kerry');
		SET @umetaid=(SELECT umeta_id FROM wp_usermeta WHERE user_id=@userid AND meta_key='nav_menu_recently_edited'),
		@key='nav_menu_recently_edited',
		@value='82';
	
		INSERT INTO wp_usermeta (umeta_id, user_id, meta_key, meta_value) 
		VALUES (@umetaid, @userid, @key, @value) 
		ON DUPLICATE KEY UPDATE umeta_id=@umetaid, user_id=@userid, meta_key=@key, meta_value=@value;




# THEME OPTIONS


	# Set theme color to red
	UPDATE wp_options SET option_value = REPLACE(option_value, 's:15:"color_header_bg";s:7:"#1e73be";', 's:15:"color_header_bg";s:7:"#dd3333";') WHERE option_name='typology_settings';
	
	
	
	
# PLUGINS

	# Activate selected plugins
	 
		SET @name='active_plugins',
		@value='a:23:{i:0;s:37:"breadcrumb-navxt/breadcrumb-navxt.php";i:1;s:33:"classic-editor/classic-editor.php";i:2;s:23:"clipboard/clipboard.php";i:3;s:33:"font-awesome-5/font-awesome-5.php";i:4;s:45:"meks-easy-ads-widget/meks-easy-ads-widget.php";i:5;s:44:"meks-flexible-shortcodes/meks-shortcodes.php";i:6;s:55:"meks-simple-flickr-widget/meks-simple-flickr-widget.php";i:7;s:53:"meks-smart-author-widget/meks-smart-author-widget.php";i:8;s:53:"meks-smart-social-widget/meks-smart-social-widget.php";i:9;s:63:"meks-themeforest-smart-widget/meks-themeforest-smart-widget.php";i:10;s:31:"meks-time-ago/meks-time-ago.php";i:11;s:33:"misc-functions/misc-functions.php";i:12;s:35:"no-wpautop-pages/nowpautoppages.php";i:13;s:37:"outdated-message/outdated-message.php";i:14;s:43:"responsive-lightbox/responsive-lightbox.php";i:15;s:59:"single-post-meta-manager-0.2.0/single-post-meta-manager.php";i:16;s:61:"syntaxhighlighter-evolved-apache/syntaxhighlighter-apache.php";i:17;s:71:"syntaxhighlighter-evolved-applescript/syntaxhighlighter-applescript.php";i:18;s:57:"syntaxhighlighter-evolved-php5/syntaxhighlighter-php5.php";i:19;s:39:"syntaxhighlighter/syntaxhighlighter.php";i:20;s:41:"wordpress-importer/wordpress-importer.php";i:21;s:29:"wp-hide-post/wp-hide-post.php";i:22;s:31:"wp-serverinfo/wp-serverinfo.php";}',
		@auto='yes';

		INSERT INTO wp_options (option_name, option_value, autoload) 
		VALUES (@name, @value, @auto) 
		ON DUPLICATE KEY UPDATE option_name=@name, option_value=@value, autoload=@auto;
	
	
	# Syntax Highlighter
		SET @name='syntaxhighlighter_settings',
		@value='a:15:{s:9:"shversion";i:3;s:5:"theme";s:7:"eclipse";s:14:"loadallbrushes";i:1;s:6:"gutter";i:1;s:9:"autolinks";i:1;s:9:"smarttabs";i:1;s:9:"wraplines";i:1;s:9:"classname";s:0:"";s:9:"firstline";i:1;s:14:"padlinenumbers";s:5:"false";s:7:"tabsize";i:4;s:5:"title";s:0:"";s:8:"collapse";i:0;s:5:"light";i:0;s:7:"toolbar";i:0;}',
		@auto='yes';
	
		INSERT INTO wp_options (option_name, option_value, autoload) 
		VALUES (@name, @value, @auto) 
		ON DUPLICATE KEY UPDATE option_name=@name, option_value=@value, autoload=@auto;
























