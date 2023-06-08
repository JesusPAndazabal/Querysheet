CREATE VIEW vs_empleados 
AS 
	SELECT EMPL.idempleado, CONCAT(USU.apellidosuser , ' ' , USU.nombresuser) AS 'encargadoregistro' , EMPL.codigomodular, EMPL.codigodni ,CONCAT(EMPL.apellidos, ' ', EMPL.nombres) AS 'empleado'  ,EMPL.fecharegistro
	FROM empleados EMPL
	INNER JOIN usuarios USU ON USU.`idusuario` = EMPL.`idusuarioregistro`;

-- Vista para la tabla
CREATE VIEW vs_instituciones_full
AS
	SELECT INST.idinstitucion , INST.codlegacy , INST.codactual,INST.nombre,CONCAT(USU.apellidosuser , ' ' , USU.nombresuser) AS 'usuarioregistro'
		FROM instituciones INST
		INNER JOIN usuarios USU ON USU.idusuario = INST.idusuarioregistro;
		


CREATE VIEW vs_usuarios 
AS
SELECT USU.`idusuario` , CONCAT(USU.`apellidosuser` , ' ', USU.`nombresuser`) AS 'usuario' , USU.nomuser , USU.correo , USU.numerodni, USU.`claveacceso`,USU.`nivelacceso`,USU.`fotoperfil`,USU.fecharegistro,USU.fechabaja ,USU.`estado`
FROM usuarios USU;


-- Vista para el autocompletado
CREATE VIEW vs_instituciones AS
SELECT instituciones.`idinstitucion`, instituciones.`nombre` AS 'text'
FROM instituciones
ORDER BY 2;

CREATE VIEW vs_empleadosbuscar AS
SELECT empleados.`idempleado`, CONCAT(empleados.`apellidos`, ' ' , empleados.`nombres`) AS 'text'
FROM empleados
ORDER BY 2;

CREATE VIEW vs_camposbuscar AS
SELECT campos.idcampo, campos.tipo, campos.nombre AS 'text'
FROM campos
ORDER BY 2;


-- Vista para las boletas revisadas

CREATE VIEW vs_boletas AS 

	SELECT BOL.idboleta, EMPL.idempleado, CONCAT(EMPL.apellidos, ' ' , EMPL.nombres) AS empleado , EMPL.codigomodular, EMPL.codigodni , INST.idinstitucion , 
	INST.nombre, INST.codlegacy , INST.codactual,CONCAT(USUR.apellidosuser,' ', USUR.nombresuser) AS 'usuarioregistro', CONCAT(USUM.apellidosuser,' ', USUM.nombresuser) AS 'usuariomodifico',
	 
		CASE 
			WHEN BOL.activo = '1' THEN 'Activo'
			WHEN BOL.activo = '0' THEN 'Pensionista'
		END 'activo',
		CASE 
			WHEN BOL.tipoempleado = 'C' THEN 'Contratado'
			WHEN BOL.tipoempleado = 'N' THEN 'Nombrado'
		END 'tipoempleado',
		CASE 
			WHEN BOL.nivel = 'I' THEN 'Inicial'
			WHEN BOL.nivel = 'P' THEN 'Primaria'
			WHEN BOL.nivel = 'S' THEN 'Secundaria'
			WHEN BOL.nivel = 'N' THEN 'Nocturna'
			WHEN BOL.nivel = 'C' THEN 'Cetpro'
		
		 END 'nivel' , BOL.cargo,  BOL.anio,
		 CASE 
			WHEN BOL.mes = '1' THEN 'Enero'
			WHEN BOL.mes = '2' THEN 'Febrero'
			WHEN BOL.mes = '3' THEN 'Marzo'
			WHEN BOL.mes = '4' THEN 'Abril'
			WHEN BOL.mes = '5' THEN 'Mayo'
			WHEN BOL.mes = '6' THEN 'Junio'
			WHEN BOL.mes = '7' THEN 'Julio'
			WHEN BOL.mes = '8' THEN 'Agosto'
			WHEN BOL.mes = '9' THEN 'Setiembre'
			WHEN BOL.mes = '10' THEN 'Octubre'
			WHEN BOL.mes = '11' THEN 'Noviembre'
			WHEN BOL.mes = '12' THEN 'Diciembre'
		 END 'mes', BOL.montoimponible,
		 CASE 
			WHEN BOL.cantidad = 'U' THEN 'Unica'
			WHEN BOL.cantidad = 'A' THEN 'Adicional' 
		 END 'cantidad', BOL.comentario, BOL.estado
	FROM boletas BOL
	INNER JOIN empleados EMPL ON EMPL.idempleado = BOL.idempleado
	INNER JOIN instituciones INST ON INST.idinstitucion = BOL.idinstitucion
	INNER JOIN usuarios USUR ON USUR.idusuario = BOL.idusuarioregistro
	LEFT JOIN usuarios USUM ON USUM.idusuario = BOL.idusuariomodifico
	WHERE  BOL.estado = '2'
	ORDER BY BOL.idboleta DESC;


-- Vista para las boletas por revisar
CREATE VIEW vs_boletasRevisar AS 

	SELECT BOL.idboleta, EMPL.idempleado, CONCAT(EMPL.apellidos, ' ' , EMPL.nombres) AS empleado , EMPL.codigomodular, EMPL.codigodni , INST.idinstitucion , 
	INST.nombre, INST.codlegacy , INST.codactual, CONCAT(USUR.apellidosuser,' ', USUR.nombresuser) AS 'usuarioregistro', CONCAT(USUM.apellidosuser,' ', USUM.nombresuser) AS 'usuariomodifico',
	BOL.fecharegistro, BOL.fechamodifico,
		CASE 
			WHEN BOL.activo = '1' THEN 'Activo'
			WHEN BOL.activo = '0' THEN 'Pensionista'
		END 'activo',
		CASE 
			WHEN BOL.tipoempleado = 'C' THEN 'Contratado'
			WHEN BOL.tipoempleado = 'N' THEN 'Nombrado'
		END 'tipoempleado',
		CASE 
			WHEN BOL.nivel = 'I' THEN 'Inicial'
			WHEN BOL.nivel = 'P' THEN 'Primaria'
			WHEN BOL.nivel = 'S' THEN 'Secundaria'
			WHEN BOL.nivel = 'N' THEN 'Nocturna'
			WHEN BOL.nivel = 'C' THEN 'Cetpro'
		
		 END 'nivel' , BOL.cargo,  BOL.anio,
		 CASE 
			WHEN BOL.mes = '1' THEN 'Enero'
			WHEN BOL.mes = '2' THEN 'Febrero'
			WHEN BOL.mes = '3' THEN 'Marzo'
			WHEN BOL.mes = '4' THEN 'Abril'
			WHEN BOL.mes = '5' THEN 'Mayo'
			WHEN BOL.mes = '6' THEN 'Junio'
			WHEN BOL.mes = '7' THEN 'Julio'
			WHEN BOL.mes = '8' THEN 'Agosto'
			WHEN BOL.mes = '9' THEN 'Setiembre'
			WHEN BOL.mes = '10' THEN 'Octubre'
			WHEN BOL.mes = '11' THEN 'Noviembre'
			WHEN BOL.mes = '12' THEN 'Diciembre'
		 END 'mes', BOL.montoimponible,
		 CASE 
			WHEN BOL.cantidad = 'U' THEN 'Unico'
			WHEN BOL.cantidad = 'A' THEN 'Adicional' 
		 END 'cantidad', BOL.comentario, BOL.estado
	FROM boletas BOL
	INNER JOIN empleados EMPL ON EMPL.idempleado = BOL.idempleado
	INNER JOIN instituciones INST ON INST.idinstitucion = BOL.idinstitucion
	INNER JOIN usuarios USUR ON USUR.idusuario = BOL.idusuarioregistro
	LEFT JOIN usuarios USUM ON USUM.idusuario = BOL.idusuariomodifico
	WHERE  BOL.estado = '1'
	ORDER BY BOL.idboleta DESC;

-- Vista para las boletas Observadas
CREATE VIEW vs_boletasObservadas 
AS 

	SELECT BOL.idboleta, EMPL.idempleado, CONCAT(EMPL.apellidos, ' ' , EMPL.nombres) AS empleado , EMPL.codigomodular, EMPL.codigodni , INST.idinstitucion , 
	INST.nombre, INST.codlegacy , INST.codactual, CONCAT(USUR.apellidosuser,' ', USUR.nombresuser) AS 'usuarioregistro', CONCAT(USUM.apellidosuser,' ', USUM.nombresuser) AS 'usuariomodifico',
	BOL.fecharegistro, BOL.fechamodifico,
		CASE 
			WHEN BOL.activo = '1' THEN 'Activo'
			WHEN BOL.activo = '0' THEN 'Pensionista'
		END 'activo',
		CASE 
			WHEN BOL.tipoempleado = 'C' THEN 'Contratado'
			WHEN BOL.tipoempleado = 'N' THEN 'Nombrado'
		END 'tipoempleado',
		CASE 
			WHEN BOL.nivel = 'I' THEN 'Inicial'
			WHEN BOL.nivel = 'P' THEN 'Primaria'
			WHEN BOL.nivel = 'S' THEN 'Secundaria'
			WHEN BOL.nivel = 'N' THEN 'Nocturna'
			WHEN BOL.nivel = 'C' THEN 'Cetpro'
		
		 END 'nivel' , BOL.cargo,  BOL.anio,
		 CASE 
			WHEN BOL.mes = '1' THEN 'Enero'
			WHEN BOL.mes = '2' THEN 'Febrero'
			WHEN BOL.mes = '3' THEN 'Marzo'
			WHEN BOL.mes = '4' THEN 'Abril'
			WHEN BOL.mes = '5' THEN 'Mayo'
			WHEN BOL.mes = '6' THEN 'Junio'
			WHEN BOL.mes = '7' THEN 'Julio'
			WHEN BOL.mes = '8' THEN 'Agosto'
			WHEN BOL.mes = '9' THEN 'Setiembre'
			WHEN BOL.mes = '10' THEN 'Octubre'
			WHEN BOL.mes = '11' THEN 'Noviembre'
			WHEN BOL.mes = '12' THEN 'Diciembre'
		 END 'mes', BOL.montoimponible,
		 CASE 
			WHEN BOL.cantidad = 'U' THEN 'Unico'
			WHEN BOL.cantidad = 'A' THEN 'Adicional' 
		 END 'cantidad', BOL.comentario ,  BOL.estado
	FROM boletas BOL
	INNER JOIN empleados EMPL ON EMPL.idempleado = BOL.idempleado
	INNER JOIN instituciones INST ON INST.idinstitucion = BOL.idinstitucion
	INNER JOIN usuarios USUR ON USUR.idusuario = BOL.idusuarioregistro
	LEFT JOIN usuarios USUM ON USUM.idusuario = BOL.idusuariomodifico
	WHERE  BOL.estado = '3'
	ORDER BY BOL.idboleta DESC;


CREATE VIEW vs_conceptos AS
SELECT CONC.`idconcepto` , CONC.`idboleta` ,
		CASE 
			WHEN CAMP.`tipo` = 'I' THEN 'Ingreso'
			WHEN CAMP.`tipo` = 'E' THEN 'Egreso' 
		END 'tipo' , CAMP.`nombre` , CONC.`monto`,BOL.anio, CONC.estado
FROM conceptos CONC
INNER JOIN campos CAMP ON CAMP.`idcampo` = CONC.`idcampo`
INNER JOIN boletas BOL ON BOL.idboleta = CONC.idboleta;

-- Vista para el historico de las boletas
DROP VIEW vs_historico AS
SELECT HIST.idhistorico , HIST.idboleta, CONCAT(EMPL.apellidos, ' ' , EMPL.nombres) AS empleado , INST.nombre, 
		CASE 
			WHEN HIST.activo = '1' THEN 'Activo'
			WHEN HIST.activo = '0' THEN 'Pensionista'
		END 'activo',  HIST.anio,
		 CASE 
			WHEN HIST.mes = '1' THEN 'Enero'
			WHEN HIST.mes = '2' THEN 'Febrero'
			WHEN HIST.mes = '3' THEN 'Marzo'
			WHEN HIST.mes = '4' THEN 'Abril'
			WHEN HIST.mes = '5' THEN 'Mayo'
			WHEN HIST.mes = '6' THEN 'Junio'
			WHEN HIST.mes = '7' THEN 'Julio'
			WHEN HIST.mes = '8' THEN 'Agosto'
			WHEN HIST.mes = '9' THEN 'Setiembre'
			WHEN HIST.mes = '10' THEN 'Octubre'
			WHEN HIST.mes = '11' THEN 'Noviembre'
			WHEN HIST.mes = '12' THEN 'Diciembre'
		 END 'mes', CONCAT(USU.apellidosuser , ' ' , USU.nombresuser) AS 'encargado', HIST.fechamodifico AS 'fecha' , HIST.accion 
	FROM historico HIST
	INNER JOIN empleados EMPL ON EMPL.idempleado = HIST.idempleado
	INNER JOIN instituciones INST ON INST.idinstitucion = HIST.idinstitucion
	INNER JOIN usuarios USU ON USU.idusuario = HIST.idusuariomodifico
	ORDER BY HIST.idhistorico DESC;
	
