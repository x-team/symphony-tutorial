<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'admin-path' => 'symphony',
			'pagination_maximum_rows' => 99999,
			'association_maximum_rows' => '5',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'version' => '2.5.1',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
			'cell_truncation_length' => '75',
			'enable_xsrf' => 'yes',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### DATABASE ######
		'database' => array(
			'host' => 'localhost',
			'port' => '3306',
			'user' => null,
			'password' => null,
			'db' => null,
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Mywebsite',
			'useragent' => 'Symphony/2.5.1',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd/m/Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Sao_Paulo',
		),
		########


		###### CACHE_DRIVER ######
		'cache_driver' => array(
			'default' => 'database',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_news_sortby' => '2',
			'section_news_order' => 'desc',
			'section_images_sortby' => '9',
			'section_images_order' => 'desc',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########
	);
