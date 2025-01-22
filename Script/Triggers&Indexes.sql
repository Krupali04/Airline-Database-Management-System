-- Indexes

CREATE INDEX idx_reservation_passenger_flight ON Reservations(PassengerID, FlightID);

CREATE INDEX idx_routeid ON Flights (RouteID);

CREATE INDEX idx_crew_schedule ON WorkSchedules (CrewID, WorkScheduleID);

CREATE INDEX idx_flight_status ON Flights (FlightStatus);

CREATE INDEX idx_flight_id ON Tickets(FlightID);

-- Trigger

-- Trigger to Prevent Booking Flights for Aircraft That Are Unavailable
DELIMITER $$

CREATE TRIGGER PreventBookingUnavailableAircraft
BEFORE INSERT ON flights
FOR EACH ROW
BEGIN
    DECLARE aircraft_status VARCHAR(20);
    -- Get the availability status of the aircraft
    SELECT AvailabilityStatus INTO aircraft_status
    FROM aircrafts
    WHERE AircraftID = NEW.AircraftID;
    
    -- If the aircraft is unavailable, raise an error
    IF aircraft_status = 'Unavailable' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot book a flight for an unavailable aircraft';
    END IF;
END $$

DELIMITER ;



