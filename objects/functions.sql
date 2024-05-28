USE rrhh_umami;
-- funciones ------------------------------------------------------------------------------------------------------------------------
DROP FUNCTION IF EXISTS premio_desempenio;
delimiter //
CREATE FUNCTION premio_desempenio(p_id INT,p_premio FLOAT) 
  	RETURNS FLOAT
    READS SQL DATA

BEGIN
DECLARE premio_desempenio FLOAT;
		select monto_usd * p_premio INTO premio_desempenio
        from ajustes
        where id_empleado = p_id;
        RETURN premio_desempenio;
END//
DELIMITER ;

DROP FUNCTION IF EXISTS monto_teletrabajo;
delimiter //
CREATE FUNCTION monto_teletrabajo(m_id INT,m_teletrabajo FLOAT) 
  	RETURNS FLOAT
    READS SQL DATA

BEGIN
DECLARE monto_teletrabajo FLOAT;
		select monto_usd / m_teletrabajo INTO monto_teletrabajo
        from ajustes
        where id_empleado = m_id;
        RETURN monto_teletrabajo;
END//
DELIMITER ;

