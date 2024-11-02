-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: trailerflix
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Actores`
--

DROP TABLE IF EXISTS `Actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actores`
--

LOCK TABLES `Actores` WRITE;
/*!40000 ALTER TABLE `Actores` DISABLE KEYS */;
INSERT INTO `Actores` VALUES (1,'Pedro','Pascal'),(2,'Carl','Weathers'),(3,'Misty','Rosas'),(4,'Chris','Bartlett'),(5,'Rio','Hackford'),(6,'Giancarlo','Esposito'),(7,'Tom','Hopper'),(8,'David','Castañeda'),(9,'Emmy','Raver-Lampman'),(10,'Robert','Sheehan'),(11,'Aidan','Gallagher'),(12,'Elliot','Page'),(13,'Anya','Taylor-Joy'),(14,'Thomas','Brodie-Sangster'),(15,'Harry','Melling'),(16,'Moses','Ingram'),(17,'Chloe','Pirrie'),(18,'Janina','Elkin'),(19,'Lili','Reinhart'),(20,'Casey','Cott'),(21,'Camila','Mendes'),(22,'Marisol','Nichols'),(23,'Madelaine','Petsch'),(24,'Mädchen','Amick'),(25,'Claire','Fox'),(26,'Olivia','Colman'),(27,'Matt','Smith'),(28,'Tobias','Menzies'),(29,'Vanesa','Kirby'),(30,'Helena','Bonham Carter'),(31,'Millie','Bobby Brown'),(32,'Henry','Cavill'),(33,'Sam','Claflin'),(34,'Louis','Partridge'),(35,'Adeel','Akhtar'),(36,'Joaquin','Phoenix'),(37,'Robert','De Niro'),(38,'Zazie','Beetz'),(39,'Frances','Conroy'),(40,'Brett','Cullen'),(41,'Shea','Whigham'),(42,'Robert','Downey Jr.'),(43,'Chris','Evans'),(44,'Mark','Ruffalo'),(45,'Chris','Hemsworth'),(46,'Scarlett','Johansson'),(47,'Jeremy','Renner'),(48,'Emilia','Clarke'),(49,'Lena','Headey'),(50,'Sophie','Turner'),(51,'Kit','Harington'),(52,'Peter','Dinklage'),(53,'Nikolaj','Coster-Waldau'),(54,'Grant','Gustin'),(55,'Carlos','Valdes'),(56,'Danielle','Panabaker'),(57,'Candice','Patton'),(58,'Jesse','L. Martin'),(59,'Tom','Cavanagh'),(60,'Miranda','Cosgrove'),(61,'Kate','Walsh'),(62,'Omar','Epps'),(63,'Angus','Macfadyen'),(64,'Jorja','Fox'),(65,'Enver','Gjokaj');
/*!40000 ALTER TABLE `Actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actores_Contenidos`
--

DROP TABLE IF EXISTS `Actores_Contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actores_Contenidos` (
  `fk_actor` int NOT NULL,
  `fk_contenido` int NOT NULL,
  UNIQUE KEY `fk_actor` (`fk_actor`,`fk_contenido`),
  KEY `Actores_Contenidos_ibfk_2` (`fk_contenido`),
  CONSTRAINT `Actores_Contenidos_ibfk_1` FOREIGN KEY (`fk_actor`) REFERENCES `Actores` (`id`),
  CONSTRAINT `Actores_Contenidos_ibfk_2` FOREIGN KEY (`fk_contenido`) REFERENCES `Contenidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actores_Contenidos`
--

LOCK TABLES `Actores_Contenidos` WRITE;
/*!40000 ALTER TABLE `Actores_Contenidos` DISABLE KEYS */;
INSERT INTO `Actores_Contenidos` VALUES (1,31),(2,31),(3,31),(4,31),(5,31),(6,31),(7,32),(8,32),(9,32),(10,32),(11,32),(12,32),(13,33),(14,33),(15,33),(16,33),(17,33),(18,33),(19,34),(20,34),(21,34),(22,34),(23,34),(24,34),(25,35),(26,35),(27,35),(28,35),(29,35),(30,35),(31,36),(32,36),(33,36),(34,36),(35,36),(36,37),(37,37),(38,37),(39,37),(40,37),(41,37),(42,38),(43,38),(44,38),(45,38),(46,38),(47,38),(48,39),(49,39),(50,39),(51,39),(52,39),(53,39),(54,40),(55,40),(56,40),(57,40),(58,40),(59,40),(1,41),(2,41),(3,41),(4,41),(5,41),(6,41),(60,86),(61,86),(62,86),(63,86),(64,86),(65,86),(60,89),(61,89),(62,89),(63,89),(64,89),(65,89);
/*!40000 ALTER TABLE `Actores_Contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Serie'),(2,'Película');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contenidos`
--

DROP TABLE IF EXISTS `Contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contenidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fk_categoria` int NOT NULL,
  `resumen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `temporadas` varchar(3) DEFAULT NULL,
  `trailer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `duracion` int DEFAULT NULL,
  `poster` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoria` (`fk_categoria`),
  CONSTRAINT `Contenidos_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `Categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contenidos`
--

LOCK TABLES `Contenidos` WRITE;
/*!40000 ALTER TABLE `Contenidos` DISABLE KEYS */;
INSERT INTO `Contenidos` VALUES (31,'The Mandalorian',1,'Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la Serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.','2','https://www.youtube.com/embed/aOC8E8z_ifw',NULL,'./posters/3.jpg'),(32,'The Umbrella Academy',1,'La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.','1','https://www.youtube.com/embed/KHucKOK-Vik',NULL,'./posters/4.jpg'),(33,'Gambito de Dama',1,'En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.','1','https://www.youtube.com/embed/lbleRbyGKL4',NULL,'./posters/5.jpg'),(34,'Riverdale',1,'El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.','5','https://www.youtube.com/embed/HxtLlByaYTc',NULL,'./posters/2.jpg'),(35,'The Crown',1,'Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.','4','https://www.youtube.com/embed/JWtnJjn6ng0',NULL,'./posters/1.jpg'),(36,'Enola Holmes',2,'La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.','N/A','https://www.youtube.com/embed/3t1g2pa355k',97,'./posters/6.jpg'),(37,'Guasón',2,'Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una Serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.','N/A','https://www.youtube.com/embed/zAGVQLHvwOY',97,'./posters/7.jpg'),(38,'Avengers: End Game',2,'Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.','N/A','https://www.youtube.com/embed/TcMBFSGVi1c',97,'./posters/8.jpg'),(39,'Juego de tronos',1,'En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.','8','https://www.youtube.com/embed/KPLWWIOCOOQ',NULL,'./posters/9.jpg'),(40,'The Flash',1,'Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.','6','https://www.youtube.com/embed/Yj0l7iGKh8g',NULL,'./posters/10.jpg'),(41,'The Big Bang Theory',1,'Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La Serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.','12','https://www.youtube.com/embed/WBb3fojgW0Q',NULL,'./posters/11.jpg'),(42,'Friends',1,'\'Friends\' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey...','10','https://www.youtube.com/embed/ekYGfU0XIx0',NULL,'./posters/12.jpg'),(43,'Anne with an \'E\'',1,'Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea...','2','https://www.youtube.com/embed/M4T-_aB8smU',NULL,'./posters/13.jpg'),(44,'Expedientes Secretos \'X\'',1,'Fox Mulder y Dana Scully son dos investigadores del FBI...','11','https://www.youtube.com/embed/KKziOmsJxzE',NULL,'./posters/14.jpg'),(45,'Chernobyl',1,'Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre...','1','https://www.youtube.com/embed/s9APLXM9Ei8',NULL,'./posters/15.jpg'),(46,'Westworld',1,'\'Westworld\' es una oscura odisea acerca del amanecer de la conciencia artificial...','3','https://www.youtube.com/embed/qLFBcdd6Qw0',NULL,'./posters/16.jpg'),(47,'Halt and Catch Fire',1,'Situada en los inicios de la década de 1980, un visionario ficticio...','4','https://www.youtube.com/embed/pWrioRji60A',NULL,'./posters/17.jpg'),(48,'Ava',2,'Ava es una mortífera asesina a sueldo...','N/A','https://www.youtube.com/embed/eLEwNo78f0k',97,'./posters/18.jpg'),(49,'Aves de presa (Harley Quinn)',2,'Después de separarse de Joker, Harley Quinn y otras tres heroínas...','N/A','https://www.youtube.com/embed/saUmnenKbBM',97,'./posters/19.jpg'),(50,'Archivo',2,'2038: George Almore está trabajando en una verdadera IA equivalente a la humana...','N/A','https://www.youtube.com/embed/VHSoCnDioAo',97,'./posters/20.jpg'),(86,'3022',2,'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una Serie de flashbacks y flash-forward.','N/A','https://www.youtube.com/embed/AGQ7OkmIx4Q',97,'./posters/22.jpg'),(89,'3022',2,'La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una Serie de flashbacks y flash-forward.','N/A','https://www.youtube.com/embed/AGQ7OkmIx4Q',97,'./posters/22.jpg');
/*!40000 ALTER TABLE `Contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generos`
--

DROP TABLE IF EXISTS `Generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Generos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos`
--

LOCK TABLES `Generos` WRITE;
/*!40000 ALTER TABLE `Generos` DISABLE KEYS */;
INSERT INTO `Generos` VALUES (1,'Drama'),(2,'Sci-Fi'),(3,'Fantasía'),(4,'Acción'),(5,'Suspenso'),(6,'Ficción'),(7,'Misterio'),(8,'Aventura'),(9,'Crimen'),(10,'Suceso Real'),(13,'Terror'),(21,'Familia'),(22,'Western'),(23,'Tecnología'),(24,'Comedia');
/*!40000 ALTER TABLE `Generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generos_Contenidos`
--

DROP TABLE IF EXISTS `Generos_Contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Generos_Contenidos` (
  `fk_genero` int NOT NULL,
  `fk_contenido` int NOT NULL,
  UNIQUE KEY `fk_genero` (`fk_genero`,`fk_contenido`),
  KEY `Generos_Contenidos_ibfk_2` (`fk_contenido`),
  CONSTRAINT `Generos_Contenidos_ibfk_1` FOREIGN KEY (`fk_genero`) REFERENCES `Generos` (`id`),
  CONSTRAINT `Generos_Contenidos_ibfk_2` FOREIGN KEY (`fk_contenido`) REFERENCES `Contenidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos_Contenidos`
--

LOCK TABLES `Generos_Contenidos` WRITE;
/*!40000 ALTER TABLE `Generos_Contenidos` DISABLE KEYS */;
INSERT INTO `Generos_Contenidos` VALUES (2,31),(4,31),(7,31),(1,32),(6,32),(7,32),(1,33),(3,33),(10,33),(1,34),(3,34),(7,34),(1,35),(3,35),(10,35),(3,36),(4,36),(8,36),(1,37),(3,37),(8,37),(2,38),(4,38),(8,38),(1,39),(3,39),(8,39),(2,40),(3,40),(8,40),(1,41),(3,41),(6,41),(1,42),(3,42),(21,42),(1,43),(3,43),(22,43),(1,44),(2,44),(5,44),(1,45),(10,45),(1,46),(2,46),(22,46),(1,47),(2,47),(23,47),(1,48),(4,48),(5,48),(4,49),(6,49),(24,49),(2,50),(4,50),(5,50),(2,86),(4,86),(5,86),(2,89),(4,89),(5,89);
/*!40000 ALTER TABLE `Generos_Contenidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 23:32:40
