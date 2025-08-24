/*Creación de Base de Datos*/
create database ClinicaAmigo;
/*Creación de la tablas*/
CREATE TABLE Dueno(
  Id_dueno INT PRIMARY KEY AUTO_INCREMENT,
  Nombre VARCHAR(50) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  Telefono VARCHAR(50) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Fecha_registro DATE
);
CREATE TABLE Mascota(
  Id_mascota INT PRIMARY KEY AUTO_INCREMENT,
  Id_dueno INT,
  Nombre VARCHAR(50) NOT NULL,
  Color_mascota VARCHAR(50) NOT NULL,
  Especie_mascota VARCHAR(50) NOT NULL,
  Raza_mascota VARCHAR(50) NOT NULL,
  Fecha_nacimiento DATE,
  Genero_mascota VARCHAR(10) NOT NULL,
  Peso_mascota DECIMAL(5,2) NOT NULL,
  Tamano_mascota VARCHAR(10) NOT NULL,
  Fecha_registro DATE,
  FOREIGN KEY (Id_dueno) REFERENCES Dueno(Id_dueno)
);
CREATE TABLE Cita(
  Id_cita INT PRIMARY KEY AUTO_INCREMENT,
  Id_mascota INT,
  Fecha DATE,
  Motivo VARCHAR(50) NOT NULL,
  Estado_cita VARCHAR(50) NOT NULL,
  FOREIGN KEY (Id_mascota) REFERENCES Mascota(Id_mascota)
);
CREATE TABLE Veterinario(
  Id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
  Num_licencia VARCHAR(20) NOT NULL,
  Nombre_veterinario VARCHAR(50) NOT NULL
);
CREATE TABLE Vacuna(
  Id_vacuna INT PRIMARY KEY AUTO_INCREMENT,
  Id_veterinario INT,
  Nombre_vacuna VARCHAR(50) NOT NULL,
  Fecha_aplicacion DATE,
  FOREIGN KEY (Id_veterinario) REFERENCES Veterinario(Id_veterinario)
);
CREATE TABLE Historial_Clinica(
  Id_clinica INT PRIMARY KEY AUTO_INCREMENT,
  Id_mascota INT,
  Fecha DATE,
  Antecedentes VARCHAR(100) NOT NULL,
  Tipo_consulta VARCHAR(50) NOT NULL,
  Medidas VARCHAR(100) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  FOREIGN KEY (Id_mascota) REFERENCES Mascota(Id_mascota)
);
CREATE TABLE Inventario(
  Id_Inventario INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_Inventario VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Cantidad INT NOT NULL,
  Precio DECIMAL(10,2) NOT NULL,
  Ubicacion VARCHAR(50) NOT NULL,
  Proveedor VARCHAR(50) NOT NULL,
  Fecha_entrada DATE
);
CREATE TABLE Factura(
  Id_factura INT PRIMARY KEY AUTO_INCREMENT,
  Id_dueno INT,
  Monto DECIMAL(10,2) NOT NULL,
  Metodo_pago VARCHAR(50) NOT NULL,
  Fecha_emision DATE,
  Descripcion VARCHAR(100) NOT NULL,
  Estado VARCHAR(50) NOT NULL,
  FOREIGN KEY (Id_dueno) REFERENCES Dueno(Id_dueno)
);
/*Creación de valores*/
INSERT INTO Dueno(nombre, direccion, telefono, email, fecha_registro)
VALUES("Daniel Arboleda", "Carrera 27 #46-77", "+57 3043558784", "tecnovalencia54@gmail.com", "2001-11-19"),
("Mariana Atehortua", "Carrera 27A #46-77cc", "+57 300908807", "mari.A@gmail.com", "2005-05-19"),
("Anwar Joseph Palacio", "Carrera 20 #46-77", "+57 3053558787", "anwar@gmail.com", "2003-11-17"),
("Camila Betancur", "Carrera 19C #46-77", "+57 3033558785", "cami@gmail.com", "2002-12-24"),
("Laura Gutierrez", "Carrera 27B #46-77A", "+57 3013558784", "lau.4@gmail.com", "2005-04-07"),
("Laura Martínez", "Calle 12 #34-56", "+57 3114567890", "lauramartinez@gmail.com", "2002-03-15"),
("Carlos Ramírez", "Avenida 3 #22-10", "+57 3109876543", "c.ramirez@yahoo.com", "2000-07-01"),
("Andrea Gómez", "Carrera 10 #20-80", "+57 3051122334", "andreagomez@outlook.com", "1999-12-25"),
("Juan Pérez", "Calle 45 #67-89", "+57 3120004455", "juanperez@hotmail.com", "2003-05-10"),
("María Fernanda López", "Transversal 6 #15-30", "+57 3019988776", "m.fernanda@gmail.com", "2001-09-03");
INSERT INTO Mascota(nombre, color_mascota, especie_mascota, raza_mascota, fecha_nacimiento, genero_mascota, peso_mascota, tamano_mascota, fecha_registro) 
VALUES("Luna", "Negro", "Perro", "Labrador", "2020-03-15", "Hembra", 25.3, "Grande", "2024-04-04"),
("Max", "Marrón", "Perro", "Pastor Alemán", "2019-07-22", "Macho", 30.2, "Grande", "2024-04-04"),
("Milo", "Blanco con gris", "Gato", "Mestizo", "2022-09-10", "Macho", 4.8, "Mediano", "2024-04-04"),
("Nala", "Blanco", "Gato", "Persa", "2021-01-05", "Hembra", 5.2, "Pequeño", "2024-04-04"),
("Rocky", "Dorado", "Perro", "Golden Retriever", "2018-11-30", "Macho", 32.5, "Grande", "2024-04-04"),
("Simba", "Gris", "Gato", "Siamés", "2020-05-14", "Macho", 5.0, "Mediano", "2024-04-04"),
("Coco", "Blanco con negro", "Perro", "Bulldog Francés", "2021-12-02", "Macho", 12.7, "Mediano", "2024-04-04"),
("Canela", "Marrón claro", "Perro", "Beagle", "2019-04-17", "Hembra", 10.5, "Mediano", "2024-04-04"),
("Toby", "Negro con blanco", "Perro", "Border Collie", "2020-08-09", "Macho", 18.4, "Mediano", "2024-04-04"),
("Maggie", "Gris atigrado", "Gato", "Mestizo", "2022-03-21", "Hembra", 4.2, "Pequeño", "2024-04-04");
INSERT INTO Cita(fecha, motivo, estado_cita) 
VALUES("2024-04-10", "Vacunación", "Pendiente"),
("2024-04-12", "Control general", "Confirmada"),
("2024-04-15", "Desparasitación", "Pendiente"),
("2024-04-18", "Consulta por enfermedad", "Cancelada"),
("2024-04-20", "Cirugía programada", "Confirmada"),
("2024-04-22", "Chequeo postoperatorio", "Pendiente"),
("2024-04-25", "Baño y peluquería", "Confirmada"),
("2024-04-28", "Vacunación", "Pendiente"),
("2024-04-30", "Consulta dermatológica", "Cancelada"),
("2024-05-02", "Radiografía de control", "Confirmada");
INSERT INTO Historial_Clinica(fecha, antecedentes, tipo_consulta, medidas, descripcion) 
VALUES("2024-03-10", "Vacunado contra rabia y moquillo", "Consulta General", "Peso: 25kg, T: 38.5°C", "Revisión general, sin anomalías."),
("2024-03-15", "Alergia a ciertos alimentos", "Consulta Dermatológica", "Peso: 8kg, T: 38.0°C", "Erupción en la piel, se recomienda cambio de dieta."),
("2024-03-20", "Historial de otitis", "Consulta por Enfermedad", "Peso: 15kg, T: 39.2°C", "Infección en el oído derecho, se receta antibiótico."),
("2024-03-25", "Cirugía reciente en la pata", "Chequeo Postoperatorio", "Peso: 22kg, T: 38.6°C", "Cicatrización en progreso, sin signos de infección."),
("2024-03-30", "Desparasitación reciente", "Consulta Preventiva", "Peso: 12kg, T: 38.2°C", "Sin parásitos detectados, próxima desparasitación en 6 meses."),
("2024-04-05", "No antecedentes relevantes", "Consulta por Vacunación", "Peso: 30kg, T: 38.3°C", "Se aplica vacuna múltiple, sin efectos adversos."),
("2024-04-10", "Problema digestivo anterior", "Consulta Gastrointestinal", "Peso: 10kg, T: 37.9°C", "Diarrea leve, se recomienda dieta blanda."),
("2024-04-15", "Fractura hace un año", "Consulta de Control", "Peso: 18kg, T: 38.4°C", "Buena recuperación, movilidad normal."),
("2024-04-20", "Problemas dentales", "Consulta Odontológica", "Peso: 5kg, T: 38.1°C", "Sarro acumulado, limpieza recomendada."),
("2024-04-25", "No antecedentes", "Chequeo Anual", "Peso: 20kg, T: 38.7°C", "Examen general sin anomalías.");
INSERT INTO Veterinario(num_licencia, nombre_veterinario) 
VALUES("VET-001", "Dr. Andrés Pérez"),
("VET-002", "Dra. Camila Rodríguez"),
("VET-003", "Dr. Sebastián Gómez"),
("VET-004", "Dra. Mariana López"),
("VET-005", "Dr. Juan Ramírez"),
("VET-006", "Dra. Laura Fernández"),
("VET-007", "Dr. Ricardo Castillo"),
("VET-008", "Dra. Sofía Martínez"),
("VET-009", "Dr. Alejandro Torres"),
("VET-010", "Dra. Valeria Méndez");
INSERT INTO Inventario(nombre_inventario, descripcion, cantidad, precio, ubicacion, proveedor, fecha_entrada)  
VALUES("Vacuna Antirrábica", "Vacuna contra la rabia para perros y gatos", 50, 25.00, "Estante A1", "Laboratorios VetPharma", "2024-03-10"),
("Antibiótico Canino", "Antibiótico de amplio espectro para perros", 30, 18.50, "Estante B2", "Farmavet", "2024-03-12"),
("Collares Antipulgas", "Collares para protección contra pulgas y garrapatas", 40, 12.00, "Estante C3", "Mascotas Felices S.A.", "2024-03-15"),
("Alimento Balanceado", "Bolsa de 10kg de alimento premium para perros", 20, 45.00, "Depósito 1", "NutriPets", "2024-03-17"),
("Jeringas Desechables", "Paquete de 100 jeringas estériles de 5ml", 100, 8.00, "Estante D4", "MediVet", "2024-03-20"),
("Solución Desinfectante", "Desinfectante para equipos veterinarios", 15, 30.00, "Estante E5", "CleanVet", "2024-03-22"),
("Camas para Mascotas", "Cama acolchonada tamaño mediano", 25, 50.00, "Almacén 2", "ComfortPets", "2024-03-25"),
("Transportadoras", "Caja transportadora para gatos y perros pequeños", 10, 60.00, "Estante F6", "PetCargo", "2024-03-27"),
("Vitaminas y Suplementos", "Multivitamínico en tabletas para cachorros", 35, 20.00, "Estante G7", "VitaPet", "2024-03-30"),
("Cepillos Dentales", "Cepillo de dientes para higiene canina", 50, 5.00, "Estante H8", "DentalPet", "2024-04-02");
INSERT INTO Factura(monto, metodo_pago, fecha_emision, descripcion, estado)  
VALUES(150.00, "Efectivo", "2024-03-10", "Consulta veterinaria general", "Pagado"),
(250.00, "Tarjeta de crédito", "2024-03-11", "Vacunación completa para perro", "Pendiente"),
(75.00, "Transferencia bancaria", "2024-03-12", "Compra de medicamento para infecciones", "Pagado"),
(320.00, "Efectivo", "2024-03-14", "Hospitalización de 24 horas", "Pagado"),
(120.00, "Tarjeta de débito", "2024-03-15", "Control y desparasitación", "Pendiente"),
(540.00, "Transferencia bancaria", "2024-03-18", "Cirugía menor", "Pagado"),
(90.00, "Efectivo", "2024-03-20", "Limpieza dental para mascota", "Pendiente"),
(45.00, "Tarjeta de crédito", "2024-03-22", "Compra de vitaminas y suplementos", "Pagado"),
(680.00, "Efectivo", "2024-03-25", "Atención de urgencia", "Pendiente"),
(300.00, "Transferencia bancaria", "2024-03-28", "Examen de laboratorio completo", "Pagado");
/*Vista*/
/*Mascota --> Dueño*/
create view Vista_fucion as
select 
	mascota.Id_mascota,
    mascota.Nombre as Nombre_Mascota,
    mascota.Especie_mascota,
    mascota.Raza_mascota,
    dueno.Nombre as Nobre_Dueno,
    dueno.Direccion,
    dueno.Telefono,
    dueno.Email
from mascota
join dueno on mascota.Id_mascota = dueno.Id_dueno;
/*Funciones*/
/*Fecha de nacimiento de la mascota*/
create function CalcularEdad(Fecha_nacimiento Date)
returns int
deterministic
return timestampdiff(YEAR, Fecha_nacimiento, CURDATE());
/*Procesos*/
/*Actualización de valor Dueño*/
Delimiter //
create procedure insert_dueno(
	in p_Nombre varchar(255),
    in p_Direccion varchar(255),
    in p_Telefono varchar(15),
    in p_Email varchar(255)
)
begin
	insert into dueno(Nombre, Direccion, Telefono, Email)
    values (p_Nombre, p_Direccion, p_Telefono, p_Email);
end //
delimiter ;
/*Trigger*/
/*insert_cita*/
DELIMITER //
CREATE TRIGGER before_cita
BEFORE INSERT ON Cita
FOR EACH ROW
BEGIN
    IF NEW.fecha IS NULL THEN
        SET NEW.fecha = NOW();
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se permite insertar manualmente la fecha.';
    END IF;
END //
DELIMITER ;
