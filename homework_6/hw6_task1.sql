﻿-- 1.Создать и заполнить таблицы лайков и постов.

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type ENUM('messages', 'users', 'posts', 'media') NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Временная таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TEMPORARY TABLE target_types (
  name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    (SELECT name FROM target_types ORDER BY RAND() LIMIT 1),
    CURRENT_TIMESTAMP 
  FROM messages;

-- Проверим
SELECT * FROM likes LIMIT 10;

-- Создадим таблицу постов
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,66,5,'et','Error quaerat sed eum totam maiores fuga laboriosam. Ipsam laboriosam et suscipit earum.',24,1,1,'2011-09-30 05:50:07','2018-10-05 16:40:58'),(2,91,16,'nulla','Reiciendis quo neque ea dolores numquam veritatis placeat. Qui magni consequatur qui esse. Necessitatibus officiis eum earum veniam ab.',31,1,1,'2018-03-26 16:13:57','2012-08-29 19:48:59'),(3,17,20,'recusandae','Ad fuga praesentium porro qui aut vero. Nihil enim sit explicabo tempora mollitia. Et omnis quo eos soluta. Libero voluptate error cum occaecati rerum laboriosam labore.',26,1,1,'2018-12-02 02:13:21','2019-05-08 20:14:17'),(4,37,20,'nihil','Corrupti sunt non autem provident est laboriosam. Optio dolor distinctio aut dolorem dolorum sed. Natus et rerum quo aut vero voluptate cumque.',9,1,1,'2019-10-08 20:47:20','2015-09-24 20:50:21'),(5,36,19,'vitae','Enim magnam iusto quo blanditiis quia odit culpa. Omnis neque ut voluptas et recusandae aspernatur. Veniam repellat porro rerum qui quos dolore in. Aut laborum qui eum vero sequi quidem sit.',39,1,1,'2018-08-21 19:13:32','2013-10-26 21:58:27'),(6,25,17,'dolorem','Qui sed sit quos ea. Aliquid est quidem aut doloremque. Dolor illo et error est. Est quia sunt asperiores repudiandae nam.',16,1,1,'2018-07-29 17:05:58','2013-07-22 06:14:51'),(7,3,19,'eum','Voluptates quod voluptatem repellendus incidunt laudantium. Possimus a laborum tenetur ut velit consectetur harum. Quae explicabo vel exercitationem quasi voluptatem provident.',12,0,1,'2016-12-02 22:05:51','2013-07-29 04:07:51'),(8,72,8,'debitis','Veritatis ut ea eos quo voluptatum. Omnis eum eum possimus. Ipsam laudantium sit dignissimos minima.',1,1,0,'2020-08-14 22:54:03','2014-09-13 08:30:16'),(9,21,7,'sit','Sed non possimus laudantium dolor sunt quia. Eveniet corporis sit vel sit. Accusantium non velit nobis veritatis in blanditiis ullam. Assumenda accusamus rerum consequuntur maxime vero provident.',38,0,0,'2012-07-31 07:00:24','2017-05-31 17:25:43'),(10,61,18,'ut','Veniam molestiae non magnam occaecati. Blanditiis accusamus asperiores consequatur quo. Ipsa aliquam vero eum ex. Laudantium explicabo nemo dolor rerum consectetur culpa sint.',40,0,0,'2015-10-06 01:55:29','2011-12-20 10:39:38'),(11,81,17,'quia','Molestias corrupti magnam vel quia magni autem. Debitis consequatur odio illo. Provident odit harum laboriosam neque ut quia. Autem nemo sapiente quo velit iusto nihil aut consectetur.',32,0,1,'2020-02-16 21:51:46','2013-01-27 20:24:19'),(12,31,7,'veritatis','Et maiores maxime porro vitae aut. Exercitationem rerum incidunt in minima voluptatem. Doloribus placeat ducimus dolorum quis quam omnis.',29,0,1,'2018-03-17 18:52:40','2011-11-22 04:50:35'),(13,15,6,'sapiente','Nihil amet et voluptatem in cum. Temporibus mollitia ex molestiae consequatur impedit accusantium. Voluptatem voluptatem unde voluptatem sit repudiandae est. Dolorem et eum impedit sed soluta sed ut.',36,1,0,'2019-12-25 21:45:32','2019-02-12 08:01:51'),(14,72,16,'molestiae','Rerum ducimus in pariatur fuga repellendus error cumque error. Dolor ipsum delectus qui earum aperiam incidunt. Id ullam debitis labore nam. Nihil laudantium et est et.',49,1,1,'2015-08-14 01:10:41','2013-12-01 22:49:14'),(15,21,3,'assumenda','Dolorem corrupti quos voluptate odit temporibus aut. Qui et dolores nam repellendus laborum. Perspiciatis hic qui maiores maiores sapiente.',37,0,0,'2021-01-15 03:12:14','2018-07-01 21:56:58'),(16,34,3,'autem','Repellat ut neque a placeat. Esse doloremque quis pariatur aliquam et delectus in. Sint ducimus voluptates omnis non dicta deleniti. Consequatur quas atque autem provident quas. Reprehenderit voluptatem aut et a praesentium nostrum.',34,0,0,'2017-09-13 00:54:59','2012-10-04 04:55:39'),(17,66,20,'rerum','Molestiae aliquam est tempora enim nihil ut. Hic doloremque amet ullam et ea quam. Dolore quaerat soluta et.',26,0,1,'2018-01-01 13:48:23','2019-09-01 08:33:13'),(18,66,4,'consequatur','Perspiciatis hic unde delectus et nihil. Reprehenderit est et modi necessitatibus voluptate. Ea consectetur laudantium eveniet cumque.',46,0,0,'2017-06-03 00:51:09','2019-05-16 15:27:10'),(19,2,16,'ut','Molestias ea odit aspernatur voluptatem. Totam eos repellendus est atque ipsa. Velit maxime ab id aut recusandae.',16,0,0,'2013-02-02 05:43:39','2020-08-12 12:49:07'),(20,53,20,'voluptatum','Mollitia eum dolore animi atque. Quasi molestiae aut et qui sed accusamus. A accusantium molestiae et aut et consequuntur quam. Deleniti aspernatur officia sunt odit atque.',37,0,0,'2020-05-16 14:08:05','2015-02-01 14:53:53'),(21,30,3,'repudiandae','Rerum reprehenderit quidem aliquam numquam animi et. Sint nam impedit dolorem dolorem possimus ipsum vero. Tenetur autem quia ut ipsum sit est est.',48,1,1,'2012-02-01 11:03:39','2018-10-10 09:00:15'),(22,3,5,'sit','Corporis itaque eveniet quaerat quis cum. Dolor est alias est dolor. Quia amet enim consequatur eum. Corporis vel provident modi esse fuga quisquam.',12,1,1,'2015-07-08 21:37:23','2018-04-14 12:28:22'),(23,85,12,'atque','Deserunt ut cumque aut. Optio architecto maiores ipsa suscipit enim. Facere quo eius corporis omnis laudantium est libero. Fuga minus distinctio est.',40,0,0,'2020-03-10 00:47:08','2012-03-16 15:39:04'),(24,44,14,'fuga','Velit placeat nihil animi est accusamus est. Aut velit pariatur neque dolore nihil similique qui. Totam id voluptas eos ratione.',33,1,1,'2015-07-14 05:21:32','2016-12-03 09:35:12'),(25,26,9,'omnis','Suscipit aut minima a et aliquam nobis eligendi. Sed rerum voluptatem est cupiditate ipsum perspiciatis quis. Deleniti ut quidem non aliquam. Reprehenderit officia aspernatur provident dolorem.',45,1,0,'2018-12-11 03:45:03','2016-01-20 23:05:35'),(26,22,2,'ut','Beatae rerum beatae eos qui deleniti id. Ut eos sint aut porro perspiciatis. Rerum sunt quasi quisquam necessitatibus magni.',6,0,0,'2016-07-31 08:14:30','2014-06-02 18:03:07'),(27,38,18,'dolorem','Aspernatur nesciunt omnis labore. Sit veritatis in qui dolorum nisi fuga optio sed. Ea a eum et iure dignissimos fugit. Optio dolorum ex consequatur et quam. Laboriosam voluptatibus deserunt voluptates eos vel iusto ut qui.',34,1,1,'2016-09-27 09:28:17','2019-12-09 11:47:37'),(28,28,3,'fuga','Id autem sint perspiciatis aut laboriosam odit fugiat. Accusantium recusandae ipsam non non commodi debitis aut.',18,1,1,'2016-01-15 18:33:41','2014-10-26 07:23:11'),(29,36,11,'molestias','Delectus laborum perferendis voluptas dolorum. Harum tenetur qui laborum iste. Qui minus tempora nesciunt qui rerum dicta. Adipisci dicta aut consectetur nostrum qui.',46,0,0,'2013-08-04 20:07:01','2014-04-24 08:24:11'),(30,85,15,'cum','Totam ut velit placeat quas itaque tempora nemo. Facilis sed quae tenetur molestiae fugit quibusdam. Repudiandae unde ea quod enim voluptas.',24,0,0,'2021-03-04 21:28:57','2019-01-24 11:34:41'),(31,83,10,'et','Voluptatem molestiae unde aut sint aut quam. Explicabo vitae quis quisquam fugit numquam omnis. Perspiciatis facilis rem error sunt perferendis esse non.',34,0,1,'2018-04-04 14:21:48','2020-03-04 18:09:04'),(32,67,16,'vitae','Quis doloremque eum quo accusantium omnis iusto. Quisquam saepe maiores deserunt porro aliquid amet soluta quas. Optio sunt ab quasi molestiae debitis. Reiciendis provident quia ab.',16,0,0,'2019-10-28 18:21:26','2020-05-17 06:49:29'),(33,49,13,'aut','Et molestiae asperiores maiores unde. Sunt laborum ratione impedit beatae repellat quos blanditiis. Quas quia commodi ducimus. Qui voluptatibus ut impedit molestiae magnam dolorem cupiditate.',38,0,0,'2018-08-16 20:33:51','2014-09-06 04:46:28'),(34,74,1,'minima','Ipsam et laudantium deserunt delectus maxime accusamus omnis optio. Veritatis dolores quidem sequi omnis. Omnis enim quia explicabo officia quia. Aut at velit eius recusandae similique ut debitis saepe.',41,1,0,'2014-07-14 19:41:14','2014-06-15 05:44:18'),(35,25,9,'quia','Nihil doloribus esse ipsum unde quia. Aliquam non alias repellat. Pariatur rerum expedita et asperiores earum voluptatibus nostrum.',32,1,1,'2020-04-23 14:47:14','2011-08-18 08:45:25'),(36,28,3,'mollitia','Molestias occaecati voluptates dolorem sint quia. Eos doloremque eius ad vel sed fuga. Qui tempore nihil quis suscipit. Nam fuga rerum consequatur repudiandae explicabo quo provident.',36,0,0,'2015-02-01 04:17:40','2020-09-16 14:19:03'),(37,1,10,'et','Autem voluptatem et culpa sit ducimus dolorem voluptas. Aperiam voluptatem necessitatibus autem blanditiis ut omnis perferendis. Rerum accusantium et vel sit corrupti. Delectus assumenda corrupti modi aut sequi non pariatur.',2,0,0,'2016-06-03 18:18:49','2017-09-07 22:52:38'),(38,10,8,'maxime','Ab rerum nisi ab tempore voluptatem architecto quo. Sunt inventore similique modi minus necessitatibus pariatur. Illum maxime sit deserunt debitis voluptatem. Ut non sit modi deserunt sequi adipisci ut.',18,0,0,'2018-02-20 04:45:36','2016-10-08 01:53:31'),(39,84,1,'voluptatem','Voluptas est est sed esse. Nemo molestiae modi et. Id quas vel ipsum omnis sequi voluptas consequuntur.',33,0,1,'2018-05-10 03:54:38','2016-11-02 09:46:14'),(40,99,4,'voluptatem','Dolores praesentium labore enim sed nobis qui qui et. Placeat consequatur dolore aspernatur et sit voluptas consequuntur. Amet minus aspernatur velit ut. Velit ut dolorem quidem et sint.',9,1,0,'2016-08-14 00:46:31','2011-12-26 12:49:16'),(41,26,19,'nisi','Quam officiis qui ex perferendis earum aliquid et quas. Quos vero qui recusandae deleniti tempora.',42,0,1,'2012-12-20 06:04:41','2012-05-13 08:31:52'),(42,59,14,'voluptas','Iusto numquam ut voluptatum inventore veniam quia est. Et possimus commodi totam rem. Sunt reprehenderit velit velit et.',26,0,0,'2017-03-15 14:26:04','2012-10-26 07:39:18'),(43,83,18,'inventore','Error est ipsa quod temporibus aut. Omnis recusandae quod eum temporibus unde ut voluptatem modi. Dignissimos ipsa at ipsa quia autem. Optio id nostrum et.',41,0,1,'2011-10-15 01:33:02','2020-10-11 03:29:21'),(44,80,6,'qui','Adipisci eius quia et deleniti eum voluptatem ex. Dolores id ab sint in. Quod adipisci repellat et dicta sed assumenda. Non rerum dolore tempora commodi ut dolorem sit qui.',47,1,1,'2014-09-08 03:25:07','2017-05-31 01:12:29'),(45,48,13,'maiores','Reprehenderit hic cupiditate incidunt quos consequuntur inventore. Consectetur omnis voluptatum veniam saepe modi temporibus quidem vel. Sed reiciendis et et officia dolores non optio. Adipisci est dolorum iste natus enim quia beatae blanditiis.',20,1,0,'2014-02-20 18:26:28','2015-05-12 22:21:11'),(46,79,20,'consectetur','Consequatur corporis qui sint doloribus debitis rerum ex. Et dolorem dolor optio sed. Et numquam quo fuga sit impedit. Consequatur recusandae odio est voluptates omnis dolorem aut.',36,1,0,'2016-11-24 13:19:02','2016-04-07 07:23:33'),(47,97,16,'laborum','Et est rerum expedita officia. Cumque voluptate fugit quidem sunt commodi repellendus eius. Cum rerum illo omnis fuga sint est et. Sit aut expedita tempore laboriosam explicabo omnis. Enim quidem et et qui eligendi.',42,1,0,'2019-11-22 17:12:01','2020-09-15 08:34:33'),(48,44,7,'possimus','Incidunt non et non omnis nihil quos. Quis exercitationem ex rem rerum. Voluptas a voluptate quis doloribus repudiandae nisi sit.',16,0,0,'2018-05-31 00:14:00','2018-04-11 09:09:03'),(49,71,18,'non','Vel officia ipsum dolores iste porro. Tempora quia mollitia ut maxime est porro totam. Asperiores pariatur mollitia autem beatae.',11,1,1,'2016-08-12 08:34:42','2015-10-07 15:50:01'),(50,71,10,'ut','Quis eos iste rerum non perspiciatis modi aut sunt. Illo voluptate eos expedita deleniti molestiae illo amet qui. Aut impedit eligendi blanditiis perspiciatis perferendis.',22,0,0,'2015-08-07 05:34:09','2021-02-06 01:22:13'),(51,50,14,'vero','Aut nobis consequatur quas labore adipisci. Rerum temporibus autem quia suscipit temporibus. Nihil voluptas magnam doloremque assumenda occaecati minus. Eius aut impedit sint voluptatem assumenda.',3,1,0,'2014-04-21 19:12:58','2013-12-30 08:21:39'),(52,35,8,'tempore','Sunt soluta aut blanditiis totam nesciunt ipsum ducimus. Et omnis commodi et.',21,1,1,'2019-03-19 04:12:16','2015-12-21 04:17:57'),(53,73,5,'dolorem','Sint placeat voluptatum et perspiciatis ut et. Assumenda ipsam dolores non. Architecto ratione rerum cum voluptatem a. Ut et adipisci voluptatem ut ut.',39,1,0,'2020-10-19 10:55:31','2013-05-06 22:04:34'),(54,21,14,'incidunt','Est voluptates consequuntur adipisci beatae. Odio quia impedit explicabo molestias nobis molestiae eum. Placeat qui explicabo ut rem et.',24,1,0,'2015-05-15 01:05:11','2012-04-25 16:30:42'),(55,93,19,'sit','Quis sint aspernatur libero quaerat voluptas. Sed sequi facilis architecto cum animi iste. Veritatis voluptatem ut voluptas illo corporis. Reiciendis officia aut rem et rerum non.',45,0,0,'2017-02-19 01:02:03','2012-03-26 10:51:38'),(56,60,3,'porro','Quidem nihil autem dolorum. Est neque impedit quibusdam dolorum voluptatem expedita consequatur. Similique quis nisi occaecati praesentium et sed enim quia.',21,1,0,'2011-10-27 09:02:41','2012-05-30 02:15:40'),(57,47,18,'atque','Quam aut suscipit ea assumenda doloribus. Consectetur excepturi velit sit perferendis. Et ad rerum autem molestiae quas quo dicta. Quibusdam culpa cum in placeat possimus eos.',11,1,0,'2012-10-10 03:39:16','2011-07-16 07:26:35'),(58,25,2,'voluptatem','Nam modi ut qui. Dignissimos velit omnis voluptatem aut repudiandae aut aut. Eum aut sequi accusamus vero eos voluptas dolor. Omnis ut ut dolorem suscipit inventore doloribus.',12,1,1,'2016-11-21 21:34:04','2013-04-12 23:43:52'),(59,43,9,'repudiandae','Et et provident non quis natus quo. Exercitationem maxime fuga quia voluptatem. Totam voluptatem magni quasi optio laboriosam et iste. Et doloribus sapiente dolorem voluptatem explicabo veritatis.',32,1,1,'2013-11-25 20:26:36','2012-02-26 21:14:54'),(60,80,14,'aut','Sed qui perferendis sit ut non delectus voluptas molestias. Accusantium earum voluptas ut voluptates laborum molestias. Ea ratione ab sint dolor voluptas.',15,1,0,'2018-09-09 10:07:24','2016-05-11 13:20:29'),(61,20,10,'dicta','Rem a laudantium aut suscipit ut cupiditate nihil veritatis. Fugiat esse quaerat qui laboriosam culpa. Omnis totam et consequuntur nemo.',18,1,0,'2011-11-12 21:44:26','2019-01-09 13:06:30'),(62,66,7,'magni','Modi cumque nesciunt nisi beatae eos nesciunt nobis. Et dignissimos tempora et fugiat sit quis sed. Fugit incidunt sint et. Nihil qui autem fugiat quia deserunt et illum voluptas.',38,0,0,'2012-11-10 13:10:56','2016-08-18 08:46:20'),(63,58,1,'quidem','Nam ut inventore quis laboriosam enim corporis. Placeat maiores facilis quidem numquam quo nam eum aut. Pariatur accusantium ut rerum aut assumenda recusandae facere. Omnis sint a sit tenetur corrupti. Aspernatur soluta labore aut eos dolor.',22,0,0,'2021-04-14 03:48:10','2016-11-22 08:03:04'),(64,89,16,'ut','Iste inventore nesciunt ea maiores. Autem ut quasi autem et voluptatem quam dolor quasi. Quisquam voluptas officiis iusto ut est pariatur.',21,0,0,'2016-08-31 22:52:57','2016-11-21 22:26:13'),(65,41,1,'eaque','Fuga unde aspernatur cumque. Eos mollitia aut exercitationem quia aut praesentium. Dolores vel dolor impedit tempora quia rerum tempora.',13,1,1,'2018-06-17 18:58:06','2015-02-18 05:31:19'),(66,88,3,'id','Totam quia provident illum ab. Ipsam qui veniam quo vitae aperiam repellat pariatur. Consectetur quis vel qui. Laboriosam a debitis perferendis ipsum. Laudantium sed vitae quia voluptas velit aut quibusdam.',8,0,0,'2011-05-09 16:41:40','2016-05-20 22:22:10'),(67,61,10,'voluptatem','Sunt nihil voluptates illum quasi. Libero atque accusantium ut eos qui tempore. Tempore sapiente incidunt similique quis at iusto omnis. Occaecati est provident quo eos non. Ea inventore qui ducimus repellat voluptatum.',43,1,0,'2018-06-04 20:27:52','2020-05-02 01:41:41'),(68,20,9,'quia','Deserunt non similique odio iste eos quis. Cum quaerat labore quo labore cumque. Voluptas voluptatem sit eaque optio quia. Accusamus nesciunt eos et ea eius est maxime. Assumenda dolor nesciunt nulla aut qui.',5,0,0,'2020-10-10 09:23:13','2019-01-29 07:08:04'),(69,29,20,'blanditiis','Facere vero sapiente possimus quos. Enim sunt voluptas fugit minus ut molestias. Quasi quam at quia qui.',19,0,0,'2017-08-18 22:17:55','2020-03-13 09:29:16'),(70,2,3,'sit','Qui iure recusandae non rerum sit. Molestias quo aut vel ut rem autem ducimus. Necessitatibus tempora dolorem impedit corrupti.',33,1,1,'2018-06-16 05:48:07','2013-03-26 21:43:06'),(71,38,14,'labore','Occaecati ea aut ut dolores quidem dolores adipisci aut. Quidem dolorum aut hic. Maiores commodi non omnis blanditiis deserunt dolores culpa.',47,1,1,'2011-09-03 03:54:23','2018-12-10 10:01:09'),(72,64,11,'non','Eligendi fugiat at neque fugiat repudiandae quia illum pariatur. Aut ut quidem et veniam sint. Consequatur sed ut quia minus dolores dolore eum. Delectus modi ratione voluptas voluptatem pariatur similique.',32,0,1,'2012-03-23 01:38:46','2016-12-17 23:44:28'),(73,58,1,'eum','Nihil qui sunt velit eos ad optio nulla. Ex repudiandae laboriosam autem ea ipsam voluptatem et. Voluptas et omnis magnam amet molestias ipsam eaque. Distinctio necessitatibus ut numquam recusandae sapiente aut aut. Exercitationem porro hic quia iure quis porro iste.',12,0,0,'2013-02-14 19:25:36','2015-03-29 04:59:47'),(74,40,18,'cum','Eum odit rem quidem dolor perspiciatis quos. Nulla ut officiis sit ut. Qui sint quae sunt dolor qui quos delectus. Consequatur est veritatis suscipit est quia molestiae fugiat.',23,0,1,'2011-07-18 18:19:13','2020-03-25 04:19:56'),(75,7,4,'labore','Porro sunt voluptatem blanditiis suscipit necessitatibus. Officiis ratione quod veniam nobis assumenda. Amet vitae eum alias similique consectetur et.',40,1,1,'2019-05-07 15:30:38','2014-01-16 02:24:07'),(76,66,6,'molestiae','Totam dolor hic saepe. Unde et enim aliquid iure est nobis repellat laboriosam. Nihil et sunt assumenda quis in assumenda expedita. Omnis nisi vitae repellendus ut dignissimos ut. Voluptatem ut aut beatae consequatur.',40,1,0,'2019-04-14 22:20:50','2019-12-02 03:12:35'),(77,66,13,'inventore','Quis aut laborum dolores fugiat quaerat. Ut dignissimos voluptates quo est cum iure. Exercitationem ipsa alias libero perspiciatis.',47,1,0,'2016-05-11 11:21:26','2017-09-07 12:29:21'),(78,9,11,'et','Dolorem dicta cumque tempora tempore. Nemo ut iusto odio veniam sunt. Doloremque quos rerum minima aut qui eum.',25,1,1,'2018-09-17 08:14:54','2016-12-01 22:24:44'),(79,4,7,'ipsum','Saepe voluptas nam delectus id alias aut quidem. Nulla quasi sit voluptate. At pariatur facere molestiae praesentium quo excepturi. Voluptatem minima sint sint et commodi.',11,1,0,'2015-05-03 08:45:40','2013-08-03 12:31:41'),(80,32,15,'in','Eligendi magni veritatis fuga non cum. Ipsam deserunt non atque. Ex aut molestiae pariatur quo.',33,1,0,'2016-01-14 09:44:45','2012-08-12 17:34:15'),(81,91,2,'reprehenderit','Aut et doloribus molestias quia. Totam aut qui sapiente temporibus qui tempore. Molestiae quas quas sapiente accusamus non.',4,1,0,'2017-12-27 08:42:37','2017-03-13 13:54:36'),(82,91,1,'distinctio','Et aut aut enim omnis laborum eum quia. Natus recusandae in et numquam nisi ducimus quidem. Facilis ipsum quos repellat vel voluptatem. Sit consequatur iste rerum qui aut quo.',25,1,1,'2014-08-02 23:48:33','2014-05-02 10:36:13'),(83,85,5,'harum','Omnis magnam eos repellat in temporibus reiciendis. Ut accusamus tenetur ut doloremque enim incidunt quaerat. Ut quia ipsam velit qui maiores.',40,1,1,'2020-02-10 01:34:17','2014-10-14 00:19:20'),(84,53,15,'corporis','Ut excepturi neque sit. Ipsa inventore maiores voluptatem dolore et temporibus. Dolores iure voluptatem numquam vel cupiditate.',11,1,0,'2020-04-22 20:13:50','2012-11-09 01:47:33'),(85,40,19,'unde','Aperiam omnis ut ducimus exercitationem assumenda delectus labore. Ad aspernatur ea velit eveniet et. Rerum laudantium numquam quod sunt sed. Eos sed rem atque cumque neque non sunt ea. Est minus impedit non eum beatae.',14,0,0,'2019-10-25 16:32:49','2014-02-02 19:04:59'),(86,26,5,'maiores','Eos qui in possimus iste nam fugiat. Modi saepe corporis magni ut nemo quis quia. Quam maxime architecto quod. Labore in qui quam odit molestias minus.',50,1,0,'2012-07-25 22:57:26','2016-05-06 23:13:49'),(87,70,4,'qui','Perferendis excepturi tempora rerum repellendus amet facere. Quibusdam asperiores minus assumenda doloribus debitis et est. Repudiandae sed qui ipsa hic eius molestiae. Nihil in molestiae suscipit cum molestias nobis.',18,0,0,'2013-02-14 12:47:16','2012-07-05 15:51:54'),(88,53,10,'impedit','Magnam quia quasi enim modi et quam quia voluptas. Quisquam nostrum nulla aut est nesciunt. Hic vel veritatis quis.',32,1,0,'2013-03-19 16:04:18','2018-01-21 00:48:50'),(89,1,12,'perferendis','Dolores ut dolores necessitatibus quisquam et ea animi. Reprehenderit neque quasi eum minus nobis et consequatur enim. Nostrum sed aliquam illum fugit aut ut iusto. Nemo doloribus aliquam ratione ut id illo.',32,0,0,'2014-12-15 23:36:35','2013-03-08 22:43:39'),(90,75,15,'quia','Laudantium voluptatibus accusamus et sit. Veniam atque deserunt dolor. Aut repellat quaerat est alias doloribus libero labore. Architecto culpa repellendus molestias doloribus sint. Esse dolor numquam qui omnis facilis dolorem soluta sapiente.',34,0,0,'2019-06-26 02:57:48','2016-09-19 07:46:03'),(91,17,9,'quaerat','Ut laboriosam voluptatem doloremque ducimus qui tempore vitae facere. Sint fugit dolor non voluptatibus. Quo iusto non enim quibusdam.',10,0,0,'2020-10-24 19:36:40','2011-10-25 02:07:50'),(92,40,11,'non','Quam quaerat porro alias unde dolorem distinctio. Voluptas qui tenetur necessitatibus officiis voluptates vitae. Et sed nobis qui in ut facere.',11,0,0,'2018-09-30 19:53:26','2014-05-01 15:09:57'),(93,32,14,'vero','Fugiat qui exercitationem at. Eos sed cum nulla quos saepe tempore. Dicta dolor veniam voluptates dolorem.',19,0,1,'2019-07-18 10:30:31','2014-09-21 01:00:11'),(94,8,14,'qui','Dolore omnis facere quia et aut. Reiciendis accusantium vel cum expedita excepturi et suscipit. Dolorem dolorum in atque est autem. Rerum amet odit voluptas. Ut recusandae accusantium dolorem qui cumque ea illum est.',11,0,0,'2019-11-23 18:47:47','2013-08-11 21:38:22'),(95,20,16,'et','Voluptatem voluptate cum inventore omnis quisquam unde voluptas. Eaque ad animi ab sint sit omnis omnis est. Sunt mollitia fugit aut sequi et laudantium ut. Eius et et sit quibusdam aut fuga rerum et.',9,1,0,'2020-02-12 17:26:28','2013-10-08 11:13:54'),(96,32,18,'voluptatem','Id voluptates aperiam eaque dolorum exercitationem tempora. Aut veritatis officiis quia expedita animi expedita nobis. Eveniet perspiciatis dignissimos similique.',4,1,1,'2013-11-22 14:08:43','2015-09-06 17:40:57'),(97,54,8,'qui','Sit rerum eveniet inventore dolores error eaque saepe. Et aut nam eveniet corporis inventore facere laboriosam est. Magnam eum quaerat voluptatem et atque ea.',37,1,1,'2012-08-13 21:27:51','2014-05-29 19:25:47'),(98,25,8,'est','Qui quisquam error impedit. Molestiae nihil debitis sed ex. Molestias reiciendis eum soluta qui. In fugiat delectus omnis ipsa aut minima voluptates et.',40,0,0,'2011-10-19 12:22:08','2015-10-17 23:02:37'),(99,51,20,'qui','Nisi id libero nisi cumque molestias est veritatis. Porro illo eligendi assumenda quo. Est beatae sed enim commodi voluptatem quia. Autem ut atque voluptates vel.',37,0,0,'2013-03-29 08:17:33','2018-07-29 16:01:51'),(100,13,6,'maxime','Deserunt temporibus tempora aut ipsa dolor libero. Dolores ea non harum quas. Nostrum eius quas odit cum iste eum. Aut odio vitae odio eum nam ex quaerat quis.',20,1,0,'2019-06-15 20:04:40','2011-08-24 06:27:33');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-04 17:50:50

-- Проверим
SELECT * FROM posts LIMIT 10;

-- Приводим в порядок временные метки
SELECT * FROM posts WHERE updated_at < created_at;
UPDATE posts SET updated_at = NOW() WHERE updated_at < created_at; 
