
-- Procedimiento para Inicio y Cierre de Sesion 

-- *************** Inicio de Sesion ********************
DELIMITER $$
CREATE PROCEDURE spu_usuarios_login(IN _nomuser VARCHAR(30))
BEGIN
	SELECT *
	FROM usuarios WHERE nomuser = _nomuser AND estado = '1';
END $$


-- *************** Actualizar la contraseña ********************
DELIMITER $$
CREATE PROCEDURE spu_usuarios_actualizarclave
(
	IN _idusuario 	  INT,
	IN _claveacceso   VARCHAR(100)
)
BEGIN 
	UPDATE usuarios SET claveacceso = _claveacceso WHERE idusuario = _idusuario;
END $$


-- *************** Listar Usuarios ********************
DELIMITER $$
CREATE PROCEDURE spu_listar_usuarios()
BEGIN 
	SELECT * FROM usuarios;
END $$

-- Procedimiento para la interfaz de usuarios
DELIMITER $$
CREATE PROCEDURE spu_buscarUsuariosRol
(
	IN _nivelacceso CHAR(1),
	IN _search 	VARCHAR(50)
)
BEGIN
	SELECT * FROM vs_usuarios
		WHERE nivelacceso = _nivelacceso AND usuario LIKE CONCAT('%', _search ,'%');
END $$

-- Procedimiento para la busqueda por nombres de usuarios
DELIMITER $$
CREATE PROCEDURE spu_buscarUsuarios
(
	IN _search 	VARCHAR(50)
)
BEGIN
	SELECT * FROM vs_usuarios
		WHERE usuario LIKE CONCAT('%', _search ,'%');
END $$


DELIMITER $$
CREATE PROCEDURE spu_registrar_usuarios
(
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
		VALUES (_apellidosuser, _nombresuser, _nomuser, _correo , _numerodni , '$2y$10$AwZ0iRnc.ikzypaIA1Z7yeLVwC.ZRpHH4I9oi5VUehbyW.ls5uzdu' ,_fotoperfil,_nivelacceso, _telefono);
END $$


DELIMITER $$
CREATE PROCEDURE spu_modificar_usuarios
(
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
END $$

-- CALL spu_modificar_usuarios (2,'Peve Andazabal', 'Jesus','jesuspeve','U','')

DELIMITER $$
CREATE PROCEDURE spu_usuarios_obtener(IN _idusuario INT)
BEGIN 
	SELECT * FROM usuarios
		WHERE idusuario = _idusuario;
END $$

-- Procedimientos para cambiar los niveles de acceso 
DELIMITER $$
CREATE PROCEDURE spu_nivelAdmin (IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'A' 
		WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_nivelUsuario (IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'U' 
		WHERE idusuario = _idusuario;
END $$

DELIMITER $$
CREATE PROCEDURE spu_nivelRevisador (IN _idusuario INT)
BEGIN 
	UPDATE usuarios SET  nivelacceso = 'R' 
		WHERE idusuario = _idusuario;
END $$


DELIMITER $$
CREATE PROCEDURE spu_estadoUsuario
(
	IN _idusuario INT,
	IN _estado CHAR(1)
)
BEGIN
	UPDATE usuarios SET estado = _estado 
		WHERE idusuario = _idusuario;
END $$


-- Procedimientos para la tabla Instituciones

DELIMITER $$
CREATE PROCEDURE spu_listar_instituciones()
BEGIN 
	SELECT * FROM instituciones;
END $$

DELIMITER $$
CREATE PROCEDURE spu_instituciones_obtener(IN _idinstitucion INT)
BEGIN
	SELECT * FROM instituciones
		WHERE idinstitucion = _idinstitucion;
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_instituciones
(
	IN _idusuarioregistro	INT,
	IN _codlegacy		CHAR(8),
	IN _codactual		CHAR(8),
	IN _nombre		VARCHAR(80)	
)
BEGIN 
	INSERT INTO instituciones (idusuarioregistro, codlegacy,codactual,nombre)
		VALUES (_idusuarioregistro, _codlegacy,_codactual, _nombre);

END $$

DELIMITER $$
CREATE PROCEDURE spu_modificar_instituciones
(
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

END $$

-- Procedimiento para la busqueda por autocompletado

DELIMITER $$
CREATE PROCEDURE spu_instituciones_buscar(IN _search VARCHAR(30))
BEGIN 
	SELECT *
	FROM vs_instituciones
	WHERE vs_instituciones.text LIKE CONCAT('%' , _search ,  '%');
END $$

DELIMITER $$
CREATE PROCEDURE spu_instituciones_eliminar(IN _idinstitucion INT)
BEGIN
	DELETE FROM instituciones WHERE idinstitucion = _idinstitucion;
END $$



-- Procedimientos para la tabla Empleados


-- Procedimiento para el autcompletado

DELIMITER $$
CREATE PROCEDURE spu_empleados_buscar(IN _search VARCHAR(30))
BEGIN 
	SELECT *
	FROM vs_empleadosbuscar
	WHERE vs_empleadosbuscar.text LIKE CONCAT('%' , _search ,  '%');
END $$

DELIMITER $$
CREATE PROCEDURE spu_empleados_obtener(IN _idempleado INT)
BEGIN 
	SELECT * FROM empleados
		WHERE idempleado = _idempleado;
END $$

-- Buscar el nombre del Empleado

DELIMITER $$
CREATE PROCEDURE spu_buscar_empleados(IN _search VARCHAR(80))
BEGIN 
		SELECT * FROM vs_empleados
		WHERE empleado LIKE CONCAT('%', _search , '%');
END $$


DELIMITER $$
CREATE PROCEDURE spu_registrar_empleados
(
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
END $$


DELIMITER $$
CREATE PROCEDURE spu_modificar_empleados
(
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
END $$



-- Procedimientos para la tabla Boletas

DELIMITER $$
CREATE PROCEDURE spu_listar_boletas()
BEGIN 
	SELECT * FROM boletas
		WHERE estado = '1';
END $$

-- Procedimiento para la interfaz de registro de Boletas
DELIMITER $$
CREATE PROCEDURE spu_listarUltimoregistro(IN _limit TINYINT)
BEGIN 
	SELECT * FROM vs_boletasRevisar
		WHERE estado = '1'
		LIMIT _limit;
END $$

-- Obtener el registro de una boleta por revisar
DELIMITER $$
CREATE PROCEDURE spu_obtener_boletas(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletasRevisar
		WHERE idboleta = _idboleta;
END $$

-- Obtener el registro de una boleta revisada 
DELIMITER $$
CREATE PROCEDURE spu_obtener_boletasR(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletas
		WHERE idboleta = _idboleta;
END $$

-- Obtener el registro de una boleta revisada 
DELIMITER $$
CREATE PROCEDURE spu_obtener_boletasO(IN _idboleta INT)
BEGIN 
	SELECT * FROM  vs_boletasObservadas
		WHERE idboleta = _idboleta;
END $$

-- Buscar una boleta por el nombre del empleado
DELIMITER $$
CREATE PROCEDURE spu_buscarBoletaempleados(IN _search VARCHAR (30))
BEGIN 
	SELECT * FROM vs_boletas
		WHERE empleado LIKE CONCAT( '%' , _search , '%')
		AND estado = '1';
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_boletas
(
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

END $$

DELIMITER $$
CREATE PROCEDURE spu_modificar_boletas
(
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
		fechamodifico		=  NOW()
	WHERE idboleta = _idboleta;
	
END $$


-- Elimina un registro fisico : Para la interfaz de boletas revisadas 
DELIMITER $$
CREATE PROCEDURE spu_eliminar_boletas 
(	
	IN _idboleta INT
	
)
BEGIN 
		
	DELETE FROM conceptos 
		WHERE idboleta = _idboleta;

	DELETE FROM boletas 
		WHERE idboleta = _idboleta;

END $$

-- Busqueda en la interfaz de Boletas en general
DELIMITER $$
CREATE PROCEDURE spu_buscafechaempleados
(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletas
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END $$

-- Procedimiento para la vista de revisiones
DELIMITER $$
CREATE PROCEDURE spu_buscafechaempleadosRevisar
(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletasRevisar
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END $$

DELIMITER $$
CREATE PROCEDURE spu_buscafechaObservadas
(
	IN _anio CHAR(4),
	IN _search VARCHAR (30)
)
BEGIN 
	SELECT * FROM vs_boletasObservadas 
		WHERE anio = _anio AND empleado LIKE CONCAT('%', _search ,'%');
	
END $$


-- Procedimiento para validar la Boleta
DELIMITER $$
CREATE PROCEDURE spu_validarBoleta
(
	IN _idempleado INT,
	IN _anio CHAR(4),
	IN _mes TINYINT

)
BEGIN 
	SELECT * FROM boletas
		WHERE idempleado = _idempleado AND anio = _anio AND mes = _mes AND cantidad = 'U';
END $$


-- Procedimiento para validar el correo
DELIMITER $$
CREATE PROCEDURE spu_validarCorreo(IN _correo VARCHAR(70))
BEGIN
	SELECT * FROM usuarios
		WHERE correo = _correo AND estado = '1';
END $$

-- Procedimiento para validar el dni

DELIMITER $$
CREATE PROCEDURE spu_validarDni(IN _numerodni VARCHAR(9))
BEGIN
	SELECT * FROM usuarios
		WHERE  numerodni = _numerodni AND estado = '1';
END $$


DELIMITER $$
CREATE PROCEDURE spu_buscarAnioempleados
(
	IN _anio CHAR(4),
	IN _search VARCHAR(30)
)
BEGIN 
	SELECT * FROM vs_boletas
		WHERE  anio = _anio AND empleado LIKE CONCAT('%', _search ,'%')
		AND estado = '1';
END $$

-- Procedimiento para dar el OK a la boleta
DELIMITER $$
CREATE PROCEDURE spu_boletaRevisada (IN _idboleta INT)
BEGIN 
	UPDATE boletas SET estado = '2' 
		WHERE idboleta = _idboleta;
END $$

-- Procedimiento para observar la boleta
DELIMITER $$
CREATE PROCEDURE spu_boletaObservada (IN _idboleta INT)
BEGIN 
		UPDATE boletas SET estado = '3' -- estado 3 = boleta observada 
			WHERE idboleta = _idboleta;
END $$

-- Procedimiento para poner en revision la boleta
DELIMITER $$
CREATE PROCEDURE spu_boletaRevision (IN _idboleta INT)
BEGIN 
		UPDATE boletas SET estado = '1' -- estado 1 = boleta en revision 
			WHERE idboleta = _idboleta;
END $$


 -- Procedimientos para la tabla campos - autcompletado
 
DELIMITER $$
CREATE PROCEDURE spu_buscar_campos(IN _search VARCHAR(30))
BEGIN 
		SELECT * FROM vs_camposbuscar
		WHERE vs_camposbuscar.text LIKE CONCAT('%', _search , '%');
END $$

-- Procedimientos para la tabla conceptos

DELIMITER $$
CREATE PROCEDURE spu_listar_conceptos()
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE monto > 0;
END $$

DELIMITER $$
CREATE PROCEDURE spu_obtener_conceptos(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND estado = '1';
END $$


DELIMITER $$
CREATE PROCEDURE spu_eliminar_concepto(IN _idconcepto INT)
BEGIN
	DELETE FROM conceptos WHERE idconcepto = _idconcepto;
END $$


DELIMITER $$
CREATE PROCEDURE spu_obtener_ingresos(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso';
END $$

DELIMITER $$
CREATE PROCEDURE spu_obtener_ingresosCol1(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso' 
		ORDER BY idconcepto LIMIT 10 OFFSET 0;
END $$

DELIMITER $$
CREATE PROCEDURE spu_obtener_ingresosCol2(IN _idboleta INT)
BEGIN 

	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Ingreso' 
		ORDER BY idconcepto LIMIT 20 OFFSET 10;
END $$
		
DELIMITER $$
CREATE PROCEDURE spu_obtener_egresos(IN _idboleta INT)
BEGIN 
	SELECT * FROM vs_conceptos
		WHERE idboleta = _idboleta AND monto > 0 AND tipo = 'Egreso';
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_conceptos
(
	IN _idboleta		INT,
	IN _idcampo		INT,
	IN _monto		DOUBLE(8,3)
)
BEGIN 
	INSERT INTO conceptos (idboleta , idcampo, monto) VALUES
		(_idboleta, _idcampo, _monto);
END $$


DELIMITER $$
CREATE PROCEDURE spu_sumarIngresos (IN _idboleta INT)
BEGIN 
	SELECT SUM(monto) AS ingreso FROM vs_conceptos WHERE tipo = 'Ingreso' AND  idboleta = _idboleta;
END $$


DELIMITER $$
CREATE PROCEDURE spu_sumarEgresos (IN _idboleta INT)
BEGIN 
	SELECT SUM(monto) AS egreso FROM vs_conceptos WHERE tipo = 'Egreso' AND  idboleta = _idboleta;
END $$


-- Procedimientos para los graficos


-- Procedimiento para saber cuntos usuarios hay por cada nivel de acceso
DELIMITER $$
CREATE PROCEDURE nivelesUsuario()
BEGIN 
	SELECT CASE 
		WHEN nivelacceso = 'A' THEN 'Administrador'
		WHEN nivelacceso = 'U' THEN 'Usuario'
		WHEN nivelacceso = 'R' THEN 'Revisador'
	END 'nivelacceso', COUNT(idusuario) AS 'Total'
	FROM usuarios
	WHERE estado = '1'
	GROUP BY nivelacceso;			
END $$

DELIMITER $$
CREATE PROCEDURE spu_nivlesUsuario_fecha(IN _fechainicio DATE, IN _fechafin DATE)
BEGIN
	SELECT CASE 
		WHEN nivelacceso = 'A' THEN 'Administrador'
		WHEN nivelacceso = 'U' THEN 'Usuario'
		WHEN nivelacceso = 'R' THEN 'Revisador'
	END 'nivelacceso', COUNT(idusuario) AS 'Total'
	FROM usuarios
	WHERE fecharegistro BETWEEN _fechainicio AND LAST_DAY(_fechafin) AND estado = '1'
	GROUP BY nivelacceso;	
END $$

-- Procedimiento para saber cuantas boletas han sido registradas por usuario
DELIMITER $$
CREATE PROCEDURE spu_boletasUsuario()
BEGIN
	SELECT 	CONCAT(USU.apellidosuser , ' ', USU.nombresuser) AS 'Usuario' , COUNT(BOL.idboleta) AS 'Total'
		FROM boletas BOL
		INNER JOIN usuarios USU ON USU.idusuario = BOL.idusuarioregistro
		WHERE BOL.estado = '2' 
		GROUP BY BOL.idusuarioregistro;
END $$

DELIMITER $$
CREATE PROCEDURE spu_boletasUsuarioFecha(IN _fechainicio DATE, IN _fechafin DATE)
BEGIN
	SELECT 	CONCAT(USU.apellidosuser , ' ', USU.nombresuser) AS 'Usuario' , COUNT(BOL.idboleta) AS 'Total'
		FROM boletas BOL
		INNER JOIN usuarios USU ON USU.idusuario = BOL.idusuarioregistro
		WHERE BOL.fecharegistro BETWEEN _fechainicio AND LAST_DAY(_fechafin) AND BOL.estado = '2' 
		GROUP BY BOL.idusuarioregistro;
END $$

-- Procedimiento para saber cuantas boletas hay revisadas y por revisar

DELIMITER $$
CREATE PROCEDURE spu_boletasEstado()
BEGIN
		SELECT 
		CASE 
				WHEN BOL.estado  =  '1' THEN 'Sin revisar'
				WHEN BOL.estado  =  '2' THEN 'Revisado'
				WHEN BOL.estado  =  '3' THEN 'Observado'
		END 'estadoBoletas' , COUNT(BOL.`idboleta`) AS 'totalBoletas'
		FROM boletas BOL
		GROUP BY BOL.estado;
END $$

DELIMITER $$
CREATE PROCEDURE spu_boletasEstadoFecha(IN _fechainicio DATE, IN _fechafin DATE)
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
END $$
		

