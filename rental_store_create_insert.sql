DROP DATABASE rental_store;
CREATE DATABASE rental_store;
USE rental_store;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE Country(
    Country_ID INT AUTO_INCREMENT PRIMARY KEY,
    Country VARCHAR(30) NOT NULL
);

CREATE TABLE Category(
	Category_id int auto_increment,
    Category varchar(255) NOT NULL,
    PRIMARY KEY(Category_id)
);

CREATE TABLE Color(
	Color_id INT AUTO_INCREMENT PRIMARY KEY,
    Color VARCHAR(255) NOT NULL
    
);


CREATE TABLE Price(
    Price_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hourly_Price Double,
    Daily_Price Double,
    Weekly_Price Double,
    Monthly_Price Double
);

CREATE TABLE Item(
    Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Quantity INT,
    Category_id INT,
    FOREIGN KEY (Category_id) REFERENCES Category(Category_id) ON DELETE CASCADE,
    Color_id INT,
    FOREIGN KEY (Color_id) REFERENCES Color(Color_id) ON DELETE CASCADE,
    Price_id INT,
    FOREIGN KEY (Price_id) REFERENCES Price(Price_id) ON DELETE CASCADE
);
CREATE TABLE Item_Name(
    Item_Name_ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_id int,
    FOREIGN KEY(Item_id) REFERENCES Item(Item_id) ON DELETE CASCADE,
    Item_Name VARCHAR(255) NOT NULL
);
CREATE TABLE Customer_address
(
	Caddress_id int auto_increment,
    Country_id int,
    FOREIGN KEY(Country_id) REFERENCES Country(Country_id) ON DELETE CASCADE,
    City varchar(255) NOT NULL,
    Street varchar (255) NOT NULL,
    Apartment_Number int NOT NULL,
    Flat_Number int NOT NULL,
    PRIMARY KEY(Caddress_id)
);

CREATE TABLE Customer(
	Customer_id int auto_increment,
    Name varchar(255) NOT NULL,
    Surname varchar(255) NOT NULL,
    Date_of_birth date NOT NULL,
    Caddress_id int,
    FOREIGN KEY(Caddress_id) REFERENCES Customer_address(Caddress_id) ON DELETE CASCADE,
    Gender varchar(255) NOT NULL,
    PRIMARY KEY(Customer_id)
);
CREATE TABLE Rental_time
(
	Rentaltime_id int auto_increment,
    Hour int NOT NULL,
    Day int NOT NULL,
    Week int NOT NULL,
    Month int NOT NULL,
    Item_id int,
    FOREIGN KEY(Item_id) REFERENCES Item(Item_id) ON DELETE CASCADE,
    PRIMARY KEY (Rentaltime_id)
   
);

CREATE TABLE Order_table
(
	Order_id int auto_increment,
    Item_id int,
    FOREIGN KEY(Item_id) REFERENCES Item(Item_id) ON DELETE CASCADE,
    Customer_id int,
    FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    Order_time date NOT NULL,
     Rentaltime_id int,
	FOREIGN KEY(Rentaltime_id) REFERENCES Rental_time(Rentaltime_id) ON DELETE CASCADE,
    PRIMARY KEY(Order_id)
);




CREATE TABLE Customer_PhoneNumber
(
	CPhoneNumber_id int auto_increment,
	Customer_id int,
    FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    Phone_Number varchar(10) NOT NULL,
    PRIMARY KEY(CPhoneNumber_id)
);


CREATE TABLE Staff_address(
	Saddress_id INT AUTO_INCREMENT PRIMARY KEY,
    Country_id INT,
    FOREIGN KEY(Country_id) REFERENCES Country(Country_ID) ON DELETE CASCADE,   
    City VARCHAR(255) NOT NULL,
    Street VARCHAR(255) NOT NULL,
	Apartment_Number INT NOT NULL,
    Flat_Number INT NOT NULL
);

CREATE TABLE Staff (
	Staff_id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    Date_of_Birth DATE NOT NULL,
	Saddress_id INT NOT NULL,
	FOREIGN KEY(Saddress_id) REFERENCES Staff_address(Saddress_id) ON DELETE CASCADE,  
    Gender VARCHAR(255) NOT NULL
   
);

CREATE TABLE Staff_PhoneNumber(
	SPhoneNumber_id INT AUTO_INCREMENT PRIMARY KEY,
    Staff_id INT NOT NULL,
    FOREIGN KEY(Staff_id) REFERENCES  Staff(Staff_id) ON DELETE CASCADE,   
    Phone_Number VARCHAR(255) NOT NULL
    
);



CREATE TABLE Bill(
    Bill_ID INT AUTO_INCREMENT PRIMARY KEY,
    Item_id INT,
    FOREIGN KEY (Item_id) REFERENCES Item(Item_id) ON DELETE CASCADE,
    Customer_id  INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE

);



INSERT INTO country(Country_id,Country)
VALUES (0,'South Korea');
INSERT INTO country(Country)
VALUES('America');
INSERT INTO country(Country)
VALUES('Italy');
INSERT INTO country(Country)
VALUES('German');
INSERT INTO country(Country)
VALUES('Greece');

INSERT INTO Category(Category_id,Category)
VALUES (0,'Mobile Phone');
INSERT INTO Category(Category)
VALUES ('Movie');
INSERT INTO Category(Category)
VALUES ('Laptop');
INSERT INTO Category(Category)
VALUES ('Clothing');
INSERT INTO Category(Category)
VALUES ('Sports');
INSERT INTO Category(Category)
VALUES ('Video Game');
INSERT INTO Category(Category)
VALUES ('Camera');
INSERT INTO Category(Category)
VALUES ('ınstrument');

INSERT INTO Color(Color_id,Color)
VALUES(0,'White');
INSERT INTO Color(Color)
VALUES('Magenta');
INSERT INTO Color(Color)
VALUES('Gray');
INSERT INTO Color(Color)
VALUES('Cosmic Gray');
INSERT INTO Color(Color)
VALUES('Orange');
INSERT INTO Color(Color)
VALUES('Brown');
INSERT INTO Color(Color)
VALUES('Green');
INSERT INTO Color(Color)
VALUES('Blue');
INSERT INTO Color(Color)
VALUES('Yellow');
INSERT INTO Color(Color)
VALUES('Black');
INSERT INTO Color(Color)
VALUES('Red');
INSERT INTO Color(Color)
VALUES('Purple');
INSERT INTO Color(Color)
VALUES('Colorful');


INSERT INTO price(Price_id,Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(0,5.00,25.00,100.00,250.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(0.50,2.50,10.00,25.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(7.50,37.50,150.00,375.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(50.00,250.00,1000.00,3000.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(4.00,20.00,80.00,200.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(1.00,5.00,30.00,150.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(1.50,7.50,30.00,75.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(3.00,15.00,60.00,150.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(2.50,12.50,50.00,200.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(3.00,15.00,60.00,240.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(2.00,10.00,70.00,280.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(6.00,30.00,120.00,300.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(3.50,17.50,70.00,175.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(5.50,27.50,110.00,275.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price,Monthly_Price)
VALUES(1.00,5.00,20.00,50.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price)
VALUES(25.00,125.00,500.00);
INSERT INTO price(Hourly_Price,Daily_Price,Weekly_Price)
VALUES(10.00,50.00,200.00);





INSERT INTO Item(Item_id,Category_id,Quantity,Color_id,Price_id)
VALUES(0,0,17,0,0);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,8,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(2,25,2,2);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(3,20,0,3);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(0,12,3,4);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,20,4,5);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(5,15,1,6);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,10,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(6,3,0,7);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(7,5,5,7);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,11,6,5);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(5,7,1,6);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,16,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,4,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(3,21,7,8);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,9,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(3,7,5,9);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,24,8,10);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,9,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(6,6,9,11);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(0,4,10,11);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,10,11,10);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(0,5,0,12);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(5,7,1,6);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,9,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(2,2,2,13);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(7,4,9,4);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(1,8,1,1);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,10,9,14);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(5,9,1,6);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(3,20,9,15);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(3,35,12,16);
INSERT INTO Item(Category_id,Quantity,Color_id,Price_id)
VALUES(4,30,8,5);


INSERT INTO Item_Name(Item_Name_ID,Item_id,item_name)
VALUES(0,0,'Iphone 11');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(1,'The Social Network');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(2,'Macbook Air');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(3,'Wedding Dress');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(4,'Galaxy S20');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(5,'Basketball Ball');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(6,'FIFA 2021');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(7,'E.T.');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(8,'Canon Eos M50');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(9,'Classic Guitar');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(10,'Football Ball');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(11,'Pac-man');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(12,'The Martian');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(13,'The Hunger Games');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(14,'Jean Dress');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(15,'Back to the Future');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(16,'Leather Jacket');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(17,'Tennis Racket');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(18,'Titanic');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(19,'Sony Alpha A7II');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(20,'Iphone 12');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(21,'Pilates mat');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(22,'Galaxy Note10');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(23,'The Sims 4');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(24,'Jurassic Park');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(25,'Lenovo Ideapad 320');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(26,'Electric guitar');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(27,'The Imitation Game');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(28,'Dumbbell 10kg');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(29,'Mario');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(30,'Wedding Suit');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(31,'Halloween Costume');
INSERT INTO Item_Name(Item_id,item_name)
VALUES(32,'Tennis Balls');

INSERT INTO Customer_address(Caddress_id,Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(0,1,'San Diego','915 Jones Avenue',289,32);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(0,'Seoul','Gangnam',5,17);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Cortland','4636 Browning Lane',253,32);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Portland','2173 Illinois Avenue',120,11);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Omaha','313 Bungalow Road',75,01);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Oakland','2143 Wayside Lane',15,45);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'South Burlington','193 Hardman Road',20,34);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Marquette','2384 Wood Duck Drive',52,51);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Davenport','4534 Garfield Road',24,15);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Mountain View','372 Hilltop Haven Drive',175,21);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Bethel','2813 Karen Lane',150,15);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(4,'Athens', 'Agiou Konstantinou Street',43,12);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Philomath','4689 Buena Vista Avenue',223,02);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Immokalee','2193 Village View Drive',172,05);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Sulphur Springs','4578 Alpha Avenue',189,23);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Atlanta','4834 Kuhl Avenue',163,35);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Deerfield Beach','108 Travis Street',97,11);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Leoville','1358 Stewart Street',56,45);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Columbia','1431 Marion Street',95,27);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Harold','4888 Leroy Lane',350,56);
INSERT INTO Customer_address(Country_id,City,Street,Apartment_Number,Flat_Number)
VALUES(1,'Houston','1781 Monroe Street',28,31);


INSERT INTO Customer(Customer_id,Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES(0,'Mary', 'Villeda','1982-01-27',0,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Sehun','Oh','1994-12-04',1,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Willard','Gill','2000-07-18',2,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Mary','Espinoza','1990-07-01',3,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Denise','Gonzalez','1957-01-10',4,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Mathew','Abadie','1979-01-15',5,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Walter','Pullen','1987-08-26',6,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Frances','Jessup','1983-01-08',7,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Jeffrey','Washington','1970-08-03',8,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Richard','Novotny','1981-09-01',9,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Brad','Lilly','1997-05-18',10,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Helen','Lupo','1957-09-23',11,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Thomas','Obanion','1954-08-29',12,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Ernestina','Roberge','1963-06-11',13,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Francis','Crouse','1956-03-08',14,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Carmen','Solomon','2000-12-4',15,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Claudia','Doyle','1994-02-16',16,'Female');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('William','Jones','1991-02-03',17,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Justin','Hensley','1991-05-15',18,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Christopher','Smith','1966-01-02',19,'Male');
INSERT INTO Customer(Name,Surname,Date_of_birth,Caddress_id,Gender)
VALUES('Kimberly','Vela','1966-04-04',20,'Female');

INSERT INTO Rental_time(Rentaltime_id, Hour, Day, Week, Month, Item_id) VALUES (0,0,0,2,0,1);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,0,0,1,6);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,2,0,0,12);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,3,0,0,24);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,0,2,0,2);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,2,0,0,30);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,2,0,0,3);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (0,1,0,0,9);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (4,0,0,0,14);
INSERT INTO Rental_time(Hour, Day, Week, Month, Item_id) VALUES (5,0,0,0,26);


INSERT INTO Order_table(Order_id, Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (0,1,1,'2020-12-5',0);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (1,1,'2020-12-5',1);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (6,5,'2020-12-5',2);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (12,6,'2020-12-6',3);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (24,10,'2020-12-7',4);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (2,1,'2020-12-7',5);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (30,17,'2020-12-8',6);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (3,13,'2020-12-8',7);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (9,5,'2020-12-11',8);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (14,20,'2020-12-11',9);
INSERT INTO Order_table(Item_id, Customer_id, Order_time,Rentaltime_id) VALUES (26,9,'2020-12-11',6);









INSERT INTO Customer_PhoneNumber(CPhoneNumber_id,Customer_id,Phone_Number) VALUES (0,0,'8324044610');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (1,'8221215130');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (2,'6077589080');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (3,'9715330245');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (4,'4029808505');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (5,'5107185566');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (6,'8023536574');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (7,'9062501654');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (8,'2092207853');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (9,'4694220685');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (10,'2063724498');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (11,'2132192087');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (12,'7747017681');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (13,'7202359790');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (14,'3154408710');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (15,'3375963905');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (16,'2133292668');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (17,'5017124164');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (18,'4074085181');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (19,'3306876441');
INSERT INTO Customer_PhoneNumber(Customer_id,Phone_Number) VALUES (20,'7087156659');




INSERT INTO Staff_address(Saddress_id, Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (0,1,'San Antonio','4501 Parrish Avenue',12,2);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Cape Coral','675 Village View Drive',32,6);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Tucson','3400 Dogwood Lane',71,3);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Netcong','4624 Granville Lane',14,2);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Colorado Springs','445 Clover Drive',16,4);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (2,'Rome','Via dei Fori Imperiali',53,1);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (3,'Bavaria','Gartenstrasse',47,3);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Mansfield','591 Still Street',46,3);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Savannah','3173 Austin Avenue',13,4);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Northbrook','4875 Clark Street',30,2);
INSERT INTO Staff_address(Country_id, City, Street, Apartment_Number, Flat_Number) VALUES (1,'Brooklyn','3803 Longview Avenue',21,3);



INSERT INTO Staff(Staff_id,Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES (0,'Francis','Brown','1995-05-03 ',3,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Oscar','Smith','1993-07-12 ',1,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Linda','Becks','1994-12-27',4,'Female');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('David','Luis','1995-06-30',0,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Mary','San','1997-07-06',2,'Female');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Everette','Botth','1991-03-04',7,'Female');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Douglas','Mich','1980-03-21',9,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Teresa','Washington','1986-04-06',5,'Female');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Joe','Jonas','1989-07-09',10,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Allan','Belcher','1990-12-30',6,'Male');
INSERT INTO Staff(Name, Surname, Date_of_Birth, Saddress_id, Gender) VALUES ('Jack','Lane','1996-01-05',8,'Male');

INSERT INTO Staff_PhoneNumber(SPhoneNumber_id, Staff_id,Phone_Number) VALUES (0,0,'6069354952');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (1,'6063040835');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (2,'9372051153');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (3,'5019884105');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (4,'7207257463');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (5,'9709047472');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (6,'5405482034');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (7,'6107960612');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (8,'2152602703');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (9,'5736394047');
INSERT INTO Staff_PhoneNumber(Staff_id,Phone_Number) VALUES (10,'6022379955');

INSERT INTO Bill(Bill_ID,Item_id,Customer_id) VALUES (0,1,1);
INSERT INTO Bill(Item_id,Customer_id) VALUES (6,5);
INSERT INTO Bill(Item_id,Customer_id) VALUES (12,6);
INSERT INTO Bill(Item_id,Customer_id) VALUES (24,10);
INSERT INTO Bill(Item_id,Customer_id) VALUES (2,1);
INSERT INTO Bill(Item_id,Customer_id) VALUES (30,17);
INSERT INTO Bill(Item_id,Customer_id) VALUES (3,13);
INSERT INTO Bill(Item_id,Customer_id) VALUES (9,5);
INSERT INTO Bill(Item_id,Customer_id) VALUES (14,20);
INSERT INTO Bill(Item_id,Customer_id) VALUES (26,9);
