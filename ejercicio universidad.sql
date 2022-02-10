use universidad;
select apellido1, apellido2, nombre, tipo from persona where tipo = 'alumno' order by apellido1 asc;-- ejercicio 1
select apellido1, apellido2, nombre, telefono from persona where tipo = 'alumno' and telefono is null;-- ejercicio 2

select apellido1, apellido2, nombre, fecha_nacimiento from persona where tipo = 'alumno' and fecha_nacimiento like '1999%';-- ejercicio 3 
select apellido1, apellido2, nombre, nif from persona where tipo = 'profesor' and nif like'%k'; -- ejercicio 4
select id, nombre, cuatrimestre, id_grado, curso from asignatura where cuatrimestre =1 and curso = 3 and id_grado = 7;-- ejercicio 5
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre  from persona,departamento, profesor where persona.id = profesor.id_profesor and departamento.id = profesor.id_departamento  and tipo = 'profesor' ;-- ejercicio 6
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin  from asignatura, persona, curso_escolar, alumno_se_matricula_asignatura where alumno_se_matricula_asignatura.id_alumno = persona.id and  alumno_se_matricula_asignatura.id_asignatura = asignatura.id and alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id and persona.nif = '26902806M';-- ejercicio 7
select d.nombre from departamento as d inner join profesor p on p.id_departamento=d.id where p.id_profesor in(select a.id_profesor FROM asignatura as a where p.id_profesor = a.id_profesor and a.id_grado = 4) ;-- ejercicio 8 ???????????'
select d.nombre from departamento as d INNER JOIN profesor p on p.id_departamento = d.id INNER JOIN asignatura a on a.id_profesor = p.id_profesor where a.id_grado=4;
select distinct  persona.apellido1, persona.apellido2, persona.nombre from asignatura, persona, curso_escolar, alumno_se_matricula_asignatura where alumno_se_matricula_asignatura.id_alumno = persona.id and  alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id and alumno_se_matricula_asignatura.id_asignatura=asignatura.id and curso_escolar.anyo_inicio = 2018 and curso_escolar.anyo_fin =2019 and persona.tipo='alumno'; -- ejercicio 9????
select * from grado, asignatura where grado.id = asignatura.id_grado and asignatura.id_grado =4;
select * from departamento;
-- --------------------------------------------------------------------------------------------------

select * from departamento d,profesor pr where d.id=pr.id_departamento ;
select p.tipo, p.nombre,a.nombre, a.id_grado,d.nombre from persona p,asignatura a,departamento d where p.tipo ='profesor' ;
select a.nombre,p.id_profesor,d.nombre from asignatura a inner join profesor p on p.id_profesor = a.id_profesor inner join departamento d on d.id = p.id_departamento ; 
select * from grado;

-- LEFT Y RIGHT JOIN
-- --------------------------------------------------------------------------------------------------
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona as p LEFT JOIN profesor pr on p.id =pr.id_profesor LEFT JOIN departamento d on d.id = pr.id_departamento where p.tipo='profesor';-- ejercicio 1
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona as p LEFT JOIN profesor pr on p.id =pr.id_profesor LEFT JOIN departamento d on d.id = pr.id_departamento where p.tipo = 'profesor' and pr.id_departamento = null ;-- ejercicio2
select d.nombre from departamento d left join profesor pr on d.id = pr.id_departamento left join persona p on p.id = pr.id_profesor where p.tipo='profesor' and pr.id_departamento = null;-- ejercicio 3
select p.apellido1, p.apellido2, p.nombre, a.nombre from persona p left join profesor pr on pr.id_profesor = p.id left join asignatura a on pr.id_profesor = a.id_profesor where p.tipo = 'profesor' and a.id_profesor = null;-- ejercicio 4

SELECT a.nombre, a.id_Profesor FROM Departamento d  RIght JOIN profesor pr  on d.id = pr.id_Departamento RIGHT JOIN Asignatura a on pr.id_profesor = a.id_profesor WHERE a.id_Profesor = NULL;--  ejercicio 5
select d.nombre from asignatura a right join profesor p on a.id_profesor = p.id_profesor right join departamento d on d.id = p.id_departamento where a.curso=null;-- ejercicio 6

-- --------------------------------------------------------------
select distinct d.nombre from departamento d left join profesor pr on d.id = pr.id_departamento left join asignatura a on pr.id_profesor=a.id_profesor left join alumno_se_matricula_asignatura al on a.id = al.id_asignatura left join curso_escolar c on al.id_curso_escolar = c.id;-- ejercicio 6 ???????????
-- --------------------------------------------------------------------------------------------------
-- consultas resumen
-- ---------------------------------------------------------------------------------------------------
select count(p.id) from persona p where p.tipo ='alumno';-- ejercicio 1
select count(p.id) from persona p where p.tipo ='alumno' and p.fecha_nacimiento like '1999%';-- ejercicio 2
select count(pr.id_profesor)  as 'numero profesores', d.nombre from profesor pr left join departamento d on pr.id_departamento = d.id group by d.id order by count(pr.id_profesor) desc;-- ejercicio 3
select d.nombre,p.apellido1,p.nombre from departamento d inner join profesor pr on d.id=pr.id_departamento inner join persona p on p.id=pr.id_profesor where d.id >0; -- ejercicio 4
select g.id,g.nombre, count(a.id) as 'numero de asignaturas' from grado g inner join asignatura a on a.id_grado =g.id group by g.id ;-- ejercicio 5
select g.id,g.nombre, count(a.id) as 'numero de asignaturas' from grado g inner join asignatura a  on a.id_grado =g.id  group by g.id,g.nombre having count(a.id)>40  ;-- ejercicio 6 
select g.id,g.nombre, sum(a.tipo='obligatoria'),sum(a.tipo='optativa'),sum(a.tipo='básica') from asignatura a inner join grado g on g.id = a.id_grado group by g.nombre,g.id ; -- ejercicio  7 
select c.anyo_inicio,count(al.id_alumno) from curso_escolar c left join alumno_se_matricula_asignatura al on c.id=al.id_alumno  group by c.anyo_inicio;-- ejercicio 8
select count(a.id ) as numero_asignaturas , p.apellido1, p.apellido2, p.nombre, p.id from persona p left join  asignatura a on p.id =a.id_profesor where p.tipo='profesor' group by p.apellido1, p.apellido2, p.nombre, p.id order by numero_asignaturas desc ;-- ejercicio 9
select * from persona p left join alumno_se_matricula_asignatura al on p.id=al.id_alumno  join asignatura a on al.id_asignatura=a.id  join grado g on g.id=a.id_grado where p.tipo='alumno' and p.fecha_nacimiento= (select max(fecha_nacimiento) from persona  where tipo='alumno');-- ejercicio 10 
select  p.nombre, p.apellido1,p.apellido2, p.tipo, d.nombre, a.nombre,a.id_profesor from persona p inner join profesor pr on p.id=pr.id_profesor inner join departamento d on d.id= pr.id_departamento left join asignatura a on a.id_profesor=pr.id_profesor  where  a.id is null; --   ;-- ejercicio 11,

