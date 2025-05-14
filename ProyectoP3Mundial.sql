
--Proyecto Progreso 3 Base de Datos del Mundial 

-- Integrantes Isaac Trujillo, Brandon Arrellano 

--Creacion de la Base de datos 

USE MASTER 
create database MUNDIAL
go

--Creacion de las Tablas 

USE MUNDIAL

-- Tabla Jugador
CREATE TABLE JUGADOR (
    IdJugador INT IDENTITY(1,1),
    NombreJugador NVARCHAR(100) NOT NULL,
    ApellidoJugador NVARCHAR(100) NOT NULL,
    NacionalidadJugador NVARCHAR(50) NOT NULL,
    PosicionJugador NVARCHAR(50) NOT NULL,
    ApodoJugador NVARCHAR(50),
    NroCamisetaJugador INT NOT NULL,
    FechaNacimientoJugador DATE NOT NULL
);

ALTER TABLE JUGADOR ADD CONSTRAINT PK_Jugador PRIMARY KEY (IdJugador);


-- Tabla Equipo
CREATE TABLE EQUIPO (
    IdEquipo INT IDENTITY(1,1),
    NombreEquipo NVARCHAR(100) NOT NULL,
    NombreApellidoDT NVARCHAR(100) NOT NULL,
    NacionalidadEquipo NVARCHAR(50) NOT NULL,
    CopasGanadas INT,
);

ALTER TABLE EQUIPO ADD CONSTRAINT PK_Equipo PRIMARY KEY (IdEquipo);



-- Tabla Arbitro
CREATE TABLE ARBITRO (
    IdArbitro INT IDENTITY(1,1),
    PasaporteArbitro NVARCHAR(20) NOT NULL UNIQUE,
    NombreArbitro NVARCHAR(100) NOT NULL,
    ApellidoArbitro NVARCHAR(100) NOT NULL,
    NacionalidadArbitro NVARCHAR(50) NOT NULL,
    InicioActividad DATE NOT NULL
);

ALTER TABLE ARBITRO ADD CONSTRAINT PK_Arbitro PRIMARY KEY (IdArbitro);



-- Tabla Partido
CREATE TABLE PARTIDO (
    IdPartido INT IDENTITY(1,1),
    IdEquipo1 INT NOT NULL,
    IdEquipo2 INT NOT NULL,
    IdArbitro INT NOT NULL,
    IdEstadio INT NOT NULL,
    Duracion INT NOT NULL,
    Instancia NVARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL
);

ALTER TABLE PARTIDO ADD CONSTRAINT PK_Partido PRIMARY KEY (IdPartido);

ALTER TABLE PARTIDO ADD CONSTRAINT FK_Partido_Equipo1 FOREIGN KEY (IdEquipo1) REFERENCES EQUIPO(IdEquipo);
ALTER TABLE PARTIDO ADD CONSTRAINT FK_Partido_Equipo2 FOREIGN KEY (IdEquipo2) REFERENCES EQUIPO(IdEquipo);
ALTER TABLE PARTIDO ADD CONSTRAINT FK_Partido_Arbitro FOREIGN KEY (IdArbitro) REFERENCES ARBITRO(IdArbitro);
ALTER TABLE PARTIDO ADD CONSTRAINT FK_Partido_Estadio FOREIGN KEY (IdEstadio) REFERENCES ESTADIO(IdEstadio);



-- Tabla Estadio
CREATE TABLE ESTADIO (
    IdEstadio INT IDENTITY(1,1),
    NombreEstadio NVARCHAR(100) NOT NULL,
    Ubicacion NVARCHAR(100) NOT NULL,
    Capacidad INT NOT NULL
);

ALTER TABLE ESTADIO ADD CONSTRAINT PK_Estadio PRIMARY KEY (IdEstadio);




-- Tabla Hincha
CREATE TABLE HINCHA (
    IdCedula INT PRIMARY KEY IDENTITY(1,1),
    NombreApellidoHincha NVARCHAR(100) NOT NULL,
    EquipoAsociado NVARCHAR(100)
);

ALTER TABLE HINCHA ADD CONSTRAINT PK_Hincha PRIMARY KEY (IdCedula);




-- Tabla Ticket
CREATE TABLE TICKET (
    IdTicket INT IDENTITY(1,1),
    NroAsiento INT NOT NULL,
    Zona NVARCHAR(50) NOT NULL,
    Fila NVARCHAR(10) NOT NULL,
    IdPartido INT NOT NULL
);

ALTER TABLE TICKET ADD CONSTRAINT PK_Ticket PRIMARY KEY (IdTicket);
ALTER TABLE TICKET ADD CONSTRAINT FK_Ticket_Partido FOREIGN KEY (IdPartido) REFERENCES PARTIDO(IdPartido);



DROP TABLE HINCHA ;
