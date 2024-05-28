-- population ---------------------------------------------------------------
USE rrhh_umami;

-- tabla area 
INSERT INTO area (id_area, banda, desc_area) 
VALUES 
(101, 100, 'DEVOPS'),
(102, 100, 'BACK-END'),
(103, 100, 'QA'),
(104, 100, 'SOPORTE IT'),
(105, 100, 'FRONT-END'),
(106, 200, 'FINANCE'),
(107, 200, 'OPERATIONS'),
(108, 200, 'PEOPLE'),
(109, 200, 'MKT'),
(110, 200, 'SOPORTE'),
(111, 200, 'CX'),
(112, 200, 'BIZ DEV'),
(113, 300, 'DATA'),
(114, 300, 'PRODUCT'),
(115, 300, 'UX/UI') ;


-- tabla contrato
INSERT INTO contrato (id_contrato, desc_contrato) 
VALUES 
(1, 'Contractor'),
(2, 'Monotributista'),
(3, 'Rel de dependencia') ;


-- tabla zona
INSERT INTO zona (id_zona, desc_zona)
VALUES 
(1, 'CABA'),
(2, 'CORDOBA'),
(3, 'NORTE'),
(4, 'SUR'),
(5, 'OESTE'),
(99, 'REMOTO') ;


-- tabla nivel
INSERT INTO nivel (id_nivel, banda, desc_puesto, minima, maxima) 
VALUES 
(1, 100, 'trainee', 400, 900 ) ,
(2, 100, 'junior', 800, 1300 ) ,
(3, 100, 'semisenior', 1200, 2000 ) ,
(4, 100, 'senior', 1900, 2700 ) ,
(5, 100, 'specialist', 2900, 3500 ) ,
(6, 100, 'tl', 2400, 4400 ) ,
(7, 100, 'vice president', 4300, 7000 ) ,
(8, 100, 'c level', 6500, 10000 ) ,
(9, 200, 'trainee', 100, 400 ) ,
(10, 200, 'junior', 350, 900 ) ,
(11, 200, 'semisenior', 800, 1300 ) ,
(12, 200, 'senior', 1200, 2000 ) ,
(13, 200, 'specialist', 2000, 2700 ) ,
(14, 200, 'tl', 2600, 3500 ) ,
(15, 200, 'vice president', 3400, 4400 ) ,
(16, 200, 'c level', 4300, 7000 ) ,
(17, 300, 'trainee', 100, 400 ) ,
(18, 300, 'junior', 350, 900 ) ,
(19, 300, 'semisenior', 850, 1300 ) ,
(20, 300, 'senior', 1200, 2000 ) ,
(21, 300, 'specialist', 1900, 2700 ) ,
(22, 300, 'tl', 2900, 3500 ) ,
(23, 300, 'vice president', 3400, 4400 ) ,
(24, 300, 'c level', 4200, 7000 ) ;


-- tabla empleados

INSERT INTO empleados (id_empleado, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, dni, cuil, genero, calle, numeracion, piso,  departamento, codigo_postal, ciudad, email, tipo_de_empleados, fecha_de_nacimiento, fecha_alta, id_nivel, id_area, id_contrato, id_zona, id_lider, sueldo, banda) 
VALUES 
(14, 'Carolina', 'NULL', 'Lopez', 'Fernandez', '55667788', '15098800',  1, 'Av. San Martin', 2425,  29, 'N', '14014', 'CABA', 'carolina@yahoo.com', 1, '1996/12/12', '2024/02/20', 24, 108, 3,  1, 14, 4540, 3) ,
(32, 'Catalina', 'NULL', 'Lopez', 'Garcia', '55667788', '33098800',  1, 'Av. San Juan', 6061,  65, 'FF', '32032', 'OESTE', 'catalina1@yahoo.com', 1, '1996/12/30', '2014/08/05', 16, 110, 2,  5, 14, 4638, 2) ,
(37, 'Lautaro', 'Ignacio', 'Fernandez', 'Gonzalez', '11223344', '38098800',  2, 'Av. Corrientes', 7071,  75, 'KK', '37037', 'REMOTO', 'lautaro3@gmail.com', 1, '1958/01/04', '2020/01/15', 8, 107, 1,  99, 14, 9372, 1) ,
(1, 'Lucas', 'Alejandro', 'Gomez', 'Fernandez', '11223344', '20987654321',  2, 'Calle San Martin', 123,  3, 'A', '1001', 'NORTE', 'lucas@gmail.com', 2, '1996/11/29', '2023/01/15', 15, 107, 1,  3, 32, 4041, 2) ,
(3, 'Diego', 'Manuel', 'Fernandez', 'Martinez', '33445566', '40987654323',  2, 'Calle Mayo', 890,  7, 'C', '3003', 'SUR', 'diego@yahoo.com', 2, '1996/12/01', '2023/03/10', 22, 114, 2,  4, 14, 3053, 3) ,
(4, 'Carla', 'Julieta', 'Perez', 'Sanchez', '44556677', '50987654324',  1, 'Calle Rivadavia', 123,  9, 'D', '4004', 'OESTE', 'carla@gmail.com', 2, '1996/12/02', '2023/04/05', 7, 101, 1,  5, 37, 5224, 1) ,
(15, 'Facundo', 'Martin', 'Gomez', 'Diaz', '66778899', '16098800',  2, 'Calle Rivadavia', 2627,  31, 'O', '15015', 'NORTE', 'facundo@hotmail.com', 2, '1996/12/13', '2024/03/10', 22, 107, 1,  3, 14, 3808, 3) ,
(18, 'Camila', 'Florencia', 'Garcia', 'Alvarez', '99001122', '19098800',  1, 'Calle Mayo', 3233,  37, 'R', '18018', 'CABA', 'camila@hotmail.com', 2, '1976/12/16', '2024/06/20', 14, 112, 1,  1, 32, 2755, 2) ,
(21, 'Santiago', 'Matias', 'Perez', 'Lopez', '33445566', '22098800',  2, 'Calle Uruguay', 3840,  43, 'U', '21021', 'REMOTO', 'santiago@hotmail.com', 2, '1996/12/19', '2024/09/15', 15, 105, 1,  99, 32, 2880, 2) ,
(22, 'Valentina', 'NULL', 'Martinez', 'Gutierrez', '44556677', '23098800',  1, 'Av. Libertador', 4041,  45, 'V', '22022', 'NORTE', 'valentina@gmail.com', 2, '1986/12/20', '2024/10/20', 22, 105, 3,  3, 14, 3943, 3) ,
(30, 'Camila', 'Julieta', 'Gomez', 'Sanchez', '33445566', '31098800',  1, 'Calle Mayo', 5657,  61, 'DD', '30030', 'OESTE', 'camila1@hotmail.com', 2, '1996/12/28', '2012/06/20', 15, 113, 2,  5, 32, 3699, 2) ,
(31, 'Luciano', 'NULL', 'Sanchez', 'Fernandez', '44556677', '32098800',  2, 'Av. Corrientes', 5859,  63, 'EE', '31031', 'OESTE', 'luciano1@hotmail.com', 2, '1996/12/29', '2022/07/10', 7, 106, 1,  5, 37, 3557, 1) ,
(35, 'Facundo', 'Tomas', 'Gomez', 'Lopez', '88990011', '0',  2, 'Calle San Martin', 6667,  71, 'II', '35035', 'CABA', 'facundo3@yahoo.com', 2, '2003/01/02', '2012/11/10', 6, 113, 1,  1, 37, 5431, 1) ,
(38, 'Lara', 'NULL', 'Rodriguez', 'Sanchez', '22334455', '39098800',  1, 'Av. San Juan', 7273,  77, 'LL', '38038', 'NORTE', 'lara3@yahoo.com', 2, '1967/01/05', '2018/02/20', 14, 114, 3,  3, 32, 2722, 2) ,
(2, 'Valeria', 'NULL', 'Rodriguez', 'Lopez', '22334455', '30987654322',  1, 'Av. Libertador', 567,  5, 'B', '2002', 'CORDOBA', 'valeria@hotmail.com', 3, '1996/11/30', '2023/02/20', 10, 107, 1,  2, 30, 1914, 2) ,
(5, 'Juan', 'Pablo', 'Lopez', 'Gutierrez', '55667788', '60987654325',  2, 'Av. Corrientes', 456,  11, 'E', '5005', 'OESTE', 'juan@hotmail.com', 3, '1996/12/03', '2023/05/15', 17, 105, 1,  5, 15, 2226, 3) ,
(6, 'Mariana', 'NULL', 'Alvarez', 'Diaz', '66778899', '70987654326',  1, 'Av. Belgrano', 789,  13, 'F', '6006', 'CORDOBA', 'mariana@yahoo.com', 3, '1996/12/04', '2023/06/20', 17, 108, 2,  2, 3, 181, 3) ,
(7, 'Roberto', 'Carlos', 'Sanchez', 'Perez', '77889900', '80987654327',  2, 'Calle Jujuy', 1011,  15, 'G', '7007', 'SUR', 'roberto@gmail.com', 3, '1996/12/05', '2023/07/10', 20, 106, 1,  4, 3, 2379, 3) ,
(8, 'Laura', 'NULL', 'Martinez', 'Fernandez', '88990011', '90987654328',  1, 'Av. San Juan', 1213,  17, 'H', '8008', 'CORDOBA', 'laura@hotmail.com', 3, '1991/12/06', '2023/08/05', 1, 109, 2,  2, 4, 1543, 1) ,
(9, 'Marcos', 'Javier', 'Gonzalez', 'Gomez', '99001122', '10098800',  2, 'Calle Entre Rios', 1415,  19, 'I', '9009', 'CABA', 'marcos@yahoo.com', 3, '1991/12/06', '2023/09/15', 20, 101, 1,  1, 15, 1174, 3) ,
(10, 'Romina', 'NULL', 'Lopez', 'Martinez', '11223344', '11098800',  1, 'Av. Colon', 1617,  21, 'J', '10010', 'OESTE', 'romina@gmail.com', 3, '1991/12/08', '2023/10/20', 5, 113, 2,  5, 35, 1344, 1) ,
(11, 'Lucas', 'Ezequiel', 'Fernandez', 'Garcia', '22334455', '12098800',  2, 'Calle Uruguay', 1819,  23, 'K', '11011', 'NORTE', 'lucas@yahoo.com', 3, '1991/12/09', '2023/11/10', 20, 110, 3,  3, 15, 2331, 3) ,
(12, 'Ana', 'NULL', 'Sanchez', 'Lopez', '33445566', '13098800',  1, 'Av. Pellegrini', 2021,  25, 'L', '12012', 'OESTE', 'ana@hotmail.com', 3, '1991/12/10', '2023/12/05', 11, 103, 1,  5, 21, 1068, 2) ,
(13, 'Ezequiel', 'Gonzalo', 'Martinez', 'Perez', '44556677', '14098800',  2, 'Calle Laprida', 2223,  27, 'M', '13013', 'REMOTO', 'ezequiel@gmail.com', 3, '1996/12/11', '2024/01/15', 13, 102, 3,  99, 30, 2336, 2) ,
(16, 'Agustina', 'NULL', 'Perez', 'Martinez', '77889900', '17098800',  1, 'Av. Libertador', 2829,  33, 'P', '16016', 'NORTE', 'agustina1@gmail.com', 3, '1966/12/14', '2024/04/05', 19, 102, 1,  3, 22, 259, 3) ,
(17, 'Leonardo', 'Nicolas', 'Martinez', 'Gomez', '88990011', '18098800',  2, 'Calle San Martin', 3031,  35, 'Q', '17017', 'CABA', 'leonardo@yahoo.com', 3, '1996/12/15', '2024/05/15', 1, 105, 3,  1, 35, 2341, 1) ,
(19, 'Gonzalo', 'NULL', 'Rodriguez', 'Sanchez', '11223344', '20098800',  2, 'Av. Corrientes', 3435,  39, 'S', '19019', 'REMOTO', 'gonzalo@gmail.com', 3, '1996/12/17', '2024/07/10', 9, 102, 1,  99, 18, 2566, 2) ,
(20, 'Abril', 'NULL', 'Fernandez', 'Martinez', '22334455', '21098800',  1, 'Av. Rivadavia', 3637,  41, 'T', '20020', 'CABA', 'abril@yahoo.com', 3, '1996/12/18', '2024/08/05', 10, 108, 3,  1, 18, 1833, 2) ,
(23, 'Lautaro', 'Agustin', 'Gomez', 'Fernandez', '55667788', '24098800',  2, 'Calle San Martin', 4243,  47, 'W', '23023', 'REMOTO', 'lautaro@yahoo.com', 3, '1996/12/21', '2024/11/10', 10, 109, 3,  99, 38, 1709, 2) ,
(24, 'Lara', 'NULL', 'Rodriguez', 'Sanchez', '66778899', '25098800',  1, 'Calle Mayo', 4445,  49, 'X', '24024', 'SUR', 'lara@hotmail.com', 3, '1996/12/22', '2024/12/05', 11, 106, 1,  4, 1, 2271, 2) ,
(25, 'Joaquin', 'Maximiliano', 'Fernandez', 'Gomez', '77889900', '26098800',  2, 'Av. Corrientes', 4647,  51, 'Y', '25025', 'NORTE', 'joaquin@gmail.com', 3, '1996/12/23', '2025/01/15', 9, 108, 1,  3, 1, 2142, 2) ,
(26, 'Jimena', 'NULL', 'Martinez', 'Lopez', '88990011', '27098800',  1, 'Av. San Juan', 4849,  53, 'Z', '26026', 'SUR', 'jimena@yahoo.com', 3, '1986/12/24', '2012/02/20', 11, 114, 2,  4, 30, 1146, 2) ,
(27, 'Matias', 'Lucas', 'Gonzalez', 'Fernandez', '99001122', '28098800',  2, 'Calle Uruguay', 5051,  55, 'AA', '27027', 'SUR', 'matias@hotmail.com', 3, '1996/12/25', '2025/03/10', 10, 102, 1,  4, 21, 1877, 2) ,
(28, 'Agustina', 'NULL', 'Perez', 'Martinez', '11223344', '29098800',  1, 'Av. Libertador', 5253,  57, 'BB', '28028', 'OESTE', 'agustina@gmail.com', 3, '1996/12/26', '2010/04/05', 20, 102, 2,  5, 22, 2508, 3) ,
(29, 'Gaston', 'NULL', 'Martinez', 'Gomez', '22334455', '30098800',  2, 'Calle San Martin', 5455,  59, 'CC', '29029', 'OESTE', 'gaston1@yahoo.com', 3, '1996/12/27', '2015/05/15', 9, 103, 1,  5, 38, 356, 2) ,
(33, 'Nicolas', 'Miguel', 'Garcia', 'Martinez', '66778899', '34098800',  2, 'Calle Uruguay', 6263,  67, 'GG', '33033', 'SUR', 'nicolas2@gmail.com', 3, '1980/03/06', '2014/09/15', 21, 111, 1,  4, 3, 289, 3) ,
(34, 'Sofia', 'NULL', 'Martinez', 'Perez', '77889900', '35098800',  1, 'Av. Libertador', 6465,  69, 'HH', '34034', 'REMOTO', 'sofia3@hotmail.com', 3, '1967/01/01', '2025/10/20', 13, 102, 1,  99, 21, 1261, 2) ,
(36, 'Abril', 'NULL', 'Perez', 'Martinez', '99001122', '37098800',  1, 'Calle Mayo', 6869,  73, 'JJ', '36036', 'SUR', 'abril3@hotmail.com', 3, '1997/01/03', '2012/12/05', 3, 101, 3,  4, 4, 2158, 1) ,
(39, 'Joaquin', 'Nicolas', 'Fernandez', 'Martinez', '33445566', '40098800',  2, 'Calle Uruguay', 7475,  79, 'MM', '39039', 'CORDOBA', 'joaquin3@hotmail.com', 3, '1980/01/06', '2015/03/10', 2, 101, 1,  2, 31, 1437, 1) ;


   
-- tabla evaluacion

INSERT INTO evaluacion (id_eval, fecha_eval, resultado_evaluacion, id_empleado, evaluado_por) 
VALUES 
(1, '2026-03-15', 1, 4, 37) ,
(2, '2026-04-20', 1, 9, 15) ,
(3, '2026-05-25', 1, 20, 18) ,
(4, '2026-06-30', 1, 25, 1) ,
(5, '2026-07-15', 1, 31, 37) ,
(6, '2026-08-20', 5, 10, 35) ,
(7, '2026-09-25', 5, 15, 14) ,
(8, '2026-10-30', 5, 23, 38) ,
(9, '2026-11-15', 5, 29, 38) ,
(10, '2026-12-20', 5, 24, 1) ,
(11, '2027-01-25', 5, 34, 21) ,
(12, '2027-02-20', 5, 8, 4) ,
(13, '2027-03-15', 5, 28, 22) ,
(25, '2026-03-15', 2, 4, 37) ,
(26, '2026-04-20', 2, 9, 15) ,
(27, '2026-05-25', 2, 20, 18) ,
(28, '2026-06-30', 2, 25, 1) ,
(29, '2026-07-15', 2, 31, 37) ,
(30, '2025-06-20', 2, 4, 37) ;


   
   -- tabla fichero
INSERT INTO fichero (id_fichero, id_empleado, fecha_hora_ingreso, fecha_hora_egreso) 
VALUES 
(1, 14, '2020-09-25 13:00:00',  '2020-09-25 17:00:00' ) ,
(2, 18, '2020-10-25 13:00:00',  '2020-10-25 17:00:00' ) ,
(3, 35, '2020-11-25 13:00:00',  '2020-11-25 17:00:00' ) ,
(4, 9, '2020-12-25 13:00:00',  '2020-12-25 17:00:00' ) ,
(5, 20, '2021-01-25 13:00:00',  '2021-01-25 17:00:00' ) ,
(6, 17, '2021-02-25 13:00:00',  '2021-02-25 17:00:00' ) ,
(7, 6, '2021-03-25 13:00:00',  '2021-03-25 17:00:00' ) ,
(8, 8, '2021-04-25 13:00:00',  '2021-04-25 17:00:00' ) ,
(9, 2, '2021-05-25 13:00:00',  '2021-05-25 17:00:00' ) ,
(10, 39, '2021-06-25 13:00:00',  '2021-06-25 17:00:00' ) ,
(11, 15, '2021-07-25 13:00:00',  '2021-07-25 17:00:00' ) ,
(12, 22, '2021-08-25 13:00:00',  '2021-08-25 17:00:00' ) ,
(13, 1, '2021-09-25 13:00:00',  '2021-09-25 17:00:00' ) ,
(14, 38, '2021-10-25 13:00:00',  '2021-10-25 17:00:00' ) ,
(15, 25, '2021-11-25 13:00:00',  '2021-11-25 17:00:00' ) ,
(16, 11, '2021-12-25 13:00:00',  '2021-12-25 17:00:00' ) ,
(17, 16, '2022-01-25 13:00:00',  '2022-01-25 17:00:00' ) ,
(18, 3, '2022-02-25 13:00:00',  '2022-02-25 17:00:00' ) ,
(19, 24, '2022-03-25 13:00:00',  '2022-03-25 17:00:00' ) ;


   
   -- tabla rotacion
INSERT INTO rotacion (id_baja, id_empleado, fecha_de_baja) 
VALUES 
(1, 4, '2026-03-15') ,
(2, 9, '2026-04-20') ,
(3, 20, '2026-05-25') ,
(4, 25, '2026-06-30') ,
(5, 31, '2026-07-15') ;

   
   -- tabla ajustes
INSERT INTO ajustes (id_sueldo, id_empleado, fecha_de_ajuste, observaciones, monto_usd, monto_ars) 
VALUES 
(17, 22, '2023-03-15', 'CAMBIO DE LEVEL', 3943, NULL) ,
(18, 5, '2023-03-08', 'CAMBIO DE LEVEL', 2226, NULL) ,
(19, 28, '2023-10-29', 'CAMBIO DE LEVEL', 2508, NULL) ,
(20, 21, '2024-03-13', 'CAMBIO DE LEVEL', 2880, NULL) ,
(3, 31, '2025-02-16', 'INFLACIÓN', 3557, NULL) ,
(4, 25, '2024-04-27', 'INFLACIÓN', 2142, NULL) ,
(7, 25, '2024-01-21', 'INFLACIÓN', 2142, NULL) ,
(8, 16, '2023-11-18', 'INFLACIÓN', 259, 300000) ,
(10, 1, '2024-08-26', 'INFLACIÓN', 4041, 5000000) ,
(11, 32, '2024-06-18', 'INFLACIÓN', 4638, 5000000) ,
(14, 17, '2024-10-10', 'INFLACIÓN', 2341, NULL) ,
(15, 30, '2024-11-06', 'INFLACIÓN', 3699, NULL) ,
(1, 10, '2024-08-14', 'PERFORMANCE', 1344, NULL) ,
(2, 15, '2024-04-28', 'PERFORMANCE', 3808, NULL) ,
(5, 23, '2023-11-16', 'PERFORMANCE', 1709, NULL) ,
(6, 29, '2023-12-06', 'PERFORMANCE', 356, 400000) ,
(9, 24, '2024-09-24', 'PERFORMANCE', 2271, NULL) ,
(12, 34, '2023-06-28', 'PERFORMANCE', 1261, NULL) ,
(13, 8, '2023-07-06', 'PERFORMANCE', 1543, NULL) ,
(16, 28, '2025-01-15', 'PERFORMANCE', 2508, NULL) ;
