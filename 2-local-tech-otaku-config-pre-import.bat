# USAGE: /Applications/MAMP/Library/bin/mysql -u root -p < /Users/steve/Developer/GitHub/mysql-batch-files/local-tech-otaku-config-a.bat

USE tech_otaku;

# USER SETTINGS

	# Nicename
	UPDATE wp_users
	SET user_nicename='nuxx'
	WHERE user_login='kerry';

	# Email
	UPDATE wp_users 
	SET user_email='blog@tech-otaku.com' 
	WHERE user_login='kerry';

	# Display Name
	UPDATE wp_users 
	SET display_name='Steve' 
	WHERE user_login='kerry';

	# Nickname
	UPDATE wp_usermeta 
	INNER JOIN wp_users ON wp_usermeta.user_id=wp_users.ID 
	SET wp_usermeta.meta_value='steve' 
	WHERE wp_usermeta.meta_key='nickname' AND wp_users.user_login='kerry';

	# First Name
	UPDATE wp_usermeta 
	INNER JOIN wp_users ON wp_usermeta.user_id=wp_users.ID 
	SET wp_usermeta.meta_value='Steve' 
	WHERE wp_usermeta.meta_key='first_name' AND wp_users.user_login='kerry';

	# Last Name
	UPDATE wp_usermeta 
	INNER JOIN wp_users ON wp_usermeta.user_id=wp_users.ID 
	SET wp_usermeta.meta_value='Ward' 
	WHERE wp_usermeta.meta_key='last_name' AND wp_users.user_login='kerry';
	
	
	
	
# GENERAL SETTINGS

	
	# Date Format
	UPDATE wp_options
	SET option_value='F j, Y'
	WHERE option_name='date_format';
	
	
	# Time Format
	UPDATE wp_options
	SET option_value='H:i'
	WHERE option_name='time_format';
	
	
	# Admin Email
	UPDATE wp_options 
	SET option_value='blog@tech-otaku.com' 
	WHERE option_name='admin_email';
	
	
	

# PERMALINK SETTINGS

	# Permalinks
	UPDATE wp_options
	SET option_value='/%category%/%postname%/' 
	WHERE option_name='permalink_structure';


	
	
# MEDIA SETTINGS

	# Don't organise uploads into month and year-based folders
	UPDATE wp_options
	SET option_value=''
	WHERE option_name='uploads_use_yearmonth_folders';
	
	
	
	
# THEME SETTINGS


    UPDATE wp_options
    SET option_value='typology'
    WHERE option_name='template';


    UPDATE wp_options
    SET option_value='typology-descendant'
    WHERE option_name='stylesheet';
    
    
 
    
# DELETE SAMPLE POST/PAGE

	DELETE FROM wp_posts WHERE post_title='Hello world!' AND post_name='hello-world';
	DELETE FROM wp_posts WHERE post_title='Sample Page' AND post_name='sample-page';
	