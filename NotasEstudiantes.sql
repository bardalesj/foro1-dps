-- Creación de la base de datos de notas de estudiantes
CREATE DATABASE NotasEstudiantes;

-- Selección de la base de datos creada
USE NotasEstudiantes;

-- Creación de la tabla de estudiantes
CREATE TABLE Estudiantes (
  Carnet VARCHAR(8) NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Email VARCHAR(50) NOT NULL UNIQUE
);

-- Creación de la tabla de materias
CREATE TABLE Materias (
  MateriaId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  Nombre VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(255)
);

-- Creación de la tabla Ciclos
CREATE TABLE Ciclos (
    CicloId INT IDENTITY(1,1) PRIMARY KEY,
    NombreCiclo VARCHAR(50) NOT NULL
);

-- Creación de la tabla NotasCiclos
CREATE TABLE NotasCiclos (
    Carnet VARCHAR(8) NOT NULL,
    MateriaId INT NOT NULL,
    CicloId INT NOT NULL,
    Nota FLOAT NOT NULL,
    PRIMARY KEY (Carnet, MateriaId, CicloId),
    FOREIGN KEY (Carnet) REFERENCES Estudiantes(Carnet),
    FOREIGN KEY (MateriaId) REFERENCES Materias(MateriaId),
    FOREIGN KEY (CicloId) REFERENCES Ciclos(CicloId)
);

INSERT INTO Estudiantes (Carnet, Nombre, Apellido, FechaNacimiento, Email) VALUES 
('JP171968', 'Juan', 'Pérez', '2000-01-01', 'juan.perez@example.com'),
('MG195412', 'María', 'González', '2002-03-15', 'maria.gonzalez@example.com');

INSERT INTO Materias (Nombre, Descripcion) VALUES 
('Matemáticas', 'Curso introductorio a las matemáticas.'),
('Historia', 'Curso sobre la historia de la humanidad.');

INSERT INTO Ciclos (NombreCiclo) VALUES 
('Ciclo 01 - 2023'),
('Ciclo 02 - 2023')

INSERT INTO NotasCiclos (Carnet, MateriaId, CicloId, Nota) VALUES 
('JP171968', 1, 1, 7.5),
('JP171968', 2, 2, 8.2),
('MG195412', 1, 2, 9),
('MG195412', 2, 1, 6.7)