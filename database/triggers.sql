
DELIMITER $$
DROP TRIGGER historico_insert
AFTER INSERT ON boletas
FOR EACH ROW 
BEGIN
	INSERT INTO historico (idboleta,idempleado,idinstitucion,idusuariomodifico,activo,nivel,cargo,anio,mes,montoimponible,cantidad,comentario,fechamodifico,estado,accion)
		VALUES (new.idboleta, new.idempleado, new.idinstitucion, new.idusuariomodifico, new.activo, new.nivel, new.cargo, new.anio, new.mes, new.montoimponible, new.cantidad,new.comentario, NOW(), new.estado, 'Registrado');
END $$


DELIMITER $$
DROP TRIGGER historico_update
AFTER UPDATE ON boletas	
FOR EACH ROW
BEGIN
		INSERT INTO historico (idboleta,idempleado,idinstitucion,idusuariomodifico,activo,nivel,cargo,anio,mes,montoimponible,cantidad,comentario,fechamodifico,estado,accion)
			VALUES (new.idboleta, new.idempleado, new.idinstitucion, new.idusuariomodifico, new.activo, new.nivel, new.cargo, new.anio, new.mes, new.montoimponible, new.cantidad,new.comentario, NOW(), new.estado, 'Modificado');
END $$ 


DELIMITER $$
DROP TRIGGER historico_delete
BEFORE DELETE ON boletas	
FOR EACH ROW
BEGIN
	INSERT INTO historico (idboleta,idempleado,idinstitucion,idusuariomodifico,activo,nivel,cargo,anio,mes,montoimponible,cantidad,comentario,fechamodifico,estado,accion)
		VALUES (old.idboleta,old.idempleado, old.idinstitucion, old.idusuariomodifico, old.activo, old.nivel, old.cargo, old.anio, old.mes, old.montoimponible, old.cantidad,old.comentario,NOW(), old.estado, 'Eliminado');
END $$ 

SELECT * FROM historico

