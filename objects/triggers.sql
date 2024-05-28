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

use rrhh_umami;
DROP PROCEDURE IF EXISTS registrarevaluacion;

DELIMITER //

CREATE PROCEDURE registrarevaluacion (
    IN p_id_empleado INT,
    IN p_fecha_eval DATE,
    IN p_resultado_evaluacion INT,
    IN p_evaluado_por INT
)
BEGIN
    INSERT INTO evaluacion (id_eval, fecha_eval, resultado_evaluacion, id_empleado, evaluado_por)
    VALUES (NULL, p_fecha_eval, p_resultado_evaluacion, p_id_empleado, p_evaluado_por);
END //

DELIMITER ;

