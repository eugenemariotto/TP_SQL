USE mysql;

CREATE ROLE IF NOT EXISTS todos_los_permisos;
CREATE ROLE IF NOT EXISTS solo_lectura;
CREATE ROLE IF NOT EXISTS lectura_insercion;

GRANT ALL PRIVILEGES ON rrhh_umami.* TO todos_los_permisos;
GRANT SELECT ON rrhh_umami.* TO solo_lectura;
GRANT SELECT, INSERT ON rrhh_umami.* TO lectura_insercion;


CREATE USER IF NOT EXISTS 'Jorge'@'%' IDENTIFIED BY '111';
CREATE USER IF NOT EXISTS 'Juan'@'%' IDENTIFIED BY '222';
CREATE USER IF NOT EXISTS 'Julian'@'%' IDENTIFIED BY '333';

GRANT todos_los_permisos TO 'Jorge'@'%';
GRANT solo_lectura TO 'Juan'@'%';
GRANT lectura_insercion TO 'Julian'@'%';

SET DEFAULT ROLE todos_los_permisos TO 'Jorge'@'%';
SET DEFAULT ROLE solo_lectura TO 'Juan'@'%';
SET DEFAULT ROLE lectura_insercion TO 'Julian'@'%';