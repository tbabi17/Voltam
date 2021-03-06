-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 05, 2017 at 03:53 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `optimal`
--

-- --------------------------------------------------------

--
-- Table structure for table `crm_balance`
--

CREATE TABLE IF NOT EXISTS `crm_balance` (
  `id` int(11) NOT NULL auto_increment,
  `incoming` double NOT NULL,
  `outgoing` double NOT NULL,
  `pty` float NOT NULL,
  `type` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` datetime NOT NULL,
  `amount` double NOT NULL,
  `descr` varchar(256) collate utf8_unicode_ci NOT NULL,
  `deposit` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1434429 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_balance_check`
--

CREATE TABLE IF NOT EXISTS `crm_balance_check` (
  `incoming` double NOT NULL,
  `outgoing` double NOT NULL,
  `pty` double NOT NULL,
  `type` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` datetime NOT NULL,
  `amount` double NOT NULL,
  `crm_id` int(11) NOT NULL,
  `descr` varchar(256) collate utf8_unicode_ci NOT NULL,
  `deposit` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`incoming`,`outgoing`,`product_id`,`price`,`crm_id`,`descr`,`deposit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_balance_tmp`
--

CREATE TABLE IF NOT EXISTS `crm_balance_tmp` (
  `id` int(11) NOT NULL auto_increment,
  `incoming` double NOT NULL,
  `outgoing` double NOT NULL,
  `pty` float NOT NULL,
  `type` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` datetime NOT NULL,
  `amount` double NOT NULL,
  `descr` varchar(256) collate utf8_unicode_ci NOT NULL,
  `deposit` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1276587 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_calllog`
--

CREATE TABLE IF NOT EXISTS `crm_calllog` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `subject` varchar(200) collate utf8_unicode_ci NOT NULL,
  `calltype` varchar(16) collate utf8_unicode_ci NOT NULL default 'outbound',
  `purpose` varchar(120) collate utf8_unicode_ci NOT NULL,
  `callresult` varchar(20) collate utf8_unicode_ci NOT NULL default 'pending',
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `duration` int(11) NOT NULL default '0',
  `_from` varchar(12) collate utf8_unicode_ci NOT NULL default 'system',
  `_to` varchar(12) collate utf8_unicode_ci NOT NULL,
  `priority` varchar(32) collate utf8_unicode_ci NOT NULL default 'medium',
  `remind_type` varchar(11) collate utf8_unicode_ci NOT NULL,
  `remind_at` date NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL default 'user defined',
  `deal_id` int(120) NOT NULL,
  `case_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `googleSync` varchar(10) collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_campaign`
--

CREATE TABLE IF NOT EXISTS `crm_campaign` (
  `id` int(11) NOT NULL auto_increment,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `total_members` int(11) NOT NULL,
  `campaign_live` varchar(32) collate utf8_unicode_ci NOT NULL default 'dynamic',
  `campaign_type` varchar(80) collate utf8_unicode_ci NOT NULL,
  `campaign_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'planning',
  `expected_revenue` bigint(20) NOT NULL,
  `budgeted_cost` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `product_name` varchar(128) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `personal` longtext collate utf8_unicode_ci NOT NULL,
  `company` varchar(80) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_case_products`
--

CREATE TABLE IF NOT EXISTS `crm_case_products` (
  `id` int(11) NOT NULL auto_increment,
  `case_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `product_name` varchar(200) collate utf8_unicode_ci NOT NULL,
  `contract` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_changeprice`
--

CREATE TABLE IF NOT EXISTS `crm_changeprice` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `change_date` date NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_comission`
--

CREATE TABLE IF NOT EXISTS `crm_comission` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_companies`
--

CREATE TABLE IF NOT EXISTS `crm_companies` (
  `name` varchar(120) collate utf8_unicode_ci NOT NULL,
  `industy` varchar(80) collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_competitors`
--

CREATE TABLE IF NOT EXISTS `crm_competitors` (
  `id` int(11) NOT NULL auto_increment,
  `competitor_name` varchar(128) collate utf8_unicode_ci NOT NULL,
  `www` varchar(128) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_complain`
--

CREATE TABLE IF NOT EXISTS `crm_complain` (
  `case_id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `complain_type` varchar(32) collate utf8_unicode_ci NOT NULL default 'question',
  `complain_origin` varchar(32) collate utf8_unicode_ci NOT NULL default 'phone',
  `priority` varchar(32) collate utf8_unicode_ci NOT NULL default 'medium',
  `complain_reason` varchar(500) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` date NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `phone` varchar(32) collate utf8_unicode_ci NOT NULL,
  `email` varchar(60) collate utf8_unicode_ci NOT NULL,
  `case_stage` varchar(32) collate utf8_unicode_ci NOT NULL default 'identify',
  `resolution_type` varchar(32) collate utf8_unicode_ci NOT NULL,
  `resolution` text collate utf8_unicode_ci NOT NULL,
  `complain_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'open',
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `groupId` varchar(15) collate utf8_unicode_ci NOT NULL,
  `calltype` varchar(32) collate utf8_unicode_ci NOT NULL default 'inbound',
  `call_from` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`case_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_complain_transfer`
--

CREATE TABLE IF NOT EXISTS `crm_complain_transfer` (
  `id` int(11) NOT NULL auto_increment,
  `case_id` int(11) NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_from` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_corporate_types`
--

CREATE TABLE IF NOT EXISTS `crm_corporate_types` (
  `industry_sub` varchar(200) collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `crm_customer`
--

CREATE TABLE IF NOT EXISTS `crm_customer` (
  `crm_id` int(11) NOT NULL auto_increment,
  `_class` varchar(32) collate utf8_unicode_ci NOT NULL default 'RETAIL',
  `type` varchar(25) collate utf8_unicode_ci NOT NULL default 'ХУВЬ ХҮН',
  `work_status` varchar(80) collate utf8_unicode_ci NOT NULL,
  `title` varchar(500) collate utf8_unicode_ci NOT NULL,
  `job_title` varchar(250) collate utf8_unicode_ci NOT NULL,
  `job_type` varchar(50) collate utf8_unicode_ci NOT NULL,
  `phone` varchar(32) collate utf8_unicode_ci NOT NULL,
  `phone1` varchar(32) collate utf8_unicode_ci NOT NULL,
  `phone2` varchar(32) collate utf8_unicode_ci NOT NULL,
  `fax` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `level` varchar(11) collate utf8_unicode_ci NOT NULL default 'suspect',
  `regNo` varchar(12) collate utf8_unicode_ci NOT NULL,
  `firstName` varchar(80) collate utf8_unicode_ci NOT NULL,
  `lastName` varchar(80) collate utf8_unicode_ci NOT NULL,
  `engName` varchar(80) collate utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(12) collate utf8_unicode_ci NOT NULL,
  `email` varchar(80) collate utf8_unicode_ci NOT NULL default '',
  `www` varchar(128) collate utf8_unicode_ci NOT NULL,
  `country` varchar(50) collate utf8_unicode_ci NOT NULL,
  `city` varchar(50) collate utf8_unicode_ci NOT NULL,
  `district` varchar(50) collate utf8_unicode_ci NOT NULL,
  `horoo` varchar(50) collate utf8_unicode_ci NOT NULL,
  `address` varchar(500) collate utf8_unicode_ci NOT NULL,
  `postalCode` varchar(10) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default 'user',
  `decision_maker` varchar(32) collate utf8_unicode_ci NOT NULL,
  `customer_type` int(11) NOT NULL default '0',
  `source` varchar(50) collate utf8_unicode_ci NOT NULL default 'employee referral',
  `parent_crm_id` int(11) NOT NULL,
  `employees` varchar(32) collate utf8_unicode_ci NOT NULL,
  `annual_revenue` double NOT NULL,
  `capital` double NOT NULL,
  `tatvar` double NOT NULL,
  `sorog_huchin` varchar(180) collate utf8_unicode_ci NOT NULL,
  `company_torol` varchar(32) collate utf8_unicode_ci NOT NULL,
  `industry` varchar(80) collate utf8_unicode_ci NOT NULL default '',
  `industry_sub` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `syncKey` varchar(32) collate utf8_unicode_ci NOT NULL,
  `lastLogTime` timestamp NOT NULL default '0000-00-00 00:00:00',
  `mayDuplicate` int(11) NOT NULL default '0',
  `priority` varchar(32) collate utf8_unicode_ci NOT NULL default 'medium',
  `company_list` varchar(500) collate utf8_unicode_ci NOT NULL default '-',
  `pricetag` varchar(12) collate utf8_unicode_ci NOT NULL default 'price',
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `promo_code` varchar(5) collate utf8_unicode_ci NOT NULL default '-',
  `promo_precent` double NOT NULL default '0',
  `promo_amount` double NOT NULL default '0',
  `payment_type` varchar(32) collate utf8_unicode_ci NOT NULL default 'cash',
  PRIMARY KEY  (`crm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='customer list' AUTO_INCREMENT=2885 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_customer_campaigns`
--

CREATE TABLE IF NOT EXISTS `crm_customer_campaigns` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_customer_company`
--

CREATE TABLE IF NOT EXISTS `crm_customer_company` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `company` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5911 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_dates`
--

CREATE TABLE IF NOT EXISTS `crm_dates` (
  `_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deals`
--

CREATE TABLE IF NOT EXISTS `crm_deals` (
  `deal_id` int(11) NOT NULL auto_increment,
  `deal` varchar(120) collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `phone` varchar(12) collate utf8_unicode_ci NOT NULL,
  `actual_revenue` double NOT NULL,
  `expected_revenue` double NOT NULL,
  `probablity` float NOT NULL,
  `current_situation` varchar(500) collate utf8_unicode_ci NOT NULL,
  `customer_need` varchar(500) collate utf8_unicode_ci NOT NULL,
  `proposed_solution` varchar(500) collate utf8_unicode_ci NOT NULL,
  `competitor_name` varchar(80) collate utf8_unicode_ci NOT NULL,
  `closing_date` date NOT NULL,
  `remind_date` date NOT NULL,
  `status` varchar(20) collate utf8_unicode_ci NOT NULL default 'open',
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `stage` varchar(32) collate utf8_unicode_ci NOT NULL default 'lead',
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `deal_type` int(11) NOT NULL default '1',
  `deal_origin` varchar(32) collate utf8_unicode_ci NOT NULL default 'new',
  `company` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_competitors`
--

CREATE TABLE IF NOT EXISTS `crm_deal_competitors` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `competitor_name` varchar(200) collate utf8_unicode_ci NOT NULL,
  `www` varchar(128) collate utf8_unicode_ci NOT NULL,
  `reported_revenue` double NOT NULL,
  `strength` varchar(500) collate utf8_unicode_ci NOT NULL,
  `weakness` varchar(500) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_payroll`
--

CREATE TABLE IF NOT EXISTS `crm_deal_payroll` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `pay_date` date NOT NULL,
  `amount` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_products`
--

CREATE TABLE IF NOT EXISTS `crm_deal_products` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(120) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `precent` float NOT NULL,
  `pty` float NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(32) collate utf8_unicode_ci NOT NULL default 'cash',
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` varchar(128) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL default '0',
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=687713 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_products_for_plan`
--

CREATE TABLE IF NOT EXISTS `crm_deal_products_for_plan` (
  `id` int(11) NOT NULL,
  `deal_id` int(120) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `precent` float NOT NULL,
  `pty` float NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(32) collate utf8_unicode_ci NOT NULL default 'cash',
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` varchar(128) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL default '0',
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_products_old`
--

CREATE TABLE IF NOT EXISTS `crm_deal_products_old` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(120) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `precent` float NOT NULL,
  `pty` float NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(32) collate utf8_unicode_ci NOT NULL default 'cash',
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` varchar(128) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL default '0',
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=118659 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_products_tmp`
--

CREATE TABLE IF NOT EXISTS `crm_deal_products_tmp` (
  `id` int(11) NOT NULL,
  `deal_id` int(120) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `precent` float NOT NULL,
  `pty` float NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `type` varchar(32) collate utf8_unicode_ci NOT NULL default 'cash',
  `crm_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` varchar(128) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL default '0',
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_deal_sales_team`
--

CREATE TABLE IF NOT EXISTS `crm_deal_sales_team` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `precent` double NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_emails`
--

CREATE TABLE IF NOT EXISTS `crm_emails` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `priority` varchar(20) collate utf8_unicode_ci NOT NULL default 'medium',
  `email_status` varchar(20) collate utf8_unicode_ci NOT NULL default 'draft',
  `_to` varchar(128) collate utf8_unicode_ci NOT NULL,
  `_from` varchar(128) collate utf8_unicode_ci NOT NULL,
  `subject` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_events`
--

CREATE TABLE IF NOT EXISTS `crm_events` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `subject` varchar(120) collate utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `event_type` varchar(32) collate utf8_unicode_ci NOT NULL default 'meeting',
  `venue` varchar(120) collate utf8_unicode_ci NOT NULL,
  `priority` varchar(32) collate utf8_unicode_ci NOT NULL default 'medium',
  `event_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'pending',
  `remind_type` varchar(11) collate utf8_unicode_ci NOT NULL default 'popup',
  `remind_at` date NOT NULL,
  `budgeted_cost` double NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `deal_id` int(120) NOT NULL,
  `case_id` int(11) NOT NULL,
  `googleSync` varchar(10) collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_field_names`
--

CREATE TABLE IF NOT EXISTS `crm_field_names` (
  `id` int(11) NOT NULL auto_increment,
  `field_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `table_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `title` varchar(128) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_gps`
--

CREATE TABLE IF NOT EXISTS `crm_gps` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `crm_id` int(11) NOT NULL,
  `battery` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1648795 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_gps_box`
--

CREATE TABLE IF NOT EXISTS `crm_gps_box` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `crm_id` int(11) NOT NULL,
  `battery` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1648545 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_gps_old`
--

CREATE TABLE IF NOT EXISTS `crm_gps_old` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `crm_id` int(11) NOT NULL,
  `battery` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=281754 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_login_attempts`
--

CREATE TABLE IF NOT EXISTS `crm_login_attempts` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_message`
--

CREATE TABLE IF NOT EXISTS `crm_message` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(100) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_from` varchar(32) collate utf8_unicode_ci NOT NULL,
  `message_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'unread',
  `descr` text collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_mta_integration`
--

CREATE TABLE IF NOT EXISTS `crm_mta_integration` (
  `id` int(11) NOT NULL auto_increment,
  `descr` varchar(256) collate utf8_unicode_ci NOT NULL,
  `billId` varchar(256) collate utf8_unicode_ci NOT NULL,
  `qrData` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `date` varchar(256) collate utf8_unicode_ci NOT NULL,
  `ttd` varchar(512) collate utf8_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL default '1',
  `lottery` varchar(1024) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `descr` (`descr`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=57160 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_notes`
--

CREATE TABLE IF NOT EXISTS `crm_notes` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `www` varchar(256) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_owner_transfer_log`
--

CREATE TABLE IF NOT EXISTS `crm_owner_transfer_log` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `crm_id` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1081 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_personal_view`
--

CREATE TABLE IF NOT EXISTS `crm_personal_view` (
  `id` int(11) NOT NULL auto_increment,
  `personal` varchar(120) character set utf8 collate utf8_unicode_ci NOT NULL,
  `field` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  `equals` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  `value` varchar(128) character set utf8 collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_posts`
--

CREATE TABLE IF NOT EXISTS `crm_posts` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `message` text collate utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL default '0',
  `reply_id` varchar(32) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_potentials`
--

CREATE TABLE IF NOT EXISTS `crm_potentials` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `deal_id` int(120) NOT NULL,
  `closing_date` date NOT NULL,
  `stage` varchar(80) collate utf8_unicode_ci NOT NULL,
  `probablity` int(11) NOT NULL default '0',
  `next_step` varchar(80) collate utf8_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `expected_revenue` bigint(20) NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL default 'user',
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default 'user',
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_price_type`
--

CREATE TABLE IF NOT EXISTS `crm_price_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `price_number` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_products`
--

CREATE TABLE IF NOT EXISTS `crm_products` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_name` varchar(120) collate utf8_unicode_ci NOT NULL,
  `product_type` varchar(80) collate utf8_unicode_ci NOT NULL,
  `product_code` varchar(12) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(16) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(80) collate utf8_unicode_ci NOT NULL,
  `product_vendor` varchar(80) collate utf8_unicode_ci NOT NULL,
  `unit_type` varchar(10) collate utf8_unicode_ci NOT NULL,
  `unit_size` float NOT NULL default '1',
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `company` varchar(80) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `price1` float NOT NULL,
  `price2` float NOT NULL,
  `price3` float NOT NULL,
  `price4` float NOT NULL,
  `price5` float NOT NULL,
  `price6` float NOT NULL,
  `price7` float NOT NULL,
  `price8` float NOT NULL,
  `price9` float NOT NULL,
  `price10` float NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `unit_metric` double NOT NULL default '0',
  `total` double NOT NULL default '0',
  `_class` float NOT NULL default '1',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_product_available`
--

CREATE TABLE IF NOT EXISTS `crm_product_available` (
  `id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) collate utf8_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1020 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_quotes`
--

CREATE TABLE IF NOT EXISTS `crm_quotes` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `quote_code` varchar(80) collate utf8_unicode_ci NOT NULL,
  `qty` float NOT NULL,
  `amount` float NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `quote_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'draft',
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default 'user',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_quote_details`
--

CREATE TABLE IF NOT EXISTS `crm_quote_details` (
  `id` int(11) NOT NULL auto_increment,
  `quote_id` int(11) NOT NULL,
  `product_name` varchar(120) collate utf8_unicode_ci NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_activity`
--

CREATE TABLE IF NOT EXISTS `crm_report_activity` (
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `section` varchar(32) collate utf8_unicode_ci NOT NULL,
  `call_p` int(11) NOT NULL,
  `email_p` int(11) NOT NULL,
  `meeting_p` int(11) NOT NULL,
  `meeting_q` int(11) NOT NULL,
  `meeting_t` float NOT NULL,
  `quote_p` int(11) NOT NULL,
  `quote_q` int(11) NOT NULL,
  `quote_t` float NOT NULL,
  `newcus_p` int(11) NOT NULL,
  `newcus_q` int(11) NOT NULL,
  `newcus_t` float NOT NULL,
  `expat_p` int(11) NOT NULL,
  `expat_q` int(11) NOT NULL,
  `expat_t` float NOT NULL,
  `vip_p` int(11) NOT NULL,
  `vip_q` int(11) NOT NULL,
  `v_t` float NOT NULL,
  `ext_p` int(11) NOT NULL,
  `ext_a` int(11) NOT NULL,
  `ext_t` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_case`
--

CREATE TABLE IF NOT EXISTS `crm_report_case` (
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `section` varchar(32) collate utf8_unicode_ci NOT NULL,
  `c1` int(11) NOT NULL,
  `c2` int(11) NOT NULL,
  `c3` int(11) NOT NULL,
  `c4` int(11) NOT NULL,
  `c5` int(11) NOT NULL,
  `p1` int(11) NOT NULL,
  `p2` int(11) NOT NULL,
  `p3` int(11) NOT NULL,
  `s1` int(11) NOT NULL,
  `s2` int(11) NOT NULL,
  `s3` int(11) NOT NULL,
  `d1` int(11) NOT NULL,
  `d2` int(11) NOT NULL,
  `e1` int(11) NOT NULL,
  `e2` int(11) NOT NULL,
  `t1` int(11) NOT NULL,
  `t2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_compare_customer`
--

CREATE TABLE IF NOT EXISTS `crm_report_compare_customer` (
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `crm_name` varchar(128) collate utf8_unicode_ci NOT NULL,
  `month1` double NOT NULL,
  `month2` double NOT NULL,
  `month3` double NOT NULL,
  `month4` double NOT NULL,
  `month5` double NOT NULL,
  `month6` double NOT NULL,
  `month7` double NOT NULL,
  `month8` double NOT NULL,
  `month9` double NOT NULL,
  `month10` double NOT NULL,
  `month11` double NOT NULL,
  `month12` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_compare_product`
--

CREATE TABLE IF NOT EXISTS `crm_report_compare_product` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(10) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(256) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(256) collate utf8_unicode_ci NOT NULL,
  `month1` double NOT NULL,
  `month2` double NOT NULL,
  `month3` double NOT NULL,
  `month4` double NOT NULL,
  `month5` double NOT NULL,
  `month6` double NOT NULL,
  `month7` double NOT NULL,
  `month8` double NOT NULL,
  `month9` double NOT NULL,
  `month10` double NOT NULL,
  `month11` double NOT NULL,
  `month12` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_compare_product_user`
--

CREATE TABLE IF NOT EXISTS `crm_report_compare_product_user` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(256) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(256) collate utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `owner1` double NOT NULL,
  `owner2` double NOT NULL,
  `owner3` double NOT NULL,
  `owner4` double NOT NULL,
  `owner5` double NOT NULL,
  `owner6` double NOT NULL,
  `owner7` double NOT NULL,
  `owner8` double NOT NULL,
  `owner9` double NOT NULL,
  `owner10` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_compare_user`
--

CREATE TABLE IF NOT EXISTS `crm_report_compare_user` (
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `month1` double NOT NULL,
  `month2` double NOT NULL,
  `month3` double NOT NULL,
  `month4` double NOT NULL,
  `month5` double NOT NULL,
  `month6` double NOT NULL,
  `month7` double NOT NULL,
  `month8` double NOT NULL,
  `month9` double NOT NULL,
  `month10` double NOT NULL,
  `month11` double NOT NULL,
  `month12` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_customer`
--

CREATE TABLE IF NOT EXISTS `crm_report_customer` (
  `crm_name` varchar(250) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `entry` int(11) NOT NULL,
  `first` double NOT NULL,
  `amount` double NOT NULL,
  `paid` double NOT NULL,
  `last` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_daily_storage`
--

CREATE TABLE IF NOT EXISTS `crm_report_daily_storage` (
  `product_code` varchar(10) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(100) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(150) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL,
  `oldbalance` double NOT NULL,
  `added` double NOT NULL,
  `ret` double NOT NULL,
  `sales` double NOT NULL,
  `gifts` double NOT NULL,
  `bm3` double NOT NULL,
  `bm4` double NOT NULL,
  `shop` double NOT NULL,
  `newbalance` double NOT NULL,
  `total` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_product`
--

CREATE TABLE IF NOT EXISTS `crm_report_product` (
  `product_code` varchar(10) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(150) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(150) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL,
  `qty` double NOT NULL,
  `pty` double NOT NULL,
  `amount` double NOT NULL,
  `average_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_report_storage`
--

CREATE TABLE IF NOT EXISTS `crm_report_storage` (
  `product_code` varchar(10) collate utf8_unicode_ci NOT NULL,
  `product_barcode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `product_brand` varchar(100) collate utf8_unicode_ci NOT NULL,
  `product_name` varchar(150) collate utf8_unicode_ci NOT NULL,
  `unit_size` double NOT NULL,
  `oldbalance` double NOT NULL,
  `added` double NOT NULL,
  `ret` double NOT NULL,
  `sales` double NOT NULL,
  `gifts` double NOT NULL,
  `newbalance` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_risk_questions`
--

CREATE TABLE IF NOT EXISTS `crm_risk_questions` (
  `id` int(11) NOT NULL auto_increment,
  `category` varchar(120) collate utf8_unicode_ci NOT NULL,
  `section` varchar(500) collate utf8_unicode_ci NOT NULL,
  `question` text collate utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_risk_results`
--

CREATE TABLE IF NOT EXISTS `crm_risk_results` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `_repeat` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `themename` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_sales`
--

CREATE TABLE IF NOT EXISTS `crm_sales` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `product_name` varchar(180) collate utf8_unicode_ci NOT NULL,
  `quote_code` varchar(32) collate utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `contract_no` varchar(32) collate utf8_unicode_ci NOT NULL,
  `qty` float NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL default '0',
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL default 'user',
  `status` varchar(32) collate utf8_unicode_ci NOT NULL default 'active',
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_services`
--

CREATE TABLE IF NOT EXISTS `crm_services` (
  `service_id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `subject` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `phone` varchar(10) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` datetime NOT NULL,
  `remind_date` date NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `service_stage` varchar(32) collate utf8_unicode_ci NOT NULL default 'receipt',
  `service_revenue` double NOT NULL,
  `service_debt` double NOT NULL,
  `service_qty` int(11) NOT NULL,
  `service_precent` double NOT NULL default '0',
  `campaign` varchar(128) collate utf8_unicode_ci NOT NULL,
  `product_vendor` varchar(80) collate utf8_unicode_ci NOT NULL default '-',
  `flag` int(11) NOT NULL default '1',
  `warehouse_id` int(11) NOT NULL default '0',
  `pricetag` varchar(10) collate utf8_unicode_ci NOT NULL default 'price1',
  PRIMARY KEY  (`service_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=237957 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_services_tmp`
--

CREATE TABLE IF NOT EXISTS `crm_services_tmp` (
  `service_id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `subject` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `phone` varchar(10) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `closing_date` datetime NOT NULL,
  `remind_date` date NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `service_stage` varchar(32) collate utf8_unicode_ci NOT NULL default 'receipt',
  `service_revenue` double NOT NULL,
  `service_debt` double NOT NULL,
  `service_qty` int(11) NOT NULL,
  `service_precent` double NOT NULL default '0',
  `campaign` varchar(128) collate utf8_unicode_ci NOT NULL,
  `product_vendor` varchar(80) collate utf8_unicode_ci NOT NULL default '-',
  `flag` int(11) NOT NULL default '1',
  `warehouse_id` int(11) NOT NULL default '0',
  `pricetag` varchar(10) collate utf8_unicode_ci NOT NULL default 'price1',
  PRIMARY KEY  (`service_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=237955 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_service_auto_log`
--

CREATE TABLE IF NOT EXISTS `crm_service_auto_log` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_product_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_service_payroll`
--

CREATE TABLE IF NOT EXISTS `crm_service_payroll` (
  `id` int(11) NOT NULL auto_increment,
  `crm_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `pay_date` date NOT NULL,
  `pay_type` varchar(32) NOT NULL default 'cash',
  `precent` double NOT NULL default '0',
  `promo_code` varchar(10) NOT NULL,
  `promo_amount` double NOT NULL,
  `amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `userCode` varchar(32) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `flag` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6875 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_service_temp`
--

CREATE TABLE IF NOT EXISTS `crm_service_temp` (
  `id` int(11) NOT NULL auto_increment,
  `descr` varchar(128) collate utf8_unicode_ci NOT NULL,
  `service_revenue` double NOT NULL,
  `service_debt` double NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10467534 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_tasks`
--

CREATE TABLE IF NOT EXISTS `crm_tasks` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `subject` varchar(120) collate utf8_unicode_ci NOT NULL,
  `duedate` date NOT NULL,
  `duetime` time NOT NULL,
  `task_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'open',
  `priority` varchar(11) collate utf8_unicode_ci NOT NULL default 'medium',
  `remind_type` varchar(11) collate utf8_unicode_ci NOT NULL default 'popup',
  `remind_at` date NOT NULL,
  `budgeted_cost` double NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `crm_id` int(11) NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `campaign` varchar(120) collate utf8_unicode_ci NOT NULL default 'user defined',
  `deal_id` int(120) NOT NULL,
  `case_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `googleSync` varchar(10) collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_users`
--

CREATE TABLE IF NOT EXISTS `crm_users` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `password` varchar(128) collate utf8_unicode_ci NOT NULL,
  `fullName` varchar(32) collate utf8_unicode_ci NOT NULL,
  `section` varchar(80) collate utf8_unicode_ci NOT NULL,
  `position` varchar(80) collate utf8_unicode_ci NOT NULL,
  `team` varchar(80) collate utf8_unicode_ci NOT NULL,
  `company` varchar(80) collate utf8_unicode_ci NOT NULL,
  `user_level` int(11) NOT NULL default '0',
  `gmailAccount` varchar(80) collate utf8_unicode_ci NOT NULL,
  `user_type` varchar(32) collate utf8_unicode_ci NOT NULL default 'corporate',
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `permission` text collate utf8_unicode_ci NOT NULL,
  `until` text collate utf8_unicode_ci NOT NULL,
  `manager` varchar(25) collate utf8_unicode_ci NOT NULL,
  `phone` varchar(20) collate utf8_unicode_ci NOT NULL,
  `partner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `mon` varchar(128) collate utf8_unicode_ci NOT NULL,
  `thue` varchar(128) collate utf8_unicode_ci NOT NULL,
  `wed` varchar(128) collate utf8_unicode_ci NOT NULL,
  `thur` varchar(128) collate utf8_unicode_ci NOT NULL,
  `fri` varchar(128) collate utf8_unicode_ci NOT NULL,
  `sat` varchar(128) collate utf8_unicode_ci NOT NULL,
  `sun` varchar(128) collate utf8_unicode_ci NOT NULL,
  `msg` varchar(250) collate utf8_unicode_ci NOT NULL,
  `pricetag` varchar(10) collate utf8_unicode_ci NOT NULL default 'price',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_groups`
--

CREATE TABLE IF NOT EXISTS `crm_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `groupName` varchar(32) collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_planning`
--

CREATE TABLE IF NOT EXISTS `crm_user_planning` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `type_name` int(11) NOT NULL,
  `price` double NOT NULL,
  `count` double NOT NULL,
  `amountTheshold` double NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `plan_name` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5506 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_stat`
--

CREATE TABLE IF NOT EXISTS `crm_user_stat` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_year` int(11) NOT NULL,
  `_month` int(11) NOT NULL,
  `event_p` int(11) NOT NULL,
  `quote_p` int(11) NOT NULL,
  `newcus_p` int(11) NOT NULL,
  `expat_p` int(11) NOT NULL,
  `vip_p` int(11) NOT NULL,
  `extend_p` int(11) NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_view_list`
--

CREATE TABLE IF NOT EXISTS `crm_view_list` (
  `id` int(11) NOT NULL auto_increment,
  `view` varchar(50) collate utf8_unicode_ci NOT NULL,
  `query` varchar(128) collate utf8_unicode_ci NOT NULL,
  `table` varchar(45) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_warehouse`
--

CREATE TABLE IF NOT EXISTS `crm_warehouse` (
  `warehouse_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) collate utf8_unicode_ci NOT NULL,
  `location` varchar(80) collate utf8_unicode_ci NOT NULL,
  `capacity` varchar(32) collate utf8_unicode_ci NOT NULL,
  `descr` text collate utf8_unicode_ci NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `warehouse_type` varchar(32) collate utf8_unicode_ci NOT NULL default 'storage',
  PRIMARY KEY  (`warehouse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `crm_workflow`
--

CREATE TABLE IF NOT EXISTS `crm_workflow` (
  `id` int(11) NOT NULL auto_increment,
  `subject` varchar(500) collate utf8_unicode_ci NOT NULL,
  `priority` varchar(32) collate utf8_unicode_ci NOT NULL default 'medium',
  `start_date` date NOT NULL,
  `start_time` varchar(32) collate utf8_unicode_ci NOT NULL default '09:00',
  `end_date` date NOT NULL,
  `end_time` varchar(32) collate utf8_unicode_ci NOT NULL default '18:00',
  `workflow_status` varchar(32) collate utf8_unicode_ci NOT NULL default 'processing',
  `issue` int(11) NOT NULL default '1',
  `precent` int(11) NOT NULL,
  `owner` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userCode` varchar(32) collate utf8_unicode_ci NOT NULL,
  `_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `descr` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `a1` varchar(500) collate utf8_unicode_ci NOT NULL,
  `a2` varchar(500) collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
