
CREATE TABLE Airports (
    airport_code VARCHAR(10) PRIMARY KEY,
    city VARCHAR(100) NOT NULL
);
SELECT * FROM Airports;

CREATE TABLE Flights(
	flight_number INT PRIMARY KEY,
	airline_name VARCHAR(100) NOT NULL,
	dep_airport VARCHAR(10) NOT NULL,
	arr_airport VARCHAR(10) NOT NULL,
	FOREIGN KEY (dep_airport) REFERENCES Airports(airport_code),
	FOREIGN KEY (arr_airport) REFERENCES Airports(airport_code)
);

SELECT * FROM Flights;

CREATE TABLE Passengers (
    passport_number VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passport_number VARCHAR(20) NOT NULL,
    flight_number INT NOT NULL,
    FOREIGN KEY (passport_number) REFERENCES Passengers(passport_number),
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number)
);

CREATE TABLE Seats (
    booking_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (booking_id, seat_number),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

INSERT INTO Airports (airport_code, city) VALUES
('CDG', 'Paris'),
('PEK', 'Peking'),
('ORY', 'Paris'),
('ALA', 'Almaty'),
('NCE', 'Nice'),
('MXP', 'Milan');

INSERT INTO Flights (flight_number, airline_name, dep_airport, arr_airport) VALUES
(2, 'Air1', 'CDG', 'PEK'),
(5, 'Air3', 'ORY', 'ALA'),
(4, 'Air9', 'NCE', 'MXP');

INSERT INTO Passengers (passport_number, full_name) VALUES
('023', 'Lady Bug'),
('456', 'Cat Noir'),
('432', 'Rena Rouge'),
('753', 'Queen Bee'),
('159', 'King Monkey'),
('789', 'Miss Hound');

INSERT INTO Bookings (booking_id, passport_number, flight_number) VALUES
(1, '023', 2),
(2, '456', 2),
(3, '432', 5),
(4, '753', 2),
(5, '159', 4),
(6, '789', 2);

INSERT INTO Seats (booking_id, seat_number, ticket_price) VALUES
(1, 'C12', 250.00),
(1, 'C15', 250.00),
(2, 'C13', 450.00),
(3, 'B16', 1200.00),
(4, 'B4', 450.00),
(5, 'E8', 150.00),
(5, 'E9', 150.00),
(6, 'A5', 450.00);

