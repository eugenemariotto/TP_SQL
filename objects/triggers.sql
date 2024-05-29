use rrhh_umami;
DROP TRIGGER if exists afterempleadoupdate;
DELIMITER //
CREATE TRIGGER afterempleadoupdate
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF OLD.sueldo <> NEW.sueldo THEN
        INSERT INTO ajustes (id_empleado, fecha_de_ajuste, observaciones, monto_usd)
        VALUES (NEW.id_empleado, CURDATE(), 'Ajuste de sueldo', NEW.sueldo);
    END IF;
END //

DELIMITER ;

DROP TRIGGER if exists afterempleadoinsert;
CREATE TRIGGER afterempleadoinsert
AFTER INSERT ON empleados
FOR EACH ROW
    INSERT INTO fichero (id_empleado, fecha_hora_ingreso)
    VALUES (NEW.id_empleado, NOW()); 


DROP TRIGGER if exists beforeempleadodelete;
DELIMITER //
CREATE TRIGGER beforeempleadodelete
BEFORE DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO rotacion (id_empleado, fecha_de_baja)
    VALUES (OLD.id_empleado, CURDATE());
END //

DELIMITER ;