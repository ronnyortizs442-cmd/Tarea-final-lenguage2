CREATE DATABASE SistemaCalificacionesPro;
GO

USE SistemaCalificacionesPro;
GO

CREATE TABLE Estudiante (
    IdEstudiante INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Cedula NVARCHAR(20) UNIQUE,
    FechaNacimiento DATE,
    Activo BIT DEFAULT 1
);


CREATE TABLE Profesor (
    IdProfesor INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    Especialidad NVARCHAR(100)
);

CREATE TABLE Materia (
    IdMateria INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100) NOT NULL,
    Creditos INT DEFAULT 3
);


CREATE TABLE Periodo (
    IdPeriodo INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(50), -- Ej: 2026-1
    FechaInicio DATE,
    FechaFin DATE
);


CREATE TABLE Inscripcion (
    IdInscripcion INT PRIMARY KEY IDENTITY,
    EstudianteId INT NOT NULL,
    MateriaId INT NOT NULL,
    ProfesorId INT NOT NULL,
    PeriodoId INT NOT NULL,

    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(IdEstudiante),
    FOREIGN KEY (MateriaId) REFERENCES Materia(IdMateria),
    FOREIGN KEY (ProfesorId) REFERENCES Profesor(IdProfesor),
    FOREIGN KEY (PeriodoId) REFERENCES Periodo(IdPeriodo)
);


CREATE TABLE Calificacion (
    IdCalificacion INT PRIMARY KEY IDENTITY,
    InscripcionId INT NOT NULL,

    Calificacion1 DECIMAL(5,2) CHECK (Calificacion1 BETWEEN 0 AND 100),
    Calificacion2 DECIMAL(5,2) CHECK (Calificacion2 BETWEEN 0 AND 100),
    Calificacion3 DECIMAL(5,2) CHECK (Calificacion3 BETWEEN 0 AND 100),
    Calificacion4 DECIMAL(5,2) CHECK (Calificacion4 BETWEEN 0 AND 100),
    Examen DECIMAL(5,2) CHECK (Examen BETWEEN 0 AND 100),

    FOREIGN KEY (InscripcionId) REFERENCES Inscripcion(IdInscripcion)
);