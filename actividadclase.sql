CREATE DATABASE ClaseActivi;
USE ClaseActivi;

CREATE TABLE tb_Departamentos(
	id_departamentos INT PRIMARY KEY,
	departamento VARCHAR(50) NOT NULL
);

CREATE TABLE tb_Proyectos(
	id_proyecto INT PRIMARY KEY,
	nombre_proyecto VARCHAR(50) NOT NULL,
	id_departamentos INT,
	CONSTRAINT fk_proyectos_departamentos
	FOREIGN KEY (id_departamentos)
	REFERENCES tb_Departamentos(id_departamentos)
);

CREATE TABLE tb_Empleados(
	id_empleado INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	cargo VARCHAR(25) NOT NULL,
	salario FLOAT(6,2) NOT NULL,
	fecha_inicio DATE NOT NULL,
	id_departamentos INT,
	CONSTRAINT fk_empleado_departamentos
	FOREIGN KEY (id_departamentos)
	REFERENCES tb_Departamentos(id_departamentos)
);

CREATE TABLE tb_Asignaciones(
	id_asignacion INT PRIMARY KEY,
	asignacion VARCHAR(50) NOT NULL,
	id_departamentos INT,
	CONSTRAINT fk_departamento_empleado
	FOREIGN KEY (id_departamentos)
	REFERENCES tb_Departamentos(id_departamentos),
	id_proyecto INT,
	CONSTRAINT fk_proyecto_empleado
	FOREIGN KEY (id_proyecto)
	REFERENCES tb_Proyectos(id_proyecto),
	id_empleado INT,
	CONSTRAINT fk_asignaciones_empleado
	FOREIGN KEY (id_empleado)
	REFERENCES tb_Empleados (id_empleado)
);

CREATE TABLE tb_Cargos(
	id_cargo INT PRIMARY KEY,
	cargo_empleado VARCHAR(25) NOT NULL,
	id_empleado INT,
	CONSTRAINT fk_empleado_cargo
	FOREIGN KEY (id_empleado)
	REFERENCES tb_Empleados(id_empleado)
);
