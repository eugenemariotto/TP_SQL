-- hhrr_umami

DROP SCHEMA IF EXISTS rrhh_umami;
CREATE DATABASE rrhh_umami;
USE rrhh_umami;

-- DROP TABLE IF EXISTS area;
CREATE TABLE area (
	id_area INT NOT NULL,
	banda INT NOT NULL,
	desc_area VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (id_area)
) ;

-- DROP TABLE IF EXISTS contrato;
CREATE TABLE contrato (
	id_contrato INT NOT NULL,
	desc_contrato VARCHAR(50) DEFAULT NULL,
	PRIMARY KEY (id_contrato)
) ;

-- DROP TABLE IF EXISTS zona;
CREATE TABLE zona (
    id_zona INT NOT NULL,
    desc_zona VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (id_zona)
) ;

-- DROP TABLE IF EXISTS nivel;
CREATE TABLE nivel (
	id_nivel INT NOT NULL,
	banda INT NOT NULL,
	desc_puesto VARCHAR(50) DEFAULT NULL,
	minima DOUBLE NOT NULL,
	maxima DOUBLE NOT NULL,
	PRIMARY KEY (id_nivel)
) ;

-- DROP TABLE IF EXISTS empleados;
CREATE TABLE empleados (
	id_empleado INT NOT NULL AUTO_INCREMENT,
	primer_nombre VARCHAR(50) NOT NULL,
	segundo_nombre VARCHAR(50) DEFAULT NULL,
	primer_apellido VARCHAR(50) NOT NULL,
	segundo_apellido VARCHAR(50) DEFAULT NULL,
	dni VARCHAR(20) NOT NULL,							
	cuil VARCHAR(20) NOT NULL,						
	genero ENUM('F','M','No binario') NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeracion VARCHAR(50) NOT NULL,
	piso VARCHAR(50) DEFAULT NULL,
	departamento VARCHAR(50) DEFAULT NULL,
	codigo_postal INT DEFAULT NULL,
	ciudad VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,				
	fecha_de_nacimiento DATE DEFAULT NULL,
    fecha_alta DATE DEFAULT NULL,
    tipo_de_empleados ENUM('C Level','Líder','Team Player') DEFAULT NULL, 	
	id_nivel INT NOT NULL,
	id_area INT NOT NULL,
	id_contrato INT NOT NULL,
	id_zona INT NOT NULL,
	id_lider INT DEFAULT NULL,
	sueldo DOUBLE,
	banda ENUM("100","200","300") DEFAULT NULL,			
	PRIMARY KEY (id_empleado),
	CONSTRAINT fk_empleados_area FOREIGN KEY (id_area) REFERENCES area (id_area),
	CONSTRAINT fk_empleados_contrato FOREIGN KEY (id_contrato) REFERENCES contrato (id_contrato),
	CONSTRAINT fk_empleados_zona FOREIGN KEY (id_zona) REFERENCES zona (id_zona),
	CONSTRAINT fk_empleados_nivel FOREIGN KEY (id_nivel) REFERENCES nivel (id_nivel),
	CONSTRAINT fk_empleados_empleados FOREIGN KEY (id_lider) REFERENCES empleados (id_empleado)
) ;


-- DROP TABLE IF EXISTS evaluacion;
CREATE TABLE evaluacion (
	id_eval INT NOT NULL,
	fecha_eval DATE NOT NULL,
	resultado_evaluacion INT NOT NULL,
	id_empleado INT NOT NULL,
	evaluado_por INT NOT NULL,
	PRIMARY KEY (id_eval,id_empleado,fecha_eval),
	CONSTRAINT fk_evaluacion_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
) ;

-- DROP TABLE IF EXISTS fichero;
CREATE TABLE fichero (
	id_fichero INT NOT NULL AUTO_INCREMENT,
	id_empleado INT DEFAULT NULL,
	fecha_hora_ingreso DATETIME DEFAULT NULL,
	fecha_hora_egreso DATETIME DEFAULT NULL,
	PRIMARY KEY (id_fichero),
	CONSTRAINT fk_fichero_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
) ;

-- DROP TABLE IF EXISTS rotacion;
CREATE TABLE rotacion (
	id_baja INT NOT NULL AUTO_INCREMENT,
	id_empleado INT DEFAULT NULL,
	fecha_de_baja DATE DEFAULT NULL,
	PRIMARY KEY (id_baja),
	CONSTRAINT fk_rotacion_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
) ;

-- DROP TABLE IF EXISTS nivel;
CREATE TABLE ajustes (
	id_sueldo INT NOT NULL,
	id_empleado INT DEFAULT NULL,
	fecha_de_ajuste DATE,
	observaciones VARCHAR(50) DEFAULT NULL,
	monto_usd INT NOT NULL,
	monto_ars INT DEFAULT NULL,
	PRIMARY KEY (id_sueldo),
	CONSTRAINT fk_ajustes_empleados FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
) ;
