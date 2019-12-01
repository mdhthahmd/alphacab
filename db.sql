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

--CREATE TABLE journeys (
--    journeyID INT not null primary key
--        GENERATED ALWAYS AS IDENTITY
--        (START WITH 1, INCREMENT BY 1),
--    email VARCHAR(30) NOT NULL,
--    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--    pickup_location VARCHAR(30) NOT NULL,
--    p_lattitude DECIMAL(8 , 8 ) NOT NULL,
--    p_longitude DECIMAL(8 , 8 ) NOT NULL,
--    dropoff_location VARCHAR(30) NOT NULL,
--    d_lattitude DECIMAL(8 , 8 ) NOT NULL,
--    d_longitude DECIMAL(8 , 8 ) NOT NULL
--);

INSERT INTO journeys(
email,
pickup_location,
p_lattitude,
p_longitude,
dropoff_location,
d_lattitude,
d_longitude) 
values(
'nabbu@mail.com',
'ameeneemagu',
450.000,
100.123,
'henveyru',
540.000,
604.000);
