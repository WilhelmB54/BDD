CREATE TABLE Movie (
    movieID INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    releaseDate DATE,
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE Cinema (
    cinemaID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE Seat (
    seatID INT PRIMARY KEY,
    cinemaID INT,
    seatNumber INT,
    FOREIGN KEY (cinemaID) REFERENCES Cinema(cinemaID)
);

CREATE TABLE User (
    userID INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Session (
    sessionID INT PRIMARY KEY,
    movieID INT,
    cinemaID INT,
    showtime DATETIME,
    roomNumber INT,
    availableSeats INT,
    paymentMethod VARCHAR(20),
    userID INT,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    FOREIGN KEY (cinemaID) REFERENCES Cinema(cinemaID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Pricing (
    pricingID INT PRIMARY KEY,
    category VARCHAR(20) NOT NULL,
    price DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Administrator (
    adminID INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    cinemaID INT,
    userID INT,
    FOREIGN KEY (cinemaID) REFERENCES Cinema(cinemaID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

CREATE TABLE Reservation (
    reservationID INT PRIMARY KEY,
    movieID INT,
    cinemaID INT,
    sessionID INT,
    seatID INT,
    userID INT,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    FOREIGN KEY (cinemaID) REFERENCES Cinema(cinemaID),
    FOREIGN KEY (sessionID) REFERENCES Session(sessionID),
    FOREIGN KEY (seatID) REFERENCES Seat(seatID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);

-- Insertion de films
INSERT INTO Movie (title, releaseDate, genre, duration) VALUES
('Inception', '2010-07-16', 'Sci-Fi', 148),
('The Dark Knight', '2008-07-18', 'Action', 152),
('Titanic', '1997-12-19', 'Romance', 195);

-- Insertion de cinémas
INSERT INTO Cinema (name, location) VALUES
('Cinema City A', 'City 1'),
('Cinema City B', 'City 2'),
('Cinema City C', 'City 3');

-- Insertion de sièges
INSERT INTO Seat (cinemaID, seatNumber) VALUES
(1, 101),
(1, 102),
(2, 201),
(2, 202),
(3, 301),
(3, 302);

-- Insertion d'utilisateurs
INSERT INTO User (username, email) VALUES
('User1', 'user1@email.com'),
('User2', 'user2@email.com');

-- Insertion de tarifs
INSERT INTO Pricing (category, price) VALUES
('Plein tarif', 9.20),
('Étudiant', 7.60),
('Moins de 14 ans', 5.90);

-- Insertion d'administrateurs
INSERT INTO Administrator (username, password, cinemaID, userID) VALUES
('AdminCinemaA', 'password1', 1, 1),
('AdminCinemaB', 'password2', 2, 2),
('AdminCinemaC', 'password3', 3, 1);

-- Insertion de séances
INSERT INTO Session (movieID, cinemaID, showtime, roomNumber, availableSeats, paymentMethod, userID) VALUES
(1, 1, '2024-01-01 18:00:00', 1, 50, 'On site', 1),
(2, 2, '2024-01-02 20:30:00', 2, 40, 'Online', 2),
(3, 3, '2024-01-03 15:45:00', 3, 60, 'On site', 1);

-- Insertion de réservations
INSERT INTO Reservation (movieID, cinemaID, sessionID, seatID, userID) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 4, 2),
(3, 3, 3, 6, 1);