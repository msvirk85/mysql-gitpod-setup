use airline;
-- Get the average airport tax by country
SELECT aCountry,
    AVG(aTax) as 'Average Airport Tax'
from Airport
GROUP BY aCountry;
-- Get all customers with Booking
SELECT *
From Customer
    INNER JOIN Booking ON pk_customerID = fk_customerID;
-- Get all customers with Booking and Payment
SELECT *
From Customer
    INNER JOIN Booking ON pk_customerID = fk_customerID
    INNER JOIN Payment ON pk_bookingID = fk_bookingID;
--  Get all customers with scratched booking status and the payments received
SELECT *
From Customer
    INNER JOIN Booking ON pk_customerID = fk_customerID
    INNER JOIN Payment ON pk_bookingID = fk_bookingID
WHERE bStatus = 'Scratched';
-- create view for query above
CREATE view Scratched_Booking AS
SELECT cFirstName,
    bClass,
    bStatus,
    paReceivedPayment
FROM Customer
    INNER JOIN Booking ON pk_customerID = fk_customerID
    INNER JOIN Payment ON pk_bookingID = fk_bookingID
WHERE bStatus = 'Scratched';
-- Run query on view 
-- Get Scratched bookings of Business Class
SELECT *
FROM Scratched_Booking
WHERE bClass = 'Business';
-- Stored Procedure to find flights with a given status
DELIMITER // 
CREATE PROCEDURE FlightWithStatus(IN flightStatus VARCHAR(11)) 
BEGIN
SELECT *
From Flight
WHERE fStatus = flightStatus;
END// 
DELIMITER ;

-- Call the stored procedure
CALL FlightWithStatus('In-Flight');