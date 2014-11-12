
-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_author` ***
INSERT INTO`tbl_fields_author` (`id`, `field_id`, `allow_multiple_selection`, `default_to_current_user`, `author_types`) VALUES (2, 3, 'no', 'yes', 'author,manager,developer');

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_checkbox` ***

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_date` ***
INSERT INTO`tbl_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (2, 2, 'now');

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_input` ***
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (2, 1, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (3, 5, NULL);
INSERT INTO`tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (4, 6, NULL);

-- *** STRUCTURE:`tbl_fields_order_entries` ***
DROP TABLE IF EXISTS`tbl_fields_order_entries`;
CREATE TABLE`tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_fields_order_entries` ***
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`) VALUES (1, 9, NULL, 'yes');

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_select` ***

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_selectbox_link` ***
INSERT INTO`tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (1, 8, 'no', 'yes', 1, 999);

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_taglist` ***

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textarea` ***
INSERT INTO`tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (2, 4, 'markdown', 15);

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_upload` ***
INSERT INTO`tbl_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES (1, 7, '/workspace/uploads/images', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE:`tbl_entries_data_1` ***
DROP TABLE IF EXISTS`tbl_entries_data_1`;
CREATE TABLE`tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_1` ***
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 1, 'lorem-ipsum-dolor-sit-amet', 'Lorem ipsum dolor sit amet');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 2, 'proin-eu-sagittis-diam', 'Proin eu sagittis diam');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 3, 'nullam-commodo-metus-a-felis-pharetra-faucibus', 'Nullam commodo metus a felis pharetra faucibus');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 4, 'vestibulum-nec-facilisis-augue', 'Vestibulum nec facilisis augue');
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 5, 'praesent-dui-lorem', 'Praesent dui lorem');

-- *** STRUCTURE:`tbl_entries_data_2` ***
DROP TABLE IF EXISTS`tbl_entries_data_2`;
CREATE TABLE`tbl_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_2` ***
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `value`, `date`) VALUES (1, 1, '2014-11-02T14:15:00-02:00', '2014-11-02 16:15:00');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `value`, `date`) VALUES (2, 2, '2014-11-02T14:17:00-02:00', '2014-11-02 16:17:00');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `value`, `date`) VALUES (3, 3, '2014-11-02T14:17:00-02:00', '2014-11-02 16:17:00');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `value`, `date`) VALUES (4, 4, '2014-11-02T14:18:00-02:00', '2014-11-02 16:18:00');
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `value`, `date`) VALUES (5, 5, '2014-11-02T14:18:00-02:00', '2014-11-02 16:18:00');

-- *** STRUCTURE:`tbl_entries_data_3` ***
DROP TABLE IF EXISTS`tbl_entries_data_3`;
CREATE TABLE`tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`entry_id`,`author_id`),
  KEY `author_id` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_3` ***
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `author_id`) VALUES (1, 1, 1);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `author_id`) VALUES (2, 2, 1);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `author_id`) VALUES (3, 3, 1);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `author_id`) VALUES (4, 4, 1);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `author_id`) VALUES (5, 5, 1);

-- *** STRUCTURE:`tbl_entries_data_4` ***
DROP TABLE IF EXISTS`tbl_entries_data_4`;
CREATE TABLE`tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_4` ***
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (1, 1, '# This is a markdown text field!!!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.\r\n\r\n## Awesome :)\r\n\r\nPraesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.\r\n\r\nProin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.', '<h1>This is a markdown text field!!!</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>\n\n<h2>Awesome :)</h2>\n\n<p>Praesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>\n\n<p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>\n');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.\r\n\r\nPraesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.\r\n\r\nProin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>\n\n<p>Praesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>\n\n<p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>\n');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (3, 3, 'Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.\r\n\r\nPraesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.', '<p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim. Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>\n\n<p>Praesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>\n');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (4, 4, 'Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.\r\n\r\nProin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.\r\n\r\nPraesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.', '<p>Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>\n\n<p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>\n\n<p>Praesent dui lorem, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>\n');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `value`, `value_formatted`) VALUES (5, 5, '# Yey!\r\n\r\n__Praesent dui lorem__, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.\r\n\r\nVestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.\r\n\r\nProin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.', '<h1>Yey!</h1>\n\n<p><strong>Praesent dui lorem</strong>, efficitur in facilisis efficitur, congue vitae nulla. Morbi felis tellus, feugiat eget vulputate eu, sollicitudin in augue. Pellentesque quis magna at tellus dictum convallis eu in velit. Donec lorem ex, placerat id metus ut, placerat convallis ex. Aliquam vel massa erat. Suspendisse condimentum, dolor sit amet pharetra semper, ligula leo porttitor elit, a rhoncus lacus nibh vel tellus. Donec eget purus sagittis, volutpat sem in, finibus sem. Morbi est orci, congue in libero dapibus, lobortis tincidunt libero.</p>\n\n<p>Vestibulum nec facilisis augue. Morbi leo ipsum, gravida vitae dapibus nec, suscipit ac justo. Vestibulum tincidunt libero ac orci facilisis, vitae venenatis velit fringilla. Aenean quis ornare sapien. Sed eget condimentum nibh. Nulla ultricies turpis nisi, ut bibendum dui faucibus et. Aliquam mauris dui, placerat vitae turpis nec, laoreet viverra sapien. Integer sit amet semper tortor. Phasellus sollicitudin turpis eget felis mollis, a tincidunt dui vestibulum. Vestibulum lobortis risus ac nisi facilisis viverra.</p>\n\n<p>Proin eu sagittis diam. In feugiat egestas enim ac bibendum. Curabitur ullamcorper metus nec tellus aliquam, vel laoreet augue cursus. Suspendisse potenti. Praesent nunc nisi, hendrerit et condimentum quis, aliquam eu enim.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam commodo metus a felis pharetra faucibus. Ut vel enim vitae arcu interdum elementum a a diam. Suspendisse potenti. Sed ac turpis a mi pulvinar consectetur eget sed elit.</p>\n');

-- *** STRUCTURE:`tbl_entries_data_5` ***
DROP TABLE IF EXISTS`tbl_entries_data_5`;
CREATE TABLE`tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_5` ***
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 6, 'desktop-inspiration', 'desktop inspiration');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 7, 'another-desktop-inspiration', 'another desktop inspiration');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 8, 'subaru-impreza', 'subaru impreza');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (8, 9, 'ubatuba', 'ubatuba');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (7, 10, 'ubatuba', 'ubatuba');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (6, 11, 'ubatuba', 'ubatuba');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (9, 12, 'ubatuba', 'ubatuba');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `handle`, `value`) VALUES (10, 13, 'ubatuba', 'ubatuba');

-- *** STRUCTURE:`tbl_entries_data_6` ***
DROP TABLE IF EXISTS`tbl_entries_data_6`;
CREATE TABLE`tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_6` ***
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (1, 6, 'googled', 'googled');
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (2, 11, 'andre', 'andré');
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (3, 10, 'andre', 'andré');
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (4, 9, 'andre', 'andré');
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (5, 12, 'andre', 'andré');
INSERT INTO`tbl_entries_data_6` (`id`, `entry_id`, `handle`, `value`) VALUES (6, 13, 'andre', 'andré');

-- *** STRUCTURE:`tbl_entries_data_7` ***
DROP TABLE IF EXISTS`tbl_entries_data_7`;
CREATE TABLE`tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_7` ***
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (1, 6, '4.jpg', 91871, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:08:29-02:00\";s:5:\"width\";i:540;s:6:\"height\";i:491;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (2, 7, '6.jpg', 70324, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:08:43-02:00\";s:5:\"width\";i:540;s:6:\"height\";i:359;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (3, 8, 'subaru-cosworth-impreza-sti-cs400-4.jpg', 259806, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:09:49-02:00\";s:5:\"width\";i:1590;s:6:\"height\";i:1060;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (8, 9, '974711_919876548040526_1619447394_n.jpg', 130549, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:10:30-02:00\";s:5:\"width\";i:960;s:6:\"height\";i:720;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (7, 10, '1063075_919876374707210_1102205846_n.jpg', 39575, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:10:35-02:00\";s:5:\"width\";i:960;s:6:\"height\";i:720;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (6, 11, '10643250_919876458040535_2051957555_n.jpg', 77705, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:11:02-02:00\";s:5:\"width\";i:960;s:6:\"height\";i:720;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (9, 12, '10743381_919876464707201_1100897924_n.jpg', 79103, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:11:24-02:00\";s:5:\"width\";i:960;s:6:\"height\";i:720;}');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (10, 13, '10749555_919876354707212_669708385_n.jpg', 54582, 'image/jpeg', 'a:3:{s:8:\"creation\";s:25:\"2014-11-02T15:11:36-02:00\";s:5:\"width\";i:960;s:6:\"height\";i:720;}');

-- *** STRUCTURE:`tbl_entries_data_8` ***
DROP TABLE IF EXISTS`tbl_entries_data_8`;
CREATE TABLE`tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_8` ***
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (1, 6, 4);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (2, 7, 4);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (3, 8, 4);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (8, 9, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (7, 10, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (6, 11, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (9, 12, 5);
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `relation_id`) VALUES (10, 13, 5);

-- *** STRUCTURE:`tbl_entries_data_9` ***
DROP TABLE IF EXISTS`tbl_entries_data_9`;
CREATE TABLE`tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- *** DATA:`tbl_entries_data_9` ***
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (1, 6, 1);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (2, 7, 2);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (3, 8, 3);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (8, 9, 1);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (7, 10, 2);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (6, 11, 3);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (9, 12, 5);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `value`) VALUES (10, 13, 4);

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (1, 1, 1, '2014-11-02 14:16:45', '2014-11-02 16:16:45', '2014-11-02 14:16:45', '2014-11-02 16:16:45');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 1, 1, '2014-11-02 14:17:54', '2014-11-02 16:17:54', '2014-11-02 14:17:54', '2014-11-02 16:17:54');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 1, 1, '2014-11-02 14:18:13', '2014-11-02 16:18:13', '2014-11-02 14:18:13', '2014-11-02 16:18:13');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 1, 1, '2014-11-02 14:18:33', '2014-11-02 16:18:33', '2014-11-02 14:18:33', '2014-11-02 16:18:33');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (5, 1, 1, '2014-11-02 14:19:08', '2014-11-02 16:19:08', '2014-11-02 14:19:08', '2014-11-02 16:19:08');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (6, 2, 1, '2014-11-02 15:08:29', '2014-11-02 17:08:29', '2014-11-02 15:08:29', '2014-11-02 17:08:29');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (7, 2, 1, '2014-11-02 15:08:43', '2014-11-02 17:08:43', '2014-11-02 15:08:43', '2014-11-02 17:08:43');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (8, 2, 1, '2014-11-02 15:09:49', '2014-11-02 17:09:49', '2014-11-02 15:09:49', '2014-11-02 17:09:49');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (9, 2, 1, '2014-11-02 15:10:30', '2014-11-02 17:10:30', '2014-11-02 15:11:12', '2014-11-02 17:11:12');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (10, 2, 1, '2014-11-02 15:10:35', '2014-11-02 17:10:35', '2014-11-02 15:11:08', '2014-11-02 17:11:08');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (11, 2, 1, '2014-11-02 15:11:02', '2014-11-02 17:11:02', '2014-11-02 15:11:02', '2014-11-02 17:11:02');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (12, 2, 1, '2014-11-02 15:11:24', '2014-11-02 17:11:24', '2014-11-02 15:11:24', '2014-11-02 17:11:24');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (13, 2, 1, '2014-11-02 15:11:36', '2014-11-02 17:11:36', '2014-11-02 15:11:36', '2014-11-02 17:11:36');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'markdown', 'enabled', 1.20);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'order_entries', 'enabled', '2.1.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'selectbox_link_field', 'enabled', 1.32);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'debugdevkit', 'enabled', '1.3.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'jit_image_manipulation', 'enabled', 1.31);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'export_ensemble', 'enabled', '2.1.1');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 3, '/backend/', 'InitaliseAdminPageHead', 'prepareIndex');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 3, '/backend/', 'AdminPagePreGenerate', 'adjustTable');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 3, '/backend/', 'AdminPagePostGenerate', 'resetPagination');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 5, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 5, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (6, 6, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 6, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 7, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Title', 'title', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Date', 'date', 'date', 1, 'yes', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Author', 'author', 'author', 1, 'yes', 2, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Text', 'text', 'textarea', 1, 'yes', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Caption', 'caption', 'input', 2, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Credits', 'credits', 'input', 2, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Image', 'image', 'upload', 2, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'News', 'news', 'selectbox_link', 2, 'yes', 3, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Sort order', 'sort-order', 'order_entries', 2, 'no', 4, 'main', 'yes');

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Homepage', 'homepage', NULL, NULL, 'list_news', NULL, 1);
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, NULL, 'News', 'news', NULL, 'title', 'current_news,news_images', NULL, 2);

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (1, 1, 'index');

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `filter`, `navigation_group`) VALUES (1, 'News', 'news', 1, 'no', 'yes', 'Content');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `filter`, `navigation_group`) VALUES (2, 'Images', 'images', 2, 'no', 'yes', 'Content');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (1, 1, 1, 2, 8, 'no', NULL, NULL);
