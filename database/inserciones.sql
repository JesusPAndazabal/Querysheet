
-- Insercion en la tabla usuarios 
INSERT INTO usuarios (apellidosuser , nombresuser,nomuser, correo, numerodni , claveacceso, nivelacceso)VALUES
			('Apolaya', 'Nicanor','78966405' ,'nicoapolaya@gmail.com' , '78966405' ,'querysheet22', 'A');


INSERT INTO usuarios (apellidosuser , nombresuser,nomuser, claveacceso, nivelacceso, fotoperfil)VALUES
			('Apolaya', 'Nicanor','nicoapolaya' ,'123456', 'A','' );
			('peve', 'jesus','jesuspeve' ,'123456', 'A', ''),
			('ramirez', 'jose', 'joseramirez', '123456','U','');
		
		
DELETE FROM usuarios WHERE idusuario = 15
SELECT * FROM usuarios
UPDATE usuarios
	SET claveacceso = '$2y$10$cC0TRZCc1SuJmUQlib7Y4.RuwQX9M8vF1f3Hwl3b9oSkgzjwlAXZ'
	WHERE idusuario = 1;
			
-- Insercion en la tabla Institciones
INSERT INTO instituciones (codlegacy, codactual, nombre) VALUES
			( '2A023005','3A023118','Colegio Jose Pardo y Barreda');


INSERT INTO cargos (cargo) VALUES 
('Profesor por hora'),
('Personal de Limpieza'),
('Director');

SELECT  * FROM boletas 
SELECT * FROM empleados
SELECT * FROM usuarios

INSERT INTO detallecargos (idcargo, idempleado) VALUES 
(2,2);
		SELECT *FROM detallecargos
		
		
-- Insercion en la tabla campos
INSERT INTO campos (tipo,nombre) VALUES
			( 'I', 'basica'),
			( 'I', 'personal'),
			( 'I', 'ael25671'),
			( 'I', 'aeds081'),
			( 'I', 'r.t.pensionab'),
			( 'I', 'd.s.28+front'),
			( 'I', 'ds081'),
			( 'I', 'tph'),
			( 'I', 'diferencial'),
			( 'I', 'familiar'),
			( 'I', 'duo080'),
			( 'I', 'refmov'),
			( 'I', 'du90'),
			( 'I', 'ds19'),
			( 'I', 'ds021'),
			( 'I', 'contrato'),
			( 'I', 'horas extras'),
			( 'I', 'c.vida.palma'),
			( 'I', 'vac.6%'),
			( 'I', 'costcovid'),
			( 'I', 'prepclas'),
			( 'I', 'reunifi'),
			( 'I', 'igv'),
			( 'I', 'compensa.cts'),
			( 'I', 'prop/enseñanza'),
			( 'I', 'gratificacion'),
			( 'I', 'dl25897'),
			( 'I', 'difpens'),
			( 'I', 'du073'),
			( 'I', 'du011'),
			( 'I', 'du065'),
			( 'I', 'du105'),
			( 'I', 'ds068'),
			( 'I', 'ley28254'),
			( 'I', 'reintegro'),
			( 'I', 'aguinaldo'),
			( 'I', 'escolaridad'),
			( 'E', 'dl20530'),
			( 'E', 'dl19990'),
			( 'E', 'snp'),
			( 'E', 'derramadminist'),
			( 'E', 'derramadocente'),
			( 'E', 'prderramag'),
			( 'E', 'ipss vida/seg social'),
			( 'E', 'cooperativa'),
			( 'E', 'coopcyup'),
			( 'E', 'desc.judicial'),
			( 'E', 'ancije'),
			( 'E', 'ptmadmin'),
			( 'E', 'responsabilidad'),
			( 'E', 'sesdis'),
			( 'E', 'fonavi'),
			( 'E', 'multas/caf'),
			( 'E', 'derese'),
			( 'E', 'cafae'),
			( 'E', 'bcomat'),
			( 'E', 'deco83'),
			( 'E', 'caja'),
			( 'E', 'adfpensiones'),
			( 'E', 'sindicato'),
			( 'E', 'pagoindeb'),
			( 'E', 'pbancario'),
			( 'E', 'subcafae'),
			( 'E', 'crahorroc'),
			( 'E', 'tardanza'),
			( 'E', 'licauto');
			

			
INSERT INTO empleados (codigomodular,apellidos,nombres,idusuarioregistro) VALUES
			('08810877', 'Munayco Tasayco', 'Victor',1);
			
INSERT INTO boletas (idempleado,idinstitucion,idusuarioregistro,activo,nivel,cargo,anio,mes) VALUES
			(1,1,1,0,'P','Profesor de aula','1992','5'),
			(1,1,1,0,'P','Profesor de aula','1992','6'),
			(1,1,1,0,'P','Profesor de aula','1992','7'),
			(1,1,1,0,'P','Profesor de aula','1992','8'),
			(1,1,1,0,'P','Profesor de aula','1992','9'),
			(1,1,1,0,'P','Profesor de aula','1992','10'),
			(1,1,1,0,'P','Profesor de aula','1992','11'),
			(1,1,1,0,'P','Profesor de aula','1992','12');
			(2,2,1,1,'S','Director','1992','1'),
			(2,2,1,1,'S','Director','1992','2'),
			(2,2,1,1,'S','Director','1992','3'),
			(2,2,1,1,'S','Director','1992','4'),
			(2,2,1,1,'S','Director','1992','5'),
			(2,2,1,1,'S','Director','1992','6'),
			(2,2,1,1,'S','Director','1992','7'),
			(2,2,1,1,'S','Director','1992','8'),
			(2,2,1,1,'S','Director','1992','9'),
			(2,2,1,1,'S','Director','1992','10'),
			(2,2,1,1,'S','Director','1992','11'),
			(2,2,1,1,'S','Director','1992','12');
			
SELECT * FROM detallecargos
SELECT * FROM instituciones
SELECT * FROM conceptos
SELECT * FROM 
			
INSERT INTO conceptos (idboleta,idcampo,monto) VALUES
			(1, 1, 0.04),
			(1, 2, 50.10),
			(1, 3, 0.04),
			(1, 4, 30.04),
			(1, 5, 0.04),
			(1, 6, 0.14),
			(1, 7, 10.04),
			(1, 8, 0.04),
			(1, 9, 0),
			(1, 10, 0),
			(1, 11, 0),
			(1, 12, 100.04),
			(1, 13, 0),
			(1, 14, 35.00),
			(1, 15, 0),
			(1, 16, 0),
			(1, 17, 0),
			(1, 18, 80.34),
			(1, 19, 0),
			(1, 20, 0),
			(1, 21, 15.46),
			(1, 22, 0),
			(1, 23, 10.04),
			(1, 24, 0),
			(1, 25, 20.04),
			(1, 26, 30.04),
			(1, 27, 0),
			(1, 28, 60.00),
			(1, 29, 0),
			(1, 30, 20.00),
			(1, 31, 0),
			(1, 32, 0),
			(1, 33, 0),
			(1, 34, 120.00),
			(1, 35, 0),
			(1, 36, 0),
			(1, 37, 0),
			(1, 38, 0),
			(1, 39, 0),
			(1, 40, 0),
			(1, 41, 0),
			(1, 42, 0),
			(1, 43, 0),
			(1, 44, 0),
			(1, 45, 0),
			(1, 46, 0),
			(1, 47, 0),
			(1, 48, 0),
			(1, 49, 0),
			(1, 50, 0),
			(1, 51, 0),
			(1, 52, 45.00),
			(1, 53, 0),
			(1, 54, 0),
			(1, 55, 0),
			(1, 56, 0),
			(1, 57, 0),
			(1, 58, 120.00),
			(1, 59, 0),
			(1, 60, 0);

INSERT INTO conceptos (idboleta, idcampo , monto) VALUES 
			(2,1,'0.05'),
			(2,2,'0.02'),
			(2,3,'130.00'),
			(2,4,''),
			(2,5,''),
			(2,6,'5.00'),
			(2,7,'3.00'),
			(2,8,''),
			(2,9,''),
			(2,10,''),
			(2,11,''),
			(2,12,'120.00'),
			(2,13,'50.00'),
			(2,14,''),
			(2,15,''),
			(2,16,''),
			(2,17,'200.00'),
			(2,18,'120.00'),
			(2,19,''),
			(2,20,''),
			(2,21,''),
			(2,22,''),
			(2,23,''),
			(2,24,''),
			(2,25,'50.00'),
			(2,26,'60.00'),
			(2,27,''),
			(2,28,''),
			(2,29,''),
			(2,30,'15.00'),
			(2,31,''),
			(2,32,''),
			(2,33,''),
			(2,34,''),
			(2,35,''),
			(2,36,'5.00'),
			(2,37,'2.00'),
			(2,38,''),
			(2,39,''),
			(2,40,''),
			(2,41,''),
			(2,42,''),
			(2,43,''),
			(2,44,''),
			(2,45,''),
			(2,46,''),
			(2,47,'150.00'),
			(2,48,''),
			(2,49,''),
			(2,50,''),
			(2,51,''),
			(2,52,''),
			(2,53,''),
			(2,54,''),
			(2,55,''),
			(2,56,'0.04'),
			(2,57,''),
			(2,58,''),
			(2,59,''),
			(2,60,'');

		
			
SELECT * FROM usuarios
SELECT * FROM instituciones
SELECT * FROM campos
SELECT * FROM cargos
SELECT *FROM detallecargos
SELECT * FROM empleados
SELECT * FROM boletas
SELECT * FROM conceptos
