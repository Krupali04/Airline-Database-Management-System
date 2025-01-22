-- Stored Procedures
-- Stored Procedure to get Reservations for a Passenger
DELIMITER $$

CREATE PROCEDURE GetPassengerReservations (IN p_PassengerID INT)
BEGIN
    SELECT r.ReservationID, r.BookingDate, r.ReservationStatus, f.FlightID, f.DepartureDateTime, f.ArrivalDateTime
    FROM Reservations r
    JOIN Flights f ON r.FlightID = f.FlightID
    WHERE r.PassengerID = p_PassengerID;
END $$

DELIMITER ;

Call GetPassengerReservations(1);

-- Stored Procedure to Cancel Reservation

DELIMITER $$

CREATE PROCEDURE CancelReservation (IN p_ReservationID INT)
BEGIN
    UPDATE Reservations
    SET ReservationStatus = 'Cancelled'
    WHERE ReservationID = p_ReservationID;
END $$

DELIMITER ;


-- Stored Procedure to Calculate Total Revenue for a Flight

DELIMITER $$

CREATE PROCEDURE CalculateFlightRevenue (IN flightID INT)
BEGIN
    SELECT SUM(t.Price) AS TotalRevenue
    FROM Tickets t
    WHERE t.FlightID = flightID;
END $$

DELIMITER ;

CALL CalculateFlightRevenue(2);

