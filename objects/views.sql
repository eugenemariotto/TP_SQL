USE rrhh_rrhh_umami;
-- VIEWS ---------------------------------------
CREATE OR REPLACE VIEW bajas_ano AS 
select e.ID_EMPLEADO AS ID_EMPLEADO,
(to_days(r.FECHA_DE_BAJA) - to_days(e.FECHA_ALTA)) AS DIAS_DE_DIFERENCIA 
from empleados e 
join rotacion r
ON e.ID_EMPLEADO = r.ID_EMPLEADO;

CREATE or replace VIEW empleados_de_caba AS 
select e.ID_EMPLEADO AS ID_EMPLEADO,
e.PRIMER_NOMBRE AS PRIMER_NOMBRE,
e.PRIMER_APELLIDO AS PRIMER_APELLIDO,
e.ID_NIVEL AS ID_NIVEL,
n.DESC_PUESTO AS DESC_PUESTO 
from empleados e 
join rrhh_umami.ZONA Z 
on e.ID_ZONA = z.ID_ZONA 
join rrhh_umami.nivel n 
on e.ID_NIVEL = n.ID_NIVEL
where z.DESC_ZONA = 'CABA';

CREATE OR REPLACE VIEW empleados_por_area_y_evaluacion AS 
select e.ID_EMPLEADO AS ID_EMPLEADO,
e.PRIMER_NOMBRE AS PRIMER_NOMBRE,
e.PRIMER_APELLIDO AS PRIMER_APELLIDO,
a.DESC_AREA AS DESC_AREA,
ev.EVALUADO_POR AS EVALUADOR 
from rrhh_umami.empleados e 
join rrhh_umami.area a 
on e.ID_AREA = a.ID_AREA 
join evaluacion ev 
on e.ID_EMPLEADO = ev.ID_EMPLEADO;

CREATE OR REPLACE VIEW inactivos AS 
select e.ID_EMPLEADO AS ID_EMPLEADO,
e.PRIMER_NOMBRE AS PRIMER_NOMBRE, 
e.PRIMER_APELLIDO AS PRIMER_APELLIDO,
r.FECHA_DE_BAJA AS FECHA_DE_BAJA,
r.ID_BAJA AS ID_BAJA 
from empleados e 
join rrhh_umami.rotacion r 
on e.ID_EMPLEADO = r.ID_EMPLEADO;

CREATE VIEW vista_empleados_completa AS
SELECT 
    e.id_empleado,
    e.primer_nombre,
    e.segundo_nombre,
    e.primer_apellido,
    e.segundo_apellido,
    e.dni,
    e.cuil,
    e.genero,
    e.calle,
    e.numeracion,
    e.piso,
    e.departamento,
    e.codigo_postal,
    e.ciudad,
    e.email,
    e.fecha_de_nacimiento,
    e.fecha_alta,
    e.tipo_de_empleados,
    e.sueldo,
    e.banda,
    a.desc_area,
    c.desc_contrato,
    n.desc_puesto,
    z.desc_zona
FROM 
    empleados e
JOIN 
    area a ON e.id_area = a.id_area
JOIN 
    contrato c ON e.id_contrato = c.id_contrato
JOIN 
    nivel n ON e.id_nivel = n.id_nivel
JOIN 
    zona z ON e.id_zona = z.id_zona;