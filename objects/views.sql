USE rrhh_umami;
-- VIEWS ---------------------------------------
CREATE OR REPLACE VIEW bajas_ano AS 
select e.id_empleado AS id_empleado,
(to_days(r.fecha_de_baja) - to_days(e.fecha_alta)) AS DIAS_DE_DIFERENCIA 
from empleados e 
join rotacion r
ON e.id_empleado = r.id_empleado;

CREATE or replace VIEW empleados_de_caba AS 
select e.id_empleado AS id_empleado,
e.primer_nombre AS primer_nombre,
e.primer_apellido AS primer_apellido,
e.id_nivel AS id_nivel,
n.desc_puesto AS desc_puesto 
from empleados e 
join rrhh_umami.zona Z 
on e.id_zona = z.id_zona 
join rrhh_umami.nivel n 
on e.id_nivel = n.id_nivel
where z.desc_zona = 'CABA';

CREATE OR REPLACE VIEW empleados_por_area_y_evaluacion AS 
select e.id_empleado AS id_empleado,
e.primer_nombre AS primer_nombre,
e.primer_apellido AS primer_apellido,
a.desc_area AS desc_area,
ev.evaluado_por AS EVALUADOR 
from rrhh_umami.empleados e 
join rrhh_umami.area a 
on e.id_area = a.id_area 
join evaluacion ev 
on e.id_empleado = ev.id_empleado;

CREATE OR REPLACE VIEW inactivos AS 
select e.id_empleado AS id_empleado,
e.primer_nombre AS primer_nombre, 
e.primer_apellido AS primer_apellido,
r.fecha_de_baja AS fecha_de_baja,
r.id_baja AS id_baja 
from empleados e 
join rrhh_umami.rotacion r 
on e.id_empleado = r.id_empleado;

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