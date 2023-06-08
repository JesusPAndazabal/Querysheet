CREATE DATABASE querysheet;
 
USE querysheet;
 
CREATE TABLE usuarios 
(
 idusuario 			INT AUTO_INCREMENT PRIMARY KEY,
 apellidosuser 			VARCHAR(30) NOT NULL,
 nombresuser			VARCHAR(30) NOT NULL,
 nomuser			VARCHAR(30) NOT NULL,
 correo				VARCHAR(70) NOT NULL,
 numerodni			VARCHAR(9)  NOT NULL,	
 claveacceso			VARCHAR(100) NOT NULL,	
 nivelacceso			CHAR(1)	NOT NULL DEFAULT 'U', -- A = administrador  -  U = Invitado - R = Revisador
 fotoperfil			VARCHAR(100) NULL,
 telefono			CHAR(11) NULL,
 fecharegistro			DATETIME NOT NULL DEFAULT NOW(),
 fechabaja			DATETIME NULL,
 estado				CHAR(1) NOT NULL DEFAULT '1',
 CONSTRAINT uk_usu_nom UNIQUE(nomuser),
 CONSTRAINT uk_usu_correo UNIQUE(correo),
 CONSTRAINT uk_usu_dni UNIQUE(numerodni)	
)ENGINE = INNODB;


CREATE TABLE instituciones
(
 idinstitucion  	INT AUTO_INCREMENT PRIMARY KEY,
 idusuarioregistro	INT NOT NULL,
 codlegacy		CHAR(8) NOT NULL,
 codactual		CHAR(8) NOT NULL,
 nombre			VARCHAR(80) NOT NULL,
 fecharegistro		DATETIME NOT NULL DEFAULT NOW(),
 CONSTRAINT fk_insti_idusuarioregistro FOREIGN KEY(idusuarioregistro) REFERENCES usuarios(idusuario)
)ENGINE=INNODB;

CREATE TABLE campos
(
 idcampo 	INT AUTO_INCREMENT PRIMARY KEY,
 tipo		CHAR(1) NOT NULL,
 nombre		VARCHAR(60) NOT NULL
)ENGINE=INNODB;

CREATE TABLE empleados
(
 idempleado		INT AUTO_INCREMENT PRIMARY KEY,
 idusuarioregistro	INT NOT NULL,
 codigomodular		CHAR(8) NOT NULL,
 codigodni		CHAR(10)NOT NULL, 
 apellidos		VARCHAR(30) NOT NULL,
 nombres		VARCHAR(30) NOT NULL, 
 telefono		CHAR(11) NULL,
 fecharegistro		DATETIME NOT NULL DEFAULT NOW(),

 CONSTRAINT fk_prof_idusuarioregistro FOREIGN KEY(idusuarioregistro) REFERENCES usuarios(idusuario),
 CONSTRAINT uk_empl_coddni UNIQUE(codigodni)	
)ENGINE=INNODB;



CREATE TABLE boletas
(
 idboleta			INT AUTO_INCREMENT PRIMARY KEY,
 idempleado			INT NOT NULL,
 idinstitucion			INT NOT NULL,
 idusuarioregistro		INT NOT NULL,
 idusuariomodifico		INT NULL,
 activo				CHAR(1) NOT NULL, 
 tipoempleado			CHAR(1) NULL, 
 nivel				CHAR(1) NOT NULL, 
 cargo				VARCHAR(50) NOT NULL,
 anio 				CHAR(4) NOT NULL,
 mes 				TINYINT NOT NULL,
 montoimponible			DECIMAL(8,2) NULL,
 cantidad			CHAR(1) NOT NULL,
 comentario			MEDIUMTEXT NULL,  
 fecharegistro			DATETIME NOT NULL DEFAULT NOW(),
 fechamodifico			DATETIME NULL,
 fechaeliminacion		DATETIME NULL,				
 estado				CHAR(1) NOT NULL DEFAULT '1', 
 -- Restricciones
 CONSTRAINT fk_bole_idempleado FOREIGN KEY(idempleado) REFERENCES empleados (idempleado),
 CONSTRAINT fk_bole_idinstitucion FOREIGN KEY(idinstitucion) REFERENCES instituciones(idinstitucion),
 CONSTRAINT fk_bole_idusuarireg FOREIGN KEY(idusuarioregistro) REFERENCES usuarios (idusuario),
 CONSTRAINT fk_bole_idusuact FOREIGN KEY(idusuariomodifico) REFERENCES usuarios(idusuario)
)ENGINE=INNODB;

 CREATE TABLE conceptos
(
 idconcepto	INT AUTO_INCREMENT PRIMARY KEY,
 idboleta	INT NOT NULL,
 idcampo	INT NOT NULL,
 monto		DOUBLE(8,3) NULL,
 estado		CHAR(1) NOT NULL DEFAULT '1',

 CONSTRAINT fk_concep_idboleta FOREIGN KEY (idboleta) REFERENCES boletas(idboleta),
 CONSTRAINT fk_concep_idcamp   FOREIGN KEY (idcampo) REFERENCES campos(idcampo)
)ENGINE=INNODB;



