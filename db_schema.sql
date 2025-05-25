
CREATE TABLE Clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    telefon VARCHAR(20),
    correu_electronic VARCHAR(100)
);

CREATE TABLE Vehicle (
    idVehicle INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20),
    model VARCHAR(100),
    any INT,
    idClient INT,
    FOREIGN KEY (idClient) REFERENCES Clients(idClient)
);

CREATE TABLE Cites (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    servei VARCHAR(255),
    idClient INT,
    idVehicle INT,
    FOREIGN KEY (idClient) REFERENCES Clients(idClient),
    FOREIGN KEY (idVehicle) REFERENCES Vehicle(idVehicle)
);
