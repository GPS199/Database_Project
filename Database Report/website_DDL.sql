CREATE TABLE IF NOT EXISTS `websites` (
  `website_id` SMALLINT NOT NULL AUTO_INCREMENT,				#website_id = 4038
  `Website` VARCHAR(45) NOT NULL,											#Website = “www.google.com”
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` SMALLINT NOT NULL AUTO_INCREMENT,				#country_id = 176
  `country` VARCHAR(40) NOT NULL,												#country = “Turkey”
  PRIMARY KEY (`country_id`));

CREATE TABLE IF NOT EXISTS `website_countries` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `country_id` SMALLINT NOT NULL,												#country_id = 176
  `Country_Rank` TINYINT NULL,														#Country_Rank = 3
  PRIMARY KEY (`website_id`, `country_id`));

CREATE TABLE IF NOT EXISTS `socialmedia` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Facebook_likes` INT NULL,															#Facebook_likes = 942000
  `Twitter_mentions` INT NULL,															#Twitter_mentions = 112000 
  `Google_pluses` INT NULL,																#Google_pluses = 117000000
  `LinkedIn_mentions` INT NULL,														#LinkedIn_mentions = 247000
  `Pinterest_pins` INT NULL,																#Pinterest_pins = 108000
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `safety` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Trustworthiness` VARCHAR(15) NOT NULL,								#Trustworthiness = “Excellent”
  `Child_Safety` VARCHAR(15) NOT NULL,									#Child_Safety = “Excellent”
  `Privacy` VARCHAR(15) NOT NULL,												#Privacy = “Excellent”
  `Status` VARCHAR(10) NOT NULL,												#Status = “ok”
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `hostages` (
  `Hosted_id` SMALLINT NOT NULL AUTO_INCREMENT,				#Hosted_id = 43
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Location` VARCHAR(45) NULL,													#Location = “United States”
  `Hosted_by` VARCHAR(170) NULL,												#Hosted_by = “Google Inc.”
  `Registrant` VARCHAR(170) NULL,												#Registrant = “DNS Admin (Google Inc.)”
PRIMARY KEY (`Hosted_id`, `website_id`));

CREATE TABLE IF NOT EXISTS `visitors_percentage` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Reach_Day_percentage` FLOAT NULL,										#Reach_Day_percentage = 8.7
  `Month_Average_Daily_Reach_percentage` FLOAT NULL,			#Month_Average_Daily_Reach_percentage = 1.1
  `Daily_Pageviews_percentage` FLOAT NULL,								#Daily_Pageviews_percentage = 45.8
  `Month_Average_Daily_Pageviews_percentage` FLOAT NULL,	#Month_Average_Daily_Pageviews_percentage = 3.5
  `Daily_Pageviews_per_user_percentage` FLOAT NULL,				#Daily_Pageviews_per_user_percentage = 33.9
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `visitors_views` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Daily_Pageviews` FLOAT NULL,													#Daily_Pageviews = 8.44896
  `Month_Average_Daily_Pageviews` FLOAT NULL,						#Month_Average_Daily_Pageviews = 7.80634
  `Daily_Pageviews_per_user` FLOAT NULL,									#Daily_Pageviews_per_user = 8496
  `Avg_Daily_Pageviews` BIGINT NULL,											#Avg_Daily_Pageviews = 4192159833
  `StumbleUpon_views` INT NULL,													#StumbleUpon_views = 246000
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `visitors` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `Traffic_Rank` INT NULL,																#Traffic_Rank = 1
  `Reach_day` FLOAT NULL,															#Reach_day = 42.3744
  `Month_Average_Daily_Reach` FLOAT NULL,								#Month_Average_Daily_Reach = 41.1494
  `Avg_Daily_Visitors` INT NULL,														#Avg_Daily_Visitors = 518108189
  PRIMARY KEY (`website_id`));

CREATE TABLE IF NOT EXISTS `subnetworks` (
  `subnetwork_id` INT NOT NULL AUTO_INCREMENT,					#subnetwork_id = 3185
  `subnetworks` VARCHAR(20) NULL,												#subnetworks = 216.58.194.132
  PRIMARY KEY (`subnetwork_id`));

CREATE TABLE IF NOT EXISTS `website_subnetworks` (
  `website_id` SMALLINT NOT NULL,												#website_id = 4038
  `subnetwork_id` INT NOT NULL,													#subnetwork_id = 3185
  PRIMARY KEY (`website_id`, `subnetwork_id`));
  
CREATE TABLE IF NOT EXISTS `registrar` (
  `registrar_id` SMALLINT NOT NULL,												#registrar_id = 146
  `Registrar` VARCHAR(100) NULL,													#registrar = “MARKMONITOR INC”
  PRIMARY KEY (`registrar_id`));

CREATE TABLE IF NOT EXISTS `website_registrar` (
  `website_id` INT NOT NULL,															#website_id = 4038
  `registrar_id` SMALLINT NOT NULL,												#registrar_id = 146
  PRIMARY KEY (`website_id`, `registrar_id`));
