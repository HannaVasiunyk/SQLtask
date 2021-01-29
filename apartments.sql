USE apartments;

CREATE TABLE hotels (
  id int NOT NULL,
  name varchar(50),
  foundation_year date,
  adress varchar(50),
  PRIMARY KEY (id)
);

CREATE TABLE rooms (
  room_id int NOT NULL,
  number int NOT NULL,
  price int,
  comfort_level int,
  capability int,
  hotel_id int,
  PRIMARY KEY (room_id),
  CONSTRAINT fk_hotel_room FOREIGN KEY (hotel_id) REFERENCES hotels (id)
);

CREATE TABLE users (
  user_id int NOT NULL,
  name varchar(20),
  email varchar(50),
  PRIMARY KEY (user_id)
);

CREATE TABLE reservation (
  id int NOT NULL,
  user_id int NOT NULL,
  room_id int NOT NULL,
  start_date date,
  end_date date,
  PRIMARY KEY (id),
  CONSTRAINT fk_room FOREIGN KEY (room_id) REFERENCES rooms (room_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO apartments.hotels (id, name, foundation_year, adress) 
VALUES
(1, 'Edelweiss', '2012-12-20', 'Hrinchenka 15'), 
(2, 'Lviv', '2015-10-12', 'Holovatogo 4'),
(3, 'Dnister', '2021-01-10', 'Karmeluka 16');

SELECT * FROM apartments.hotels;

UPDATE apartments.hotels 
SET foundation_year = '1937-12-20' 
WHERE id = 1;

DELETE FROM apartments.hotels 
WHERE id = 3;

INSERT INTO apartments.users
(user_id, name, email) 
VALUES
(1, 'Anton', 'anton@gmai.com'),
(2, 'Andrew', 'andr@gmail.com'),
(3, 'Anton', 'antone@gmai.com'),
(4, 'Max', 'max@gmail.com'),
(5, 'Eler', 'eler@gmai.com'),
(6, 'Illya', 'illya@gmail.com'),
(7, 'Bogdan', 'bd@gmai.com'),
(8, 'Mark', 'mark@gmail.com'),
(9, 'Anton', 'antone@gmai.com'),
(10, 'Mark', 'markian@gmail.com');

SELECT *  FROM apartments.users 
WHERE name LIKE 'A%';

INSERT INTO apartments.rooms
(room_id, number, price, comfort_level, capability, hotel_id) 
VALUES
(1, 101, 370,  1, 4, 1),
(2, 101, 550,  2, 2, 2),
(3, 301, 1200,  3, 1, 1),
(4, 505, 550,  2, 2, 1),
(5, 111, 340,  1, 4, 1),
(6, 220, 750,  3, 2, 2),
(7, 501, 1000,  3, 1, 1),
(8, 525, 520,  2, 2, 1),
(9, 131, 460,  2, 3, 1),
(10, 153, 350,  1, 4, 2);

SELECT * FROM apartments.rooms
ORDER BY price;

SELECT * FROM apartments.rooms
WHERE hotel_id = 1
ORDER BY price;

SELECT * FROM apartments.rooms
WHERE comfort_level = 3;

USE apartments;
SELECT hotels.name, rooms.number 
FROM hotels JOIN rooms
ON hotels.id = rooms.hotel_id
WHERE comfort_level = 1;

USE apartments;
SELECT hotels.name, sum(capability) FROM 
hotels JOIN rooms 
ON hotels.id = rooms.hotel_id
WHERE rooms.hotel_id = 1
UNION
SELECT hotels.name, sum(capability) FROM 
hotels JOIN rooms 
ON hotels.id = rooms.hotel_id
WHERE rooms.hotel_id = 2;

INSERT INTO apartments.reservation
(id, user_id, room_id, start_date, end_date) 
VALUES
(1, 1, 1,  '2020-09-20', '2020-09-25'),
(2, 6, 5,  '2020-12-12', '2020-12-19'),
(3, 5, 1,  '2020-12-12', '2020-12-19'),
(4, 5, 6,  '2020-02-12', '2020-02-19'),
(5, 9, 7,  '2020-09-20', '2020-09-25'),
(6, 3, 8,  '2020-07-13', '2020-07-19'),
(7, 2, 2,  '2020-02-23', '2020-02-25'),
(8, 1, 5,  '2020-10-10', '2020-10-25'),
(9, 1, 4,  '2020-11-21', '2020-11-23'),
(10, 4, 3,  '2020-12-12', '2020-12-19');

USE apartments;
SELECT users.name, rooms.number, start_date, end_date 
FROM users INNER JOIN reservation
ON users.user_id = reservation.user_id
INNER JOIN rooms
ON reservation.room_id = rooms.room_id;
