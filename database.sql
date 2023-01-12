DROP DATABASE IF EXISTS excellenttaste;

CREATE DATABASE excellenttaste;

USE excellenttaste;

CREATE table gerechtcategorieen (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
    Code VARCHAR(3) UNIQUE,
    Naam VARCHAR(20),
    PRIMARY KEY(ID)
);

CREATE table klanten (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
    Naam VARCHAR(20) NOT NULL,
    Telefoon VARCHAR(11) NOT NULL,
    Email VARCHAR(128) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE table gerechtsoorten (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
    Code VARCHAR(3) UNIQUE,
    Naam VARCHAR(20),
    Gerechtcategorie_ID int(11) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (Gerechtcategorie_ID) REFERENCES gerechtcategorieen(ID)
);

CREATE table menuitems (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
    Code VARCHAR(4) UNIQUE,
    Naam VARCHAR(30),
    Gerechtsoort_ID int(11) NOT NULL,
    Prijs DECIMAL(6,2) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (Gerechtsoort_ID) REFERENCES gerechtsoorten(ID)
);

CREATE table reserveringen (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
  	Tafel int(11) NOT NULL,
    Datum date NOT NULL,
    Tijd time NOT NULL,
    Klant_ID int(11) NOT NULL,
    Aantal int(11) NOT NULL,
    Status tinyint(4) NOT NULL DEFAULT '1',
    Datum_toegevoegd timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Allergieen text,
    Opmerkingen text,
    UNIQUE (ID, Datum, Tijd),
    PRIMARY KEY(ID),
    FOREIGN KEY (Klant_ID) REFERENCES klanten(ID)
);

CREATE table bestellingen (
    ID int(11) NOT NULL AUTO_INCREMENT UNIQUE, 
  	Reservering_ID int(11) NOT NULL,
    Menuitem_ID int(11) NOT NULL,
    Aantal int(11),
    Geserveerd tinyint(4) DEFAULT '0',
    Klaar tinyint(4) DEFAULT '0',
    PRIMARY KEY(ID),
    FOREIGN KEY (Reservering_ID) REFERENCES reserveringen(ID),
    FOREIGN KEY (Menuitem_ID) REFERENCES menuitems(ID)
);

INSERT INTO `klanten` (`ID`, `Naam`, `Telefoon`, `Email`) 
VALUES (NULL, 'Jeroen Krabber', '0632659825', 'Jeroenkrabber@gmail.com'),
(NULL, 'Piet Hein', '0537726986', 'Piethein@gmail.com');

INSERT INTO `reserveringen` (`ID`, `Tafel`, `Datum`, `Tijd`, `Klant_ID`, `Aantal`, `Status`, `Datum_toegevoegd`, `Allergieen`, `Opmerkingen`) 
VALUES (NULL, '4', '2022-06-30', '10:11:30', '2', '4', '1', current_timestamp(), NULL, 'Bij het raam'),
(NULL, '2', '2022-06-24', '09:15:00', '2', '3', '1', current_timestamp(), 'Seafood', NULL);

INSERT INTO `gerechtcategorieen` (`ID`, `Code`, `Naam`) 
VALUES (NULL, 'Dr', 'Dranken'),
(NULL, 'Hap', 'Hapjes'),
(NULL, 'Voo', 'Voorgerechten'),
(NULL, 'Hoo', 'Hoofdgerechten'),
(NULL, 'Nag', 'Nagerechten')
;

INSERT INTO `gerechtsoorten` (`ID`, `Code`, `Naam`, `Gerechtcategorie_ID`) 
VALUES (NULL, 'B', 'Bieren', '1'),
(NULL, 'F', 'Frisdranken', '1'),
(NULL, 'WD', 'Warme dranken', '1'),
(NULL, 'W', 'Wijnen', '1'),
(NULL, 'KH', 'Koude hapjes', '2'),
(NULL, 'WH', 'Warme hapjes', '2'),
(NULL, 'Veg', 'Vegetarisch', '3'),
(NULL, 'Vis', 'Vis', '3'),
(NULL, 'Vls', 'Vlees', '3'),
(NULL, 'Ijs', 'Ijs', '4'),
(NULL, 'Mou', 'Mousse', '4'),
(NULL, 'KV', 'Koud', '5'),
(NULL, 'WV', 'Warm', '5')
;

INSERT INTO `menuitems` (`ID`, `Code`, `Naam`, `Gerechtsoort_ID`, `Prijs`) 
VALUES (NULL, 'Pils', 'Pilsner', '2', '2.50'),
(NULL, 'Chau', 'Chaudfontaine rood', '1', '2.49'),
(NULL, 'Koff', 'Koffie', '1', '2.00'),
(NULL, 'Glas', 'Per glas', '1', '2.50'),
(NULL, 'KaMo', 'Portie kaas met mosterd', '2', '5.50'),
(NULL, 'BiMo', 'Portie bitterballetjes met mosterd', '2', '4.50'),
(NULL, 'GeBa', 'Gebakken banaan', '2', '7.50'),
(NULL, 'GeMa', 'Gebakken makreel', '2', '9.00'),
(NULL, 'Wien', 'Wienerschnitzel', '2', '8.50'),
(NULL, 'Vruc', 'Vruchtenijs', '4', '3.50'),
(NULL, 'Choc', 'Chocolademousse', '4', '3.50'),
(NULL, 'Sala', 'Salade met geitenkaas', '5', '11.50'),
(NULL, 'Toma', 'Tomatensoep', '5', '10.75')
;

INSERT INTO `bestellingen` (`ID`, `Reservering_ID`, `Menuitem_ID`, `Aantal`, `Geserveerd`, `Klaar`) VALUES 
    (NULL, '1', '2', '2', '0','0')
;

/* CREATE TABLE users ( 
    id INT(11) NOT NULL AUTO_INCREMENT,
    Voornaam VARCHAR(255) NOT NULL,
    Voorvoegsel VARCHAR(255),
    Achternaam VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    UNIQUE (medewerkersid),
    PRIMARY KEY (medewerkersid)
);


ALTER TABLE users
ADD password char(32);

*/




