-- MySQL dump 10.13  Distrib 5.5.15, for osx10.6 (i386)
--
-- Host: localhost    Database: q
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `collisions`
--

DROP TABLE IF EXISTS `collisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collisions` (
  `id` int(11) NOT NULL,
  `reactant_id` smallint(5) unsigned NOT NULL,
  `product_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collisions_cc2623c` (`reactant_id`),
  KEY `collisions_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_855677a9` FOREIGN KEY (`product_id`) REFERENCES `species` (`id`),
  CONSTRAINT `reactant_id_refs_id_855677a9` FOREIGN KEY (`reactant_id`) REFERENCES `species` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collisions`
--

LOCK TABLES `collisions` WRITE;
/*!40000 ALTER TABLE `collisions` DISABLE KEYS */;
INSERT INTO `collisions` VALUES (1,7,7),(2,8,9);
/*!40000 ALTER TABLE `collisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasets` (
  `id` int(11) NOT NULL,
  `collision_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datasets_22ad0477` (`collision_id`),
  CONSTRAINT `collision_id_refs_id_938f86e5` FOREIGN KEY (`collision_id`) REFERENCES `collisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasets`
--

LOCK TABLES `datasets` WRITE;
/*!40000 ALTER TABLE `datasets` DISABLE KEYS */;
INSERT INTO `datasets` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `mass` decimal(8,5) NOT NULL,
  `nuclear_charge` int(11) NOT NULL,
  `inchi` varchar(256) NOT NULL,
  `molecule` tinyint(1) NOT NULL,
  `chemical_formula` varchar(128) NOT NULL,
  `cas` varchar(128) NOT NULL,
  `inchikey` varchar(20) NOT NULL,
  `isotope` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `species_52094d6e` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES (7,'Benzene',78.00000,42,'InChI=1S/C6H6/c1-2-4-6-5-3-1/h1-6H',1,'C6H6','71-43-2','UHOVQNZJYSORNB-UHFFF',1),(8,'Cytosine',111.00000,58,'InChI=1S/C4H5N3O/c5-3-1-2-6-4(8)7-3/h1-2H,(H3,5,6,7,8)',1,'C4H5N3O','71-30-7','OPTASPLRGRRNAP-UHFFF',1),(9,'Cytosinide',110.00000,41,'',1,'C4H4N3O','19224-69-2','',1),(10,'',67.00000,35,'',1,'C3H3N2','','',1),(11,'',65.00000,33,'',1,'C3HN2','','',1),(12,'',42.00000,21,'',1,'OCN','','',1),(13,'',26.00000,13,'',1,'CN','','',1),(14,'Atomic Oxy',16.00000,8,'InChI=1S/O',0,'O','','QVGXLLKOCUKJST-UHFFF',1),(17,'Thymine',126.00000,66,'InChI=1S/C5H6N2O2/c1-3-2-6-5(9)7-4(3)8/h2H,1H3,(H2,6,7,8,9)',1,'C5H6N2O2','65-71-4','RWQNBRDOKXIBIV-UHFFF',1),(18,'',125.00000,65,'',1,'C5H5N2O2','61529-55-3','',1),(19,'',124.00000,64,'',1,'C5H4N2O2','','',1),(20,'',97.00000,53,'',1,'C4H5N2O','','',1),(24,'',71.00000,37,'',1,'C2H3N2O','','',1),(25,'',68.00000,35,'',1,'C3H2NO','','',1),(26,'',54.00000,29,'',1,'C3H4N','','',1),(27,'Adenine',135.00000,70,'InChI=1S/C5H5N5/c6-4-3-5(9-1-7-3)10-2-8-4/h1-2H,(H3,6,7,8,9,10)',1,'C5H5N5','73-24-5','GFFGJBXGBJISGV-UHFFF',1),(28,'',134.00000,69,'',1,'C5H4N5','','',1);
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabdata`
--

DROP TABLE IF EXISTS `tabdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabdata` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `x` longtext NOT NULL,
  `xunit` varchar(8) NOT NULL,
  `xdesc` varchar(32) NOT NULL,
  `y` longtext NOT NULL,
  `yunit` varchar(8) NOT NULL,
  `ydesc` varchar(32) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tabdata_9c63e21` (`dataset_id`),
  CONSTRAINT `dataset_id_refs_id_6013c584` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabdata`
--

LOCK TABLES `tabdata` WRITE;
/*!40000 ALTER TABLE `tabdata` DISABLE KEYS */;
INSERT INTO `tabdata` VALUES (1,1,'0.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0','eV','Energy','1.0 1.0 1.2 2.8 6.9 3.8 2.0 1.0 1.0 1.0','m2','cross-section',10),(2,1,'5.5','eV','Energy','1','','Peaks: 1 = C3HN2-',1);
/*!40000 ALTER TABLE `tabdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-26 20:31:08
