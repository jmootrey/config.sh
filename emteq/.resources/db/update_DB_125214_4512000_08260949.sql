-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: econnect
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alto_amp_config`
--

DROP TABLE IF EXISTS `alto_amp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alto_amp_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `rs485_bus_rx` tinyint(3) unsigned NOT NULL,
  `rs485_bus_tx` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alto_amp_config`
--

LOCK TABLES `alto_amp_config` WRITE;
/*!40000 ALTER TABLE `alto_amp_config` DISABLE KEYS */;
INSERT INTO `alto_amp_config` VALUES (1,1,2);
/*!40000 ALTER TABLE `alto_amp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alto_amp_inputs`
--

DROP TABLE IF EXISTS `alto_amp_inputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alto_amp_inputs` (
  `input_id` int(10) unsigned NOT NULL,
  `alto_input_ch` tinyint(3) unsigned NOT NULL,
  `audio_source` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alto_amp_inputs`
--

LOCK TABLES `alto_amp_inputs` WRITE;
/*!40000 ALTER TABLE `alto_amp_inputs` DISABLE KEYS */;
INSERT INTO `alto_amp_inputs` VALUES (1,1,0),(2,2,1),(3,3,2),(4,4,3);
/*!40000 ALTER TABLE `alto_amp_inputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alto_amp_outputs`
--

DROP TABLE IF EXISTS `alto_amp_outputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alto_amp_outputs` (
  `output_id` int(10) unsigned NOT NULL,
  `display_seat_num` tinyint(4) NOT NULL,
  `audio_source` tinyint(3) unsigned NOT NULL,
  `volume` tinyint(3) unsigned NOT NULL,
  `mute` tinyint(3) unsigned NOT NULL,
  `bass` tinyint(4) NOT NULL,
  `treble` tinyint(4) NOT NULL,
  PRIMARY KEY (`output_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alto_amp_outputs`
--

LOCK TABLES `alto_amp_outputs` WRITE;
/*!40000 ALTER TABLE `alto_amp_outputs` DISABLE KEYS */;
INSERT INTO `alto_amp_outputs` VALUES (1,1,0,50,0,11,6),(2,2,0,50,0,11,6),(3,3,0,50,0,11,6),(4,4,0,50,0,11,6),(5,0,1,2,0,9,6);
/*!40000 ALTER TABLE `alto_amp_outputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arinc_628_config`
--

DROP TABLE IF EXISTS `arinc_628_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arinc_628_config` (
  `arinc_id` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `lru_name` varchar(45) DEFAULT NULL,
  `value_id` smallint(5) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `seat_name` varchar(45) DEFAULT NULL,
  `seat_col` tinyint(3) unsigned NOT NULL,
  `seat_row` tinyint(3) unsigned NOT NULL,
  `if_bus` tinyint(3) unsigned NOT NULL,
  `input_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`arinc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arinc_628_config`
--

LOCK TABLES `arinc_628_config` WRITE;
/*!40000 ALTER TABLE `arinc_628_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `arinc_628_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_extensions`
--

DROP TABLE IF EXISTS `audio_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_extensions` (
  `ext_count` tinyint(3) unsigned NOT NULL,
  `extension` varchar(255) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ext_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_extensions`
--

LOCK TABLES `audio_extensions` WRITE;
/*!40000 ALTER TABLE `audio_extensions` DISABLE KEYS */;
INSERT INTO `audio_extensions` VALUES (1,'mp3',1,1),(2,'wav',1,0),(3,'m4a',1,0);
/*!40000 ALTER TABLE `audio_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avds_connections`
--

DROP TABLE IF EXISTS `avds_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avds_connections` (
  `connect_id` tinyint(3) unsigned NOT NULL,
  `avds_audio_ch` int(11) unsigned NOT NULL,
  `avds_video_ch` int(11) unsigned NOT NULL,
  `avds_output_ch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`connect_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avds_connections`
--

LOCK TABLES `avds_connections` WRITE;
/*!40000 ALTER TABLE `avds_connections` DISABLE KEYS */;
INSERT INTO `avds_connections` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `avds_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avds_inputs`
--

DROP TABLE IF EXISTS `avds_inputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avds_inputs` (
  `input_id` int(11) unsigned NOT NULL,
  `avds_audio_ch` int(11) unsigned NOT NULL,
  `avds_video_ch` int(11) unsigned NOT NULL,
  `input_name` varchar(255) NOT NULL,
  `av_code` tinyint(3) unsigned NOT NULL,
  `rosen_lru_id` tinyint(4) NOT NULL,
  `default_volume` tinyint(4) NOT NULL,
  PRIMARY KEY (`input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avds_inputs`
--

LOCK TABLES `avds_inputs` WRITE;
/*!40000 ALTER TABLE `avds_inputs` DISABLE KEYS */;
INSERT INTO `avds_inputs` VALUES (1,1,1,'AppleTV',3,-1,75),(2,2,2,'Rosen Blu-Ray',3,1,75),(3,3,3,'eConnect AVOD',3,-1,75);
/*!40000 ALTER TABLE `avds_inputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avds_installed`
--

DROP TABLE IF EXISTS `avds_installed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avds_installed` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `avds_ip` varchar(255) NOT NULL,
  `override_input_id` int(11) NOT NULL,
  `override_output_id` int(11) NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avds_installed`
--

LOCK TABLES `avds_installed` WRITE;
/*!40000 ALTER TABLE `avds_installed` DISABLE KEYS */;
INSERT INTO `avds_installed` VALUES (1,'0.0.0.0',-1,0);
/*!40000 ALTER TABLE `avds_installed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avds_outputs`
--

DROP TABLE IF EXISTS `avds_outputs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avds_outputs` (
  `output_id` int(11) NOT NULL,
  `avds_output_ch` int(11) unsigned NOT NULL,
  `output_name` varchar(255) NOT NULL,
  `av_code` tinyint(3) unsigned NOT NULL,
  `rosen_lru_id` tinyint(4) NOT NULL,
  `volume` tinyint(3) unsigned NOT NULL,
  `mute` tinyint(3) unsigned NOT NULL,
  `bass` tinyint(4) NOT NULL,
  `treble` tinyint(4) NOT NULL,
  PRIMARY KEY (`output_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avds_outputs`
--

LOCK TABLES `avds_outputs` WRITE;
/*!40000 ALTER TABLE `avds_outputs` DISABLE KEYS */;
INSERT INTO `avds_outputs` VALUES (1,1,'COTS Monitor',3,-1,75,0,0,0);
/*!40000 ALTER TABLE `avds_outputs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_config`
--

DROP TABLE IF EXISTS `avioip_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_config` (
  `name` varchar(64) NOT NULL,
  `value` varchar(512) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_config`
--

LOCK TABLES `avioip_config` WRITE;
/*!40000 ALTER TABLE `avioip_config` DISABLE KEYS */;
INSERT INTO `avioip_config` VALUES ('soapmodule.boot_enable','0'),('usermanager.activated','false'),('usermanager.lanif','br0'),('usermanager.expip','10.0.9.3'),('usermanager.defaultStatus','Pending'),('usermanager.defaultWanif','1'),('usermanager.defaultPersistent','false'),('license.key','4d20910a134da3abf9b0d762530585d57c256dd5279903cc252ad414282ced9b'),('wlan.has_wpa_passphrase','0'),('passwords.admin','$6$EHagdcit$S1An3yWshCI6HECw7rvUmYNK2dhuhdk8cZpRlZoU3jjzMbn7D1PNKXM2qU9NR4It2vksRr/F/dtbzcUPv9YbD.'),('passwords.maint','$6$yPEp0qEH$RkFrt/Lyy5ALO/4AeJ8O1LEWlEdaoGAIM3ZagnmpCSDEXQVIsg03suVPFszL3OSVnSfhtebMYevjTx9v9Q0rk/'),('passwords.user','$6$vWTxtbH/$4tyg1GiuNEELLaBV1v2VE3cRUKwe0Hc8zpK5y4j0w0kMsoxYxV8tyZ1kKXGMBtJ/eF8cjJ6Y4fh7F56vC2G3Q/'),('passwords.user_password_enabled','0'),('ipsec.esp',''),('ipsec.ikelifetime',''),('ipsec.keylife',''),('ipsec.left',''),('ipsec.leftsubnet',''),('ipsec.auto',''),('ipsec.authby',''),('ipsec.type',''),('ipsec.ike',''),('ipsec.right',''),('ipsec.rightsubnet',''),('ipsec.secrets',': PSK \"secret\"'),('wan.ip','192.168.42.1'),('wan.mask','255.255.255.0'),('lan.ip','10.0.9.1'),('lan.mask','255.255.255.0'),('lan.hostname','econnect'),('lan.DHCPRangeFrom','10.0.9.200'),('lan.DHCPRangeTo','10.0.9.250'),('lan.DHCPDNSDomain','myhome'),('lan.DHCPEnabled','1'),('lan.DHCPGateway',''),('lan.addmac1','22.34.56.78.90'),('lan.addmac2','22.34.56.78.22'),('lan.addmac3','22.34.56.78.33'),('lan.addmac4','22.34.56.78.44'),('wizard.configured','0'),('wlan.ssid','econnect'),('wlan.channel','4'),('wlan.ignore_broadcast_ssid','0'),('wlan.wep_key',''),('wlan.wpa','0'),('wlan.wpa_passphrase',''),('snmp.ip','172.18.0.250'),('ipsec.enabled','0'),('wlan.has_wep_key','0');
/*!40000 ALTER TABLE `avioip_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_dhcp_static`
--

DROP TABLE IF EXISTS `avioip_dhcp_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_dhcp_static` (
  `mac` varchar(64) NOT NULL,
  `ip` varchar(64) NOT NULL,
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_dhcp_static`
--

LOCK TABLES `avioip_dhcp_static` WRITE;
/*!40000 ALTER TABLE `avioip_dhcp_static` DISABLE KEYS */;
/*!40000 ALTER TABLE `avioip_dhcp_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_iptables`
--

DROP TABLE IF EXISTS `avioip_iptables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_iptables` (
  `name` char(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_iptables`
--

LOCK TABLES `avioip_iptables` WRITE;
/*!40000 ALTER TABLE `avioip_iptables` DISABLE KEYS */;
INSERT INTO `avioip_iptables` VALUES ('conf','# Generated by iptables-save v1.4.12.1 on Mon Oct 10 12:18:30 2011\n*nat\n:PREROUTING ACCEPT [8:698]\n:INPUT ACCEPT [6:384]\n:OUTPUT ACCEPT [7:500]\n:POSTROUTING ACCEPT [7:500]\n:USERMANAGER2 - [0:0]\n-A PREROUTING ! -d 10.0.9.1/32 -i br0 -p tcp -m tcp --dport 80 -j USERMANAGER2\n-A POSTROUTING -o link+ -j MASQUERADE\n-A POSTROUTING -o xip-wireless -j MASQUERADE\nCOMMIT\n# Completed on Mon Oct 10 12:18:30 2011\n# Generated by iptables-save v1.4.12.1 on Mon Oct 10 12:18:30 2011\n*mangle\n:PREROUTING ACCEPT [111:25727]\n:INPUT ACCEPT [106:25164]\n:FORWARD ACCEPT [0:0]\n:OUTPUT ACCEPT [86:32807]\n:POSTROUTING ACCEPT [86:32807]\n:USERMANAGER - [0:0]\nCOMMIT\n# Completed on Mon Oct 10 12:18:30 2011\n# Generated by iptables-save v1.4.12.1 on Mon Oct 10 12:18:30 2011\n*filter\n:INPUT ACCEPT [9:536]\n:FORWARD ACCEPT [0:0]\n:OUTPUT ACCEPT [86:32807]\n:EMAIL - [0:0]\n:MACFILTER - [0:0]\n-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT\n-A INPUT -p icmp -j ACCEPT\n-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT\n-A INPUT -i link+ -j DROP\n-A FORWARD ! -s 10.0.9.3/32 -i br0 -j MACFILTER\n-A EMAIL -p tcp -m tcp --dport 110 -j ACCEPT\n-A EMAIL -p tcp -m tcp --dport 143 -j ACCEPT\n-A EMAIL -p tcp -m tcp --dport 25 -j ACCEPT\n-A EMAIL -p tcp -m tcp --dport 465 -j ACCEPT\n-A EMAIL -p tcp -m tcp --dport 993 -j ACCEPT\n-A EMAIL -p tcp -m tcp --dport 995 -j ACCEPT\n-A EMAIL -j DROP\nCOMMIT\n# Completed on Mon Oct 10 12:18:30 2011\n');
/*!40000 ALTER TABLE `avioip_iptables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_usermanager_group_table`
--

DROP TABLE IF EXISTS `avioip_usermanager_group_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_usermanager_group_table` (
  `mac` char(17) NOT NULL,
  `ip` text NOT NULL,
  `user_group` int(2) NOT NULL,
  `username` text NOT NULL,
  `status` text NOT NULL,
  `date` datetime NOT NULL,
  `permanent` tinyint(1) NOT NULL,
  `device` text NOT NULL,
  `netbios` text NOT NULL,
  `wanif` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_usermanager_group_table`
--

LOCK TABLES `avioip_usermanager_group_table` WRITE;
/*!40000 ALTER TABLE `avioip_usermanager_group_table` DISABLE KEYS */;
INSERT INTO `avioip_usermanager_group_table` VALUES ('7c:c5:37:ac:24:e9','10.0.9.242',1,'Fg','Accepted','0000-00-00 00:00:00',0,'Phone','',0);
/*!40000 ALTER TABLE `avioip_usermanager_group_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_usermanager_mod_table`
--

DROP TABLE IF EXISTS `avioip_usermanager_mod_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_usermanager_mod_table` (
  `id` int(2) NOT NULL,
  `name` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_usermanager_mod_table`
--

LOCK TABLES `avioip_usermanager_mod_table` WRITE;
/*!40000 ALTER TABLE `avioip_usermanager_mod_table` DISABLE KEYS */;
INSERT INTO `avioip_usermanager_mod_table` VALUES (1,'Full Access'),(2,'Toolbar Mode Select'),(5,'Ads/Java Filter'),(4,'Optimum'),(3,'Text Only'),(0,'No Access'),(6,'Full express (beta)');
/*!40000 ALTER TABLE `avioip_usermanager_mod_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avioip_xiplink`
--

DROP TABLE IF EXISTS `avioip_xiplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avioip_xiplink` (
  `name` char(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avioip_xiplink`
--

LOCK TABLES `avioip_xiplink` WRITE;
/*!40000 ALTER TABLE `avioip_xiplink` DISABLE KEYS */;
INSERT INTO `avioip_xiplink` VALUES ('conf','<Local version=\"3.4.1-60\">\n      <Device os=\"FreeBSD\" myname=\"XE\"/>\n      <LicensedUser agreed=\"true\" organization=\"Satcom1\" name=\"Satcom1\"/>\n      <GlobalVPNKeyHash hashValue=\"No key\"/>\n      <InterfaceMapping>\n        <Interface name=\"Wireless\" ifname=\"re0\" carpname=\"carp0\" carpvhid=\"166\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Routed\" ifname=\"re3\" carpname=\"carp1\" carpvhid=\"167\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Bridged\" ifname=\"re1\" carpname=\"carp2\" carpvhid=\"168\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"LAN2\" ifname=\"re2\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n      </InterfaceMapping>\n      <ClusterMember enabled=\"false\" myname=\"A\" master=\"false\" pass=\"defaultClusterPass\" vhidBase=\"166\"/>\n      <LicenseKeys>\n        <XHO available=\"false\" license=\"\"/>\n        <VPN available=\"true\" license=\"\"/>\n      </LicenseKeys>\n    </Local>\n    <Global version=\"3.4.1-60\">\n      <PredefinedObjects>\n        <Nets>\n          <List name=\"Site1\" transitq=\"Link1\">\n            <IPv4 addr=\"any\"/>\n          </List>\n        </Nets>\n        <Ports>\n          <List name=\"MS_Net\">\n            <Port port=\"135,139,445\"/>\n          </List>\n          <List name=\"http\">\n            <Port port=\"80\"/>\n          </List>\n          <List name=\"https\">\n            <Port port=\"443\"/>\n          </List>\n          <List name=\"smtp\">\n            <Port port=\"25\"/>\n          </List>\n          <List name=\"dns\">\n            <Port port=\"53\"/>\n          </List>\n          <List name=\"pop3\">\n            <Port port=\"110\"/>\n          </List>\n          <List name=\"imap\">\n            <Port port=\"143\"/>\n          </List>\n          <List name=\"snmp\">\n            <Port port=\"161\"/>\n          </List>\n          <List name=\"bgp\">\n            <Port port=\"179\"/>\n          </List>\n        </Ports>\n      </PredefinedObjects>\n      <Device os=\"FreeBSD\" name=\"XE\">\n        <Network nodetype=\"hub\" IPv6Enabled=\"false\" IPv4Enabled=\"true\" mode=\"router\" lan2usage=\"management\">\n          <IPv4Routes defaultGateway=\"10.0.0.1\">\n          </IPv4Routes>\n          <IPv6Routes defaultGateway=\"\"/>\n          <Interfaces>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\" man_if=\"true\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.9.3\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n              <IPv6/>\n            </Interface>\n            <ClusterMember name=\"A\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n            <ClusterMember name=\"B\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n          </Interfaces>\n          <NAT enabled=\"false\" interface=\"Wireless\"/>\n          <GRE transparency=\"true\"/>\n        </Network>\n        <WCCP enabled=\"false\">\n          <Services interface=\"Wireless\"/>\n          <Services interface=\"Routed\"/>\n        </WCCP>\n        <Tunnel bypassManagementTraffic=\"true\" qosQueue=\"\" dscpMark=\"\">\n          <Server enabled=\"false\" password=\"\"/>\n          <Client enabled=\"true\" password=\"satcom321\" remote=\"37.60.167.105\" returnIp=\"\" nat=\"true\">\n            <IFSubnet interface=\"Routed\" enabled=\"true\"/>\n            <IPv4TunnelSubnets>\n              <Subnet network=\"192.168.220.0\" mask=\"255.255.255.0\"/>\n            </IPv4TunnelSubnets>\n          </Client>\n          <Coalesce enabled=\"true\" maxTime=\"40\" byteThresh=\"1400\"/>\n          <PathBalancing enabled=\"true\">\n            <Path addr=\"10.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n            <Path addr=\"127.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n          </PathBalancing>\n        </Tunnel>\n        <Optimization enabled=\"true\" hubOnly=\"false\" externalPEP=\"false\">\n          <Link xtc=\"xtc-drc\"/>\n          <OptParams packetOverhead=\"69\" useCompression=\"true\" enableBlackHoleDetection=\"false\"/>\n          <Ttcp enabled=\"true\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n            <Port number=\"8081\"/>\n            <Port number=\"8082\"/>\n          </Ttcp>\n          <HttpPrefetching enabled=\"false\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n          </HttpPrefetching>\n          <HttpCompression enabled=\"false\" minimumSize=\"512\" maximumSize=\"0\"/>\n          <ImageTranscoding>\n            <JPEG enabled=\"false\" quality=\"10\" minimumSize=\"512\" maximumSize=\"253952\"/>\n          </ImageTranscoding>\n          <SCPS ipv6Accel=\"true\" sNack=\"true\">\n            <AFR enabled=\"false\" ppa=\"4\" dupacks=\"false\"/>\n          </SCPS>\n          <OptAdv mtuDisco=\"true\" clampMss=\"false\" maxmss=\"1000\" proxyBindStrategy=\"0\"/>\n        </Optimization>\n        <Services UI_open=\"true\">\n          <DNSConfig domain=\"\" useDhcpDns=\"false\" UI_open=\"true\">\n            <nameserver address=\"8.8.8.8\" UI_open=\"true\"/>\n            <nameserver address=\"8.8.4.4\" UI_open=\"true\"/>\n            <InterceptDNS enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DNSConfig>\n          <DHCPServer units=\"H\" enabled=\"false\" UI_open=\"true\">\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Wireless\" UI_open=\"true\"/>\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DHCPServer>\n          <SNMP trapIPList=\"\" trapInterval=\"0\" enableTraps=\"false\" enabled=\"false\" UI_open=\"true\"/>\n          <RIP enabled=\"false\" kernel=\"true\" static=\"true\" connected=\"true\" wireless=\"true\" routed=\"true\" authentication=\"false\" password=\"\" UI_open=\"true\"/>\n          <OSPFConfig enabled=\"false\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" stub=\"\" UI_open=\"true\">\n            <OSPFNetwork network=\"\" netmask=\"\" area=\"\" UI_open=\"true\"/>\n          </OSPFConfig>\n          <BGPConfig enabled=\"false\" asystem=\"\" network=\"\" netmask=\"\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" UI_open=\"true\">\n            <BGPPeer address=\"\" asystem=\"\" UI_open=\"true\"/>\n          </BGPConfig>\n          <DiskCache equipped=\"false\" enabled=\"false\" UI_open=\"true\">\n            <UrlRedirector nanny=\"false\" whitelist=\"false\" deniedUrl=\"\" welcome=\"false\" welcomeUrl=\"\" welcomeRenewalAge=\"24\" UI_open=\"true\">\n              <NannyList UI_open=\"true\"/>\n              <WelcomeDestExceptions UI_open=\"true\"/>\n              <WelcomeSrcIpExceptions UI_open=\"true\"/>\n            </UrlRedirector>\n          </DiskCache>\n          <NTP addresses=\"90.80.85.131\" ipv=\"4\" enabled=\"true\" UI_open=\"true\"/>\n          <Qos enabled=\"true\" UI_open=\"true\">\n            <RootQueue name=\"root\" queuename=\"root\" interface=\"Wireless\" bandwidth=\"100Mb\" rtt=\"3000\" UI_depth=\"-1\" UI_open=\"true\">\n              <Queue name=\"Link1\" queuename=\"root.Link1\" upperlimit_m2=\"256Kb\" bandwidth=\"256Kb\" returnrate=\"1024Kb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\">\n                <Queue name=\"Site1\" queuename=\"root.Link1.Site1\" bandwidth=\"100%\" UI_open=\"true\" UI_depth=\"1\" upperlimit_m2=\"256Kb\">\n                  <Queue name=\"tcp\" queuename=\"root.Link1.Site1.tcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                  <Queue name=\"nottcp\" queuename=\"root.Link1.Site1.nottcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                </Queue>\n              </Queue>\n              <Queue name=\"Unassigned\" queuename=\"root.Unassigned\" deflt=\"true\" upperlimit_m2=\"16Mb\" bandwidth=\"16Mb\" returnrate=\"16Mb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\"/>\n            </RootQueue>\n          </Qos>\n          <Firewall UI_open=\"true\">\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"1\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_seq=\"2\" UI_dq=\"0\" UI_open=\"true\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"3\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"4\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"true\" xrtaction=\"tun\" xrtqueue=\"24\" queue=\"root.Link1.Site1.tcp\" lbl=\"AutoInsert\" UI_open=\"true\" UI_seq=\"5\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"not tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"false\" xrtaction=\"tun\" xrtqueue=\"25\" queue=\"root.Link1.Site1.nottcp\" UI_open=\"true\" UI_seq=\"6\" UI_dq=\"0\"/>\n          </Firewall>\n          <LLDPD enable=\"false\" UI_open=\"true\"/>\n        </Services>\n        <VPN vpnIP6Endpoint=\"Wireless\" tunType=\"ESPv4\" vpnTemplate=\"IPsec V1\" inetBreakout=\"local\" secProfile=\"standard\" vpnIP4Endpoint=\"Wireless\" keepaliveInterval=\"0\" nodeType=\"spoke\" enabled=\"false\">\n          <IPv4ProtectedSubnets>\n            <subnet mask=\"255.255.255.0\" network=\"192.168.1.0\"/>\n          </IPv4ProtectedSubnets>\n        </VPN>\n        <Stats saveLocal=\"true\" qos=\"false\" receive=\"false\">\n          <Forward enabled=\"false\" address=\"10.0.0.10\"/>\n        </Stats>\n        <Sysctl>\n          <Sysctl name=\"net.qos.detect_slowreaders\" value=\"0\"/>\n          <Sysctl name=\"net.qos.mem.memory_fudge\" value=\"3\"/>\n          <Sysctl name=\"net.qos.reass_mgnt\" value=\"1\"/>\n          <Sysctl name=\"net.inet.tcp.scps.snack.long\" value=\"1\"/>\n        </Sysctl>\n      </Device>\n      <VPNTemplates>\n        <VPNTemplate name=\"IPsec V1\">\n          <ProposalDefinitions>\n            <BaseProposals>\n              <Maximum>\nAlgorithm rijndael-cbc = {\n	key-increment = 8\n	block-size = 64\n	default-key-size = 256\n	max-key-size = 256\n	min-key-size = 128\n	type = cipher\n}\nProposal base-proposal = {\n    ciphers = { rijndael-cbc }\n    hmacs = { hmac-sha256-96 }\n    hashes = { sha256 }\n    compressions = { deflate }\n}\n            </Maximum>\n              <High>\nProposal base-proposal = {\n    ciphers = { rijndael-cbc 3des-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </High>\n              <Standard>\nProposal base-proposal = {\n    ciphers = { 3des-cbc rijndael-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </Standard>\n              <Null>\nProposal base-proposal = {\n    ciphers = { none }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { none }\n}\n          </Null>\n            </BaseProposals>\n            <Proposals>\nProposal ike-base-proposal extends base-proposal = {\n    type        = isakmp\n    life        = isakmp-proposal-default-life\n}\nProposal ike-psk-proposal extends ike-base-proposal = {\n    auth-method = pre-shared-key\n}\nProposalList ike-proposals = {\n    proposals = { ike-psk-proposal }\n}\nProposal esp-base-proposal extends base-proposal = {\n    type = esp\n    life = isakmp-proposal-default-life\n}\nProposal esp-transport-proposal extends esp-base-proposal = {\n    flags       = { transport }\n}\nProposal esp-tunnel-proposal extends esp-base-proposal = {\n    flags       = { tunnel }\n}\nProposal ipcomp-base-proposal extends base-proposal = {\n    type = ipcomp\n}\nProposal ipcomp-tunnel-proposal extends ipcomp-base-proposal = {\n    flags = { tunnel }\n}\nProposal esp-tr-ipcomp-tn-proposal = {\n    chain = {\n        esp-transport-proposal\n        ipcomp-tunnel-proposal\n    }\n}\nProposalList ipsec-esp-tr-ipcomp-tn-proposals = {\n    proposals = { esp-tr-ipcomp-tn-proposal }\n}\nProposalList ipsec-esp-tn-proposal = {\n    proposals = { esp-tunnel-proposal }\n}\n          </Proposals>\n          </ProposalDefinitions>\n          <LifetimeDefinitions>\n            <Maximum>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     1000000\n    hard-seconds     =     28800\n}\n          </Maximum>\n            <High>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     2000000\n    hard-seconds     =     86400\n}\n          </High>\n            <Standard>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Standard>\n            <Null>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Null>\n          </LifetimeDefinitions>\n          <GroupDefinitions maximum=\"isakmp-group-modp-1\" high=\"isakmp-group-5\" standard=\"isakmp-group-1\">\nGroup isakmp-group-1 = { ident = 1 }\nGroup isakmp-group-2 = { ident = 2 }\nGroup isakmp-group-5 = { ident = 5 }\n        </GroupDefinitions>\n          <GroupMappings maximum=\"isakmp-group-5\" high=\"isakmp-group-2\" standard=\"isakmp-group-1\"/>\n          <KeyDefinitions>\n            <Block name=\"ike-key\">\nKey $name; = { ike-shared-secret = $key; }\n          </Block>\n          </KeyDefinitions>\n          <ConnectionDefinitions>\n            <DefaultConnections>\nConnection allow-ike-io = {\n    flags                = { passby no-forwarding }\n    local-address        = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n}\n\n# Passby DNS queries to remote DNS server.\nConnection allow-dns-o = {\n    flags                = { passby no-forwarding match-outbound }\n    local-address        = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n}\n\n# Passby DNS replies from the remote DNS server.\nConnection allow-dns-i = {\n    flags                = { passby match-inbound }\n    local-address        = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n}\n\nConnection dhcp-request = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n}\n\nConnection dhcp-reply = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n}\n          </DefaultConnections>\n            <CustomConnections>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n		}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n             </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh\" apply-to-local=\"mesh\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-local=\"inetlocal\" name=\"allow-all\">\nConnection $name; = {\n    flags                = { passby }\n    local-address        = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n}\n           </Block>\n            </CustomConnections>\n          </ConnectionDefinitions>\n          <DeviceDefinitions>\n# Enable stats via http\nParams params = {\n  http-interface = {\n    port = 9090\n    statistics-pages = { \"sa\" }\n  }\n  ike-addresses = {\n    \"$Wireless_ip4_addr;\"\n  }\n}\n\nDevice vpn-cfg = {\nconnections  = {\nallow-ike-io\ndhcp-request\ndhcp-reply\n$ruleset;\n}\nparams = params\n}\n        </DeviceDefinitions>\n          <UsedDevice>\nuse vpn-cfg \n        </UsedDevice>\n        </VPNTemplate>\n        <VPNTemplate name=\"IPsec dummy template\"/>\n      </VPNTemplates>\n    </Global>\n    \n'),('conf','<Local version=\"3.4.1-60\">\n      <Device os=\"FreeBSD\" myname=\"XE\"/>\n      <LicensedUser agreed=\"true\" organization=\"Satcom1\" name=\"Satcom1\"/>\n      <GlobalVPNKeyHash hashValue=\"No key\"/>\n      <InterfaceMapping>\n        <Interface name=\"Wireless\" ifname=\"re0\" carpname=\"carp0\" carpvhid=\"166\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Routed\" ifname=\"re3\" carpname=\"carp1\" carpvhid=\"167\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Bridged\" ifname=\"re1\" carpname=\"carp2\" carpvhid=\"168\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"LAN2\" ifname=\"re2\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n      </InterfaceMapping>\n      <ClusterMember enabled=\"false\" myname=\"A\" master=\"false\" pass=\"defaultClusterPass\" vhidBase=\"166\"/>\n      <LicenseKeys>\n        <XHO available=\"false\" license=\"\"/>\n        <VPN available=\"true\" license=\"\"/>\n      </LicenseKeys>\n    </Local>\n    <Global version=\"3.4.1-60\">\n      <PredefinedObjects>\n        <Nets>\n          <List name=\"Site1\" transitq=\"Link1\">\n            <IPv4 addr=\"any\"/>\n          </List>\n        </Nets>\n        <Ports>\n          <List name=\"MS_Net\">\n            <Port port=\"135,139,445\"/>\n          </List>\n          <List name=\"http\">\n            <Port port=\"80\"/>\n          </List>\n          <List name=\"https\">\n            <Port port=\"443\"/>\n          </List>\n          <List name=\"smtp\">\n            <Port port=\"25\"/>\n          </List>\n          <List name=\"dns\">\n            <Port port=\"53\"/>\n          </List>\n          <List name=\"pop3\">\n            <Port port=\"110\"/>\n          </List>\n          <List name=\"imap\">\n            <Port port=\"143\"/>\n          </List>\n          <List name=\"snmp\">\n            <Port port=\"161\"/>\n          </List>\n          <List name=\"bgp\">\n            <Port port=\"179\"/>\n          </List>\n        </Ports>\n      </PredefinedObjects>\n      <Device os=\"FreeBSD\" name=\"XE\">\n        <Network nodetype=\"hub\" IPv6Enabled=\"false\" IPv4Enabled=\"true\" mode=\"router\" lan2usage=\"management\">\n          <IPv4Routes defaultGateway=\"10.0.0.1\">\n          </IPv4Routes>\n          <IPv6Routes defaultGateway=\"\"/>\n          <Interfaces>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\" man_if=\"true\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.9.3\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n              <IPv6/>\n            </Interface>\n            <ClusterMember name=\"A\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n            <ClusterMember name=\"B\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n          </Interfaces>\n          <NAT enabled=\"false\" interface=\"Wireless\"/>\n          <GRE transparency=\"true\"/>\n        </Network>\n        <WCCP enabled=\"false\">\n          <Services interface=\"Wireless\"/>\n          <Services interface=\"Routed\"/>\n        </WCCP>\n        <Tunnel bypassManagementTraffic=\"true\" qosQueue=\"\" dscpMark=\"\">\n          <Server enabled=\"false\" password=\"\"/>\n          <Client enabled=\"true\" password=\"satcom321\" remote=\"37.60.167.105\" returnIp=\"\" nat=\"true\">\n            <IFSubnet interface=\"Routed\" enabled=\"true\"/>\n            <IPv4TunnelSubnets>\n              <Subnet network=\"192.168.220.0\" mask=\"255.255.255.0\"/>\n            </IPv4TunnelSubnets>\n          </Client>\n          <Coalesce enabled=\"true\" maxTime=\"40\" byteThresh=\"1400\"/>\n          <PathBalancing enabled=\"true\">\n            <Path addr=\"10.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n            <Path addr=\"127.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n          </PathBalancing>\n        </Tunnel>\n        <Optimization enabled=\"true\" hubOnly=\"false\" externalPEP=\"false\">\n          <Link xtc=\"xtc-drc\"/>\n          <OptParams packetOverhead=\"69\" useCompression=\"true\" enableBlackHoleDetection=\"false\"/>\n          <Ttcp enabled=\"true\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n            <Port number=\"8081\"/>\n            <Port number=\"8082\"/>\n          </Ttcp>\n          <HttpPrefetching enabled=\"false\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n          </HttpPrefetching>\n          <HttpCompression enabled=\"false\" minimumSize=\"512\" maximumSize=\"0\"/>\n          <ImageTranscoding>\n            <JPEG enabled=\"false\" quality=\"10\" minimumSize=\"512\" maximumSize=\"253952\"/>\n          </ImageTranscoding>\n          <SCPS ipv6Accel=\"true\" sNack=\"true\">\n            <AFR enabled=\"false\" ppa=\"4\" dupacks=\"false\"/>\n          </SCPS>\n          <OptAdv mtuDisco=\"true\" clampMss=\"false\" maxmss=\"1000\" proxyBindStrategy=\"0\"/>\n        </Optimization>\n        <Services UI_open=\"true\">\n          <DNSConfig domain=\"\" useDhcpDns=\"false\" UI_open=\"true\">\n            <nameserver address=\"8.8.8.8\" UI_open=\"true\"/>\n            <nameserver address=\"8.8.4.4\" UI_open=\"true\"/>\n            <InterceptDNS enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DNSConfig>\n          <DHCPServer units=\"H\" enabled=\"false\" UI_open=\"true\">\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Wireless\" UI_open=\"true\"/>\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DHCPServer>\n          <SNMP trapIPList=\"\" trapInterval=\"0\" enableTraps=\"false\" enabled=\"false\" UI_open=\"true\"/>\n          <RIP enabled=\"false\" kernel=\"true\" static=\"true\" connected=\"true\" wireless=\"true\" routed=\"true\" authentication=\"false\" password=\"\" UI_open=\"true\"/>\n          <OSPFConfig enabled=\"false\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" stub=\"\" UI_open=\"true\">\n            <OSPFNetwork network=\"\" netmask=\"\" area=\"\" UI_open=\"true\"/>\n          </OSPFConfig>\n          <BGPConfig enabled=\"false\" asystem=\"\" network=\"\" netmask=\"\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" UI_open=\"true\">\n            <BGPPeer address=\"\" asystem=\"\" UI_open=\"true\"/>\n          </BGPConfig>\n          <DiskCache equipped=\"false\" enabled=\"false\" UI_open=\"true\">\n            <UrlRedirector nanny=\"false\" whitelist=\"false\" deniedUrl=\"\" welcome=\"false\" welcomeUrl=\"\" welcomeRenewalAge=\"24\" UI_open=\"true\">\n              <NannyList UI_open=\"true\"/>\n              <WelcomeDestExceptions UI_open=\"true\"/>\n              <WelcomeSrcIpExceptions UI_open=\"true\"/>\n            </UrlRedirector>\n          </DiskCache>\n          <NTP addresses=\"90.80.85.131\" ipv=\"4\" enabled=\"true\" UI_open=\"true\"/>\n          <Qos enabled=\"true\" UI_open=\"true\">\n            <RootQueue name=\"root\" queuename=\"root\" interface=\"Wireless\" bandwidth=\"100Mb\" rtt=\"3000\" UI_depth=\"-1\" UI_open=\"true\">\n              <Queue name=\"Link1\" queuename=\"root.Link1\" upperlimit_m2=\"256Kb\" bandwidth=\"256Kb\" returnrate=\"1024Kb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\">\n                <Queue name=\"Site1\" queuename=\"root.Link1.Site1\" bandwidth=\"100%\" UI_open=\"true\" UI_depth=\"1\" upperlimit_m2=\"256Kb\">\n                  <Queue name=\"tcp\" queuename=\"root.Link1.Site1.tcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                  <Queue name=\"nottcp\" queuename=\"root.Link1.Site1.nottcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                </Queue>\n              </Queue>\n              <Queue name=\"Unassigned\" queuename=\"root.Unassigned\" deflt=\"true\" upperlimit_m2=\"16Mb\" bandwidth=\"16Mb\" returnrate=\"16Mb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\"/>\n            </RootQueue>\n          </Qos>\n          <Firewall UI_open=\"true\">\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"1\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_seq=\"2\" UI_dq=\"0\" UI_open=\"true\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"3\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"4\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"true\" xrtaction=\"tun\" xrtqueue=\"24\" queue=\"root.Link1.Site1.tcp\" lbl=\"AutoInsert\" UI_open=\"true\" UI_seq=\"5\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"not tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"false\" xrtaction=\"tun\" xrtqueue=\"25\" queue=\"root.Link1.Site1.nottcp\" UI_open=\"true\" UI_seq=\"6\" UI_dq=\"0\"/>\n          </Firewall>\n          <LLDPD enable=\"false\" UI_open=\"true\"/>\n        </Services>\n        <VPN vpnIP6Endpoint=\"Wireless\" tunType=\"ESPv4\" vpnTemplate=\"IPsec V1\" inetBreakout=\"local\" secProfile=\"standard\" vpnIP4Endpoint=\"Wireless\" keepaliveInterval=\"0\" nodeType=\"spoke\" enabled=\"false\">\n          <IPv4ProtectedSubnets>\n            <subnet mask=\"255.255.255.0\" network=\"192.168.1.0\"/>\n          </IPv4ProtectedSubnets>\n        </VPN>\n        <Stats saveLocal=\"true\" qos=\"false\" receive=\"false\">\n          <Forward enabled=\"false\" address=\"10.0.0.10\"/>\n        </Stats>\n        <Sysctl>\n          <Sysctl name=\"net.qos.detect_slowreaders\" value=\"0\"/>\n          <Sysctl name=\"net.qos.mem.memory_fudge\" value=\"3\"/>\n          <Sysctl name=\"net.qos.reass_mgnt\" value=\"1\"/>\n          <Sysctl name=\"net.inet.tcp.scps.snack.long\" value=\"1\"/>\n        </Sysctl>\n      </Device>\n      <VPNTemplates>\n        <VPNTemplate name=\"IPsec V1\">\n          <ProposalDefinitions>\n            <BaseProposals>\n              <Maximum>\nAlgorithm rijndael-cbc = {\n	key-increment = 8\n	block-size = 64\n	default-key-size = 256\n	max-key-size = 256\n	min-key-size = 128\n	type = cipher\n}\nProposal base-proposal = {\n    ciphers = { rijndael-cbc }\n    hmacs = { hmac-sha256-96 }\n    hashes = { sha256 }\n    compressions = { deflate }\n}\n            </Maximum>\n              <High>\nProposal base-proposal = {\n    ciphers = { rijndael-cbc 3des-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </High>\n              <Standard>\nProposal base-proposal = {\n    ciphers = { 3des-cbc rijndael-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </Standard>\n              <Null>\nProposal base-proposal = {\n    ciphers = { none }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { none }\n}\n          </Null>\n            </BaseProposals>\n            <Proposals>\nProposal ike-base-proposal extends base-proposal = {\n    type        = isakmp\n    life        = isakmp-proposal-default-life\n}\nProposal ike-psk-proposal extends ike-base-proposal = {\n    auth-method = pre-shared-key\n}\nProposalList ike-proposals = {\n    proposals = { ike-psk-proposal }\n}\nProposal esp-base-proposal extends base-proposal = {\n    type = esp\n    life = isakmp-proposal-default-life\n}\nProposal esp-transport-proposal extends esp-base-proposal = {\n    flags       = { transport }\n}\nProposal esp-tunnel-proposal extends esp-base-proposal = {\n    flags       = { tunnel }\n}\nProposal ipcomp-base-proposal extends base-proposal = {\n    type = ipcomp\n}\nProposal ipcomp-tunnel-proposal extends ipcomp-base-proposal = {\n    flags = { tunnel }\n}\nProposal esp-tr-ipcomp-tn-proposal = {\n    chain = {\n        esp-transport-proposal\n        ipcomp-tunnel-proposal\n    }\n}\nProposalList ipsec-esp-tr-ipcomp-tn-proposals = {\n    proposals = { esp-tr-ipcomp-tn-proposal }\n}\nProposalList ipsec-esp-tn-proposal = {\n    proposals = { esp-tunnel-proposal }\n}\n          </Proposals>\n          </ProposalDefinitions>\n          <LifetimeDefinitions>\n            <Maximum>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     1000000\n    hard-seconds     =     28800\n}\n          </Maximum>\n            <High>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     2000000\n    hard-seconds     =     86400\n}\n          </High>\n            <Standard>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Standard>\n            <Null>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Null>\n          </LifetimeDefinitions>\n          <GroupDefinitions maximum=\"isakmp-group-modp-1\" high=\"isakmp-group-5\" standard=\"isakmp-group-1\">\nGroup isakmp-group-1 = { ident = 1 }\nGroup isakmp-group-2 = { ident = 2 }\nGroup isakmp-group-5 = { ident = 5 }\n        </GroupDefinitions>\n          <GroupMappings maximum=\"isakmp-group-5\" high=\"isakmp-group-2\" standard=\"isakmp-group-1\"/>\n          <KeyDefinitions>\n            <Block name=\"ike-key\">\nKey $name; = { ike-shared-secret = $key; }\n          </Block>\n          </KeyDefinitions>\n          <ConnectionDefinitions>\n            <DefaultConnections>\nConnection allow-ike-io = {\n    flags                = { passby no-forwarding }\n    local-address        = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n}\n\n# Passby DNS queries to remote DNS server.\nConnection allow-dns-o = {\n    flags                = { passby no-forwarding match-outbound }\n    local-address        = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n}\n\n# Passby DNS replies from the remote DNS server.\nConnection allow-dns-i = {\n    flags                = { passby match-inbound }\n    local-address        = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n}\n\nConnection dhcp-request = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n}\n\nConnection dhcp-reply = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n}\n          </DefaultConnections>\n            <CustomConnections>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n		}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n             </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh\" apply-to-local=\"mesh\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-local=\"inetlocal\" name=\"allow-all\">\nConnection $name; = {\n    flags                = { passby }\n    local-address        = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n}\n           </Block>\n            </CustomConnections>\n          </ConnectionDefinitions>\n          <DeviceDefinitions>\n# Enable stats via http\nParams params = {\n  http-interface = {\n    port = 9090\n    statistics-pages = { \"sa\" }\n  }\n  ike-addresses = {\n    \"$Wireless_ip4_addr;\"\n  }\n}\n\nDevice vpn-cfg = {\nconnections  = {\nallow-ike-io\ndhcp-request\ndhcp-reply\n$ruleset;\n}\nparams = params\n}\n        </DeviceDefinitions>\n          <UsedDevice>\nuse vpn-cfg \n        </UsedDevice>\n        </VPNTemplate>\n        <VPNTemplate name=\"IPsec dummy template\"/>\n      </VPNTemplates>\n    </Global>\n    \n'),('conf','<Local version=\"3.4.1-60\">\n      <Device os=\"FreeBSD\" myname=\"XE\"/>\n      <LicensedUser agreed=\"true\" organization=\"Satcom1\" name=\"Satcom1\"/>\n      <GlobalVPNKeyHash hashValue=\"No key\"/>\n      <InterfaceMapping>\n        <Interface name=\"Wireless\" ifname=\"re0\" carpname=\"carp0\" carpvhid=\"166\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Routed\" ifname=\"re3\" carpname=\"carp1\" carpvhid=\"167\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Bridged\" ifname=\"re1\" carpname=\"carp2\" carpvhid=\"168\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"LAN2\" ifname=\"re2\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n      </InterfaceMapping>\n      <ClusterMember enabled=\"false\" myname=\"A\" master=\"false\" pass=\"defaultClusterPass\" vhidBase=\"166\"/>\n      <LicenseKeys>\n        <XHO available=\"false\" license=\"\"/>\n        <VPN available=\"true\" license=\"\"/>\n      </LicenseKeys>\n    </Local>\n    <Global version=\"3.4.1-60\">\n      <PredefinedObjects>\n        <Nets>\n          <List name=\"Site1\" transitq=\"Link1\">\n            <IPv4 addr=\"any\"/>\n          </List>\n        </Nets>\n        <Ports>\n          <List name=\"MS_Net\">\n            <Port port=\"135,139,445\"/>\n          </List>\n          <List name=\"http\">\n            <Port port=\"80\"/>\n          </List>\n          <List name=\"https\">\n            <Port port=\"443\"/>\n          </List>\n          <List name=\"smtp\">\n            <Port port=\"25\"/>\n          </List>\n          <List name=\"dns\">\n            <Port port=\"53\"/>\n          </List>\n          <List name=\"pop3\">\n            <Port port=\"110\"/>\n          </List>\n          <List name=\"imap\">\n            <Port port=\"143\"/>\n          </List>\n          <List name=\"snmp\">\n            <Port port=\"161\"/>\n          </List>\n          <List name=\"bgp\">\n            <Port port=\"179\"/>\n          </List>\n        </Ports>\n      </PredefinedObjects>\n      <Device os=\"FreeBSD\" name=\"XE\">\n        <Network nodetype=\"hub\" IPv6Enabled=\"false\" IPv4Enabled=\"true\" mode=\"router\" lan2usage=\"management\">\n          <IPv4Routes defaultGateway=\"10.0.0.1\">\n          </IPv4Routes>\n          <IPv6Routes defaultGateway=\"\"/>\n          <Interfaces>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\" man_if=\"true\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.9.3\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n              <IPv6/>\n            </Interface>\n            <ClusterMember name=\"A\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n            <ClusterMember name=\"B\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n          </Interfaces>\n          <NAT enabled=\"false\" interface=\"Wireless\"/>\n          <GRE transparency=\"true\"/>\n        </Network>\n        <WCCP enabled=\"false\">\n          <Services interface=\"Wireless\"/>\n          <Services interface=\"Routed\"/>\n        </WCCP>\n        <Tunnel bypassManagementTraffic=\"true\" qosQueue=\"\" dscpMark=\"\">\n          <Server enabled=\"false\" password=\"\"/>\n          <Client enabled=\"true\" password=\"satcom321\" remote=\"37.60.167.105\" returnIp=\"\" nat=\"true\">\n            <IFSubnet interface=\"Routed\" enabled=\"true\"/>\n            <IPv4TunnelSubnets>\n              <Subnet network=\"192.168.220.0\" mask=\"255.255.255.0\"/>\n            </IPv4TunnelSubnets>\n          </Client>\n          <Coalesce enabled=\"true\" maxTime=\"40\" byteThresh=\"1400\"/>\n          <PathBalancing enabled=\"true\">\n            <Path addr=\"10.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n            <Path addr=\"127.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n          </PathBalancing>\n        </Tunnel>\n        <Optimization enabled=\"true\" hubOnly=\"false\" externalPEP=\"false\">\n          <Link xtc=\"xtc-drc\"/>\n          <OptParams packetOverhead=\"69\" useCompression=\"true\" enableBlackHoleDetection=\"false\"/>\n          <Ttcp enabled=\"true\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n            <Port number=\"8081\"/>\n            <Port number=\"8082\"/>\n          </Ttcp>\n          <HttpPrefetching enabled=\"false\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n          </HttpPrefetching>\n          <HttpCompression enabled=\"false\" minimumSize=\"512\" maximumSize=\"0\"/>\n          <ImageTranscoding>\n            <JPEG enabled=\"false\" quality=\"10\" minimumSize=\"512\" maximumSize=\"253952\"/>\n          </ImageTranscoding>\n          <SCPS ipv6Accel=\"true\" sNack=\"true\">\n            <AFR enabled=\"false\" ppa=\"4\" dupacks=\"false\"/>\n          </SCPS>\n          <OptAdv mtuDisco=\"true\" clampMss=\"false\" maxmss=\"1000\" proxyBindStrategy=\"0\"/>\n        </Optimization>\n        <Services UI_open=\"true\">\n          <DNSConfig domain=\"\" useDhcpDns=\"false\" UI_open=\"true\">\n            <nameserver address=\"8.8.8.8\" UI_open=\"true\"/>\n            <nameserver address=\"8.8.4.4\" UI_open=\"true\"/>\n            <InterceptDNS enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DNSConfig>\n          <DHCPServer units=\"H\" enabled=\"false\" UI_open=\"true\">\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Wireless\" UI_open=\"true\"/>\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DHCPServer>\n          <SNMP trapIPList=\"\" trapInterval=\"0\" enableTraps=\"false\" enabled=\"false\" UI_open=\"true\"/>\n          <RIP enabled=\"false\" kernel=\"true\" static=\"true\" connected=\"true\" wireless=\"true\" routed=\"true\" authentication=\"false\" password=\"\" UI_open=\"true\"/>\n          <OSPFConfig enabled=\"false\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" stub=\"\" UI_open=\"true\">\n            <OSPFNetwork network=\"\" netmask=\"\" area=\"\" UI_open=\"true\"/>\n          </OSPFConfig>\n          <BGPConfig enabled=\"false\" asystem=\"\" network=\"\" netmask=\"\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" UI_open=\"true\">\n            <BGPPeer address=\"\" asystem=\"\" UI_open=\"true\"/>\n          </BGPConfig>\n          <DiskCache equipped=\"false\" enabled=\"false\" UI_open=\"true\">\n            <UrlRedirector nanny=\"false\" whitelist=\"false\" deniedUrl=\"\" welcome=\"false\" welcomeUrl=\"\" welcomeRenewalAge=\"24\" UI_open=\"true\">\n              <NannyList UI_open=\"true\"/>\n              <WelcomeDestExceptions UI_open=\"true\"/>\n              <WelcomeSrcIpExceptions UI_open=\"true\"/>\n            </UrlRedirector>\n          </DiskCache>\n          <NTP addresses=\"90.80.85.131\" ipv=\"4\" enabled=\"true\" UI_open=\"true\"/>\n          <Qos enabled=\"true\" UI_open=\"true\">\n            <RootQueue name=\"root\" queuename=\"root\" interface=\"Wireless\" bandwidth=\"100Mb\" rtt=\"3000\" UI_depth=\"-1\" UI_open=\"true\">\n              <Queue name=\"Link1\" queuename=\"root.Link1\" upperlimit_m2=\"256Kb\" bandwidth=\"256Kb\" returnrate=\"1024Kb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\">\n                <Queue name=\"Site1\" queuename=\"root.Link1.Site1\" bandwidth=\"100%\" UI_open=\"true\" UI_depth=\"1\" upperlimit_m2=\"256Kb\">\n                  <Queue name=\"tcp\" queuename=\"root.Link1.Site1.tcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                  <Queue name=\"nottcp\" queuename=\"root.Link1.Site1.nottcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                </Queue>\n              </Queue>\n              <Queue name=\"Unassigned\" queuename=\"root.Unassigned\" deflt=\"true\" upperlimit_m2=\"16Mb\" bandwidth=\"16Mb\" returnrate=\"16Mb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\"/>\n            </RootQueue>\n          </Qos>\n          <Firewall UI_open=\"true\">\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"1\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_seq=\"2\" UI_dq=\"0\" UI_open=\"true\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"3\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"4\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"true\" xrtaction=\"tun\" xrtqueue=\"24\" queue=\"root.Link1.Site1.tcp\" lbl=\"AutoInsert\" UI_open=\"true\" UI_seq=\"5\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"not tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"false\" xrtaction=\"tun\" xrtqueue=\"25\" queue=\"root.Link1.Site1.nottcp\" UI_open=\"true\" UI_seq=\"6\" UI_dq=\"0\"/>\n          </Firewall>\n          <LLDPD enable=\"false\" UI_open=\"true\"/>\n        </Services>\n        <VPN vpnIP6Endpoint=\"Wireless\" tunType=\"ESPv4\" vpnTemplate=\"IPsec V1\" inetBreakout=\"local\" secProfile=\"standard\" vpnIP4Endpoint=\"Wireless\" keepaliveInterval=\"0\" nodeType=\"spoke\" enabled=\"false\">\n          <IPv4ProtectedSubnets>\n            <subnet mask=\"255.255.255.0\" network=\"192.168.1.0\"/>\n          </IPv4ProtectedSubnets>\n        </VPN>\n        <Stats saveLocal=\"true\" qos=\"false\" receive=\"false\">\n          <Forward enabled=\"false\" address=\"10.0.0.10\"/>\n        </Stats>\n        <Sysctl>\n          <Sysctl name=\"net.qos.detect_slowreaders\" value=\"0\"/>\n          <Sysctl name=\"net.qos.mem.memory_fudge\" value=\"3\"/>\n          <Sysctl name=\"net.qos.reass_mgnt\" value=\"1\"/>\n          <Sysctl name=\"net.inet.tcp.scps.snack.long\" value=\"1\"/>\n        </Sysctl>\n      </Device>\n      <VPNTemplates>\n        <VPNTemplate name=\"IPsec V1\">\n          <ProposalDefinitions>\n            <BaseProposals>\n              <Maximum>\nAlgorithm rijndael-cbc = {\n	key-increment = 8\n	block-size = 64\n	default-key-size = 256\n	max-key-size = 256\n	min-key-size = 128\n	type = cipher\n}\nProposal base-proposal = {\n    ciphers = { rijndael-cbc }\n    hmacs = { hmac-sha256-96 }\n    hashes = { sha256 }\n    compressions = { deflate }\n}\n            </Maximum>\n              <High>\nProposal base-proposal = {\n    ciphers = { rijndael-cbc 3des-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </High>\n              <Standard>\nProposal base-proposal = {\n    ciphers = { 3des-cbc rijndael-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </Standard>\n              <Null>\nProposal base-proposal = {\n    ciphers = { none }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { none }\n}\n          </Null>\n            </BaseProposals>\n            <Proposals>\nProposal ike-base-proposal extends base-proposal = {\n    type        = isakmp\n    life        = isakmp-proposal-default-life\n}\nProposal ike-psk-proposal extends ike-base-proposal = {\n    auth-method = pre-shared-key\n}\nProposalList ike-proposals = {\n    proposals = { ike-psk-proposal }\n}\nProposal esp-base-proposal extends base-proposal = {\n    type = esp\n    life = isakmp-proposal-default-life\n}\nProposal esp-transport-proposal extends esp-base-proposal = {\n    flags       = { transport }\n}\nProposal esp-tunnel-proposal extends esp-base-proposal = {\n    flags       = { tunnel }\n}\nProposal ipcomp-base-proposal extends base-proposal = {\n    type = ipcomp\n}\nProposal ipcomp-tunnel-proposal extends ipcomp-base-proposal = {\n    flags = { tunnel }\n}\nProposal esp-tr-ipcomp-tn-proposal = {\n    chain = {\n        esp-transport-proposal\n        ipcomp-tunnel-proposal\n    }\n}\nProposalList ipsec-esp-tr-ipcomp-tn-proposals = {\n    proposals = { esp-tr-ipcomp-tn-proposal }\n}\nProposalList ipsec-esp-tn-proposal = {\n    proposals = { esp-tunnel-proposal }\n}\n          </Proposals>\n          </ProposalDefinitions>\n          <LifetimeDefinitions>\n            <Maximum>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     1000000\n    hard-seconds     =     28800\n}\n          </Maximum>\n            <High>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     2000000\n    hard-seconds     =     86400\n}\n          </High>\n            <Standard>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Standard>\n            <Null>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Null>\n          </LifetimeDefinitions>\n          <GroupDefinitions maximum=\"isakmp-group-modp-1\" high=\"isakmp-group-5\" standard=\"isakmp-group-1\">\nGroup isakmp-group-1 = { ident = 1 }\nGroup isakmp-group-2 = { ident = 2 }\nGroup isakmp-group-5 = { ident = 5 }\n        </GroupDefinitions>\n          <GroupMappings maximum=\"isakmp-group-5\" high=\"isakmp-group-2\" standard=\"isakmp-group-1\"/>\n          <KeyDefinitions>\n            <Block name=\"ike-key\">\nKey $name; = { ike-shared-secret = $key; }\n          </Block>\n          </KeyDefinitions>\n          <ConnectionDefinitions>\n            <DefaultConnections>\nConnection allow-ike-io = {\n    flags                = { passby no-forwarding }\n    local-address        = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n}\n\n# Passby DNS queries to remote DNS server.\nConnection allow-dns-o = {\n    flags                = { passby no-forwarding match-outbound }\n    local-address        = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n}\n\n# Passby DNS replies from the remote DNS server.\nConnection allow-dns-i = {\n    flags                = { passby match-inbound }\n    local-address        = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n}\n\nConnection dhcp-request = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n}\n\nConnection dhcp-reply = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n}\n          </DefaultConnections>\n            <CustomConnections>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n		}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n             </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh\" apply-to-local=\"mesh\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-local=\"inetlocal\" name=\"allow-all\">\nConnection $name; = {\n    flags                = { passby }\n    local-address        = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n}\n           </Block>\n            </CustomConnections>\n          </ConnectionDefinitions>\n          <DeviceDefinitions>\n# Enable stats via http\nParams params = {\n  http-interface = {\n    port = 9090\n    statistics-pages = { \"sa\" }\n  }\n  ike-addresses = {\n    \"$Wireless_ip4_addr;\"\n  }\n}\n\nDevice vpn-cfg = {\nconnections  = {\nallow-ike-io\ndhcp-request\ndhcp-reply\n$ruleset;\n}\nparams = params\n}\n        </DeviceDefinitions>\n          <UsedDevice>\nuse vpn-cfg \n        </UsedDevice>\n        </VPNTemplate>\n        <VPNTemplate name=\"IPsec dummy template\"/>\n      </VPNTemplates>\n    </Global>\n    \n'),('conf','<Local version=\"3.4.1-60\">\n      <Device os=\"FreeBSD\" myname=\"XE\"/>\n      <LicensedUser agreed=\"true\" organization=\"Satcom1\" name=\"Satcom1\"/>\n      <GlobalVPNKeyHash hashValue=\"No key\"/>\n      <InterfaceMapping>\n        <Interface name=\"Wireless\" ifname=\"re0\" carpname=\"carp0\" carpvhid=\"166\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Routed\" ifname=\"re3\" carpname=\"carp1\" carpvhid=\"167\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"Bridged\" ifname=\"re1\" carpname=\"carp2\" carpvhid=\"168\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n        <Interface name=\"LAN2\" ifname=\"re2\">\n          <SupportedMedia>\n            <Media name=\"autoselect flowcontrol\"/>\n            <Media name=\"autoselect\"/>\n            <Media name=\"100baseTX full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"100baseTX full-duplex\"/>\n            <Media name=\"100baseTX\"/>\n            <Media name=\"10baseT/UTP full-duplex mediaopt flowcontrol\"/>\n            <Media name=\"10baseT/UTP full-duplex\"/>\n            <Media name=\"10baseT/UTP\"/>\n            <Media name=\"100baseTX hw-loopback\"/>\n          </SupportedMedia>\n        </Interface>\n      </InterfaceMapping>\n      <ClusterMember enabled=\"false\" myname=\"A\" master=\"false\" pass=\"defaultClusterPass\" vhidBase=\"166\"/>\n      <LicenseKeys>\n        <XHO available=\"false\" license=\"\"/>\n        <VPN available=\"true\" license=\"\"/>\n      </LicenseKeys>\n    </Local>\n    <Global version=\"3.4.1-60\">\n      <PredefinedObjects>\n        <Nets>\n          <List name=\"Site1\" transitq=\"Link1\">\n            <IPv4 addr=\"any\"/>\n          </List>\n        </Nets>\n        <Ports>\n          <List name=\"MS_Net\">\n            <Port port=\"135,139,445\"/>\n          </List>\n          <List name=\"http\">\n            <Port port=\"80\"/>\n          </List>\n          <List name=\"https\">\n            <Port port=\"443\"/>\n          </List>\n          <List name=\"smtp\">\n            <Port port=\"25\"/>\n          </List>\n          <List name=\"dns\">\n            <Port port=\"53\"/>\n          </List>\n          <List name=\"pop3\">\n            <Port port=\"110\"/>\n          </List>\n          <List name=\"imap\">\n            <Port port=\"143\"/>\n          </List>\n          <List name=\"snmp\">\n            <Port port=\"161\"/>\n          </List>\n          <List name=\"bgp\">\n            <Port port=\"179\"/>\n          </List>\n        </Ports>\n      </PredefinedObjects>\n      <Device os=\"FreeBSD\" name=\"XE\">\n        <Network nodetype=\"hub\" IPv6Enabled=\"false\" IPv4Enabled=\"true\" mode=\"router\" lan2usage=\"management\">\n          <IPv4Routes defaultGateway=\"10.0.0.1\">\n          </IPv4Routes>\n          <IPv6Routes defaultGateway=\"\"/>\n          <Interfaces>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\" man_if=\"true\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.9.3\"/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\">\n              <IPv4/>\n              <IPv6/>\n            </Interface>\n            <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\" man_if=\"false\" vlanMode=\"all\" vlan=\"1\" rbridged=\"false\">\n              <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n              <IPv6/>\n            </Interface>\n            <ClusterMember name=\"A\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n            <ClusterMember name=\"B\">\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Wireless\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"10.0.0.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"Routed\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"192.168.1.200\"/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"true\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"false\" name=\"Bridged\">\n                <IPv4/>\n                <IPv6/>\n              </Interface>\n              <Interface bridged=\"false\" IP6Type=\"none\" IP4Type=\"static\" mtu=\"1500\" media=\"autoselect\" enabled=\"true\" name=\"LAN2\">\n                <IPv4 type=\"primary\" mask=\"255.255.255.0\" address=\"172.16.1.200\"/>\n                <IPv6/>\n              </Interface>\n            </ClusterMember>\n          </Interfaces>\n          <NAT enabled=\"false\" interface=\"Wireless\"/>\n          <GRE transparency=\"true\"/>\n        </Network>\n        <WCCP enabled=\"false\">\n          <Services interface=\"Wireless\"/>\n          <Services interface=\"Routed\"/>\n        </WCCP>\n        <Tunnel bypassManagementTraffic=\"true\" qosQueue=\"\" dscpMark=\"\">\n          <Server enabled=\"false\" password=\"\"/>\n          <Client enabled=\"true\" password=\"satcom321\" remote=\"37.60.167.105\" returnIp=\"\" nat=\"true\">\n            <IFSubnet interface=\"Routed\" enabled=\"true\"/>\n            <IPv4TunnelSubnets>\n              <Subnet network=\"192.168.220.0\" mask=\"255.255.255.0\"/>\n            </IPv4TunnelSubnets>\n          </Client>\n          <Coalesce enabled=\"true\" maxTime=\"40\" byteThresh=\"1400\"/>\n          <PathBalancing enabled=\"true\">\n            <Path addr=\"10.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n            <Path addr=\"127.0.0.1\" tx_upperlimit=\"256000\" rx_upperlimit=\"720000\"/>\n          </PathBalancing>\n        </Tunnel>\n        <Optimization enabled=\"true\" hubOnly=\"false\" externalPEP=\"false\">\n          <Link xtc=\"xtc-drc\"/>\n          <OptParams packetOverhead=\"69\" useCompression=\"true\" enableBlackHoleDetection=\"false\"/>\n          <Ttcp enabled=\"true\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n            <Port number=\"8081\"/>\n            <Port number=\"8082\"/>\n          </Ttcp>\n          <HttpPrefetching enabled=\"false\">\n            <Port number=\"80\"/>\n            <Port number=\"8080\"/>\n          </HttpPrefetching>\n          <HttpCompression enabled=\"false\" minimumSize=\"512\" maximumSize=\"0\"/>\n          <ImageTranscoding>\n            <JPEG enabled=\"false\" quality=\"10\" minimumSize=\"512\" maximumSize=\"253952\"/>\n          </ImageTranscoding>\n          <SCPS ipv6Accel=\"true\" sNack=\"true\">\n            <AFR enabled=\"false\" ppa=\"4\" dupacks=\"false\"/>\n          </SCPS>\n          <OptAdv mtuDisco=\"true\" clampMss=\"false\" maxmss=\"1000\" proxyBindStrategy=\"0\"/>\n        </Optimization>\n        <Services UI_open=\"true\">\n          <DNSConfig domain=\"\" useDhcpDns=\"false\" UI_open=\"true\">\n            <nameserver address=\"8.8.8.8\" UI_open=\"true\"/>\n            <nameserver address=\"8.8.4.4\" UI_open=\"true\"/>\n            <InterceptDNS enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DNSConfig>\n          <DHCPServer units=\"H\" enabled=\"false\" UI_open=\"true\">\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Wireless\" UI_open=\"true\"/>\n            <interfaceSetting dhcpLease=\"1\" dhcpEnd=\"0.0.0.10\" dhcpStart=\"0.0.0.0\" enabled=\"false\" interface=\"Routed\" UI_open=\"true\"/>\n          </DHCPServer>\n          <SNMP trapIPList=\"\" trapInterval=\"0\" enableTraps=\"false\" enabled=\"false\" UI_open=\"true\"/>\n          <RIP enabled=\"false\" kernel=\"true\" static=\"true\" connected=\"true\" wireless=\"true\" routed=\"true\" authentication=\"false\" password=\"\" UI_open=\"true\"/>\n          <OSPFConfig enabled=\"false\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" stub=\"\" UI_open=\"true\">\n            <OSPFNetwork network=\"\" netmask=\"\" area=\"\" UI_open=\"true\"/>\n          </OSPFConfig>\n          <BGPConfig enabled=\"false\" asystem=\"\" network=\"\" netmask=\"\" isKernelDist=\"false\" isStaticDist=\"false\" isConnectedDist=\"false\" UI_open=\"true\">\n            <BGPPeer address=\"\" asystem=\"\" UI_open=\"true\"/>\n          </BGPConfig>\n          <DiskCache equipped=\"false\" enabled=\"false\" UI_open=\"true\">\n            <UrlRedirector nanny=\"false\" whitelist=\"false\" deniedUrl=\"\" welcome=\"false\" welcomeUrl=\"\" welcomeRenewalAge=\"24\" UI_open=\"true\">\n              <NannyList UI_open=\"true\"/>\n              <WelcomeDestExceptions UI_open=\"true\"/>\n              <WelcomeSrcIpExceptions UI_open=\"true\"/>\n            </UrlRedirector>\n          </DiskCache>\n          <NTP addresses=\"90.80.85.131\" ipv=\"4\" enabled=\"true\" UI_open=\"true\"/>\n          <Qos enabled=\"true\" UI_open=\"true\">\n            <RootQueue name=\"root\" queuename=\"root\" interface=\"Wireless\" bandwidth=\"100Mb\" rtt=\"3000\" UI_depth=\"-1\" UI_open=\"true\">\n              <Queue name=\"Link1\" queuename=\"root.Link1\" upperlimit_m2=\"256Kb\" bandwidth=\"256Kb\" returnrate=\"1024Kb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\">\n                <Queue name=\"Site1\" queuename=\"root.Link1.Site1\" bandwidth=\"100%\" UI_open=\"true\" UI_depth=\"1\" upperlimit_m2=\"256Kb\">\n                  <Queue name=\"tcp\" queuename=\"root.Link1.Site1.tcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                  <Queue name=\"nottcp\" queuename=\"root.Link1.Site1.nottcp\" xipcaps=\"0\" bandwidth=\"50%\" UI_open=\"true\" UI_depth=\"2\"/>\n                </Queue>\n              </Queue>\n              <Queue name=\"Unassigned\" queuename=\"root.Unassigned\" deflt=\"true\" upperlimit_m2=\"16Mb\" bandwidth=\"16Mb\" returnrate=\"16Mb\" rtt=\"3000\" UI_depth=\"0\" UI_open=\"true\"/>\n            </RootQueue>\n          </Qos>\n          <Firewall UI_open=\"true\">\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"1\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:MS_Net\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_seq=\"2\" UI_dq=\"0\" UI_open=\"true\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" srcport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"3\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstport=\"PORT:bgp\" keepstate=\"false\" optimize=\"false\" action=\"allow\" UI_open=\"true\" UI_seq=\"4\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"true\" xrtaction=\"tun\" xrtqueue=\"24\" queue=\"root.Link1.Site1.tcp\" lbl=\"AutoInsert\" UI_open=\"true\" UI_seq=\"5\" UI_dq=\"0\"/>\n            <Rule enabled=\"true\" ipver=\"4\" proto=\"not tcp\" dstip=\"NET:Site1\" action=\"allow\" optimize=\"false\" xrtaction=\"tun\" xrtqueue=\"25\" queue=\"root.Link1.Site1.nottcp\" UI_open=\"true\" UI_seq=\"6\" UI_dq=\"0\"/>\n          </Firewall>\n          <LLDPD enable=\"false\" UI_open=\"true\"/>\n        </Services>\n        <VPN vpnIP6Endpoint=\"Wireless\" tunType=\"ESPv4\" vpnTemplate=\"IPsec V1\" inetBreakout=\"local\" secProfile=\"standard\" vpnIP4Endpoint=\"Wireless\" keepaliveInterval=\"0\" nodeType=\"spoke\" enabled=\"false\">\n          <IPv4ProtectedSubnets>\n            <subnet mask=\"255.255.255.0\" network=\"192.168.1.0\"/>\n          </IPv4ProtectedSubnets>\n        </VPN>\n        <Stats saveLocal=\"true\" qos=\"false\" receive=\"false\">\n          <Forward enabled=\"false\" address=\"10.0.0.10\"/>\n        </Stats>\n        <Sysctl>\n          <Sysctl name=\"net.qos.detect_slowreaders\" value=\"0\"/>\n          <Sysctl name=\"net.qos.mem.memory_fudge\" value=\"3\"/>\n          <Sysctl name=\"net.qos.reass_mgnt\" value=\"1\"/>\n          <Sysctl name=\"net.inet.tcp.scps.snack.long\" value=\"1\"/>\n        </Sysctl>\n      </Device>\n      <VPNTemplates>\n        <VPNTemplate name=\"IPsec V1\">\n          <ProposalDefinitions>\n            <BaseProposals>\n              <Maximum>\nAlgorithm rijndael-cbc = {\n	key-increment = 8\n	block-size = 64\n	default-key-size = 256\n	max-key-size = 256\n	min-key-size = 128\n	type = cipher\n}\nProposal base-proposal = {\n    ciphers = { rijndael-cbc }\n    hmacs = { hmac-sha256-96 }\n    hashes = { sha256 }\n    compressions = { deflate }\n}\n            </Maximum>\n              <High>\nProposal base-proposal = {\n    ciphers = { rijndael-cbc 3des-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </High>\n              <Standard>\nProposal base-proposal = {\n    ciphers = { 3des-cbc rijndael-cbc }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { deflate }\n}\n            </Standard>\n              <Null>\nProposal base-proposal = {\n    ciphers = { none }\n    hmacs = { hmac-sha1-96 }\n    hashes = { sha1 }\n    compressions = { none }\n}\n          </Null>\n            </BaseProposals>\n            <Proposals>\nProposal ike-base-proposal extends base-proposal = {\n    type        = isakmp\n    life        = isakmp-proposal-default-life\n}\nProposal ike-psk-proposal extends ike-base-proposal = {\n    auth-method = pre-shared-key\n}\nProposalList ike-proposals = {\n    proposals = { ike-psk-proposal }\n}\nProposal esp-base-proposal extends base-proposal = {\n    type = esp\n    life = isakmp-proposal-default-life\n}\nProposal esp-transport-proposal extends esp-base-proposal = {\n    flags       = { transport }\n}\nProposal esp-tunnel-proposal extends esp-base-proposal = {\n    flags       = { tunnel }\n}\nProposal ipcomp-base-proposal extends base-proposal = {\n    type = ipcomp\n}\nProposal ipcomp-tunnel-proposal extends ipcomp-base-proposal = {\n    flags = { tunnel }\n}\nProposal esp-tr-ipcomp-tn-proposal = {\n    chain = {\n        esp-transport-proposal\n        ipcomp-tunnel-proposal\n    }\n}\nProposalList ipsec-esp-tr-ipcomp-tn-proposals = {\n    proposals = { esp-tr-ipcomp-tn-proposal }\n}\nProposalList ipsec-esp-tn-proposal = {\n    proposals = { esp-tunnel-proposal }\n}\n          </Proposals>\n          </ProposalDefinitions>\n          <LifetimeDefinitions>\n            <Maximum>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     1000000\n    hard-seconds     =     28800\n}\n          </Maximum>\n            <High>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     2000000\n    hard-seconds     =     86400\n}\n          </High>\n            <Standard>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Standard>\n            <Null>\nLife isakmp-proposal-default-life = {\n    hard-kbytes      =     3000000\n    hard-seconds     =     86400\n}\n          </Null>\n          </LifetimeDefinitions>\n          <GroupDefinitions maximum=\"isakmp-group-modp-1\" high=\"isakmp-group-5\" standard=\"isakmp-group-1\">\nGroup isakmp-group-1 = { ident = 1 }\nGroup isakmp-group-2 = { ident = 2 }\nGroup isakmp-group-5 = { ident = 5 }\n        </GroupDefinitions>\n          <GroupMappings maximum=\"isakmp-group-5\" high=\"isakmp-group-2\" standard=\"isakmp-group-1\"/>\n          <KeyDefinitions>\n            <Block name=\"ike-key\">\nKey $name; = { ike-shared-secret = $key; }\n          </Block>\n          </KeyDefinitions>\n          <ConnectionDefinitions>\n            <DefaultConnections>\nConnection allow-ike-io = {\n    flags                = { passby no-forwarding }\n    local-address        = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:500,0.0.0.0/0)\n        ipv6_subnet(udp:500,::/0)\n    }\n}\n\n# Passby DNS queries to remote DNS server.\nConnection allow-dns-o = {\n    flags                = { passby no-forwarding match-outbound }\n    local-address        = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n}\n\n# Passby DNS replies from the remote DNS server.\nConnection allow-dns-i = {\n    flags                = { passby match-inbound }\n    local-address        = {\n        ipv4_subnet(udp:53,0.0.0.0/0)\n        ipv6_subnet(udp:53,::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(udp:1024-65535,0.0.0.0/0)\n        ipv6_subnet(udp:1024-65535,::/0)\n    }\n}\n\nConnection dhcp-request = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n}\n\nConnection dhcp-reply = {\n	flags = { passby }\n	local-address = {\n		ipv4_subnet(udp:67,0.0.0.0/0)\n	}\n	remote-address = {\n		ipv4_subnet(udp:68,0.0.0.0/0)\n	}\n}\n          </DefaultConnections>\n            <CustomConnections>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Wireless_ip4_addr;)\n		ipv4(tcp:22,$Wireless_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n		}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4(tcp:443,$Routed_ip4_addr;)\n		ipv4(tcp:22,$Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		ipv4_subnet(tcp:22,0.0.0.0/0)\n		ipv4_subnet(tcp:443,0.0.0.0/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6(tcp:443,$Wireless_ip6_addr;)\n		ipv6(tcp:22,$Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv6_enabled -autoconf_sat\" name=\"manage-other-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv6($Wireless_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	remote-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6(tcp:443,$Routed_ip6_addr;)\n		ipv6(tcp:22,$Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv6_enabled -autoconf_lan\" name=\"manage-other-lan-out\">\nConnection $name; = {\n	flags = {passby}\n	remote-address = {\n		ipv6($Routed_ip6_addr;)\n	}\n	local-address = {\n		ipv6_subnet(tcp:443,::/0)\n		ipv6_subnet(tcp:22,::/0)\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"ipv4_enabled -dhcp4_sat\" name=\"subnets-sat-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Wireless_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-in\">\nConnection $name; = {\n	flags = { passby }\n	local-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	remote-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-local=\"-bridge ipv4_enabled -dhcp4_lan\" name=\"subnets-lan-out\">\nConnection $name; = {\n	flags = { passby }\n	remote-address = {\n		ipv4($Routed_ip4_addr;)\n	}\n	local-address = {\n		$local_address;\n	}\n}\n          </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n             </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh -inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh -inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh\" apply-to-local=\"mesh\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { $remote_address;\n                   $remote_gateway; }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"spoke inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"spoke inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"hub\" apply-to-local=\"mesh inethub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nremote-address = { ipv4_subnet(0.0.0.0/0) }\nlocal-address  = { $local_address;\n                   $local_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-remote=\"mesh inethub\" apply-to-local=\"hub\" name=\"vpn\">\nConnection $name; = {\nflags          = { sa-per-net }\nlocal-address = { ipv4_subnet(0.0.0.0/0) }\nremote-address  = { $remote_address;\n                    $remote_gateway; }\nlocal-gw       = $local_gateway;\nremote-gw      = $remote_gateway;\nike-proposal   = ike-proposals\nike-groups     = { $isakmp_group; }\nike-key        = $ike_key;\nipsec-proposal = ipsec-esp-tn-proposal\n}\n            </Block>\n              <Block apply-to-local=\"inetlocal\" name=\"allow-all\">\nConnection $name; = {\n    flags                = { passby }\n    local-address        = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n    remote-address       = {\n        ipv4_subnet(0.0.0.0/0)\n        ipv6_subnet(::/0)\n    }\n}\n           </Block>\n            </CustomConnections>\n          </ConnectionDefinitions>\n          <DeviceDefinitions>\n# Enable stats via http\nParams params = {\n  http-interface = {\n    port = 9090\n    statistics-pages = { \"sa\" }\n  }\n  ike-addresses = {\n    \"$Wireless_ip4_addr;\"\n  }\n}\n\nDevice vpn-cfg = {\nconnections  = {\nallow-ike-io\ndhcp-request\ndhcp-reply\n$ruleset;\n}\nparams = params\n}\n        </DeviceDefinitions>\n          <UsedDevice>\nuse vpn-cfg \n        </UsedDevice>\n        </VPNTemplate>\n        <VPNTemplate name=\"IPsec dummy template\"/>\n      </VPNTemplates>\n    </Global>\n    \n');
/*!40000 ALTER TABLE `avioip_xiplink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_config`
--

DROP TABLE IF EXISTS `browser_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `url` varchar(4096) NOT NULL,
  `default_on` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_config`
--

LOCK TABLES `browser_config` WRITE;
/*!40000 ALTER TABLE `browser_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `browser_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bt_available_devices`
--

DROP TABLE IF EXISTS `bt_available_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bt_available_devices` (
  `device_num` tinyint(3) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `device_name` varchar(255) NOT NULL,
  PRIMARY KEY (`device_num`,`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bt_available_devices`
--

LOCK TABLES `bt_available_devices` WRITE;
/*!40000 ALTER TABLE `bt_available_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `bt_available_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `can_config`
--

DROP TABLE IF EXISTS `can_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `can_bps` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_config`
--

LOCK TABLES `can_config` WRITE;
/*!40000 ALTER TABLE `can_config` DISABLE KEYS */;
INSERT INTO `can_config` VALUES (1,1000000);
/*!40000 ALTER TABLE `can_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `econnect_config`
--

DROP TABLE IF EXISTS `econnect_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `econnect_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `master` tinyint(3) unsigned NOT NULL,
  `econnect_ip` varchar(255) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  `boot_mode` tinyint(3) unsigned NOT NULL,
  `lru_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `lru_state` tinyint(3) unsigned NOT NULL,
  `ether_port_flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `econnect_config`
--

LOCK TABLES `econnect_config` WRITE;
/*!40000 ALTER TABLE `econnect_config` DISABLE KEYS */;
INSERT INTO `econnect_config` VALUES (1,1,'10.0.9.2','00:0e:8e:64:86:ce',1,1,1,1,0);
/*!40000 ALTER TABLE `econnect_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `econnect_no_econapp`
--

DROP TABLE IF EXISTS `econnect_no_econapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `econnect_no_econapp` (
  `econnect_ip` varchar(255) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  `tsappver` varchar(255) NOT NULL,
  `boot_mode` tinyint(3) unsigned NOT NULL,
  `lru_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `lru_state` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`econnect_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `econnect_no_econapp`
--

LOCK TABLES `econnect_no_econapp` WRITE;
/*!40000 ALTER TABLE `econnect_no_econapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `econnect_no_econapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fms_config`
--

DROP TABLE IF EXISTS `fms_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fms_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fms_type` tinyint(3) unsigned DEFAULT NULL,
  `receiver1_config` tinyint(3) unsigned DEFAULT NULL,
  `receiver2_config` tinyint(3) unsigned DEFAULT NULL,
  `receiver1_data` tinyint(3) unsigned DEFAULT NULL,
  `receiver2_data` tinyint(3) DEFAULT NULL,
  `data_update_rate` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fms_config`
--

LOCK TABLES `fms_config` WRITE;
/*!40000 ALTER TABLE `fms_config` DISABLE KEYS */;
INSERT INTO `fms_config` VALUES (1,0,2,0,3,0,3);
/*!40000 ALTER TABLE `fms_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fms_data`
--

DROP TABLE IF EXISTS `fms_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fms_data` (
  `decode_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gui_code` tinyint(3) unsigned DEFAULT NULL,
  `arinc_label` varchar(8) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `units` varchar(32) DEFAULT NULL,
  `value` varchar(32) NOT NULL,
  PRIMARY KEY (`decode_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fms_data`
--

LOCK TABLES `fms_data` WRITE;
/*!40000 ALTER TABLE `fms_data` DISABLE KEYS */;
INSERT INTO `fms_data` VALUES (1,1,'150','GMT','hh:mm:ss',''),(2,2,'203','Altitude','Feet',''),(3,2,'204','Altitude - Corrected','Feet',''),(4,3,'205','Mach','Mach',''),(27,23,'353','Destination GMT offset','+/-hh:mm:ss',''),(5,4,'210','Airspeed','Knots',''),(6,5,'212','Vertical Speed','Feet/Min',''),(7,6,'310','Latitude','Degrees',''),(8,7,'311','Longitude','Degrees',''),(9,8,'312','Ground Speed','Knots',''),(10,9,'313','Track Angle','Degrees',''),(11,10,'314','True Heading','Degrees',' '),(12,11,'315','Wind Speed','Knots',''),(13,12,'316','Wind Direction','Degrees',''),(14,13,'213','Air temperature','Deg C',''),(15,14,'351','Distance to Destination','Nautical Miles',''),(16,15,'352','Time to Destination','Minutes',''),(17,16,'361','Origin Airport - part 1','Code',''),(18,17,'362','Origin Airport - part 2','Code',''),(20,19,'364','Destination Airport - part 2','Code',''),(19,18,'365','Destination Airport - part 1','Code',''),(21,10,'320','Magnetic Heading','Degrees',''),(26,22,'371','Equiptment Info','Text',''),(25,21,'074','Flight Plan Records','Count',''),(22,20,'260','Date','dd/mm/yy',''),(23,14,'251','Distance to Destination','Nautical Miles',''),(24,15,'252','Time to Destination','Minutes',''),(28,40,'275','Cabin ECS Cntl','boolean',''),(30,42,'272','Actual Cabin Zone Temperature','Kelvin',''),(31,43,'275','Cabin Vent Fan Speed','Count (0 - 7)',''),(32,44,'271','Commanded Cabin Zone Temperature','Kelvin',''),(34,46,'61','Origin and Destination 1','Code',''),(35,47,'62','Origin and Destination 2','Code',''),(36,48,'63','Origin and Destination 3','Code',''),(37,49,'275','Aircraft WOW','boolean',''),(29,41,'275','Cabin Lighting Control','boolean','');
/*!40000 ALTER TABLE `fms_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fms_flight_plan`
--

DROP TABLE IF EXISTS `fms_flight_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fms_flight_plan` (
  `rec_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(3) unsigned DEFAULT NULL,
  `waypoint_num` tinyint(3) unsigned DEFAULT NULL,
  `rec_flags` tinyint(3) unsigned DEFAULT NULL,
  `ident` varchar(32) DEFAULT NULL,
  `latitude` double(13,4) DEFAULT NULL,
  `longitude` double(13,4) DEFAULT NULL,
  PRIMARY KEY (`rec_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fms_flight_plan`
--

LOCK TABLES `fms_flight_plan` WRITE;
/*!40000 ALTER TABLE `fms_flight_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `fms_flight_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ife_remote`
--

DROP TABLE IF EXISTS `ife_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ife_remote` (
  `record_no` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ife_code` tinyint(3) unsigned DEFAULT NULL,
  `rosen_id` tinyint(3) DEFAULT NULL,
  `avds_record` tinyint(3) unsigned DEFAULT NULL,
  `av_code` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`record_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ife_remote`
--

LOCK TABLES `ife_remote` WRITE;
/*!40000 ALTER TABLE `ife_remote` DISABLE KEYS */;
INSERT INTO `ife_remote` VALUES (1,1,'eConnect AVOD',2,-1,3,3),(2,1,'AppleTV',0,-1,1,3),(4,0,'Monitor',0,-1,1,2),(5,1,'Rosen Blu-ray',6,20,2,3),(8,0,'PED Streaming',1,-1,1,3);
/*!40000 ALTER TABLE `ife_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_config`
--

DROP TABLE IF EXISTS `input_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_config` (
  `input_num` tinyint(3) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `input_id` tinyint(3) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `active_mode_id` smallint(5) unsigned NOT NULL,
  `inactive_mode_id` smallint(5) unsigned NOT NULL,
  `send_trigger` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`input_num`,`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_config`
--

LOCK TABLES `input_config` WRITE;
/*!40000 ALTER TABLE `input_config` DISABLE KEYS */;
INSERT INTO `input_config` VALUES (1,1,0,0,0,0,0),(2,1,0,0,0,0,0),(3,1,0,0,0,0,0),(4,1,0,0,0,0,0),(5,1,0,0,0,0,0),(6,1,0,0,0,0,0),(7,1,0,0,0,0,0);
/*!40000 ALTER TABLE `input_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_status`
--

DROP TABLE IF EXISTS `input_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `bitmask` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_status`
--

LOCK TABLES `input_status` WRITE;
/*!40000 ALTER TABLE `input_status` DISABLE KEYS */;
INSERT INTO `input_status` VALUES (1,255),(2,127);
/*!40000 ALTER TABLE `input_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang_lookup`
--

DROP TABLE IF EXISTS `lang_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang_lookup` (
  `Rec_no` tinyint(3) NOT NULL,
  `lang_1_word` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lang_2_word` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Rec_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang_lookup`
--

LOCK TABLES `lang_lookup` WRITE;
/*!40000 ALTER TABLE `lang_lookup` DISABLE KEYS */;
INSERT INTO `lang_lookup` VALUES (1,'UPWASH','Свет, вверх'),(2,'DOWNWASH','Свет, вниз'),(3,'DIM 1','Темнее 1'),(4,'DIM 2','Темнее 2'),(5,'BRIGHT','Светлее'),(6,'OPEN ALL','Открыть все'),(7,'CLOSE ALL','Закрыть все'),(8,'DESELECT ALL','Отменить выбор'),(9,'RIGHT','Правый'),(10,'LEFT','Левый'),(11,'INPUT','Вход'),(12,'OUTPUT','Выход'),(13,'VIDEO OUT','Выход Видео'),(14,'AUDIO OUT','Выход Аудио'),(15,'VIEW AS','Просмотреть'),(16,'LIST','Лист'),(17,'GRID','Сетка'),(18,'ELECTRICAL','Электропитание'),(19,'USB UPDATES','Обновление USB'),(20,'VERSIONS','Версии');
/*!40000 ALTER TABLE `lang_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_config`
--

DROP TABLE IF EXISTS `lighting_io_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_config` (
  `config_id` smallint(5) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `use_broadcast_address` tinyint(3) unsigned NOT NULL,
  `subaddress` int(11) unsigned NOT NULL,
  `gpo` tinyint(4) NOT NULL,
  `gpo_on` tinyint(4) NOT NULL,
  `gpo_duration` int(11) NOT NULL,
  `spst` tinyint(4) NOT NULL,
  `spst_duration` int(11) NOT NULL,
  `spdt` tinyint(4) NOT NULL,
  `spdt_duration` int(11) NOT NULL,
  `pwm` tinyint(4) NOT NULL,
  `pwm_min` int(11) NOT NULL,
  `pwm_max` int(11) NOT NULL,
  `pot` tinyint(4) NOT NULL,
  `pot_min` int(11) NOT NULL,
  `pot_max` int(11) NOT NULL,
  `spn_spst_num` int(11) NOT NULL,
  `spn_led_num` int(11) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_config`
--

LOCK TABLES `lighting_io_config` WRITE;
/*!40000 ALTER TABLE `lighting_io_config` DISABLE KEYS */;
INSERT INTO `lighting_io_config` VALUES (4,1,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,4,-1),(3,1,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,3,-1),(2,1,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,2,-1),(1,1,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,1,-1),(5,2,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(6,3,0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
/*!40000 ALTER TABLE `lighting_io_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_defaults`
--

DROP TABLE IF EXISTS `lighting_io_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_defaults` (
  `default_id` smallint(5) unsigned NOT NULL,
  `set_id` smallint(5) unsigned NOT NULL,
  `onoff` smallint(5) NOT NULL,
  `slider1_val` int(11) NOT NULL,
  `slider2_val` int(11) NOT NULL,
  `slider3_val` int(11) NOT NULL,
  `slider4_val` int(11) NOT NULL,
  `slider5_val` int(11) NOT NULL,
  PRIMARY KEY (`default_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_defaults`
--

LOCK TABLES `lighting_io_defaults` WRITE;
/*!40000 ALTER TABLE `lighting_io_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `lighting_io_defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_installed`
--

DROP TABLE IF EXISTS `lighting_io_installed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_installed` (
  `lru_id` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `part_id` tinyint(3) unsigned NOT NULL,
  `model` varchar(255) NOT NULL,
  `if_bus` tinyint(3) unsigned NOT NULL,
  `bus_address` tinyint(3) unsigned NOT NULL,
  `io_timer` tinyint(4) NOT NULL,
  `report_status` tinyint(1) NOT NULL,
  `param_group` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_installed`
--

LOCK TABLES `lighting_io_installed` WRITE;
/*!40000 ALTER TABLE `lighting_io_installed` DISABLE KEYS */;
INSERT INTO `lighting_io_installed` VALUES (2,1,253,'ESP',6,80,-1,0,0),(1,1,254,'SPN',4,64,-1,0,0),(3,1,252,'LSP',6,64,-1,0,0);
/*!40000 ALTER TABLE `lighting_io_installed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_modes`
--

DROP TABLE IF EXISTS `lighting_io_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_modes` (
  `rec_no` int(10) unsigned NOT NULL,
  `mode_id` smallint(5) unsigned NOT NULL,
  `gui_group` tinyint(3) unsigned NOT NULL,
  `mode_name` varchar(255) NOT NULL,
  `set_id` smallint(5) unsigned NOT NULL,
  `onoff` smallint(5) NOT NULL,
  `slider1_val` int(11) NOT NULL,
  `slider2_val` int(11) NOT NULL,
  `slider3_val` int(11) NOT NULL,
  `slider4_val` int(11) NOT NULL,
  `slider5_val` int(11) NOT NULL,
  PRIMARY KEY (`rec_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_modes`
--

LOCK TABLES `lighting_io_modes` WRITE;
/*!40000 ALTER TABLE `lighting_io_modes` DISABLE KEYS */;
INSERT INTO `lighting_io_modes` VALUES (1,1,0,'on',1,1,0,0,0,0,0),(2,1,0,'on',3,1,0,0,0,0,0),(3,1,0,'on',5,1,0,0,0,0,0),(4,1,0,'on',7,1,0,0,0,0,0),(5,2,0,'off',1,0,0,0,0,0,0),(6,2,0,'off',3,0,0,0,0,0,0),(7,2,0,'off',5,0,0,0,0,0,0),(8,2,0,'off',7,0,0,0,0,0,0);
/*!40000 ALTER TABLE `lighting_io_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_param_groups`
--

DROP TABLE IF EXISTS `lighting_io_param_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_param_groups` (
  `key` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `param_group` tinyint(3) unsigned NOT NULL,
  `set_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_param_groups`
--

LOCK TABLES `lighting_io_param_groups` WRITE;
/*!40000 ALTER TABLE `lighting_io_param_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `lighting_io_param_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lighting_io_settings`
--

DROP TABLE IF EXISTS `lighting_io_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lighting_io_settings` (
  `set_id` smallint(5) unsigned NOT NULL,
  `config_id` smallint(5) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `gui_group` tinyint(3) unsigned NOT NULL,
  `slider_count` tinyint(3) unsigned NOT NULL,
  `control_label` varchar(255) NOT NULL,
  `icd_cmd` tinyint(3) unsigned NOT NULL,
  `onoff` smallint(5) NOT NULL,
  `display_onoff` tinyint(4) NOT NULL,
  `slider1_label` varchar(255) NOT NULL,
  `slider1_min` int(10) unsigned NOT NULL,
  `slider1_max` int(10) unsigned NOT NULL,
  `slider1_val` int(10) unsigned NOT NULL,
  `display_slider1` tinyint(4) NOT NULL,
  `slider2_label` varchar(255) NOT NULL,
  `slider2_min` int(11) NOT NULL,
  `slider2_max` int(11) NOT NULL,
  `slider2_val` int(11) NOT NULL,
  `display_slider2` tinyint(4) NOT NULL,
  `slider3_label` varchar(255) NOT NULL,
  `slider3_min` int(11) NOT NULL,
  `slider3_max` int(11) NOT NULL,
  `slider3_val` int(11) NOT NULL,
  `display_slider3` tinyint(4) NOT NULL,
  `slider4_label` varchar(255) NOT NULL,
  `slider4_min` int(11) NOT NULL,
  `slider4_max` int(11) NOT NULL,
  `slider4_val` int(11) NOT NULL,
  `display_slider4` tinyint(4) NOT NULL,
  `slider5_label` varchar(255) NOT NULL,
  `slider5_min` int(11) NOT NULL,
  `slider5_max` int(11) NOT NULL,
  `slider5_val` int(11) NOT NULL,
  `display_slider5` tinyint(4) NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lighting_io_settings`
--

LOCK TABLES `lighting_io_settings` WRITE;
/*!40000 ALTER TABLE `lighting_io_settings` DISABLE KEYS */;
INSERT INTO `lighting_io_settings` VALUES (5,5,4,7,4,'ENV',64,0,0,'TEMP DOWN',0,1,1,0,'Temp UP',0,1,0,0,'Fan Down',0,1,0,0,'Fan UP',0,1,0,0,'',-1,-1,-1,-1),(4,4,2,6,0,'SHADE4',0,0,1,'',0,0,0,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1),(3,3,2,6,0,'SHADE3',0,0,1,'',0,0,0,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1),(2,2,2,6,0,'SHADE2',0,0,1,'',0,0,0,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1),(1,1,2,6,0,'SHADE1',0,0,1,'',0,0,0,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1,'-1',-1,-1,-1,-1),(6,6,4,1,4,'Cabin Lights',5,0,0,'ENTRY',0,1,1,0,'Cabin',0,1,0,0,'Accent',0,1,0,0,'Night',0,1,0,0,'-1',-1,-1,-1,-1);
/*!40000 ALTER TABLE `lighting_io_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `profile_id` tinyint(3) unsigned NOT NULL,
  `link_id` tinyint(3) unsigned NOT NULL,
  `name` char(128) DEFAULT NULL,
  `type` char(32) NOT NULL,
  `sub_type` char(32) DEFAULT NULL,
  `login` char(16) DEFAULT NULL,
  `password` char(16) DEFAULT NULL,
  `apn` char(128) DEFAULT NULL,
  `pppoe_login` char(16) DEFAULT NULL,
  `pppoe_password` char(16) DEFAULT NULL,
  `transceiver_constraint` char(8) DEFAULT NULL,
  `interface` char(32) NOT NULL,
  `control_ip` text NOT NULL,
  `control_port` char(5) NOT NULL,
  `auto` tinyint(1) DEFAULT NULL,
  `idle_time` int(11) NOT NULL,
  PRIMARY KEY (`profile_id`,`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_audio`
--

DROP TABLE IF EXISTS `local_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_audio` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_audio`
--

LOCK TABLES `local_audio` WRITE;
/*!40000 ALTER TABLE `local_audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `local_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_video`
--

DROP TABLE IF EXISTS `local_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local_video` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_video`
--

LOCK TABLES `local_video` WRITE;
/*!40000 ALTER TABLE `local_video` DISABLE KEYS */;
INSERT INTO `local_video` VALUES (65537,1,'test_720','/mnt/user/local/test_720.mov',1,1),(65538,1,'test','/mnt/user/local/test.mov',1,1),(65539,1,'test_1080','/mnt/user/local/test_1080.mov',1,1),(65540,1,'test_720','/mnt/user/local/test_720.avi',1,0),(65541,1,'test_1080','/mnt/user/local/test_1080.avi',1,0);
/*!40000 ALTER TABLE `local_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_playlist`
--

DROP TABLE IF EXISTS `media_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_playlist` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_playlist`
--

LOCK TABLES `media_playlist` WRITE;
/*!40000 ALTER TABLE `media_playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_status`
--

DROP TABLE IF EXISTS `media_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `usb_audio_file_cnt` int(10) unsigned NOT NULL,
  `usb_video_file_cnt` int(10) unsigned NOT NULL,
  `local_audio_file_cnt` int(10) unsigned NOT NULL,
  `local_video_file_cnt` int(10) unsigned NOT NULL,
  `user_audio_file_cnt` int(10) unsigned NOT NULL,
  `user_video_file_cnt` int(10) unsigned NOT NULL,
  `current_list` tinyint(3) unsigned NOT NULL,
  `current_fn_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_status`
--

LOCK TABLES `media_status` WRITE;
/*!40000 ALTER TABLE `media_status` DISABLE KEYS */;
INSERT INTO `media_status` VALUES (1,0,0,0,5,12,6,0,0),(2,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `media_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `net_displays`
--

DROP TABLE IF EXISTS `net_displays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `net_displays` (
  `display_ip` varchar(255) NOT NULL,
  `seat_num` tinyint(4) NOT NULL,
  `display_brightness` tinyint(4) unsigned NOT NULL,
  `display_contrast` tinyint(4) unsigned NOT NULL,
  `partnum_version` varchar(255) NOT NULL DEFAULT '',
  `display_temperature` tinyint(4) NOT NULL,
  `mac_address` varchar(255) NOT NULL,
  PRIMARY KEY (`display_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_displays`
--

LOCK TABLES `net_displays` WRITE;
/*!40000 ALTER TABLE `net_displays` DISABLE KEYS */;
INSERT INTO `net_displays` VALUES ('10.0.9.101',2,83,60,'DSK_201212 0.2.4',47,''),('10.0.9.104',5,83,60,'DSK_201212 0.2.4',45,''),('10.0.9.103',4,83,60,'DSK_201212 0.2.4',48,''),('10.0.9.102',3,83,60,'DSK_201212 0.2.4',47,''),('10.0.9.100',1,83,60,'DSK_201212 0.2.4',48,'');
/*!40000 ALTER TABLE `net_displays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `net_upgrades`
--

DROP TABLE IF EXISTS `net_upgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `net_upgrades` (
  `report_id` smallint(5) unsigned NOT NULL,
  `network_ip` varchar(255) NOT NULL,
  `result_code` tinyint(4) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `net_upgrades`
--

LOCK TABLES `net_upgrades` WRITE;
/*!40000 ALTER TABLE `net_upgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `net_upgrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcc_config`
--

DROP TABLE IF EXISTS `pcc_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcc_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver1_config` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver2_config` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `transmit1_config` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `transmit2_config` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcc_config`
--

LOCK TABLES `pcc_config` WRITE;
/*!40000 ALTER TABLE `pcc_config` DISABLE KEYS */;
INSERT INTO `pcc_config` VALUES (1,0,0,0,0);
/*!40000 ALTER TABLE `pcc_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcc_status`
--

DROP TABLE IF EXISTS `pcc_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcc_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `system_set_temp` double(11,1) NOT NULL DEFAULT '20.0',
  `requested_set_temp` double(11,1) NOT NULL DEFAULT '20.0',
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcc_status`
--

LOCK TABLES `pcc_status` WRITE;
/*!40000 ALTER TABLE `pcc_status` DISABLE KEYS */;
INSERT INTO `pcc_status` VALUES (1,20.0,20.0);
/*!40000 ALTER TABLE `pcc_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rosen_blueray_status`
--

DROP TABLE IF EXISTS `rosen_blueray_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosen_blueray_status` (
  `lru_id` tinyint(3) unsigned NOT NULL,
  `status_byte` tinyint(3) unsigned NOT NULL,
  `current_title` varchar(255) NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rosen_blueray_status`
--

LOCK TABLES `rosen_blueray_status` WRITE;
/*!40000 ALTER TABLE `rosen_blueray_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `rosen_blueray_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rosen_installed`
--

DROP TABLE IF EXISTS `rosen_installed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rosen_installed` (
  `lru_id` tinyint(3) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `part_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `if_bus` tinyint(3) unsigned NOT NULL,
  `bus_address` tinyint(3) unsigned NOT NULL,
  `input_source` tinyint(3) unsigned NOT NULL,
  `default_on` tinyint(3) NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rosen_installed`
--

LOCK TABLES `rosen_installed` WRITE;
/*!40000 ALTER TABLE `rosen_installed` DISABLE KEYS */;
/*!40000 ALTER TABLE `rosen_installed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rs485_config`
--

DROP TABLE IF EXISTS `rs485_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rs485_config` (
  `rec_no` int(10) unsigned NOT NULL,
  `bus_num` tinyint(3) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `term` tinyint(3) unsigned NOT NULL,
  `rs485_baud` int(10) unsigned NOT NULL,
  `rs485_parity` tinyint(3) unsigned NOT NULL,
  `rs485_databits` tinyint(3) unsigned NOT NULL,
  `rs485_stopbits` tinyint(3) unsigned NOT NULL,
  `com_status` tinyint(3) unsigned NOT NULL,
  `com_direction` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rec_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rs485_config`
--

LOCK TABLES `rs485_config` WRITE;
/*!40000 ALTER TABLE `rs485_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `rs485_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scene_scripts`
--

DROP TABLE IF EXISTS `scene_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scene_scripts` (
  `script_cnt` int(11) unsigned NOT NULL DEFAULT '0',
  `ecms_id` tinyint(3) unsigned DEFAULT NULL,
  `script_id` smallint(5) unsigned DEFAULT NULL,
  `fq_filename` varchar(4096) DEFAULT NULL,
  `script_comment` varchar(256) DEFAULT NULL,
  `script_running` tinyint(3) unsigned DEFAULT NULL,
  `script_type` tinyint(3) unsigned DEFAULT NULL,
  `script_startup` tinyint(3) unsigned DEFAULT NULL,
  `script_exclusive` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`script_cnt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scene_scripts`
--

LOCK TABLES `scene_scripts` WRITE;
/*!40000 ALTER TABLE `scene_scripts` DISABLE KEYS */;
INSERT INTO `scene_scripts` VALUES (65537,1,23,'/opt/scenes/c2ver.sh','',0,0,1,0),(65538,1,31,'/opt/scenes/ss_recover.sh','',1,0,1,0),(65539,1,20,'/opt/scenes/mmap_update.sh','',1,0,1,0),(65540,1,22,'/opt/scenes/usb_fix.sh','',0,0,1,0),(65541,1,30,'/opt/scenes/watchnd.sh','',1,0,1,0);
/*!40000 ALTER TABLE `scene_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_status`
--

DROP TABLE IF EXISTS `sensor_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `temp_ad7414` double NOT NULL,
  `temp_fault_min_ad7414` double NOT NULL,
  `temp_fault_max_ad7414` double NOT NULL,
  `temp_lm80` double NOT NULL,
  `temp_fault_min_lm80` double NOT NULL,
  `temp_fault_max_lm80` double NOT NULL,
  `temp_lm75` double NOT NULL,
  `temp_fault_min_lm75` double NOT NULL,
  `temp_fault_max_lm75` double NOT NULL,
  `temp_core0` double NOT NULL,
  `temp_fault_min_core0` double NOT NULL,
  `temp_fault_max_core0` double NOT NULL,
  `temp_core1` double NOT NULL,
  `temp_fault_min_core1` double NOT NULL,
  `temp_fault_max_core1` double NOT NULL,
  `v0` double NOT NULL,
  `v0_fault_min` double NOT NULL,
  `v0_fault_max` double NOT NULL,
  `v1` double NOT NULL,
  `v1_fault_min` double NOT NULL,
  `v1_fault_max` double NOT NULL,
  `v2` double NOT NULL,
  `v2_fault_min` double NOT NULL,
  `v2_fault_max` double NOT NULL,
  `v3` double NOT NULL,
  `v3_fault_min` double NOT NULL,
  `v3_fault_max` double NOT NULL,
  `v4` double NOT NULL,
  `v4_fault_min` double NOT NULL,
  `v4_fault_max` double NOT NULL,
  `v5` double NOT NULL,
  `v5_fault_min` double NOT NULL,
  `v5_fault_max` double NOT NULL,
  `v6` double NOT NULL,
  `v6_fault_min` double NOT NULL,
  `v6_fault_max` double NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_status`
--

LOCK TABLES `sensor_status` WRITE;
/*!40000 ALTER TABLE `sensor_status` DISABLE KEYS */;
INSERT INTO `sensor_status` VALUES (1,47.75,-20,85,45.375,-20,85,0,-20,85,45,-20,105,45,-20,105,1.2,1.1645,1.2248,1.83,1.7468,1.8372,2.52672,2.3649,2.6027,3.347043,3.1861,3.4646,4.956294,4.7651,5.2127,12.896371,12.2695,13.7749,27.434,19.2151,32.6656);
/*!40000 ALTER TABLE `sensor_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_mounts`
--

DROP TABLE IF EXISTS `slave_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_mounts` (
  `slave_cnt` tinyint(3) unsigned NOT NULL,
  `slave_ip_host` varchar(255) NOT NULL,
  `slave_media_location` varchar(4096) NOT NULL,
  `ecms_local_mount` varchar(4096) NOT NULL,
  PRIMARY KEY (`slave_cnt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_mounts`
--

LOCK TABLES `slave_mounts` WRITE;
/*!40000 ALTER TABLE `slave_mounts` DISABLE KEYS */;
INSERT INTO `slave_mounts` VALUES (1,'10.0.9.100','/mnt/user/local','/mnt/user/slaves/10.0.9.100_local');
/*!40000 ALTER TABLE `slave_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn03_config`
--

DROP TABLE IF EXISTS `spn03_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn03_config` (
  `rec_num` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `value_id` smallint(5) unsigned NOT NULL,
  `lru_name` varchar(255) NOT NULL,
  `control_mask` tinyint(3) unsigned NOT NULL,
  `group_mask` int(10) unsigned NOT NULL,
  `align_delay` tinyint(3) unsigned NOT NULL,
  `lower_bound` smallint(5) unsigned NOT NULL,
  `upper_bound` smallint(5) unsigned NOT NULL,
  `value_min` int(11) NOT NULL,
  `value_max` int(11) NOT NULL,
  `power_on_delay` smallint(5) unsigned NOT NULL,
  `comloss_timeout` smallint(5) unsigned NOT NULL,
  `comloss_frame` tinyint(3) unsigned NOT NULL,
  `active_type` tinyint(3) unsigned NOT NULL,
  `debounce_period` smallint(5) unsigned NOT NULL,
  `bit_length` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rec_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn03_config`
--

LOCK TABLES `spn03_config` WRITE;
/*!40000 ALTER TABLE `spn03_config` DISABLE KEYS */;
INSERT INTO `spn03_config` VALUES (1,1,4,100,'GPI0',1,1,1,0,1,0,1,1,1,1,0,100,8),(2,1,5,100,'GPI0',1,1,1,0,1,0,1,1,1,1,0,100,16);
/*!40000 ALTER TABLE `spn03_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn03_econapp_actions`
--

DROP TABLE IF EXISTS `spn03_econapp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn03_econapp_actions` (
  `rec_num` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `gpi_mask` int(10) unsigned NOT NULL,
  `compare_id` int(10) unsigned NOT NULL,
  `cur_value` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`rec_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn03_econapp_actions`
--

LOCK TABLES `spn03_econapp_actions` WRITE;
/*!40000 ALTER TABLE `spn03_econapp_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn03_econapp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn03_status`
--

DROP TABLE IF EXISTS `spn03_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn03_status` (
  `lru_id` smallint(5) unsigned NOT NULL,
  `value_id` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `report_state` int(11) NOT NULL,
  `value_gui` int(11) NOT NULL,
  `valid` tinyint(3) unsigned NOT NULL,
  `value_name` varchar(255) NOT NULL,
  PRIMARY KEY (`lru_id`,`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn03_status`
--

LOCK TABLES `spn03_status` WRITE;
/*!40000 ALTER TABLE `spn03_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn03_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn03_versions`
--

DROP TABLE IF EXISTS `spn03_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn03_versions` (
  `lru_id` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `firm_yy` tinyint(3) unsigned NOT NULL,
  `firm_mm` tinyint(3) unsigned NOT NULL,
  `firm_dd` tinyint(3) unsigned NOT NULL,
  `bl_yy` tinyint(3) unsigned NOT NULL,
  `bl_mm` tinyint(3) unsigned NOT NULL,
  `bl_dd` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn03_versions`
--

LOCK TABLES `spn03_versions` WRITE;
/*!40000 ALTER TABLE `spn03_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn03_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn_input_config`
--

DROP TABLE IF EXISTS `spn_input_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn_input_config` (
  `rec_no` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `input_num` tinyint(3) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `input_id` tinyint(3) unsigned NOT NULL,
  `active` tinyint(3) unsigned NOT NULL,
  `active_mode_id` smallint(5) unsigned NOT NULL,
  `inactive_mode_id` smallint(5) unsigned NOT NULL,
  `send_trigger` tinyint(3) unsigned NOT NULL,
  `debounce_period` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rec_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn_input_config`
--

LOCK TABLES `spn_input_config` WRITE;
/*!40000 ALTER TABLE `spn_input_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn_input_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn_input_status`
--

DROP TABLE IF EXISTS `spn_input_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn_input_status` (
  `lru_id` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `status_request` tinyint(3) unsigned NOT NULL,
  `input_bitmask` tinyint(3) unsigned NOT NULL,
  `output_bitmask` tinyint(3) unsigned NOT NULL,
  `led_bitmask` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn_input_status`
--

LOCK TABLES `spn_input_status` WRITE;
/*!40000 ALTER TABLE `spn_input_status` DISABLE KEYS */;
INSERT INTO `spn_input_status` VALUES (1,1,0,128,128,128);
/*!40000 ALTER TABLE `spn_input_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn_led_config`
--

DROP TABLE IF EXISTS `spn_led_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn_led_config` (
  `rec_no` smallint(5) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `led_num` tinyint(3) unsigned NOT NULL,
  `led_default_state` tinyint(3) unsigned NOT NULL,
  `led_mode_id` tinyint(3) unsigned NOT NULL,
  `led_io_active` tinyint(3) unsigned NOT NULL,
  `led_io_tracking` tinyint(3) unsigned NOT NULL,
  `led_on_off_delay` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`rec_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn_led_config`
--

LOCK TABLES `spn_led_config` WRITE;
/*!40000 ALTER TABLE `spn_led_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn_led_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn_output_config`
--

DROP TABLE IF EXISTS `spn_output_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn_output_config` (
  `rec_no` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `lru_id` smallint(5) unsigned NOT NULL,
  `output_num` tinyint(3) unsigned NOT NULL,
  `default_state` tinyint(3) unsigned NOT NULL,
  `active_duration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rec_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn_output_config`
--

LOCK TABLES `spn_output_config` WRITE;
/*!40000 ALTER TABLE `spn_output_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `spn_output_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spn_versions`
--

DROP TABLE IF EXISTS `spn_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spn_versions` (
  `lru_id` smallint(6) unsigned NOT NULL,
  `major` tinyint(4) unsigned NOT NULL,
  `minor` tinyint(4) NOT NULL,
  `day` tinyint(4) NOT NULL,
  `month` tinyint(4) NOT NULL,
  `year` tinyint(4) NOT NULL,
  PRIMARY KEY (`lru_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spn_versions`
--

LOCK TABLES `spn_versions` WRITE;
/*!40000 ALTER TABLE `spn_versions` DISABLE KEYS */;
INSERT INTO `spn_versions` VALUES (1,0,0,0,0,0);
/*!40000 ALTER TABLE `spn_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_actions`
--

DROP TABLE IF EXISTS `system_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_actions` (
  `rec_num` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `icd_code` tinyint(3) unsigned NOT NULL,
  `icd_ecmsid` tinyint(3) unsigned NOT NULL,
  `icd_args` varchar(255) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  PRIMARY KEY (`rec_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_actions`
--

LOCK TABLES `system_actions` WRITE;
/*!40000 ALTER TABLE `system_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_av_status`
--

DROP TABLE IF EXISTS `system_av_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_av_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `av_status` tinyint(3) unsigned NOT NULL,
  `volume` tinyint(3) unsigned NOT NULL,
  `mute` tinyint(3) unsigned NOT NULL,
  `bass` tinyint(4) NOT NULL,
  `treble` tinyint(4) NOT NULL,
  `seek_skip_sec` smallint(5) unsigned NOT NULL,
  `seek_skip_wait_msec` smallint(5) NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_av_status`
--

LOCK TABLES `system_av_status` WRITE;
/*!40000 ALTER TABLE `system_av_status` DISABLE KEYS */;
INSERT INTO `system_av_status` VALUES (1,0,50,0,0,0,1,100),(2,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `system_av_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_compare`
--

DROP TABLE IF EXISTS `system_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_compare` (
  `rec_num` int(10) unsigned NOT NULL,
  `compare_id` int(10) unsigned NOT NULL,
  `match_value` int(11) NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`rec_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_compare`
--

LOCK TABLES `system_compare` WRITE;
/*!40000 ALTER TABLE `system_compare` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `satcom1` tinyint(3) unsigned NOT NULL,
  `bluetooth` tinyint(3) unsigned NOT NULL,
  `bt_persist` tinyint(3) NOT NULL,
  `hd_sdi` tinyint(3) unsigned NOT NULL,
  `spdif` tinyint(3) unsigned NOT NULL,
  `analog_audio` tinyint(3) unsigned NOT NULL,
  `xm_radio` tinyint(3) unsigned NOT NULL,
  `xm_persist` tinyint(3) NOT NULL,
  `fms` tinyint(3) unsigned NOT NULL,
  `eav` tinyint(3) unsigned NOT NULL,
  `rosen_devices` tinyint(3) unsigned NOT NULL,
  `light_controller` tinyint(3) unsigned NOT NULL,
  `esp_controller` tinyint(3) unsigned NOT NULL,
  `spn_controller` tinyint(3) unsigned NOT NULL,
  `spn03_controller` tinyint(3) unsigned NOT NULL,
  `display_devices` tinyint(3) unsigned NOT NULL,
  `alto_amp` tinyint(3) unsigned NOT NULL,
  `seat_audio` tinyint(3) unsigned NOT NULL,
  `air_cell` tinyint(3) unsigned NOT NULL,
  `pcc` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (1,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0),(2,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_paths`
--

DROP TABLE IF EXISTS `system_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_paths` (
  `path_name` varchar(255) NOT NULL,
  `path` varchar(4096) NOT NULL,
  PRIMARY KEY (`path_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_paths`
--

LOCK TABLES `system_paths` WRITE;
/*!40000 ALTER TABLE `system_paths` DISABLE KEYS */;
INSERT INTO `system_paths` VALUES ('WEB_ROOT','/var/www/localhosts/htdocs'),('USB_MOUNT_POINT','/media/ttt'),('AUDIO_LOCAL','/mnt/user/local'),('VIDEO_LOCAL','/mnt/user/local'),('USER_UPLOAD','/mnt/user/upload'),('MPLAYER_UTILS','/opt/eConnect/scripts/mplay'),('USB_UTILS','/opt/eConnect/scripts/usb'),('BT_UTILS','/opt/eConnect/scripts/bt'),('SYS_UTILS','/opt/eConnect/scripts/db'),('RW_TMP','/mnt/user/tmp'),('UPDATE_UTILS','/opt/eConnect/scripts/misc'),('BROWSER_UTILS','/opt/eConnect/scripts/browser'),('SCENE_SCRIPTS','/opt/scenes');
/*!40000 ALTER TABLE `system_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_status_flags`
--

DROP TABLE IF EXISTS `system_status_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_status_flags` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `bt_connected` tinyint(3) unsigned NOT NULL,
  `bt_discovery` tinyint(3) unsigned NOT NULL,
  `wifi_disabled` tinyint(3) unsigned NOT NULL,
  `bt_disabled` tinyint(3) unsigned NOT NULL,
  `headset_inserted` tinyint(3) unsigned NOT NULL,
  `ecms_powerdown` tinyint(3) unsigned NOT NULL,
  `system_update` tinyint(3) unsigned NOT NULL,
  `system_reset` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_status_flags`
--

LOCK TABLES `system_status_flags` WRITE;
/*!40000 ALTER TABLE `system_status_flags` DISABLE KEYS */;
INSERT INTO `system_status_flags` VALUES (1,0,0,0,1,0,0,0,0),(2,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `system_status_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_upgrades`
--

DROP TABLE IF EXISTS `system_upgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_upgrades` (
  `upgrade_cnt` tinyint(3) unsigned NOT NULL,
  `upgrade_prefix` varchar(50) NOT NULL,
  `upgrade_extension` varchar(10) NOT NULL,
  `upgrade_path` varchar(4096) NOT NULL,
  `upgrade_filesystem` varchar(20) NOT NULL,
  `platform` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`upgrade_cnt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_upgrades`
--

LOCK TABLES `system_upgrades` WRITE;
/*!40000 ALTER TABLE `system_upgrades` DISABLE KEYS */;
INSERT INTO `system_upgrades` VALUES (1,'update_ECONAPP_','.tgz','/opt/eConnect','ssd-optfs',1),(2,'update_DB_','.sql','database','',3),(3,'update_QUALTEST_','.tgz','/opt/board_tests','ssd-optfs',1),(4,'update_C2_','.tgz','/opt/c2','ssd-optfs',1),(5,'update_AVIOIP_','.tgz','/opt/avioip','ssd-optfs',1),(6,'update_FPGA_','.bin','fpga','',1),(7,'update_IOBOARD_','.bin','ioboard','',3),(8,'update_ECONNECT_','.sh','/mnt/user/local','',3),(9,'update_LIST_','.lst','/opt','ssd-optfs',3),(10,'update_SCENES_','.tgz','/opt/scenes','ssd-optfs',3),(11,'update_TILESTREAM_','.tgz','/opt/tilestream','ssd-optfs',1),(12,'update_SPN_','.bin','spn','',3),(13,'update_MMAP_','.tgz','/mnt/mmap','ssd-mmap',1),(14,'update_TSAPP_','.tgz','/opt/tsApp','ssd-optfs',2),(15,'update_TSIMAGES_','.tgz','/opt/Images','ssd-optfs',2),(16,'update_TSTESTAPPS_','.tgz','/opt/testapps','ssd-optfs',2),(17,'update_TSECONAPP_','.tgz','/opt/eConnect','ssd-optfs',2),(18,'update_TSC2_','.tgz','/opt/c2','ssd-optfs',2),(19,'update_CWRTSAPP','.tgz','/opt/tsApp','ssd-optfs',1),(20,'update_SPN03_','.bin','spn03','',3);
/*!40000 ALTER TABLE `system_upgrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_versions`
--

DROP TABLE IF EXISTS `system_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_versions` (
  `ecms_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `db_ver_sch_major` tinyint(3) unsigned NOT NULL,
  `db_ver_sch_minor` tinyint(3) unsigned NOT NULL,
  `db_ver_values` int(10) unsigned NOT NULL,
  `db_ver_customer` int(10) unsigned NOT NULL,
  `ecms_major` tinyint(3) unsigned NOT NULL,
  `ecms_minor` tinyint(3) unsigned NOT NULL,
  `web_app_major` tinyint(3) unsigned NOT NULL,
  `web_app_minor` tinyint(3) unsigned NOT NULL,
  `web_customer_major` int(10) unsigned NOT NULL,
  `web_customer_minor` int(10) unsigned NOT NULL,
  `fpga_ver` varchar(32) NOT NULL,
  `io_board_major` int(10) unsigned NOT NULL,
  `io_board_minor` int(10) unsigned NOT NULL,
  `os_rootfs_ver` varchar(32) NOT NULL,
  `os_bootfs_ver` varchar(32) NOT NULL,
  `avioip_major` tinyint(3) unsigned NOT NULL,
  `avioip_minor` tinyint(3) unsigned NOT NULL,
  `avioip_build` int(10) unsigned NOT NULL,
  `qual_test_major` tinyint(3) unsigned NOT NULL,
  `qual_test_minor` tinyint(3) unsigned NOT NULL,
  `tsapp_ver` varchar(32) NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_versions`
--

LOCK TABLES `system_versions` WRITE;
/*!40000 ALTER TABLE `system_versions` DISABLE KEYS */;
INSERT INTO `system_versions` VALUES (1,3,0,0,20160826,1,0,0,0,20160527,0,'2016/3/28.1',0,0,'201603211333','201603031426',6,0,0,3,0,'1.0.0'),(2,3,0,0,20160826,0,58,2,0,20160527,0,' ',0,0,'201502271212','201501271338',0,0,0,2,7,'0.2.6');
/*!40000 ALTER TABLE `system_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperatures`
--

DROP TABLE IF EXISTS `temperatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temperatures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(5) NOT NULL,
  `red` tinyint(3) unsigned NOT NULL,
  `green` tinyint(3) unsigned NOT NULL,
  `blue` tinyint(3) unsigned NOT NULL,
  `amber` tinyint(3) unsigned NOT NULL,
  `daylight` int(3) NOT NULL,
  `x` decimal(15,10) NOT NULL,
  `y` decimal(15,10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperatures`
--

LOCK TABLES `temperatures` WRITE;
/*!40000 ALTER TABLE `temperatures` DISABLE KEYS */;
INSERT INTO `temperatures` VALUES (1,'2000K',249,180,29,255,3500,0.5300443000,0.2060316000),(2,'2050K',243,178,29,255,3517,0.5247015420,0.2271436220),(3,'2100K',237,176,29,255,3534,0.5194650060,0.2457293910),(4,'2150K',232,175,30,255,3552,0.5143261390,0.2621052890),(5,'2200K',227,174,31,255,3569,0.5092795930,0.2765433200),(6,'2250K',223,174,32,255,3586,0.5043222200,0.2892780700),(7,'2300K',219,175,34,255,3603,0.4994523400,0.3005124670),(8,'2350K',215,176,35,255,3621,0.4946692220,0.3104225500),(9,'2400K',212,177,37,255,3638,0.4899727130,0.3191614500),(10,'2450K',209,178,39,255,3655,0.4853629680,0.3268627170),(11,'2500K',207,180,41,255,3672,0.4808402780,0.3336431110),(12,'2550K',204,182,43,255,3690,0.4764049370,0.3396049520),(13,'2600K',202,185,45,255,3707,0.4720571660,0.3448381100),(14,'2650K',200,187,48,255,3724,0.4677970600,0.3494216860),(15,'2700K',198,190,50,255,3741,0.4636245570,0.3534254500),(16,'2750K',196,193,53,255,3759,0.4595394290,0.3569110590),(17,'2800K',195,196,55,255,3776,0.4555412760,0.3599331010),(18,'2850K',193,199,58,254,3793,0.4516295310,0.3625399960),(19,'2900K',192,202,61,254,3810,0.4478034720,0.3647747650),(20,'2950K',191,205,64,254,3828,0.4440622280,0.3666756910),(21,'3000K',189,208,67,255,3845,0.4404048000,0.3682769000),(22,'3050K',188,211,70,255,3862,0.4368300710,0.3696088530),(23,'3100K',187,214,73,255,3879,0.4333368230,0.3706987810),(24,'3150K',186,217,76,255,3897,0.4299237490,0.3715710580),(25,'3200K',185,220,79,255,3914,0.4265894700,0.3722475340),(26,'3250K',184,223,82,255,3931,0.4233325430,0.3727478150),(27,'3300K',183,226,85,255,3948,0.4201514780,0.3730895180),(28,'3350K',182,228,88,255,3966,0.4170447440,0.3732884900),(29,'3400K',181,231,91,255,3983,0.4140107820,0.3733589990),(30,'3450K',180,233,94,255,4000,0.4110480130,0.3733139070),(31,'3500K',179,236,97,255,4017,0.4081548430,0.3731648200),(32,'3550K',177,238,100,255,4034,0.4053296750,0.3729222160),(33,'3600K',176,240,103,255,4052,0.4025709120,0.3725955700),(34,'3650K',175,242,106,255,4069,0.3998769620,0.3721934500),(35,'3700K',174,244,109,255,4086,0.3972462440,0.3717236140),(36,'3750K',173,245,112,255,4103,0.3946771900,0.3711930890),(37,'3800K',172,247,115,255,4121,0.3921682520,0.3706082470),(38,'3850K',170,248,118,255,4138,0.3897179030,0.3699748670),(39,'3900K',169,249,121,255,4155,0.3873246360,0.3692981960),(40,'3950K',168,250,123,254,4172,0.3849869730,0.3685829980),(41,'4000K',166,251,126,254,4190,0.3827034630,0.3678336000),(42,'4050K',165,252,129,253,4207,0.3804726790,0.3670539380),(43,'4100K',164,253,131,252,4224,0.3782932300,0.3662475890),(44,'4150K',162,254,134,251,4241,0.3761637490,0.3654178070),(45,'4200K',161,254,136,250,4259,0.3740829060,0.3645675540),(46,'4250K',159,255,139,249,4276,0.3720493960,0.3636995240),(47,'4300K',158,255,141,248,4293,0.3700619520,0.3628161710),(48,'4350K',157,255,143,247,4310,0.3681193320,0.3619197270),(49,'4400K',155,255,145,246,4328,0.3662203320,0.3610122250),(50,'4450K',154,255,148,245,4345,0.3643637750,0.3600955160),(51,'4500K',152,255,150,244,4362,0.3625485160,0.3591712850),(52,'4550K',151,255,152,243,4379,0.3607734420,0.3582410660),(53,'4600K',149,255,154,242,4397,0.3590374710,0.3573062540),(54,'4650K',148,255,156,241,4414,0.3573395470,0.3563681200),(55,'4700K',146,255,158,239,4431,0.3556786490,0.3554278170),(56,'4750K',145,255,159,238,4448,0.3540537800,0.3544863950),(57,'4800K',143,255,161,237,4466,0.3524639740,0.3535448090),(58,'4850K',142,254,163,236,4483,0.3509082930,0.3526039240),(59,'4900K',141,254,165,235,4500,0.3493858240,0.3516645260),(60,'4950K',139,254,166,234,4517,0.3478956830,0.3507273270),(61,'5000K',138,254,168,233,4534,0.3464370090,0.3497929700),(62,'5050K',137,254,169,232,4552,0.3450089690,0.3488620410),(63,'5100K',136,253,171,231,4569,0.3436107520,0.3479350640),(64,'5150K',135,253,172,230,4586,0.3422415730,0.3470125150),(65,'5200K',133,253,174,229,4603,0.3409006680,0.3460948220),(66,'5250K',132,253,175,229,4621,0.3395872980,0.3451823680),(67,'5300K',131,253,177,228,4638,0.3383007430,0.3442754980),(68,'5350K',130,253,178,227,4655,0.3370403070,0.3433745180),(69,'5400K',129,253,180,227,4672,0.3358053140,0.3424797030),(70,'5450K',128,253,181,226,4690,0.3345951070,0.3415912960),(71,'5500K',128,253,183,226,4707,0.3334090490,0.3407095120),(72,'5550K',127,253,185,225,4724,0.3322465210,0.3398345390),(73,'5600K',126,253,186,225,4741,0.3311069250,0.3389665450),(74,'5650K',125,253,188,224,4759,0.3299896780,0.3381056710),(75,'5700K',124,253,189,224,4776,0.3288942150,0.3372520420),(76,'5750K',124,253,191,224,4793,0.3278199870,0.3364057620),(77,'5800K',123,253,193,223,4810,0.3267664640,0.3355669210),(78,'5850K',122,253,195,223,4828,0.3257331270,0.3347355920),(79,'5900K',122,253,197,223,4845,0.3247194770,0.3339118330),(80,'5950K',121,253,199,222,4862,0.3237250250,0.3330956910),(81,'6000K',120,254,201,222,4879,0.3227493000,0.3322872000),(82,'6050K',119,253,203,222,4897,0.3217918430,0.3314863840),(83,'6100K',119,253,206,221,4914,0.3208522080,0.3306932560),(84,'6150K',118,253,208,221,4931,0.3199299620,0.3299078210),(85,'6200K',117,253,211,220,4948,0.3190246870,0.3291300760),(86,'6250K',116,252,213,219,4966,0.3181359730,0.3283600100),(87,'6300K',115,252,216,218,4983,0.3172634240,0.3275976040),(88,'6350K',113,251,220,217,5000,0.3164066550,0.3268428350);
/*!40000 ALTER TABLE `temperatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tft`
--

DROP TABLE IF EXISTS `tft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tft` (
  `profile_id` tinyint(3) unsigned NOT NULL,
  `link_id` tinyint(3) unsigned NOT NULL,
  `channel_id` tinyint(3) unsigned NOT NULL,
  `tft_id` tinyint(3) unsigned NOT NULL,
  `protocol` tinyint(3) unsigned DEFAULT NULL,
  `dport_from` smallint(5) unsigned DEFAULT NULL,
  `dport_to` smallint(5) unsigned DEFAULT NULL,
  `sport_from` smallint(5) unsigned DEFAULT NULL,
  `sport_to` smallint(5) unsigned DEFAULT NULL,
  `ipsec_spi` int(10) unsigned DEFAULT NULL,
  `tos_value` tinyint(3) unsigned DEFAULT NULL,
  `tos_mask` tinyint(3) unsigned DEFAULT NULL,
  `src_ip_addr` char(15) DEFAULT NULL,
  `src_ip_mask` char(15) DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`link_id`,`channel_id`,`tft_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tft`
--

LOCK TABLES `tft` WRITE;
/*!40000 ALTER TABLE `tft` DISABLE KEYS */;
/*!40000 ALTER TABLE `tft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_audio`
--

DROP TABLE IF EXISTS `usb_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usb_audio` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_audio`
--

LOCK TABLES `usb_audio` WRITE;
/*!40000 ALTER TABLE `usb_audio` DISABLE KEYS */;
/*!40000 ALTER TABLE `usb_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_update_files`
--

DROP TABLE IF EXISTS `usb_update_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usb_update_files` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `path` varchar(4096) NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_update_files`
--

LOCK TABLES `usb_update_files` WRITE;
/*!40000 ALTER TABLE `usb_update_files` DISABLE KEYS */;
INSERT INTO `usb_update_files` VALUES (65537,1,'/mnt/user/upload/update_DB_XMALT_CWR451.sql'),(65538,1,'/mnt/user/upload/update_C2_rel_PILATUS_201605031153.tgz'),(65539,1,'/mnt/user/upload/update_DB_CWR451DVT.sql'),(65540,1,'/mnt/user/upload/update_C2_rel_HONDA_20160225-2.tgz'),(65541,1,'/mnt/user/upload/update_DB_PC12_451_test.sql'),(65542,1,'/mnt/user/upload/update_DB_multi_master_ver.sql'),(65543,1,'/mnt/user/upload/update_LIST_4512000_Factory.lst');
/*!40000 ALTER TABLE `usb_update_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_update_status`
--

DROP TABLE IF EXISTS `usb_update_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usb_update_status` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `update_script_cnt` int(10) unsigned NOT NULL,
  `update_binary_cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_update_status`
--

LOCK TABLES `usb_update_status` WRITE;
/*!40000 ALTER TABLE `usb_update_status` DISABLE KEYS */;
INSERT INTO `usb_update_status` VALUES (1,0,7),(2,0,0);
/*!40000 ALTER TABLE `usb_update_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_video`
--

DROP TABLE IF EXISTS `usb_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usb_video` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_video`
--

LOCK TABLES `usb_video` WRITE;
/*!40000 ALTER TABLE `usb_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `usb_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audio`
--

DROP TABLE IF EXISTS `user_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_audio` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audio`
--

LOCK TABLES `user_audio` WRITE;
/*!40000 ALTER TABLE `user_audio` DISABLE KEYS */;
INSERT INTO `user_audio` VALUES (65537,1,'13 - Human After All _ Together _ One More Time (Reprise) _ Music Sounds Better With You (Stardust)','/mnt/user/upload/13 - Human After All _ Together _ One More Time (Reprise) _ Music Sounds Better With You (Stardust).mp3',1,1),(65538,1,'04 - Too Long _ Steam Machine','/mnt/user/upload/04 - Too Long _ Steam Machine.mp3',1,1),(65539,1,'11 - Da Funk _ Daftendirekt','/mnt/user/upload/11 - Da Funk _ Daftendirekt.mp3',1,1),(65540,1,'10 - The Prime Time of Your Life _ The Brainwasher _ Rollin\' & Scratchin\' _ Alive','/mnt/user/upload/10 - The Prime Time of Your Life _ The Brainwasher _ Rollin\' & Scratchin\' _ Alive.mp3',1,1),(65541,1,'03 - Television Rules the Nation _ Crescendolls','/mnt/user/upload/03 - Television Rules the Nation _ Crescendolls.mp3',1,1),(65542,1,'08 - One More Time _ Aerodynamic','/mnt/user/upload/08 - One More Time _ Aerodynamic.mp3',1,1),(65543,1,'05 - Around the World _ Harder, Better, Faster, Stronger','/mnt/user/upload/05 - Around the World _ Harder, Better, Faster, Stronger.mp3',1,1),(65544,1,'06 - Burnin\' _ Too Long','/mnt/user/upload/06 - Burnin\' _ Too Long.mp3',1,1),(65545,1,'07 - Face to Face _ Short Circuit','/mnt/user/upload/07 - Face to Face _ Short Circuit.mp3',1,1),(65546,1,'12 - Superheroes _ Human After All _ Rock\'n Roll','/mnt/user/upload/12 - Superheroes _ Human After All _ Rock\'n Roll.mp3',1,1),(65547,1,'09 - Aerodynamic Beats _ Forget About the World','/mnt/user/upload/09 - Aerodynamic Beats _ Forget About the World.mp3',1,1),(65548,1,'01 - Robot Rock _ Oh Yeah','/mnt/user/upload/01 - Robot Rock _ Oh Yeah.mp3',1,1);
/*!40000 ALTER TABLE `user_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_video`
--

DROP TABLE IF EXISTS `user_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_video` (
  `fn_count` int(10) unsigned NOT NULL,
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `fq_filename` varchar(4096) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`fn_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_video`
--

LOCK TABLES `user_video` WRITE;
/*!40000 ALTER TABLE `user_video` DISABLE KEYS */;
INSERT INTO `user_video` VALUES (65541,1,'The Glitch Mob - Fortune Days','/mnt/user/upload/The Glitch Mob - Fortune Days.mp4',1,0),(65540,1,'Spaceballs','/mnt/user/upload/Spaceballs.avi',1,0),(65539,1,'Blaze_test1_WMV-WMV9MP_CBR_320x240_AR4to3_15fps_512kbps_WMA9.2L2_32kbps_44100Hz_Mono','/mnt/user/upload/Blaze_test1_WMV-WMV9MP_CBR_320x240_AR4to3_15fps_512kbps_WMA9.2L2_32kbps_44100Hz_Mono.wmv',1,0),(65538,1,'blaze','/mnt/user/upload/blaze.wmv',1,0),(65537,1,'tears_of_steel_720p','/mnt/user/upload/tears_of_steel_720p.mov',1,1),(65542,1,'The Lion King','/mnt/user/upload/The Lion King.m4v',1,1);
/*!40000 ALTER TABLE `user_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_extensions`
--

DROP TABLE IF EXISTS `video_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_extensions` (
  `ext_count` tinyint(3) unsigned NOT NULL,
  `extension` varchar(255) NOT NULL,
  `mplayer` tinyint(3) unsigned NOT NULL,
  `web_server` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ext_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_extensions`
--

LOCK TABLES `video_extensions` WRITE;
/*!40000 ALTER TABLE `video_extensions` DISABLE KEYS */;
INSERT INTO `video_extensions` VALUES (1,'mov',1,1),(2,'wmv',1,0),(3,'avi',1,0),(4,'mp4',1,0),(5,'m4v',1,1),(6,'mkv',1,0);
/*!40000 ALTER TABLE `video_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wan_channel`
--

DROP TABLE IF EXISTS `wan_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wan_channel` (
  `profile_id` tinyint(3) unsigned NOT NULL,
  `link_id` tinyint(3) unsigned NOT NULL,
  `channel_id` tinyint(3) unsigned NOT NULL,
  `name` char(128) DEFAULT NULL,
  `service` text,
  `auto` tinyint(1) DEFAULT NULL,
  `idle_time` int(11) DEFAULT NULL,
  `activate_on_enable` tinyint(1) NOT NULL,
  `transceiver_constraint` char(8) DEFAULT NULL,
  `interface` char(16) DEFAULT NULL,
  PRIMARY KEY (`profile_id`,`link_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wan_channel`
--

LOCK TABLES `wan_channel` WRITE;
/*!40000 ALTER TABLE `wan_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `wan_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wan_profile`
--

DROP TABLE IF EXISTS `wan_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wan_profile` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` char(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wan_profile`
--

LOCK TABLES `wan_profile` WRITE;
/*!40000 ALTER TABLE `wan_profile` DISABLE KEYS */;
INSERT INTO `wan_profile` VALUES (1,'Empty');
/*!40000 ALTER TABLE `wan_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washes`
--

DROP TABLE IF EXISTS `washes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `washes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `set_id` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washes`
--

LOCK TABLES `washes` WRITE;
/*!40000 ALTER TABLE `washes` DISABLE KEYS */;
/*!40000 ALTER TABLE `washes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_albummeta`
--

DROP TABLE IF EXISTS `web_albummeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_albummeta` (
  `album` varchar(196) NOT NULL DEFAULT '',
  `title` varchar(256) DEFAULT NULL,
  `artist` varchar(256) DEFAULT NULL,
  `description` text,
  `avg_rating` varchar(256) DEFAULT NULL,
  `audio_year` varchar(32) DEFAULT NULL,
  `genre` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_albummeta`
--

LOCK TABLES `web_albummeta` WRITE;
/*!40000 ALTER TABLE `web_albummeta` DISABLE KEYS */;
INSERT INTO `web_albummeta` VALUES ('Alive 2007','Alive 2007','Daft Punk','',NULL,'2007','Electronic');
/*!40000 ALTER TABLE `web_albummeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_albumtrackmeta`
--

DROP TABLE IF EXISTS `web_albumtrackmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_albumtrackmeta` (
  `filename` varchar(196) NOT NULL,
  `track_number` int(11) DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `duration` varchar(256) DEFAULT NULL,
  `album` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_albumtrackmeta`
--

LOCK TABLES `web_albumtrackmeta` WRITE;
/*!40000 ALTER TABLE `web_albumtrackmeta` DISABLE KEYS */;
INSERT INTO `web_albumtrackmeta` VALUES ('/mnt/user/upload/01 - Robot Rock _ Oh Yeah.mp3',1,'Robot Rock / Oh Yeah','06:28','Alive 2007'),('/mnt/user/upload/03 - Television Rules the Nation _ Crescendolls.mp3',3,'Television Rules the Nation / Crescendolls','04:51','Alive 2007'),('/mnt/user/upload/04 - Too Long _ Steam Machine.mp3',4,'Too Long / Steam Machine','07:02','Alive 2007'),('/mnt/user/upload/05 - Around the World _ Harder, Better, Faster, Stronger.mp3',5,'Around the World / Harder, Better, Faster, Stronger','05:43','Alive 2007'),('/mnt/user/upload/06 - Burnin\' _ Too Long.mp3',6,'Burnin\' / Too Long','07:12','Alive 2007'),('/mnt/user/upload/07 - Face to Face _ Short Circuit.mp3',7,'Face to Face / Short Circuit','04:56','Alive 2007'),('/mnt/user/upload/08 - One More Time _ Aerodynamic.mp3',8,'One More Time / Aerodynamic','06:11','Alive 2007'),('/mnt/user/upload/09 - Aerodynamic Beats _ Forget About the World.mp3',9,'Aerodynamic Beats / Forget About the World','03:32','Alive 2007'),('/mnt/user/upload/10 - The Prime Time of Your Life _ The Brainwasher _ Rollin\' & Scratchin\' _ Alive.mp3',10,'The Prime Time of Your Life / The Brainwasher / Rollin\' & Scratchin\' / Alive','10:23','Alive 2007'),('/mnt/user/upload/11 - Da Funk _ Daftendirekt.mp3',11,'Da Funk / Daftendirekt','06:38','Alive 2007'),('/mnt/user/upload/12 - Superheroes _ Human After All _ Rock\'n Roll.mp3',12,'Superheroes / Human After All / Rock\'n Roll','05:42','Alive 2007'),('/mnt/user/upload/13 - Human After All _ Together _ One More Time (Reprise) _ Music Sounds Better With You (Stardust).mp3',13,'Human After All / Together / One More Time (Reprise) / Music Sounds Better With You (Stardust)','09:59','Alive 2007');
/*!40000 ALTER TABLE `web_albumtrackmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_application`
--

DROP TABLE IF EXISTS `web_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_application` (
  `ApplicationID` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `route` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `defaultDevice` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ApplicationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_application`
--

LOCK TABLES `web_application` WRITE;
/*!40000 ALTER TABLE `web_application` DISABLE KEYS */;
INSERT INTO `web_application` VALUES (1,'default','desktop',NULL),(2,'touchscreen','touchscreen','touchscreen');
/*!40000 ALTER TABLE `web_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `web_audioview`
--

DROP TABLE IF EXISTS `web_audioview`;
/*!50001 DROP VIEW IF EXISTS `web_audioview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_audioview` (
  `fn_count` tinyint NOT NULL,
  `ecms_id` tinyint NOT NULL,
  `display_name` tinyint NOT NULL,
  `fq_filename` tinyint NOT NULL,
  `mplayer` tinyint NOT NULL,
  `web_server` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_authentication`
--

DROP TABLE IF EXISTS `web_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_authentication` (
  `AuthenticationID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) DEFAULT NULL,
  `username` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `pass` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`AuthenticationID`),
  KEY `FKIndex1` (`ApplicationID`),
  CONSTRAINT `web_authentication_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `web_application` (`ApplicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_authentication`
--

LOCK TABLES `web_authentication` WRITE;
/*!40000 ALTER TABLE `web_authentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_configuration`
--

DROP TABLE IF EXISTS `web_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_configuration` (
  `ConfigurationID` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `value` varchar(256) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ConfigurationID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_configuration`
--

LOCK TABLES `web_configuration` WRITE;
/*!40000 ALTER TABLE `web_configuration` DISABLE KEYS */;
INSERT INTO `web_configuration` VALUES (1,'media_seek_speed_init','2'),(2,'media_seek_speed_mult','2'),(3,'clientPath','C:/emteq'),(4,'theme','pc12'),(5,'unsupported_browser_message','Accessing the eConnect Inflight Entertainment System with this browser will not allow for the best user experience. To access the system and provide you with the best user experience, we recommend the latest version of Chrome.'),(6,'unsupported_browser_timeout','0'),(7,'hls_server_url','http://10.0.9.251:8010/indexfile.m3u8'),(10,'map_installed','none'),(17,'whitelist_extensions','aac'),(18,'whitelist_extensions','aiff'),(19,'whitelist_extensions','amr'),(20,'whitelist_extensions','flac'),(21,'whitelist_extensions','mp3'),(22,'whitelist_extensions','m4a'),(23,'whitelist_extensions','wav'),(24,'whitelist_extensions','wma'),(25,'whitelist_extensions','midi'),(26,'whitelist_extensions','ogg'),(27,'whitelist_extensions','wpl'),(28,'whitelist_extensions','3gp'),(29,'whitelist_extensions','avi'),(30,'whitelist_extensions','h264'),(31,'whitelist_extensions','m4v'),(32,'whitelist_extensions','mkv'),(33,'whitelist_extensions','mov'),(34,'whitelist_extensions','mp4'),(35,'whitelist_extensions','mpg'),(36,'whitelist_extensions','ogv'),(37,'whitelist_extensions','wmv'),(38,'whitelist_extensions','ai'),(39,'whitelist_extensions','drw'),(40,'whitelist_extensions','odg'),(41,'whitelist_extensions','svg'),(42,'whitelist_extensions','bmp'),(43,'whitelist_extensions','gif'),(44,'whitelist_extensions','jpg'),(45,'whitelist_extensions','png'),(46,'whitelist_extensions','psd'),(47,'whitelist_extensions','tif'),(48,'whitelist_extensions','tiff'),(49,'whitelist_extensions','tabi'),(50,'whitelist_extensions','abi'),(51,'whitelist_extensions','doc'),(52,'whitelist_extensions','docx'),(53,'whitelist_extensions','docm'),(54,'whitelist_extensions','dot'),(55,'whitelist_extensions','dotm'),(56,'whitelist_extensions','dotx'),(57,'whitelist_extensions','epub'),(58,'whitelist_extensions','ind'),(59,'whitelist_extensions','indd'),(60,'whitelist_extensions','key'),(61,'whitelist_extensions','keynote'),(62,'whitelist_extensions','mpp'),(63,'whitelist_extensions','mpt'),(64,'whitelist_extensions','odf'),(65,'whitelist_extensions','ods'),(66,'whitelist_extensions','odt'),(67,'whitelist_extensions','ott'),(68,'whitelist_extensions','oxps'),(69,'whitelist_extensions','pages'),(70,'whitelist_extensions','pdf'),(71,'whitelist_extensions','pmd'),(72,'whitelist_extensions','pot'),(73,'whitelist_extensions','potx'),(74,'whitelist_extensions','pps'),(75,'whitelist_extensions','ppsx'),(76,'whitelist_extensions','ppt'),(77,'whitelist_extensions','pptm'),(78,'whitelist_extensions','pptx'),(79,'whitelist_extensions','prproj'),(80,'whitelist_extensions','ps'),(81,'whitelist_extensions','pub'),(82,'whitelist_extensions','pwi'),(83,'whitelist_extensions','rep'),(84,'whitelist_extensions','rtf'),(85,'whitelist_extensions','sdd'),(86,'whitelist_extensions','sdw'),(87,'whitelist_extensions','shs'),(88,'whitelist_extensions','snp'),(89,'whitelist_extensions','sxw'),(90,'whitelist_extensions','vsd'),(91,'whitelist_extensions','wdp'),(92,'whitelist_extensions','wps'),(93,'whitelist_extensions','xps'),(94,'whitelist_extensions','csv'),(95,'whitelist_extensions','rtf'),(96,'whitelist_extensions','txt'),(97,'whitelist_extensions','xml'),(98,'whitelist_extensions','xls'),(99,'whitelist_extensions','xlsx'),(100,'whitelist_extensions','xlsm'),(101,'whitelist_extensions','jpeg');
/*!40000 ALTER TABLE `web_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_machinegroupmachines`
--

DROP TABLE IF EXISTS `web_machinegroupmachines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_machinegroupmachines` (
  `MachineID` int(11) NOT NULL,
  `MachineGroupID` int(11) NOT NULL,
  KEY `FKIndex1` (`MachineGroupID`),
  KEY `FKIndex2` (`MachineID`),
  CONSTRAINT `web_machinegroupmachines_ibfk_1` FOREIGN KEY (`MachineGroupID`) REFERENCES `web_machinegroups` (`MachineGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_machinegroupmachines_ibfk_2` FOREIGN KEY (`MachineID`) REFERENCES `web_machines` (`MachineID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_machinegroupmachines`
--

LOCK TABLES `web_machinegroupmachines` WRITE;
/*!40000 ALTER TABLE `web_machinegroupmachines` DISABLE KEYS */;
INSERT INTO `web_machinegroupmachines` VALUES (1,1);
/*!40000 ALTER TABLE `web_machinegroupmachines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_machinegroups`
--

DROP TABLE IF EXISTS `web_machinegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_machinegroups` (
  `MachineGroupID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) DEFAULT NULL,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`MachineGroupID`),
  KEY `FKIndex1` (`ApplicationID`),
  CONSTRAINT `web_machinegroups_ibfk_1` FOREIGN KEY (`ApplicationID`) REFERENCES `web_application` (`ApplicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_machinegroups`
--

LOCK TABLES `web_machinegroups` WRITE;
/*!40000 ALTER TABLE `web_machinegroups` DISABLE KEYS */;
INSERT INTO `web_machinegroups` VALUES (1,1,'Default');
/*!40000 ALTER TABLE `web_machinegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_machines`
--

DROP TABLE IF EXISTS `web_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_machines` (
  `MachineID` int(11) NOT NULL AUTO_INCREMENT,
  `IPAddress` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`MachineID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_machines`
--

LOCK TABLES `web_machines` WRITE;
/*!40000 ALTER TABLE `web_machines` DISABLE KEYS */;
INSERT INTO `web_machines` VALUES (1,'127.0.0.1');
/*!40000 ALTER TABLE `web_machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_pages`
--

DROP TABLE IF EXISTS `web_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_pages` (
  `PageID` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) DEFAULT NULL,
  `PageTypeID` int(11) NOT NULL,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  KEY `FKIndex2` (`ApplicationID`),
  KEY `PageTypeID` (`PageTypeID`),
  CONSTRAINT `web_pages_ibfk_1` FOREIGN KEY (`PageTypeID`) REFERENCES `web_pagetypes` (`PageTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_pages_ibfk_2` FOREIGN KEY (`ApplicationID`) REFERENCES `web_application` (`ApplicationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_pages`
--

LOCK TABLES `web_pages` WRITE;
/*!40000 ALTER TABLE `web_pages` DISABLE KEYS */;
INSERT INTO `web_pages` VALUES (1,1,1,'Home','',1,0),(2,1,9,'Media','',2,0),(3,1,8,'Map','',6,0),(4,1,7,'Maintenance','',7,0),(5,1,12,'File Manager','',8,0),(6,1,4,'Video','',3,0),(7,1,5,'Audio','',4,0),(8,1,13,'XM','\0',5,0);
/*!40000 ALTER TABLE `web_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_pagetypes`
--

DROP TABLE IF EXISTS `web_pagetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_pagetypes` (
  `PageTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`PageTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_pagetypes`
--

LOCK TABLES `web_pagetypes` WRITE;
/*!40000 ALTER TABLE `web_pagetypes` DISABLE KEYS */;
INSERT INTO `web_pagetypes` VALUES (1,'home'),(2,'temp'),(3,'lights'),(4,'video'),(5,'audio'),(6,'shades'),(7,'maintenance'),(8,'flight'),(9,'media'),(12,'filemanager'),(13,'xm');
/*!40000 ALTER TABLE `web_pagetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_supported_browsers`
--

DROP TABLE IF EXISTS `web_supported_browsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_supported_browsers` (
  `SupportedBrowserID` int(11) NOT NULL AUTO_INCREMENT,
  `os` varchar(256) NOT NULL,
  `version` varchar(256) NOT NULL,
  `browser` varchar(256) NOT NULL,
  PRIMARY KEY (`SupportedBrowserID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_supported_browsers`
--

LOCK TABLES `web_supported_browsers` WRITE;
/*!40000 ALTER TABLE `web_supported_browsers` DISABLE KEYS */;
INSERT INTO `web_supported_browsers` VALUES (1,'Mac OS X','6.1','Safari'),(2,'Mac OS X','34','Chrome'),(3,'Windows 8','11','IE'),(4,'Windows 8','34','Chrome'),(5,'Windows 8','28','Firefox'),(6,'iOS','7','Mobile Safari'),(7,'iOS','33','Chrome Mobile iOS'),(8,'Android','33','Chrome Mobile'),(9,'Android','4','Android'),(10,'Windows 7','11','IE'),(11,'Windows 7','34','Chrome'),(12,'Windows 7','28','Firefox'),(13,'Windows XP','11','IE'),(14,'Windows XP','34','Chrome'),(15,'Windows XP','28','Firefox'),(16,'Windows 8.1','11','IE'),(17,'Windows 8.1','34','Chrome'),(18,'Windows 8.1','28','Firefox'),(19,'Android','33','Chrome'),(20,'Android','5','Mozilla');
/*!40000 ALTER TABLE `web_supported_browsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userwidgetactions`
--

DROP TABLE IF EXISTS `web_userwidgetactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userwidgetactions` (
  `UserWidgetActionID` int(11) NOT NULL AUTO_INCREMENT,
  `UserWidgetStateID` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `DependentWidgetStateID` int(11) DEFAULT NULL,
  `dependent_state` int(11) DEFAULT NULL,
  `icd_value` int(11) DEFAULT NULL,
  `end_state` int(11) NOT NULL,
  PRIMARY KEY (`UserWidgetActionID`),
  KEY `FKIndex1` (`UserWidgetStateID`),
  KEY `FKIndex2` (`DependentWidgetStateID`),
  CONSTRAINT `web_userwidgetactions_ibfk_1` FOREIGN KEY (`UserWidgetStateID`) REFERENCES `web_userwidgetstate` (`UserWidgetStateID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_userwidgetactions_ibfk_2` FOREIGN KEY (`DependentWidgetStateID`) REFERENCES `web_userwidgetstate` (`UserWidgetStateID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userwidgetactions`
--

LOCK TABLES `web_userwidgetactions` WRITE;
/*!40000 ALTER TABLE `web_userwidgetactions` DISABLE KEYS */;
INSERT INTO `web_userwidgetactions` VALUES (1,6,0,NULL,NULL,1,0),(2,7,0,NULL,NULL,2,0),(3,8,0,NULL,NULL,3,0),(4,5,0,NULL,NULL,0,0);
/*!40000 ALTER TABLE `web_userwidgetactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userwidgetattributes`
--

DROP TABLE IF EXISTS `web_userwidgetattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userwidgetattributes` (
  `UserWidgetAttributeID` int(11) NOT NULL AUTO_INCREMENT,
  `UserWidgetID` int(11) NOT NULL,
  `WidgetAttributeID` int(11) NOT NULL,
  `value` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserWidgetAttributeID`),
  KEY `FKIndex1` (`WidgetAttributeID`),
  KEY `FKIndex2` (`UserWidgetID`),
  CONSTRAINT `web_userwidgetattributes_ibfk_1` FOREIGN KEY (`WidgetAttributeID`) REFERENCES `web_widgetattributes` (`WidgetAttributeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_userwidgetattributes_ibfk_2` FOREIGN KEY (`UserWidgetID`) REFERENCES `web_userwidgets` (`UserWidgetID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userwidgetattributes`
--

LOCK TABLES `web_userwidgetattributes` WRITE;
/*!40000 ALTER TABLE `web_userwidgetattributes` DISABLE KEYS */;
INSERT INTO `web_userwidgetattributes` VALUES (111,2,23,'0'),(112,2,24,'1'),(113,2,25,'-1'),(114,2,26,'0'),(115,2,27,'3'),(116,2,28,'2'),(117,2,29,'/img/media-icons/output-ped.png'),(120,3,23,'1'),(121,3,24,'2'),(123,3,25,'-1'),(124,3,26,'4'),(125,3,27,'3'),(127,3,29,'/img/media-icons/source-econnect.png'),(128,4,31,'1'),(129,5,31,'0'),(130,2,27,'3'),(131,7,10,'10.0.9.1/slideshow'),(132,7,11,'0'),(143,26,23,'1'),(144,26,24,'8'),(145,26,25,'-1'),(146,26,26,'4'),(147,26,27,'0'),(149,5,35,'0'),(150,4,35,'1'),(200,2,28,'8'),(201,27,23,'1'),(202,27,24,'11'),(203,27,25,'-1'),(204,27,27,'1'),(205,2,28,'11'),(206,26,29,'/img/media-icons/SXM-econnect2.png'),(207,27,29,'/img/media-icons/HLS-econnect.png'),(301,301,9,'2'),(302,302,9,'4'),(303,303,9,'3'),(304,304,9,'5'),(305,305,9,'8'),(306,306,9,'6'),(307,307,9,'7'),(308,308,9,'10'),(309,309,9,'11'),(310,310,9,'12'),(311,311,9,'13'),(312,312,9,'20'),(313,313,9,'1'),(314,314,9,'23'),(315,315,9,'15'),(316,316,9,'14'),(318,300,34,'3'),(319,300,35,'15'),(320,300,36,'10'),(321,300,37,'1');
/*!40000 ALTER TABLE `web_userwidgetattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userwidgets`
--

DROP TABLE IF EXISTS `web_userwidgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userwidgets` (
  `UserWidgetID` int(11) NOT NULL AUTO_INCREMENT,
  `WidgetTypeID` int(10) unsigned NOT NULL,
  `ParentUserWidgetID` int(11) DEFAULT NULL,
  `PageID` int(11) DEFAULT NULL,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `w` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `ordinal` int(11) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserWidgetID`),
  KEY `FKIndex1` (`PageID`),
  KEY `FKIndex2` (`WidgetTypeID`),
  KEY `FKIndex3` (`ParentUserWidgetID`),
  CONSTRAINT `web_userwidgets_ibfk_1` FOREIGN KEY (`PageID`) REFERENCES `web_pages` (`PageID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_userwidgets_ibfk_2` FOREIGN KEY (`ParentUserWidgetID`) REFERENCES `web_userwidgets` (`UserWidgetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_userwidgets_ibfk_3` FOREIGN KEY (`WidgetTypeID`) REFERENCES `web_widgettypes` (`WidgetTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userwidgets`
--

LOCK TABLES `web_userwidgets` WRITE;
/*!40000 ALTER TABLE `web_userwidgets` DISABLE KEYS */;
INSERT INTO `web_userwidgets` VALUES (1,24,NULL,2,'Media',0,200,NULL,NULL,'',3,0),(2,34,4,2,'PED Streaming',0,0,NULL,NULL,'',1,0),(3,34,5,2,'eConnect AVOD',0,0,NULL,NULL,'',4,0),(4,35,NULL,2,'Output',0,-300,NULL,NULL,'',2,0),(5,35,NULL,2,'Source',0,-300,NULL,NULL,'',1,0),(6,25,NULL,3,NULL,0,0,NULL,NULL,'',1,0),(7,45,NULL,1,'Slideshow',0,0,700,600,'',1,0),(8,27,NULL,4,'Flight Planner',0,10,NULL,NULL,'\0',10,0),(19,48,NULL,4,'Refresh Media Files',300,110,200,NULL,'',2,0),(23,33,NULL,4,'Measurements:',300,20,NULL,NULL,'',3,0),(24,14,NULL,4,'Select Refresh Media Files to update system media and update software files.',10,50,200,0,'',1,0),(25,12,NULL,4,NULL,0,10,520,175,'',4,0),(27,18,NULL,4,'Versions',0,325,NULL,NULL,'',1,0),(28,19,NULL,4,'Update Software',0,200,NULL,NULL,'',5,0),(29,50,NULL,5,'File Manager',0,50,700,400,'',1,0),(300,49,0,3,'FMS Container',0,575,715,125,'',1,0),(301,28,300,3,'Altitude',0,600,0,0,'',1,0),(302,28,300,3,'Airspeed',0,0,0,0,'',2,0),(303,28,300,3,'Mach',0,0,0,0,'',3,0),(304,28,300,3,'Vertical Speed',0,0,0,0,'\0',0,0),(305,28,300,3,'Ground Speed',350,600,0,0,'',4,0),(306,28,300,3,'Latitude',0,0,0,0,'',5,0),(307,28,300,3,'Longitude',0,0,0,0,'',6,0),(308,28,300,3,'Heading',575,600,0,0,'',7,0),(309,28,300,3,'Wind Speed',0,600,0,0,'',8,0),(310,28,300,3,'Wind Direction',200,600,0,0,'',9,0),(311,28,300,3,'Air Temperature',435,600,0,0,'\0',0,0),(312,28,300,3,'Date',0,0,0,0,'\0',0,0),(313,28,300,3,'GMT',0,0,0,0,'\0',0,0),(314,28,300,3,'GMT Offset Destination',500,600,0,0,'\0',0,0),(315,28,300,3,'Time to Destination',250,600,0,0,'\0',0,0),(316,28,300,3,'Dist to Destination',0,600,0,0,'\0',0,0),(317,51,NULL,7,'Audio Library',0,50,700,400,'',1,0),(318,52,NULL,6,'Video Library',0,50,700,400,'',1,0),(319,55,NULL,8,'XM Container',0,50,700,NULL,'',0,0),(320,54,319,8,'XM Player',50,10,600,40,'',0,0),(321,53,319,8,'XM Controls',0,50,700,NULL,'',0,0);
/*!40000 ALTER TABLE `web_userwidgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_userwidgetstate`
--

DROP TABLE IF EXISTS `web_userwidgetstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_userwidgetstate` (
  `UserWidgetStateID` int(11) NOT NULL AUTO_INCREMENT,
  `MachineGroupID` int(11) DEFAULT NULL,
  `UserWidgetID` int(11) NOT NULL,
  `widget_element_id` int(11) NOT NULL,
  `current_state` int(11) DEFAULT NULL,
  `current_data` text COLLATE latin1_general_ci,
  PRIMARY KEY (`UserWidgetStateID`),
  KEY `FKIndex1` (`UserWidgetID`),
  KEY `FKIndex2` (`MachineGroupID`),
  CONSTRAINT `web_userwidgetstate_ibfk_1` FOREIGN KEY (`UserWidgetID`) REFERENCES `web_userwidgets` (`UserWidgetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_userwidgetstate_ibfk_2` FOREIGN KEY (`MachineGroupID`) REFERENCES `web_machinegroups` (`MachineGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_userwidgetstate`
--

LOCK TABLES `web_userwidgetstate` WRITE;
/*!40000 ALTER TABLE `web_userwidgetstate` DISABLE KEYS */;
INSERT INTO `web_userwidgetstate` VALUES (1,NULL,1,0,0,'{\"current\":0,\"playlist\":0,\"source\":2}'),(2,NULL,2,0,0,NULL),(3,NULL,7,0,0,NULL),(4,NULL,8,0,0,'{\"Waypoints\":[{\"Lat\":45,\"Lon\":100},{\"Lat\":50,\"Lon\":100},{\"Lat\":50,\"Lon\":-100},{\"Lat\":75,\"Lon\":-120}]}'),(5,NULL,19,0,0,NULL),(6,NULL,20,0,0,NULL),(7,NULL,21,0,0,NULL),(8,NULL,22,0,0,NULL);
/*!40000 ALTER TABLE `web_userwidgetstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_videometa`
--

DROP TABLE IF EXISTS `web_videometa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_videometa` (
  `filename` varchar(196) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `video_year` varchar(32) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `description` text,
  `avg_rating` varchar(32) DEFAULT NULL,
  `genre` varchar(256) DEFAULT NULL,
  `director` varchar(256) DEFAULT NULL,
  `cast` text,
  `rating` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_videometa`
--

LOCK TABLES `web_videometa` WRITE;
/*!40000 ALTER TABLE `web_videometa` DISABLE KEYS */;
INSERT INTO `web_videometa` VALUES ('/mnt/user/upload/blaze.wmv','blaze','','20','','','','','',''),('/mnt/user/upload/Blaze_test1_WMV-WMV9MP_CBR_320x240_AR4to3_15fps_512kbps_WMA9.2L2_32kbps_44100Hz_Mono.wmv','Blaze_test1_WMV-WMV9MP_CBR_320x240_AR4to3_15fps_512kbps_WMA9.2L2_32kbps_44100Hz_Mono','','20','','','','','',''),('/mnt/user/upload/Spaceballs.avi','Spaceballs','','01:08','','','','','',''),('/mnt/user/upload/tears_of_steel_720p.mov','tears_of_steel_720p','','12:14','','','','','',''),('/mnt/user/upload/The Glitch Mob - Fortune Days.mp4','The Glitch Mob - Fortune Days','','06:20','','','','','',''),('/mnt/user/upload/The Lion King.m4v','Chapter 1','','01:28:22','','','','','','');
/*!40000 ALTER TABLE `web_videometa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `web_videoview`
--

DROP TABLE IF EXISTS `web_videoview`;
/*!50001 DROP VIEW IF EXISTS `web_videoview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `web_videoview` (
  `fn_count` tinyint NOT NULL,
  `ecms_id` tinyint NOT NULL,
  `display_name` tinyint NOT NULL,
  `fq_filename` tinyint NOT NULL,
  `mplayer` tinyint NOT NULL,
  `web_server` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `web_widgetattributes`
--

DROP TABLE IF EXISTS `web_widgetattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_widgetattributes` (
  `WidgetAttributeID` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE latin1_general_ci NOT NULL,
  `WidgetTypeID` int(10) unsigned NOT NULL,
  `WidgetAttributeTypeID` int(11) NOT NULL,
  PRIMARY KEY (`WidgetAttributeID`),
  KEY `FKIndex1` (`WidgetAttributeTypeID`),
  KEY `FKIndex2` (`WidgetTypeID`),
  CONSTRAINT `web_widgetattributes_ibfk_1` FOREIGN KEY (`WidgetTypeID`) REFERENCES `web_widgettypes` (`WidgetTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `web_widgetattributes_ibfk_2` FOREIGN KEY (`WidgetAttributeTypeID`) REFERENCES `web_widgetattributetypes` (`WidgetAttributeTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_widgetattributes`
--

LOCK TABLES `web_widgetattributes` WRITE;
/*!40000 ALTER TABLE `web_widgetattributes` DISABLE KEYS */;
INSERT INTO `web_widgetattributes` VALUES (1,'BitMask',9,1),(2,'BitMask',10,1),(3,'BitMask',11,1),(4,'lopa_image',16,2),(5,'multiple_select',17,3),(6,'image',20,2),(7,'link',20,4),(8,'select',14,3),(9,'gui_code',28,1),(10,'url',30,2),(11,'popup',30,3),(12,'width',30,6),(13,'height',30,6),(14,'location',30,3),(15,'menubar',30,3),(16,'status',30,3),(17,'toolbar',30,3),(18,'scrollbars',30,3),(19,'resizable',30,3),(20,'title',30,5),(21,'value1',31,5),(22,'value2',31,5),(23,'io_type',34,6),(24,'media_channel_type',34,6),(25,'rosen_id',34,6),(26,'avds_record',34,6),(27,'av_type',34,6),(28,'source_media_channel_type',34,6),(29,'image',34,2),(30,'zone',34,6),(31,'multiple_select',35,3),(32,'fault',3001,1),(33,'in_use',3001,2),(34,'elements_in_row',49,6),(35,'left_right_padding',49,6),(36,'top_bottom_padding',49,6),(37,'has_shading',49,3);
/*!40000 ALTER TABLE `web_widgetattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_widgetattributetypes`
--

DROP TABLE IF EXISTS `web_widgetattributetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_widgetattributetypes` (
  `WidgetAttributeTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`WidgetAttributeTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_widgetattributetypes`
--

LOCK TABLES `web_widgetattributetypes` WRITE;
/*!40000 ALTER TABLE `web_widgetattributetypes` DISABLE KEYS */;
INSERT INTO `web_widgetattributetypes` VALUES (1,'BYTE'),(2,'URL'),(3,'BIT'),(4,'ARRAY'),(5,'TEXT'),(6,'INT'),(7,'FAULT_BYTE'),(8,'IN_USE_BYTE'),(9,'CSS_CLASS'),(10,'MEDIA_TYPE');
/*!40000 ALTER TABLE `web_widgetattributetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_widgettypes`
--

DROP TABLE IF EXISTS `web_widgettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_widgettypes` (
  `WidgetTypeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(256) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`WidgetTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_widgettypes`
--

LOCK TABLES `web_widgettypes` WRITE;
/*!40000 ALTER TABLE `web_widgettypes` DISABLE KEYS */;
INSERT INTO `web_widgettypes` VALUES (1,'ON_OFF'),(2,'ON_OFF_SLIDER'),(3,'DAYLIGHT'),(4,'QUASAR'),(5,'RGB_FLEX'),(6,'SHADE'),(7,'MODE_BUTTON'),(8,'SCENE_BUTTON'),(9,'LED_GREEN_OFF'),(10,'LED_RED_OFF'),(11,'LED_GREEN_RED'),(12,'GREY_FRAME'),(13,'BLUE_FRAME'),(14,'LABEL'),(15,'TEMP'),(16,'ZONE'),(17,'ZONE_SELECT'),(18,'VERSIONS'),(19,'SOFTWARE_UPDATES'),(20,'IMAGE_MAP'),(21,'REMOTE'),(22,'SHADES_CONTROL'),(23,'TEMP_DISPLAY'),(24,'MEDIA'),(25,'MAP'),(26,'REFRESH_MEDIA_FILES'),(27,'FMS_FLIGHT_PLANNER'),(28,'FMS_LABEL'),(29,'QII'),(30,'LINK_BUTTON'),(31,'TOGGLE'),(32,'LOGIN'),(33,'MEASUREMENT_TOGGLE'),(34,'MEDIA_CHANNEL'),(35,'ICON_SLIDER'),(36,'OUTLET_CONTAINER'),(37,'OUTLET'),(38,'FAULT_CONTAINER'),(39,'VOLUME_CONTROL'),(40,'FAN_CONTROL'),(41,'SOURCE_SELECT'),(42,'MEDIA_SOURCE'),(43,'MEDIA_DISPLAY'),(44,'MEDIA_PLAYER'),(45,'SLIDESHOW'),(46,'DYNAMIC_LABEL'),(47,'GREY_SCENE_BUTTON'),(48,'GREY_REFRESH_MEDIA_FILES'),(49,'FMS_CONTAINER'),(50,'FILE_MANAGER'),(51,'AUDIO'),(52,'VIDEO'),(53,'XM_CONTROLS'),(54,'XM_PLAYER'),(55,'STATIC_FRAME');
/*!40000 ALTER TABLE `web_widgettypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wlan0_tc`
--

DROP TABLE IF EXISTS `wlan0_tc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlan0_tc` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `tc_onoff` tinyint(3) unsigned NOT NULL,
  `bw_reduce` tinyint(3) unsigned NOT NULL,
  `nclients` tinyint(3) unsigned NOT NULL,
  `client_ceil` tinyint(3) unsigned NOT NULL,
  `client_prio` tinyint(3) unsigned NOT NULL,
  `client_size` tinyint(3) unsigned NOT NULL,
  `mcast_base` tinyint(3) unsigned NOT NULL,
  `mcast_ceil` tinyint(3) unsigned NOT NULL,
  `mcast_prio` tinyint(3) unsigned NOT NULL,
  `mcast_size` tinyint(3) unsigned NOT NULL,
  `mcast_ip1` varchar(255) NOT NULL,
  `mcast_ip2` varchar(255) NOT NULL,
  `def_base` tinyint(3) unsigned NOT NULL,
  `def_ceil` tinyint(3) unsigned NOT NULL,
  `def_prio` tinyint(3) unsigned NOT NULL,
  `def_size` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wlan0_tc`
--

LOCK TABLES `wlan0_tc` WRITE;
/*!40000 ALTER TABLE `wlan0_tc` DISABLE KEYS */;
INSERT INTO `wlan0_tc` VALUES (1,1,90,50,2,1,12,1,1,1,20,'','',5,1,0,8);
/*!40000 ALTER TABLE `wlan0_tc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xm_channel_list`
--

DROP TABLE IF EXISTS `xm_channel_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xm_channel_list` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `xm_channel` int(10) unsigned NOT NULL,
  `xm_channel_name` varchar(32) NOT NULL,
  PRIMARY KEY (`ecms_id`,`xm_channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xm_channel_list`
--

LOCK TABLES `xm_channel_list` WRITE;
/*!40000 ALTER TABLE `xm_channel_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `xm_channel_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xm_config`
--

DROP TABLE IF EXISTS `xm_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xm_config` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `xm_rs485_bus` tinyint(3) unsigned NOT NULL,
  `bus_address` tinyint(3) unsigned NOT NULL,
  `default_channel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xm_config`
--

LOCK TABLES `xm_config` WRITE;
/*!40000 ALTER TABLE `xm_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `xm_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xm_playing`
--

DROP TABLE IF EXISTS `xm_playing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xm_playing` (
  `ecms_id` tinyint(3) unsigned NOT NULL,
  `xm_playing` int(10) unsigned NOT NULL,
  `xm_channel_name` varchar(32) NOT NULL,
  `xm_channel_songtitle` varchar(32) NOT NULL,
  `xm_channel_artist` varchar(32) NOT NULL,
  `xm_channel_category` varchar(32) NOT NULL,
  PRIMARY KEY (`ecms_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xm_playing`
--

LOCK TABLES `xm_playing` WRITE;
/*!40000 ALTER TABLE `xm_playing` DISABLE KEYS */;
/*!40000 ALTER TABLE `xm_playing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `web_audioview`
--

/*!50001 DROP TABLE IF EXISTS `web_audioview`*/;
/*!50001 DROP VIEW IF EXISTS `web_audioview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `web_audioview` AS (select `user_audio`.`fn_count` AS `fn_count`,`user_audio`.`ecms_id` AS `ecms_id`,`user_audio`.`display_name` AS `display_name`,`user_audio`.`fq_filename` AS `fq_filename`,`user_audio`.`mplayer` AS `mplayer`,`user_audio`.`web_server` AS `web_server` from `user_audio`) union all (select `usb_audio`.`fn_count` AS `fn_count`,`usb_audio`.`ecms_id` AS `ecms_id`,`usb_audio`.`display_name` AS `display_name`,`usb_audio`.`fq_filename` AS `fq_filename`,`usb_audio`.`mplayer` AS `mplayer`,`usb_audio`.`web_server` AS `web_server` from `usb_audio`) order by `display_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `web_videoview`
--

/*!50001 DROP TABLE IF EXISTS `web_videoview`*/;
/*!50001 DROP VIEW IF EXISTS `web_videoview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `web_videoview` AS (select `user_video`.`fn_count` AS `fn_count`,`user_video`.`ecms_id` AS `ecms_id`,`user_video`.`display_name` AS `display_name`,`user_video`.`fq_filename` AS `fq_filename`,`user_video`.`mplayer` AS `mplayer`,`user_video`.`web_server` AS `web_server` from `user_video`) union all (select `usb_video`.`fn_count` AS `fn_count`,`usb_video`.`ecms_id` AS `ecms_id`,`usb_video`.`display_name` AS `display_name`,`usb_video`.`fq_filename` AS `fq_filename`,`usb_video`.`mplayer` AS `mplayer`,`usb_video`.`web_server` AS `web_server` from `usb_video`) order by `display_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-26  9:51:06
