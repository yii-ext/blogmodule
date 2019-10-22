insert  into `admin_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('/adminblog/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/create',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/delete',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/index',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/update',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/catalog/view',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/create',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/delete',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/index',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/update',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/comment/view',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/default/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/default/index',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/create',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/delete',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/index',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/update',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/post/view',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/*',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/create',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/delete',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/index',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/update',2,NULL,NULL,NULL,1558669668,1558669668),
('/adminblog/tag/view',2,NULL,NULL,NULL,1558669668,1558669668),
('博客管理',2,NULL,NULL,NULL,1558670469,1558670469);

insert  into `admin_auth_item_child`(`parent`,`child`) values
('博客管理','/adminblog/*'),
('博客管理','/adminblog/catalog/*'),
('博客管理','/adminblog/catalog/create'),
('博客管理','/adminblog/catalog/delete'),
('博客管理','/adminblog/catalog/index'),
('博客管理','/adminblog/catalog/update'),
('博客管理','/adminblog/catalog/view'),
('博客管理','/adminblog/comment/*'),
('博客管理','/adminblog/comment/create'),
('博客管理','/adminblog/comment/delete'),
('博客管理','/adminblog/comment/index'),
('博客管理','/adminblog/comment/update'),
('博客管理','/adminblog/comment/view'),
('博客管理','/adminblog/default/*'),
('博客管理','/adminblog/default/index'),
('博客管理','/adminblog/post/*'),
('博客管理','/adminblog/post/create'),
('博客管理','/adminblog/post/delete'),
('博客管理','/adminblog/post/index'),
('博客管理','/adminblog/post/update'),
('博客管理','/adminblog/post/view'),
('博客管理','/adminblog/tag/*'),
('博客管理','/adminblog/tag/create'),
('博客管理','/adminblog/tag/delete'),
('博客管理','/adminblog/tag/index'),
('博客管理','/adminblog/tag/update'),
('博客管理','/adminblog/tag/view'),
('系统管理员','博客管理');

DROP TABLE IF EXISTS `blog_catalog`;

CREATE TABLE `blog_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `is_nav` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '50',
  `page_size` int(11) NOT NULL DEFAULT '10',
  `template` varchar(255) NOT NULL DEFAULT 'post',
  `redirect_url` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_nav` (`is_nav`),
  KEY `sort_order` (`sort_order`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `blog_comment`;

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blog_comment` */

/*Table structure for table `blog_post` */

DROP TABLE IF EXISTS `blog_post`;

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `brief` text,
  `content` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  KEY `FK_post_user` (`user_id`),
  CONSTRAINT `FK_post_catalog` FOREIGN KEY (`catalog_id`) REFERENCES `blog_catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_post_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `blog_tag` */

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert  into `admin_menu`(`id`,`name`,`parent`,`route`,`order`,`data`) values
(9,'博客',NULL,'/adminblog/default/index',NULL,NULL),
(10,'分类',9,'/adminblog/catalog/index',NULL,NULL),
(11,'文章',9,'/adminblog/post/index',NULL,NULL),
(12,'评论',9,'/adminblog/comment/index',NULL,NULL),
(13,'标签',9,'/adminblog/tag/index',NULL,NULL);


insert  into `migration`(`version`,`apply_time`) values
('m141208_201480_blog_init',1558619572);

/*Table structure for table `user` */
