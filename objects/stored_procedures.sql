USE rrhh_umami;
DROP PROCEDURE IF EXISTS sp_actualizacion_sueldos;
DELIMITER //
CREATE PROCEDURE sp_actualizacion_sueldos (IN inflacion_ars DOUBLE, IN bono_usd DOUBLE)
SQL SECURITY DEFINER
BEGIN
        -- Seleccione los resultados de ambas consultas
    SELECT e.primer_nombre, 
           e.primer_apellido, 
           s_ars.monto_ARS, 
           (s_ars.monto_ARS * inflacion_ars) AS "Ajuste de inflación Q1",
           s_usd.monto_usd, 
           (s_usd.monto_usd * bono_usd) AS "Bono precarización USD"
    FROM empleados AS e
    left JOIN -- encontrar lo que necesitás, no hace un select y lo plasma, solo lo busca.
    (SELECT id_empleado, monto_ARS
        FROM ajustes
        WHERE monto_usd < 2000 AND fecha_de_ajuste LIKE '2023-01-01') AS s_ars 
        ON e.id_empleado = s_ars.id_empleado
    left JOIN (SELECT id_empleado, monto_usd 
        FROM ajustes 
        WHERE monto_usd > 2000 AND fecha_de_ajuste LIKE '2023-01-01'
    ) AS s_usd ON e.id_empleado = s_usd.id_empleado;

END //
DELIMITER ;

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

