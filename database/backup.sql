/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - querysheet
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`querysheet` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `querysheet`;

/*Table structure for table `boletas` */

DROP TABLE IF EXISTS `boletas`;

CREATE TABLE `boletas` (
  `idboleta` int(11) NOT NULL AUTO_INCREMENT,
  `idempleado` int(11) NOT NULL,
  `idinstitucion` int(11) NOT NULL,
  `idusuarioregistro` int(11) NOT NULL,
  `idusuariomodifico` int(11) DEFAULT NULL,
  `activo` char(1) NOT NULL,
  `tipoempleado` char(1) DEFAULT NULL,
  `nivel` char(1) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `anio` char(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `montoimponible` decimal(8,2) DEFAULT NULL,
  `cantidad` char(1) NOT NULL,
  `comentario` mediumtext DEFAULT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `fechamodifico` datetime DEFAULT NULL,
  `fechaeliminacion` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idboleta`),
  KEY `fk_bole_idempleado` (`idempleado`),
  KEY `fk_bole_idinstitucion` (`idinstitucion`),
  KEY `fk_bole_idusuarireg` (`idusuarioregistro`),
  KEY `fk_bole_idusuact` (`idusuariomodifico`),
  CONSTRAINT `fk_bole_idempleado` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`),
  CONSTRAINT `fk_bole_idinstitucion` FOREIGN KEY (`idinstitucion`) REFERENCES `instituciones` (`idinstitucion`),
  CONSTRAINT `fk_bole_idusuact` FOREIGN KEY (`idusuariomodifico`) REFERENCES `usuarios` (`idusuario`),
  CONSTRAINT `fk_bole_idusuarireg` FOREIGN KEY (`idusuarioregistro`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `boletas` */

insert  into `boletas`(`idboleta`,`idempleado`,`idinstitucion`,`idusuarioregistro`,`idusuariomodifico`,`activo`,`tipoempleado`,`nivel`,`cargo`,`anio`,`mes`,`montoimponible`,`cantidad`,`comentario`,`fecharegistro`,`fechamodifico`,`fechaeliminacion`,`estado`) values 
(1,1,1,2,1,'1','C','I','Profesor de Aula','1992',1,199.00,'U',NULL,'2022-11-24 22:38:45','2022-11-25 10:23:41',NULL,'2'),
(2,1,1,1,1,'1','C','I','Profesor de Aula','1992',2,199.00,'U',NULL,'2022-11-24 22:46:31','2022-11-25 10:36:58',NULL,'1'),
(3,1,1,1,2,'1','C','N','Profesor de Aula','1992',3,199.00,'U',NULL,'2022-11-24 23:07:10','2022-11-25 10:26:32',NULL,'2'),
(4,1,1,1,2,'1','N','I','Profesor de Aula','1992',4,199.00,'U',NULL,'2022-11-24 23:55:28','2022-11-25 00:04:38',NULL,'3'),
(5,1,1,1,2,'1','N','P','Director','1992',5,199.00,'U',NULL,'2022-11-25 11:09:44','2022-11-25 11:17:47',NULL,'3'),
(6,1,1,1,1,'1','','P','Profesor de Aula','1989',6,199.00,'U','Corregir el cargo del empleado','2022-11-25 11:20:45','2022-11-25 11:30:28',NULL,'2'),
(7,2,2,1,2,'0','N','P','Profesor de Aula','1994',1,199.00,'U',NULL,'2022-11-28 23:37:11','2022-11-28 23:42:31',NULL,'2');

/*Table structure for table `campos` */

DROP TABLE IF EXISTS `campos`;

CREATE TABLE `campos` (
  `idcampo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`idcampo`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

/*Data for the table `campos` */

insert  into `campos`(`idcampo`,`tipo`,`nombre`) values 
(1,'I','basica'),
(2,'I','personal'),
(3,'I','ael25671'),
(4,'I','aeds081'),
(5,'I','r.t.pensionab'),
(6,'I','d.s.28+front'),
(7,'I','ds081'),
(8,'I','tph'),
(9,'I','diferencial'),
(10,'I','familiar'),
(11,'I','duo080'),
(12,'I','refmov'),
(13,'I','du90'),
(14,'I','ds19'),
(15,'I','ds021'),
(16,'I','contrato'),
(17,'I','horas extras'),
(18,'I','c.vida.palma'),
(19,'I','vac.6%'),
(20,'I','costcovid'),
(21,'I','prepclas'),
(22,'I','reunifi'),
(23,'I','igv'),
(24,'I','compensa.cts'),
(25,'I','prop/enseñanza'),
(26,'I','gratificacion'),
(27,'I','dl25897'),
(28,'I','difpens'),
(29,'I','du073'),
(30,'I','du011'),
(31,'I','du065'),
(32,'I','du105'),
(33,'I','ds068'),
(34,'I','ley28254'),
(35,'I','reintegro'),
(36,'I','aguinaldo'),
(37,'I','escolaridad'),
(38,'E','dl20530'),
(39,'E','dl19990'),
(40,'E','snp'),
(41,'E','derramadminist'),
(42,'E','derramadocente'),
(43,'E','prderramag'),
(44,'E','ipss vida/seg social'),
(45,'E','cooperativa'),
(46,'E','coopcyup'),
(47,'E','desc.judicial'),
(48,'E','ancije'),
(49,'E','ptmadmin'),
(50,'E','responsabilidad'),
(51,'E','sesdis'),
(52,'E','fonavi'),
(53,'E','multas/caf'),
(54,'E','derese'),
(55,'E','cafae'),
(56,'E','bcomat'),
(57,'E','deco83'),
(58,'E','caja'),
(59,'E','adfpensiones'),
(60,'E','sindicato'),
(61,'E','pagoindeb'),
(62,'E','pbancario'),
(63,'E','subcafae'),
(64,'E','crahorroc'),
(65,'E','tardanza'),
(66,'E','licauto');

/*Table structure for table `conceptos` */

DROP TABLE IF EXISTS `conceptos`;

CREATE TABLE `conceptos` (
  `idconcepto` int(11) NOT NULL AUTO_INCREMENT,
  `idboleta` int(11) NOT NULL,
  `idcampo` int(11) NOT NULL,
  `monto` double(8,3) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idconcepto`),
  KEY `fk_concep_idboleta` (`idboleta`),
  KEY `fk_concep_idcamp` (`idcampo`),
  CONSTRAINT `fk_concep_idboleta` FOREIGN KEY (`idboleta`) REFERENCES `boletas` (`idboleta`),
  CONSTRAINT `fk_concep_idcamp` FOREIGN KEY (`idcampo`) REFERENCES `campos` (`idcampo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

/*Data for the table `conceptos` */

insert  into `conceptos`(`idconcepto`,`idboleta`,`idcampo`,`monto`,`estado`) values 
(1,1,1,0.020,'1'),
(2,1,37,300.000,'1'),
(4,6,1,15.380,'1'),
(5,5,1,0.020,'1'),
(6,5,12,0.050,'1'),
(7,5,45,2.000,'1'),
(8,6,2,15.000,'1'),
(9,6,45,2.000,'1'),
(10,3,1,0.050,'1'),
(11,3,2,0.030,'1'),
(12,3,12,15.000,'1'),
(13,3,45,0.050,'1'),
(14,3,36,200.000,'1'),
(15,3,19,15.300,'1'),
(16,3,47,10.600,'1'),
(17,5,36,150.000,'1'),
(18,7,1,0.040,'1'),
(19,7,2,42.500,'1'),
(20,7,3,10.310,'1'),
(21,7,8,26.490,'1'),
(22,7,10,0.020,'1'),
(23,7,12,5.000,'1'),
(24,7,15,10.240,'1'),
(25,7,20,17.250,'1'),
(26,7,21,18.170,'1'),
(27,7,22,20.000,'1'),
(28,7,27,49.580,'1'),
(29,7,44,6.880,'1'),
(30,7,48,5.000,'1');

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `idusuarioregistro` int(11) NOT NULL,
  `codigomodular` char(8) NOT NULL,
  `codigodni` char(10) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `telefono` char(11) DEFAULT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idempleado`),
  UNIQUE KEY `uk_empl_coddni` (`codigodni`),
  KEY `fk_prof_idusuarioregistro` (`idusuarioregistro`),
  CONSTRAINT `fk_prof_idusuarioregistro` FOREIGN KEY (`idusuarioregistro`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `empleados` */

insert  into `empleados`(`idempleado`,`idusuarioregistro`,`codigomodular`,`codigodni`,`apellidos`,`nombres`,`telefono`,`fecharegistro`) values 
(1,1,'05423968','005423968','Meza Yauri','Juan Gabriel',NULL,'2022-11-24 22:36:55'),
(2,1,'1788299','001788299','Marchan Lopez ','Juan Rolando',NULL,'2022-11-28 23:36:25');

/*Table structure for table `historico` */

DROP TABLE IF EXISTS `historico`;

CREATE TABLE `historico` (
  `idhistorico` int(11) NOT NULL AUTO_INCREMENT,
  `idboleta` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idinstitucion` int(11) NOT NULL,
  `idusuariomodifico` int(11) NOT NULL,
  `activo` char(1) NOT NULL,
  `nivel` char(1) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `anio` char(4) NOT NULL,
  `mes` tinyint(4) NOT NULL,
  `montoimponible` decimal(8,2) DEFAULT NULL,
  `cantidad` char(1) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `fechamodifico` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT '1',
  `accion` varchar(50) NOT NULL,
  PRIMARY KEY (`idhistorico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `historico` */

/*Table structure for table `instituciones` */

DROP TABLE IF EXISTS `instituciones`;

CREATE TABLE `instituciones` (
  `idinstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `idusuarioregistro` int(11) NOT NULL,
  `codlegacy` char(8) NOT NULL,
  `codactual` char(8) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idinstitucion`),
  KEY `fk_insti_idusuarioregistro` (`idusuarioregistro`),
  CONSTRAINT `fk_insti_idusuarioregistro` FOREIGN KEY (`idusuarioregistro`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `instituciones` */

insert  into `instituciones`(`idinstitucion`,`idusuarioregistro`,`codlegacy`,`codactual`,`nombre`,`fecharegistro`) values 
(1,1,'2A458963','2A458963','Colegio Jose Pardo y Barreda','2022-11-24 22:37:28'),
(2,1,'2B524986','2B524986','Pensionistas Letra M','2022-11-28 23:35:58');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `apellidosuser` varchar(30) NOT NULL,
  `nombresuser` varchar(30) NOT NULL,
  `nomuser` varchar(30) NOT NULL,
  `correo` varchar(70) NOT NULL,
  `numerodni` varchar(9) NOT NULL,
  `claveacceso` varchar(100) NOT NULL,
  `nivelacceso` char(1) NOT NULL DEFAULT 'U',
  `fotoperfil` varchar(100) DEFAULT NULL,
  `telefono` char(11) DEFAULT NULL,
  `fecharegistro` datetime NOT NULL DEFAULT current_timestamp(),
  `fechabaja` datetime DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `uk_usu_nom` (`nomuser`),
  UNIQUE KEY `uk_usu_correo` (`correo`),
  UNIQUE KEY `uk_usu_dni` (`numerodni`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`apellidosuser`,`nombresuser`,`nomuser`,`correo`,`numerodni`,`claveacceso`,`nivelacceso`,`fotoperfil`,`telefono`,`fecharegistro`,`fechabaja`,`estado`) values 
(1,'Apolaya','Nicanor','nicoapolaya','nicoapolaya@gmail.com','78966405','$2y$10$J7gowuuVf0ofrzV.eP.hEO9vexj7ccfi.I.wqf7i7u1HTpSroGqrC','A',NULL,NULL,'2022-11-24 22:26:23',NULL,'1'),
(2,'Peve Andazabal','Jesus Mauricio','72523115','1142396@senati.pe','72523115','$2y$10$J7gowuuVf0ofrzV.eP.hEO9vexj7ccfi.I.wqf7i7u1HTpSroGqrC','U','20221125043747.jpg',NULL,'2022-11-24 22:37:47',NULL,'1'),
(3,'Alvarado Garcia','Luis Miguel','12345678','luismiguel@gmail.com','12345678','$2y$10$J7gowuuVf0ofrzV.eP.hEO9vexj7ccfi.I.wqf7i7u1HTpSroGqrC','U','20221128104411.jpg',NULL,'2022-11-28 16:44:11',NULL,'1');

/* Procedure structure for procedure `nivelesUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `nivelesUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `nivelesUsuario`()
BEGIN 
	SELECT CASE 
		WHEN nivelacceso = 'A' THEN 'Administrador'
		WHEN nivelacceso = 'U' THEN 'Usuario'
		WHEN nivelacceso = 'R' THEN 'Revisador'
	END 'nivelacceso', COUNT(idusuario) AS 'Total'
	FROM usuarios
	WHERE estado = '1'
	GROUP BY nivelacceso;			
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletaObservada` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletaObservada` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletaObservada`(IN _idboleta INT)
BEGIN 
		UPDATE boletas SET estado = '3' -- estado 3 = boleta observada 
			WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletaRevisada` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletaRevisada` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletaRevisada`(IN _idboleta INT)
BEGIN 
	UPDATE boletas SET estado = '2' 
		WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletaRevision` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletaRevision` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletaRevision`(IN _idboleta INT)
BEGIN 
		UPDATE boletas SET estado = '1' -- estado 1 = boleta en revision 
			WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletasEstado` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletasEstado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletasEstado`()
BEGIN
		SELECT 
		CASE 
				WHEN BOL.estado  =  '1' THEN 'Sin revisar'
				WHEN BOL.estado  =  '2' THEN 'Revisado'
				WHEN BOL.estado  =  '3' THEN 'Observado'
		END 'estadoBoletas' , COUNT(BOL.`idboleta`) AS 'totalBoletas'
		FROM boletas BOL
		GROUP BY BOL.estado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletasEstadoFecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletasEstadoFecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletasEstadoFecha`(IN _fechainicio DATE, IN _fechafin DATE)
BEGIN
		SELECT 
		CASE 
				WHEN BOL.estado  =  '1' THEN 'Sin revisar'
				WHEN BOL.estado  =  '2' THEN 'Revisado'
				WHEN BOL.estado  =  '3' THEN 'Observado'
		END 'estadoBoletas' , COUNT(BOL.`idboleta`) AS 'totalBoletas'
		FROM boletas BOL
		WHERE BOL.fecharegistro BETWEEN _fechainicio AND LAST_DAY(_fechafin)
		GROUP BY BOL.estado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletasUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletasUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletasUsuario`()
BEGIN
	SELECT 	CONCAT(USU.apellidosuser , ' ', USU.nombresuser) AS 'Usuario' , COUNT(BOL.idboleta) AS 'Total'
		FROM boletas BOL
		INNER JOIN usuarios USU ON USU.idusuario = BOL.idusuarioregistro
		WHERE BOL.estado = '2' 
		GROUP BY BOL.idusuarioregistro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_boletasUsuarioFecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_boletasUsuarioFecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_boletasUsuarioFecha`(IN _fechainicio DATE, IN _fechafin DATE)
BEGIN
	SELECT 	CONCAT(USU.apellidosuser , ' ', USU.nombresuser) AS 'Usuario' , COUNT(BOL.idboleta) AS 'Total'
		FROM boletas BOL
		INNER JOIN usuarios USU ON USU.idusuario = BOL.idusuarioregistro
		WHERE BOL.fecharegistro BETWEEN _fechainicio AND LAST_DAY(_fechafin) AND BOL.estado = '2' 
		GROUP BY BOL.idusuarioregistro;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscafechaempleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscafechaempleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscafechaempleados`(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletas
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscafechaempleadosRevisar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscafechaempleadosRevisar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscafechaempleadosRevisar`(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletasRevisar
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscafechaObservadas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscafechaObservadas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscafechaObservadas`(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletasObservadas 
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscarAnioempleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscarAnioempleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscarAnioempleados`(
	IN _anio CHAR(4),
	IN _search VARCHAR(30)
)
BEGIN 
	SELECT * FROM vs_boletas
		WHERE  anio = _anio AND empleado LIKE CONCAT('%', _search ,'%')
		AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscarBoletaempleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscarBoletaempleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscarBoletaempleados`(IN _search VARCHAR (30))
BEGIN 
	SELECT * FROM vs_boletas
		WHERE empleado LIKE CONCAT( '%' , _search , '%')
		AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscarUsuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscarUsuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscarUsuarios`(
	IN _search 	VARCHAR(50)
)
BEGIN
	SELECT * FROM vs_usuarios
		WHERE usuario LIKE CONCAT('%', _search ,'%') AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscarUsuariosRol` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscarUsuariosRol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscarUsuariosRol`(
	IN _nivelacceso CHAR(1),
	IN _search 	VARCHAR(50)
)
BEGIN
	SELECT * FROM vs_usuarios
		WHERE nivelacceso = _nivelacceso AND usuario LIKE CONCAT('%', _search ,'%') AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscar_campos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_campos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_campos`(IN _search VARCHAR(30))
BEGIN 
		SELECT * FROM vs_camposbuscar
		WHERE vs_camposbuscar.text LIKE CONCAT('%', _search , '%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_buscar_empleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_buscar_empleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_empleados`(IN _search VARCHAR(80))
BEGIN 
		SELECT * FROM vs_empleados
		WHERE empleado LIKE CONCAT('%', _search , '%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eliminarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eliminarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminarUsuario`(IN _idusuario INT)
BEGIN
	UPDATE usuarios SET estado = '0' 
		WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eliminar_boletas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eliminar_boletas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_boletas`(	
	IN _idboleta INT
	
)
BEGIN 
		
	DELETE FROM conceptos 
		WHERE idboleta = _idboleta;
	DELETE FROM boletas 
		WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_eliminar_concepto` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_eliminar_concepto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_eliminar_concepto`(IN _idconcepto INT)
BEGIN
	DELETE FROM conceptos WHERE idconcepto = _idconcepto;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_empleados_buscar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_empleados_buscar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_empleados_buscar`(IN _search VARCHAR(30))
BEGIN 
	SELECT *
	FROM vs_empleadosbuscar
	WHERE vs_empleadosbuscar.text LIKE CONCAT('%' , _search ,  '%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_empleados_obtener` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_empleados_obtener` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_empleados_obtener`(IN _idempleado INT)
BEGIN 
	SELECT * FROM empleados
		WHERE idempleado = _idempleado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_instituciones_buscar` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_instituciones_buscar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_instituciones_buscar`(IN _search VARCHAR(30))
BEGIN 
	SELECT *
	FROM vs_instituciones
	WHERE vs_instituciones.text LIKE CONCAT('%' , _search ,  '%');
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_instituciones_obtener` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_instituciones_obtener` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_instituciones_obtener`(IN _idinstitucion INT)
BEGIN
	SELECT * FROM instituciones
		WHERE idinstitucion = _idinstitucion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listarUltimoregistro` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listarUltimoregistro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listarUltimoregistro`(IN _limit TINYINT)
BEGIN 
	SELECT * FROM vs_boletasRevisar
		WHERE estado = '1'
		LIMIT _limit;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_boletas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_boletas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_boletas`()
BEGIN 
	SELECT * FROM boletas
		WHERE estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_conceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_conceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_conceptos`()
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE monto > 0;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_instituciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_instituciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_instituciones`()
BEGIN 
	SELECT * FROM instituciones;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_listar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_listar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_usuarios`()
BEGIN 
	SELECT * FROM usuarios;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_modificar_boletas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_modificar_boletas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modificar_boletas`(
	IN  _idboleta			INT,
	IN  _idempleado			INT,
	IN  _idinstitucion		INT,
	IN  _idusuariomodifico		INT,
	IN  _activo			CHAR(1), -- 1 = Activo - 0 = Cesante
	IN  _tipoempleado		CHAR(1),
	IN  _nivel			CHAR(1), 
	IN  _cargo			VARCHAR(50),
	IN  _anio 			CHAR(4),
	IN  _mes 			TINYINT,
	IN  _montoimponible		DECIMAL(8,2),
	IN  _cantidad			CHAR(1),
	IN  _comentario			MEDIUMTEXT
)
BEGIN 
		IF _montoimponible = '' THEN SET _montoimponible = NULL; END IF;
		IF _comentario	= '' THEN SET _comentario = NULL; END IF;
	
		
	UPDATE boletas SET
		idempleado 		= _idempleado,
		idinstitucion		= _idinstitucion,
		idusuariomodifico	= _idusuariomodifico,
		activo			= _activo,
		tipoempleado		= _tipoempleado,
		nivel			= _nivel,
		cargo			= _cargo,
		anio			= _anio,
		mes			= _mes,
		montoimponible    	= _montoimponible,
		cantidad		= _cantidad,
		comentario		= _comentario,
		fechamodifico		=  now()
	WHERE idboleta = _idboleta;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_modificar_empleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_modificar_empleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modificar_empleados`(
	 IN _idempleado		INT,
	 IN _idusuarioregistro	INT,
	 IN _codigomodular	CHAR(8),
	 IN _codigodni		CHAR(10),
	 IN _apellidos		VARCHAR(30),
	 IN _nombres		VARCHAR(30), 
	 IN _telefono		CHAR(11)
)
BEGIN 
	IF _telefono = '' THEN SET _telefono = NULL; END IF;
	
	UPDATE empleados SET
		idusuarioregistro = _idusuarioregistro,
		codigomodular	= _codigomodular,
		codigodni	= _codigodni,
		apellidos	= _apellidos,
		nombres		= _nombres,
		telefono	= _telefono
	WHERE idempleado = _idempleado;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_modificar_instituciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_modificar_instituciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modificar_instituciones`(
	IN _idinstitucion	INT,
	IN _idusuarioregistro	INT,
	IN _codlegacy		CHAR(8),
	IN _codactual		CHAR(8),
	IN _nombre		VARCHAR(80)	 	
)
BEGIN 
	UPDATE instituciones SET
		idusuarioregistro = _idusuarioregistro,
		codlegacy = _codlegacy,
		codactual = _codactual,
		nombre = _nombre
	WHERE idinstitucion = _idinstitucion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_modificar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_modificar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_modificar_usuarios`(
	IN  _idusuario		INT,
	IN  _apellidosuser 	VARCHAR(30),
	IN  _nombresuser	VARCHAR(30),
	IN  _nomuser		VARCHAR(30),
	IN  _correo		VARCHAR(70),
	IN  _numerodni		VARCHAR(9),	
	IN  _nivelacceso	CHAR(1),
	IN  _telefono 		CHAR(11)
)
BEGIN 
	IF _telefono = '' THEN SET _telefono = NULL; END IF;
	
	UPDATE usuarios SET 
		apellidosuser = _apellidosuser,
		nombresuser   = _nombresuser,
		nomuser	      = _nomuser,
		correo	      = _correo,
		numerodni     = _numerodni,
		nivelacceso   = _nivelacceso,
		telefono      = _telefono
	WHERE idusuario = _idusuario;	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nivelAdmin` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nivelAdmin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nivelAdmin`(IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'A' 
		WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nivelRevisador` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nivelRevisador` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nivelRevisador`(IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'R' 
		WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nivelUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nivelUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nivelUsuario`(IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'U' 
		WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_nivlesUsuario_fecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_nivlesUsuario_fecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_nivlesUsuario_fecha`(IN _fechainicio DATE, IN _fechafin DATE)
BEGIN
	SELECT CASE 
		WHEN nivelacceso = 'A' THEN 'Administrador'
		WHEN nivelacceso = 'U' THEN 'Usuario'
		WHEN nivelacceso = 'R' THEN 'Revisador'
	END 'nivelacceso', COUNT(idusuario) AS 'Total'
	FROM usuarios
	WHERE fecharegistro BETWEEN _fechainicio AND LAST_DAY(_fechafin) AND estado = '1'
	GROUP BY nivelacceso;	
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_boletas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_boletas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_boletas`(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletasRevisar
		WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_boletasO` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_boletasO` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_boletasO`(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletasObservadas
		WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_boletasR` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_boletasR` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_boletasR`(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletas
		WHERE idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_conceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_conceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_conceptos`(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_egresos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_egresos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_egresos`(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Egreso';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_ingresos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_ingresos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_ingresos`(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_ingresosCol1` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_ingresosCol1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_ingresosCol1`(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso' 
		ORDER BY idconcepto LIMIT 10 OFFSET 0;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_obtener_ingresosCol2` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_obtener_ingresosCol2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_ingresosCol2`(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso' 
		ORDER BY idconcepto LIMIT 20 OFFSET 10;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_boletas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_boletas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_boletas`(
	IN  _idempleado				INT,
	IN  _idinstitucion			INT,
	IN  _idusuarioregistro			INT,
	IN  _activo				CHAR(1), -- 1 = Activo - 0 = Cesante
	IN  _tipoempleado			CHAR(1),
	IN  _nivel				CHAR(1), 
	IN  _cargo				VARCHAR(50),
	IN  _anio 				CHAR(4),
	IN  _mes 				TINYINT,
	IN  _montoimponible			DECIMAL(8,2),
	IN  _cantidad				CHAR(1),
	IN  _comentario 			MEDIUMTEXT
)
BEGIN 
	IF _montoimponible = '' THEN SET _montoimponible = NULL; END IF;
	IF _comentario	= '' THEN SET _comentario = NULL; END IF;
	INSERT INTO boletas (idempleado, idinstitucion, idusuarioregistro, activo, tipoempleado , nivel, cargo, anio, mes, montoimponible,cantidad,comentario) VALUES
			(_idempleado, _idinstitucion, _idusuarioregistro, _activo, _tipoempleado , _nivel, _cargo, _anio, _mes, _montoimponible,_cantidad,_comentario);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_conceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_conceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_conceptos`(
	IN _idboleta		INT,
	IN _idcampo		INT,
	IN _monto		DOUBLE(8,3)
)
BEGIN 
	INSERT INTO conceptos (idboleta , idcampo, monto) VALUES
		(_idboleta, _idcampo, _monto);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_empleados` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_empleados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_empleados`(
	 IN _idusuarioregistro	INT,
	 IN _codigomodular	CHAR(8),
	 IN _codigodni		CHAR(10),
	 IN _apellidos		VARCHAR(30),
	 IN _nombres		VARCHAR(30),
	 IN _telefono		CHAR(11) 
)
BEGIN 
	IF _telefono = '' THEN SET _telefono = NULL; END IF;
	
	INSERT INTO empleados (idusuarioregistro, codigomodular, codigodni, apellidos, nombres,telefono) VALUES
		(_idusuarioregistro, _codigomodular, _codigodni,  _apellidos, _nombres, _telefono);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_instituciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_instituciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_instituciones`(
	IN _idusuarioregistro	INT,
	IN _codlegacy		CHAR(8),
	IN _codactual		CHAR(8),
	IN _nombre		VARCHAR(80)	
)
BEGIN 
	INSERT INTO instituciones (idusuarioregistro, codlegacy,codactual,nombre)
		VALUES (_idusuarioregistro, _codlegacy,_codactual, _nombre);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_registrar_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_registrar_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_usuarios`(
	IN  _apellidosuser 	VARCHAR(30),
	IN  _nombresuser	VARCHAR(30),
	IN  _nomuser		VARCHAR(30),
	IN  _correo		VARCHAR(70),
	IN  _numerodni		VARCHAR(9),
	IN  _fotoperfil		VARCHAR(100),
	IN  _nivelacceso	CHAR(1),
	IN  _telefono		CHAR(11)		
)
BEGIN 
	IF _fotoperfil = '' THEN SET _fotoperfil = NULL; END IF;
	IF _telefono = '' THEN SET _telefono = NULL; END IF;
	
	INSERT INTO usuarios (apellidosuser, nombresuser, nomuser, correo, numerodni , claveacceso,fotoperfil,nivelacceso,telefono)
		VALUES (_apellidosuser, _nombresuser, _nomuser, _correo , _numerodni , '$2y$10$J7gowuuVf0ofrzV.eP.hEO9vexj7ccfi.I.wqf7i7u1HTpSroGqrC' ,_fotoperfil,_nivelacceso, _telefono);
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sumarEgresos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sumarEgresos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sumarEgresos`(IN _idboleta INT)
BEGIN 
	SELECT SUM(monto) AS egreso FROM vs_conceptos WHERE tipo = 'Egreso' AND  idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_sumarIngresos` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_sumarIngresos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_sumarIngresos`(IN _idboleta INT)
BEGIN 
	SELECT SUM(monto) AS ingreso FROM vs_conceptos WHERE tipo = 'Ingreso' AND  idboleta = _idboleta;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_actualizarclave` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_actualizarclave` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_actualizarclave`(
	IN _idusuario 	  INT,
	IN _claveacceso   VARCHAR(100)
)
BEGIN 
	UPDATE usuarios SET claveacceso = _claveacceso WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_login` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_login` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_login`(IN _nomuser VARCHAR(30))
BEGIN
	SELECT *
	FROM usuarios WHERE nomuser = _nomuser AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_usuarios_obtener` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_usuarios_obtener` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuarios_obtener`(IN _idusuario INT)
BEGIN 
	SELECT * FROM usuarios
		WHERE idusuario = _idusuario;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_validarBoleta` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_validarBoleta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_validarBoleta`(
	IN _anio CHAR(4),
	IN _mes TINYINT
)
BEGIN 
	SELECT * FROM boletas
		WHERE anio = _anio AND mes = _mes AND cantidad = 'U';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_validarCorreo` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_validarCorreo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_validarCorreo`(IN _correo VARCHAR(70))
BEGIN
	SELECT * FROM usuarios
		WHERE correo = _correo AND estado = '1';
END */$$
DELIMITER ;

/* Procedure structure for procedure `spu_validarDni` */

/*!50003 DROP PROCEDURE IF EXISTS  `spu_validarDni` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_validarDni`(IN _numerodni VARCHAR(9))
BEGIN
	SELECT * FROM usuarios
		WHERE  numerodni = _numerodni AND estado = '1';
END */$$
DELIMITER ;

/*Table structure for table `vs_boletas` */

DROP TABLE IF EXISTS `vs_boletas`;

/*!50001 DROP VIEW IF EXISTS `vs_boletas` */;
/*!50001 DROP TABLE IF EXISTS `vs_boletas` */;

/*!50001 CREATE TABLE  `vs_boletas`(
 `idboleta` int(11) ,
 `idempleado` int(11) ,
 `empleado` varchar(61) ,
 `codigomodular` char(8) ,
 `codigodni` char(10) ,
 `idinstitucion` int(11) ,
 `nombre` varchar(80) ,
 `codlegacy` char(8) ,
 `codactual` char(8) ,
 `usuarioregistro` varchar(61) ,
 `usuariomodifico` varchar(61) ,
 `activo` varchar(11) ,
 `tipoempleado` varchar(10) ,
 `nivel` varchar(10) ,
 `cargo` varchar(50) ,
 `anio` char(4) ,
 `mes` varchar(9) ,
 `montoimponible` decimal(8,2) ,
 `cantidad` varchar(9) ,
 `comentario` mediumtext ,
 `estado` char(1) 
)*/;

/*Table structure for table `vs_boletasobservadas` */

DROP TABLE IF EXISTS `vs_boletasobservadas`;

/*!50001 DROP VIEW IF EXISTS `vs_boletasobservadas` */;
/*!50001 DROP TABLE IF EXISTS `vs_boletasobservadas` */;

/*!50001 CREATE TABLE  `vs_boletasobservadas`(
 `idboleta` int(11) ,
 `idempleado` int(11) ,
 `empleado` varchar(61) ,
 `codigomodular` char(8) ,
 `codigodni` char(10) ,
 `idinstitucion` int(11) ,
 `nombre` varchar(80) ,
 `codlegacy` char(8) ,
 `codactual` char(8) ,
 `usuarioregistro` varchar(61) ,
 `usuariomodifico` varchar(61) ,
 `fecharegistro` datetime ,
 `fechamodifico` datetime ,
 `activo` varchar(11) ,
 `tipoempleado` varchar(10) ,
 `nivel` varchar(10) ,
 `cargo` varchar(50) ,
 `anio` char(4) ,
 `mes` varchar(9) ,
 `montoimponible` decimal(8,2) ,
 `cantidad` varchar(9) ,
 `comentario` mediumtext ,
 `estado` char(1) 
)*/;

/*Table structure for table `vs_boletasrevisar` */

DROP TABLE IF EXISTS `vs_boletasrevisar`;

/*!50001 DROP VIEW IF EXISTS `vs_boletasrevisar` */;
/*!50001 DROP TABLE IF EXISTS `vs_boletasrevisar` */;

/*!50001 CREATE TABLE  `vs_boletasrevisar`(
 `idboleta` int(11) ,
 `idempleado` int(11) ,
 `empleado` varchar(61) ,
 `codigomodular` char(8) ,
 `codigodni` char(10) ,
 `idinstitucion` int(11) ,
 `nombre` varchar(80) ,
 `codlegacy` char(8) ,
 `codactual` char(8) ,
 `usuarioregistro` varchar(61) ,
 `usuariomodifico` varchar(61) ,
 `fecharegistro` datetime ,
 `fechamodifico` datetime ,
 `activo` varchar(11) ,
 `tipoempleado` varchar(10) ,
 `nivel` varchar(10) ,
 `cargo` varchar(50) ,
 `anio` char(4) ,
 `mes` varchar(9) ,
 `montoimponible` decimal(8,2) ,
 `cantidad` varchar(9) ,
 `comentario` mediumtext ,
 `estado` char(1) 
)*/;

/*Table structure for table `vs_camposbuscar` */

DROP TABLE IF EXISTS `vs_camposbuscar`;

/*!50001 DROP VIEW IF EXISTS `vs_camposbuscar` */;
/*!50001 DROP TABLE IF EXISTS `vs_camposbuscar` */;

/*!50001 CREATE TABLE  `vs_camposbuscar`(
 `idcampo` int(11) ,
 `tipo` char(1) ,
 `text` varchar(60) 
)*/;

/*Table structure for table `vs_conceptos` */

DROP TABLE IF EXISTS `vs_conceptos`;

/*!50001 DROP VIEW IF EXISTS `vs_conceptos` */;
/*!50001 DROP TABLE IF EXISTS `vs_conceptos` */;

/*!50001 CREATE TABLE  `vs_conceptos`(
 `idconcepto` int(11) ,
 `idboleta` int(11) ,
 `tipo` varchar(7) ,
 `nombre` varchar(60) ,
 `monto` double(8,3) ,
 `anio` char(4) ,
 `estado` char(1) 
)*/;

/*Table structure for table `vs_empleados` */

DROP TABLE IF EXISTS `vs_empleados`;

/*!50001 DROP VIEW IF EXISTS `vs_empleados` */;
/*!50001 DROP TABLE IF EXISTS `vs_empleados` */;

/*!50001 CREATE TABLE  `vs_empleados`(
 `idempleado` int(11) ,
 `encargadoregistro` varchar(61) ,
 `codigomodular` char(8) ,
 `codigodni` char(10) ,
 `empleado` varchar(61) ,
 `fecharegistro` datetime 
)*/;

/*Table structure for table `vs_empleadosbuscar` */

DROP TABLE IF EXISTS `vs_empleadosbuscar`;

/*!50001 DROP VIEW IF EXISTS `vs_empleadosbuscar` */;
/*!50001 DROP TABLE IF EXISTS `vs_empleadosbuscar` */;

/*!50001 CREATE TABLE  `vs_empleadosbuscar`(
 `idempleado` int(11) ,
 `text` varchar(61) 
)*/;

/*Table structure for table `vs_historico` */

DROP TABLE IF EXISTS `vs_historico`;

/*!50001 DROP VIEW IF EXISTS `vs_historico` */;
/*!50001 DROP TABLE IF EXISTS `vs_historico` */;

/*!50001 CREATE TABLE  `vs_historico`(
 `idhistorico` int(11) ,
 `idboleta` int(11) ,
 `empleado` varchar(61) ,
 `nombre` varchar(80) ,
 `activo` varchar(11) ,
 `anio` char(4) ,
 `mes` varchar(9) ,
 `encargado` varchar(61) ,
 `fecha` datetime ,
 `accion` varchar(50) 
)*/;

/*Table structure for table `vs_instituciones` */

DROP TABLE IF EXISTS `vs_instituciones`;

/*!50001 DROP VIEW IF EXISTS `vs_instituciones` */;
/*!50001 DROP TABLE IF EXISTS `vs_instituciones` */;

/*!50001 CREATE TABLE  `vs_instituciones`(
 `idinstitucion` int(11) ,
 `text` varchar(80) 
)*/;

/*Table structure for table `vs_instituciones_full` */

DROP TABLE IF EXISTS `vs_instituciones_full`;

/*!50001 DROP VIEW IF EXISTS `vs_instituciones_full` */;
/*!50001 DROP TABLE IF EXISTS `vs_instituciones_full` */;

/*!50001 CREATE TABLE  `vs_instituciones_full`(
 `idinstitucion` int(11) ,
 `codlegacy` char(8) ,
 `codactual` char(8) ,
 `nombre` varchar(80) ,
 `usuarioregistro` varchar(61) 
)*/;

/*Table structure for table `vs_usuarios` */

DROP TABLE IF EXISTS `vs_usuarios`;

/*!50001 DROP VIEW IF EXISTS `vs_usuarios` */;
/*!50001 DROP TABLE IF EXISTS `vs_usuarios` */;

/*!50001 CREATE TABLE  `vs_usuarios`(
 `idusuario` int(11) ,
 `usuario` varchar(61) ,
 `nomuser` varchar(30) ,
 `correo` varchar(70) ,
 `numerodni` varchar(9) ,
 `claveacceso` varchar(100) ,
 `nivelacceso` char(1) ,
 `fotoperfil` varchar(100) ,
 `fecharegistro` datetime ,
 `fechabaja` datetime ,
 `estado` char(1) 
)*/;

/*View structure for view vs_boletas */

/*!50001 DROP TABLE IF EXISTS `vs_boletas` */;
/*!50001 DROP VIEW IF EXISTS `vs_boletas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_boletas` AS select `bol`.`idboleta` AS `idboleta`,`empl`.`idempleado` AS `idempleado`,concat(`empl`.`apellidos`,' ',`empl`.`nombres`) AS `empleado`,`empl`.`codigomodular` AS `codigomodular`,`empl`.`codigodni` AS `codigodni`,`inst`.`idinstitucion` AS `idinstitucion`,`inst`.`nombre` AS `nombre`,`inst`.`codlegacy` AS `codlegacy`,`inst`.`codactual` AS `codactual`,concat(`usur`.`apellidosuser`,' ',`usur`.`nombresuser`) AS `usuarioregistro`,concat(`usum`.`apellidosuser`,' ',`usum`.`nombresuser`) AS `usuariomodifico`,case when `bol`.`activo` = '1' then 'Activo' when `bol`.`activo` = '0' then 'Pensionista' end AS `activo`,case when `bol`.`tipoempleado` = 'C' then 'Contratado' when `bol`.`tipoempleado` = 'N' then 'Nombrado' end AS `tipoempleado`,case when `bol`.`nivel` = 'I' then 'Inicial' when `bol`.`nivel` = 'P' then 'Primaria' when `bol`.`nivel` = 'S' then 'Secundaria' when `bol`.`nivel` = 'N' then 'Nocturna' when `bol`.`nivel` = 'C' then 'Cetpro' end AS `nivel`,`bol`.`cargo` AS `cargo`,`bol`.`anio` AS `anio`,case when `bol`.`mes` = '1' then 'Enero' when `bol`.`mes` = '2' then 'Febrero' when `bol`.`mes` = '3' then 'Marzo' when `bol`.`mes` = '4' then 'Abril' when `bol`.`mes` = '5' then 'Mayo' when `bol`.`mes` = '6' then 'Junio' when `bol`.`mes` = '7' then 'Julio' when `bol`.`mes` = '8' then 'Agosto' when `bol`.`mes` = '9' then 'Setiembre' when `bol`.`mes` = '10' then 'Octubre' when `bol`.`mes` = '11' then 'Noviembre' when `bol`.`mes` = '12' then 'Diciembre' end AS `mes`,`bol`.`montoimponible` AS `montoimponible`,case when `bol`.`cantidad` = 'U' then 'Unica' when `bol`.`cantidad` = 'A' then 'Adicional' end AS `cantidad`,`bol`.`comentario` AS `comentario`,`bol`.`estado` AS `estado` from ((((`boletas` `bol` join `empleados` `empl` on(`empl`.`idempleado` = `bol`.`idempleado`)) join `instituciones` `inst` on(`inst`.`idinstitucion` = `bol`.`idinstitucion`)) join `usuarios` `usur` on(`usur`.`idusuario` = `bol`.`idusuarioregistro`)) left join `usuarios` `usum` on(`usum`.`idusuario` = `bol`.`idusuariomodifico`)) where `bol`.`estado` = '2' order by `bol`.`idboleta` desc */;

/*View structure for view vs_boletasobservadas */

/*!50001 DROP TABLE IF EXISTS `vs_boletasobservadas` */;
/*!50001 DROP VIEW IF EXISTS `vs_boletasobservadas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_boletasobservadas` AS select `bol`.`idboleta` AS `idboleta`,`empl`.`idempleado` AS `idempleado`,concat(`empl`.`apellidos`,' ',`empl`.`nombres`) AS `empleado`,`empl`.`codigomodular` AS `codigomodular`,`empl`.`codigodni` AS `codigodni`,`inst`.`idinstitucion` AS `idinstitucion`,`inst`.`nombre` AS `nombre`,`inst`.`codlegacy` AS `codlegacy`,`inst`.`codactual` AS `codactual`,concat(`usur`.`apellidosuser`,' ',`usur`.`nombresuser`) AS `usuarioregistro`,concat(`usum`.`apellidosuser`,' ',`usum`.`nombresuser`) AS `usuariomodifico`,`bol`.`fecharegistro` AS `fecharegistro`,`bol`.`fechamodifico` AS `fechamodifico`,case when `bol`.`activo` = '1' then 'Activo' when `bol`.`activo` = '0' then 'Pensionista' end AS `activo`,case when `bol`.`tipoempleado` = 'C' then 'Contratado' when `bol`.`tipoempleado` = 'N' then 'Nombrado' end AS `tipoempleado`,case when `bol`.`nivel` = 'I' then 'Inicial' when `bol`.`nivel` = 'P' then 'Primaria' when `bol`.`nivel` = 'S' then 'Secundaria' when `bol`.`nivel` = 'N' then 'Nocturna' when `bol`.`nivel` = 'C' then 'Cetpro' end AS `nivel`,`bol`.`cargo` AS `cargo`,`bol`.`anio` AS `anio`,case when `bol`.`mes` = '1' then 'Enero' when `bol`.`mes` = '2' then 'Febrero' when `bol`.`mes` = '3' then 'Marzo' when `bol`.`mes` = '4' then 'Abril' when `bol`.`mes` = '5' then 'Mayo' when `bol`.`mes` = '6' then 'Junio' when `bol`.`mes` = '7' then 'Julio' when `bol`.`mes` = '8' then 'Agosto' when `bol`.`mes` = '9' then 'Setiembre' when `bol`.`mes` = '10' then 'Octubre' when `bol`.`mes` = '11' then 'Noviembre' when `bol`.`mes` = '12' then 'Diciembre' end AS `mes`,`bol`.`montoimponible` AS `montoimponible`,case when `bol`.`cantidad` = 'U' then 'Unico' when `bol`.`cantidad` = 'A' then 'Adicional' end AS `cantidad`,`bol`.`comentario` AS `comentario`,`bol`.`estado` AS `estado` from ((((`boletas` `bol` join `empleados` `empl` on(`empl`.`idempleado` = `bol`.`idempleado`)) join `instituciones` `inst` on(`inst`.`idinstitucion` = `bol`.`idinstitucion`)) join `usuarios` `usur` on(`usur`.`idusuario` = `bol`.`idusuarioregistro`)) left join `usuarios` `usum` on(`usum`.`idusuario` = `bol`.`idusuariomodifico`)) where `bol`.`estado` = '3' order by `bol`.`idboleta` desc */;

/*View structure for view vs_boletasrevisar */

/*!50001 DROP TABLE IF EXISTS `vs_boletasrevisar` */;
/*!50001 DROP VIEW IF EXISTS `vs_boletasrevisar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_boletasrevisar` AS select `bol`.`idboleta` AS `idboleta`,`empl`.`idempleado` AS `idempleado`,concat(`empl`.`apellidos`,' ',`empl`.`nombres`) AS `empleado`,`empl`.`codigomodular` AS `codigomodular`,`empl`.`codigodni` AS `codigodni`,`inst`.`idinstitucion` AS `idinstitucion`,`inst`.`nombre` AS `nombre`,`inst`.`codlegacy` AS `codlegacy`,`inst`.`codactual` AS `codactual`,concat(`usur`.`apellidosuser`,' ',`usur`.`nombresuser`) AS `usuarioregistro`,concat(`usum`.`apellidosuser`,' ',`usum`.`nombresuser`) AS `usuariomodifico`,`bol`.`fecharegistro` AS `fecharegistro`,`bol`.`fechamodifico` AS `fechamodifico`,case when `bol`.`activo` = '1' then 'Activo' when `bol`.`activo` = '0' then 'Pensionista' end AS `activo`,case when `bol`.`tipoempleado` = 'C' then 'Contratado' when `bol`.`tipoempleado` = 'N' then 'Nombrado' end AS `tipoempleado`,case when `bol`.`nivel` = 'I' then 'Inicial' when `bol`.`nivel` = 'P' then 'Primaria' when `bol`.`nivel` = 'S' then 'Secundaria' when `bol`.`nivel` = 'N' then 'Nocturna' when `bol`.`nivel` = 'C' then 'Cetpro' end AS `nivel`,`bol`.`cargo` AS `cargo`,`bol`.`anio` AS `anio`,case when `bol`.`mes` = '1' then 'Enero' when `bol`.`mes` = '2' then 'Febrero' when `bol`.`mes` = '3' then 'Marzo' when `bol`.`mes` = '4' then 'Abril' when `bol`.`mes` = '5' then 'Mayo' when `bol`.`mes` = '6' then 'Junio' when `bol`.`mes` = '7' then 'Julio' when `bol`.`mes` = '8' then 'Agosto' when `bol`.`mes` = '9' then 'Setiembre' when `bol`.`mes` = '10' then 'Octubre' when `bol`.`mes` = '11' then 'Noviembre' when `bol`.`mes` = '12' then 'Diciembre' end AS `mes`,`bol`.`montoimponible` AS `montoimponible`,case when `bol`.`cantidad` = 'U' then 'Unico' when `bol`.`cantidad` = 'A' then 'Adicional' end AS `cantidad`,`bol`.`comentario` AS `comentario`,`bol`.`estado` AS `estado` from ((((`boletas` `bol` join `empleados` `empl` on(`empl`.`idempleado` = `bol`.`idempleado`)) join `instituciones` `inst` on(`inst`.`idinstitucion` = `bol`.`idinstitucion`)) join `usuarios` `usur` on(`usur`.`idusuario` = `bol`.`idusuarioregistro`)) left join `usuarios` `usum` on(`usum`.`idusuario` = `bol`.`idusuariomodifico`)) where `bol`.`estado` = '1' order by `bol`.`idboleta` desc */;

/*View structure for view vs_camposbuscar */

/*!50001 DROP TABLE IF EXISTS `vs_camposbuscar` */;
/*!50001 DROP VIEW IF EXISTS `vs_camposbuscar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_camposbuscar` AS select `campos`.`idcampo` AS `idcampo`,`campos`.`tipo` AS `tipo`,`campos`.`nombre` AS `text` from `campos` order by 2 */;

/*View structure for view vs_conceptos */

/*!50001 DROP TABLE IF EXISTS `vs_conceptos` */;
/*!50001 DROP VIEW IF EXISTS `vs_conceptos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_conceptos` AS select `conc`.`idconcepto` AS `idconcepto`,`conc`.`idboleta` AS `idboleta`,case when `camp`.`tipo` = 'I' then 'Ingreso' when `camp`.`tipo` = 'E' then 'Egreso' end AS `tipo`,`camp`.`nombre` AS `nombre`,`conc`.`monto` AS `monto`,`bol`.`anio` AS `anio`,`conc`.`estado` AS `estado` from ((`conceptos` `conc` join `campos` `camp` on(`camp`.`idcampo` = `conc`.`idcampo`)) join `boletas` `bol` on(`bol`.`idboleta` = `conc`.`idboleta`)) */;

/*View structure for view vs_empleados */

/*!50001 DROP TABLE IF EXISTS `vs_empleados` */;
/*!50001 DROP VIEW IF EXISTS `vs_empleados` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_empleados` AS select `empl`.`idempleado` AS `idempleado`,concat(`usu`.`apellidosuser`,' ',`usu`.`nombresuser`) AS `encargadoregistro`,`empl`.`codigomodular` AS `codigomodular`,`empl`.`codigodni` AS `codigodni`,concat(`empl`.`apellidos`,' ',`empl`.`nombres`) AS `empleado`,`empl`.`fecharegistro` AS `fecharegistro` from (`empleados` `empl` join `usuarios` `usu` on(`usu`.`idusuario` = `empl`.`idusuarioregistro`)) */;

/*View structure for view vs_empleadosbuscar */

/*!50001 DROP TABLE IF EXISTS `vs_empleadosbuscar` */;
/*!50001 DROP VIEW IF EXISTS `vs_empleadosbuscar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_empleadosbuscar` AS select `empleados`.`idempleado` AS `idempleado`,concat(`empleados`.`apellidos`,' ',`empleados`.`nombres`) AS `text` from `empleados` order by 2 */;

/*View structure for view vs_historico */

/*!50001 DROP TABLE IF EXISTS `vs_historico` */;
/*!50001 DROP VIEW IF EXISTS `vs_historico` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_historico` AS select `hist`.`idhistorico` AS `idhistorico`,`hist`.`idboleta` AS `idboleta`,concat(`empl`.`apellidos`,' ',`empl`.`nombres`) AS `empleado`,`inst`.`nombre` AS `nombre`,case when `hist`.`activo` = '1' then 'Activo' when `hist`.`activo` = '0' then 'Pensionista' end AS `activo`,`hist`.`anio` AS `anio`,case when `hist`.`mes` = '1' then 'Enero' when `hist`.`mes` = '2' then 'Febrero' when `hist`.`mes` = '3' then 'Marzo' when `hist`.`mes` = '4' then 'Abril' when `hist`.`mes` = '5' then 'Mayo' when `hist`.`mes` = '6' then 'Junio' when `hist`.`mes` = '7' then 'Julio' when `hist`.`mes` = '8' then 'Agosto' when `hist`.`mes` = '9' then 'Setiembre' when `hist`.`mes` = '10' then 'Octubre' when `hist`.`mes` = '11' then 'Noviembre' when `hist`.`mes` = '12' then 'Diciembre' end AS `mes`,concat(`usu`.`apellidosuser`,' ',`usu`.`nombresuser`) AS `encargado`,`hist`.`fechamodifico` AS `fecha`,`hist`.`accion` AS `accion` from (((`historico` `hist` join `empleados` `empl` on(`empl`.`idempleado` = `hist`.`idempleado`)) join `instituciones` `inst` on(`inst`.`idinstitucion` = `hist`.`idinstitucion`)) join `usuarios` `usu` on(`usu`.`idusuario` = `hist`.`idusuariomodifico`)) order by `hist`.`idhistorico` desc */;

/*View structure for view vs_instituciones */

/*!50001 DROP TABLE IF EXISTS `vs_instituciones` */;
/*!50001 DROP VIEW IF EXISTS `vs_instituciones` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_instituciones` AS select `instituciones`.`idinstitucion` AS `idinstitucion`,`instituciones`.`nombre` AS `text` from `instituciones` order by 2 */;

/*View structure for view vs_instituciones_full */

/*!50001 DROP TABLE IF EXISTS `vs_instituciones_full` */;
/*!50001 DROP VIEW IF EXISTS `vs_instituciones_full` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_instituciones_full` AS select `inst`.`idinstitucion` AS `idinstitucion`,`inst`.`codlegacy` AS `codlegacy`,`inst`.`codactual` AS `codactual`,`inst`.`nombre` AS `nombre`,concat(`usu`.`apellidosuser`,' ',`usu`.`nombresuser`) AS `usuarioregistro` from (`instituciones` `inst` join `usuarios` `usu` on(`usu`.`idusuario` = `inst`.`idusuarioregistro`)) */;

/*View structure for view vs_usuarios */

/*!50001 DROP TABLE IF EXISTS `vs_usuarios` */;
/*!50001 DROP VIEW IF EXISTS `vs_usuarios` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vs_usuarios` AS select `usu`.`idusuario` AS `idusuario`,concat(`usu`.`apellidosuser`,' ',`usu`.`nombresuser`) AS `usuario`,`usu`.`nomuser` AS `nomuser`,`usu`.`correo` AS `correo`,`usu`.`numerodni` AS `numerodni`,`usu`.`claveacceso` AS `claveacceso`,`usu`.`nivelacceso` AS `nivelacceso`,`usu`.`fotoperfil` AS `fotoperfil`,`usu`.`fecharegistro` AS `fecharegistro`,`usu`.`fechabaja` AS `fechabaja`,`usu`.`estado` AS `estado` from `usuarios` `usu` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
