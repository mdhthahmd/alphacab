--CREATE TABLE users (
--    fullName VARCHAR(30) NOT NULL,
--    email VARCHAR(30) NOT NULL,
--    userName VARCHAR(30) NOT NULL,
--    password VARCHAR(30) NOT NULL,
--    userRole VARCHAR(30) NOT NULL,
--    PRIMARY KEY (email)
--);

INSERT INTO users(fullName,email,userName,password,userRole) 
values('Midhath','midhath@mail.com','midhath','midhath','Customer');

--SELECT * FROM users;

-- CREATE TABLE journeys (
--     journeyID INT not null primary key
--         GENERATED ALWAYS AS IDENTITY
--         (START WITH 1, INCREMENT BY 1),
--     email VARCHAR(30) NOT NULL,
--     date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     pickup_location VARCHAR(90) NOT NULL,
--     p_lattitude DECIMAL(16 , 8 ) NOT NULL,
--     p_longitude DECIMAL(16 , 8 ) NOT NULL,
--     dropoff_location VARCHAR(90) NOT NULL,
--     d_lattitude DECIMAL(16 , 8 ) NOT NULL,
--     d_longitude DECIMAL(16 , 8 ) NOT NULL,
--     journeyDistance  DECIMAL(16 , 8 ) NOT NULL,
--     status VARCHAR(10) NOT NULL
-- );

INSERT INTO journeys(
email,
pickup_location,
p_lattitude,
p_longitude,
dropoff_location,
d_lattitude,
d_longitude,
journeyDistance,
status)

values(
'nabbu@mail.com',
'ameeneemagu',
10.000,
20.123,
'henveyru',
40.000,
-04.000,
1234.123,
'UNASSIGNED');
