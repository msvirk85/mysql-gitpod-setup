DROP DATABASE airline;
CREATE DATABASE IF NOT EXISTS airline;
USE airline;
CREATE TABLE `Customer` (
    `pk_customerID` int unsigned auto_increment,
    `cFirstName` varchar(60),
    `cLastName` varchar(60),
    `cCitizenshipCountry` varchar(60),
    `cPassportNumber` varchar(9),
    `cMailingAddress` Varchar(255),
    PRIMARY KEY (`pk_customerID`)
);
CREATE TABLE `Airport` (
    `pk_airportID` int unsigned auto_increment,
    `aCity` varchar(60),
    `aCountry` varchar(56),
    `aTax` decimal(5, 2),
    `aCurrency` char(3),
    PRIMARY KEY (`pk_airportID`)
);
CREATE TABLE `Booking_Office` (
    `pk_bookingOfficeID` int unsigned auto_increment,
    `boCity` varchar(60),
    `boCountry` varchar(56),
    PRIMARY KEY (`pk_bookingOfficeID`)
);
CREATE TABLE `Booking` (
    `pk_bookingID` int unsigned auto_increment,
    `fk_customerID` int unsigned not null,
    `fk_bookingOfficeID` int unsigned not null,
    `bDate` date,
    `bTime` time,
    `bClass` varchar(10),
    `bTotalPrice` decimal(8, 2),
    `bStatus` varchar(10),
    PRIMARY KEY (`pk_bookingID`)
);
CREATE TABLE `Flight` (
    `pk_flightID` int unsigned auto_increment,
    `fk_airlineID` int unsigned not null,
    `fk_flightOrigin` int unsigned not null,
    `fk_flightDestination` int unsigned not null,
    `fStatus` varchar(11),
    `fDepartureDate` date,
    `fDepartureTime` time,
    `fArrivalDate` date,
    `fArrivalTime` time,
    `fTotalSeatsFirst` int unsigned,
    `fTotalSeatsBusiness` int unsigned,
    `fTotalSeatsEconomy` int unsigned,
    `fBookedSeatsFirst` int unsigned,
    `fBookedSeatsBusiness` int unsigned,
    `fBookedSeatsEconomy` int unsigned,
    `fListedPrice` decimal(8, 2),
    `fk_flighttNumber` varchar(10),
    PRIMARY KEY (`pk_flightID`)
);
CREATE TABLE `Booking_Flight` (
    `pk_bookingFlightID` int unsigned auto_increment,
    `fk_bookingID` int unsigned not null,
    `fk_flightID` int unsigned not null,
    PRIMARY KEY (`pk_bookingFlightID`)
);
CREATE TABLE `Payment` (
    `pk_paymentID` int unsigned auto_increment,
    `fk_bookingID` int unsigned not null,
    `paDate` date,
    `paDueDate` date,
    `paReceivedPayment` decimal(8, 2),
    PRIMARY KEY (`pk_paymentID`)
);
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Gates',
        'Kingaby',
        'China',
        'ZaDRSLToR',
        '2 Prairieview Terrace'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Terry',
        'Macari',
        'Albania',
        'DXE7DjVT2',
        '857 Monument Street'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Antonina',
        'Purrington',
        'Indonesia',
        'OxhHyngtk',
        '14 Loftsgordon Court'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Siobhan',
        'Prosek',
        'Japan',
        'qY7fbjsk',
        '7833 Division Plaza'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Brittne',
        'Realff',
        'China',
        '26K6lIQQz',
        '21117 Pine View Crossing'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Bryna',
        'Willshire',
        'Ukraine',
        'N9TuUZcf',
        '8 Ridgeway Lane'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Kenton',
        'Pleasance',
        'Nicaragua',
        've4FcHDKL',
        '2 Wayridge Junction'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Chauncey',
        'Wyldbore',
        'Germany',
        'UL9l3NRR',
        '2 Montana Avenue'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Ethelyn',
        'Jennions',
        'Russia',
        'gkmmd6oHQ',
        '4 Iowa Point'
    );
INSERT INTO Customer (
        cFirstName,
        cLastName,
        cCitizenshipCountry,
        cPassportNumber,
        cMailingAddress
    )
VALUES (
        'Chelsey',
        'Musterd',
        'Brazil',
        '3l5HR53D5',
        '29723 Spenser Plaza'
    );
INSERT INTO Airport (aCity, aCountry, aTax, aCurrency)
VALUES ('Totonto', 'Canada', '1', 'CAD'),
    ('Vancouver', 'Canada', '2', 'CAD'),
    ('Calgary', 'Canada', '1', 'CAD'),
    ('Edmonton', 'Canada', '1', 'CAD'),
    ('Heathrow', 'United Kingdom', '2', "GBP");
INSERT INTO `Booking_Office` (`pk_bookingOfficeID`, `boCity`, `boCountry`)
VALUES (1, "Edinburgh", "United Kingdom"),
    (2, "Nice", "France"),
    (3, "Chicago", "United State of America"),
    (4, "Nice", "France"),
    (5, "Toronto", "Canada");
INSERT INTO `Booking` (
        `fk_customerID`,
        `fk_bookingOfficeID`,
        `bDate`,
        `bTime`,
        `bClass`,
        `bTotalPrice`,
        `bStatus`
    )
VALUES (
        1,
        1,
        "2022-01-18",
        "14:03:25",
        "Economy",
        633,
        "Booked"
    ),
    (
        2,
        2,
        "2022-01-29",
        "19:02:23",
        "Business",
        129,
        "Scratched"
    ),
    (
        1,
        3,
        "2022-01-22",
        "03:07:21",
        "Economy",
        797,
        "Scratched"
    ),
    (
        4,
        4,
        "2022-01-02",
        "10:31:22",
        "Economy",
        472,
        "Booked"
    ),
    (
        5,
        5,
        "2022-01-26",
        "23:56:19",
        "Business",
        704,
        "Scratched"
    );
INSERT INTO `Flight` (
        `fk_airlineID`,
        `fk_flightOrigin`,
        `fk_flightDestination`,
        `fStatus`,
        `fDepartureDate`,
        `fDepartureTime`,
        `fArrivalDate`,
        `fArrivalTime`,
        `fTotalSeatsFirst`
    )
VALUES (
        1,
        1,
        2,
        "On Schedule",
        "2022-01-05",
        "05:02:38",
        "2022-02-06",
        "14:13:09",
        8
    ),
    (
        2,
        2,
        3,
        "Delayed",
        "2022-01-16",
        "04:17:50",
        "2022-02-01",
        "22:01:16",
        9
    ),
    (
        3,
        3,
        4,
        "On Schedule",
        "2022-01-30",
        "02:27:06",
        "2022-02-03",
        "02:42:13",
        2
    ),
    (
        4,
        4,
        5,
        "In-Flight",
        "2022-01-13",
        "05:49:29",
        "2022-02-13",
        "23:32:08",
        4
    ),
    (
        5,
        5,
        6,
        "In-Flight",
        "2022-01-14",
        "05:46:49",
        "2022-02-15",
        "05:39:25",
        5
    );
INSERT INTO Payment (
        fk_bookingID,
        paDate,
        paDueDate,
        paReceivedPayment
    )
VALUES (1, "2022-01-16", "2022-02-13", 633),
    (2, "2022-01-15", "2022-02-26", 428),
    (3, "2022-01-22", "2022-02-16", 216),
    (4, "2022-01-13", "2022-02-16", 472),
    (5, "2022-01-06", "2022-02-08", 186);

INSERT INTO Booking_Flight (fk_bookingID, fk_flightID)
VALUES (1, 1),
    (2, 2),
    (3, 1),
    (4, 4),
    (5, 5);