DROP TABLE IF EXISTS transactions;

DROP TABLE IF EXISTS flight_schedule;

CREATE TABLE flight_schedule (
    flight_id VARCHAR(10) PRIMARY KEY NOT NULL,
    airc_id VARCHAR(50) NOT NULL,
    route_id VARCHAR(20) NOT NULL,
    flight_date TIMESTAMP,
    departure VARCHAR(20),
    destination VARCHAR(20),
    FOREIGN KEY (airc_id) REFERENCES aircraft (airc_id),
    FOREIGN KEY (route_id) REFERENCES route (route_id)
);

CREATE TABLE transactions (
    trans_id VARCHAR(5) PRIMARY KEY NOT NULL,
    flight_id VARCHAR(10) NOT NULL,
    ps_id VARCHAR(10) NOT NULL,
    booking_date TIMESTAMP,
    FOREIGN KEY (flight_id) REFERENCES flight_schedule (flight_id),
    FOREIGN KEY (ps_id) REFERENCES passenger (ps_id)
);

INSERT INTO
    flight_schedule (
        flight_id,
        airc_id,
        route_id,
        flight_date,
        departure,
        destination
    )
VALUES 
    ('FL01', 'AC10', 'R05', '2026-06-01 08:00:00', 'Tokyo', 'Singapore'),
    ('FL02', 'AC01', 'R12', '2026-06-01 12:30:00', 'Sydney', 'Auckland'),
    ('FL03', 'AC15', 'R01', '2026-06-02 09:15:00', 'Istanbul', 'New York'),
    ('FL04', 'AC03', 'R19', '2026-06-02 16:45:00', 'Stockholm', 'Helsinki'),
    ('FL05', 'AC10', 'R02', '2026-06-03 07:30:00', 'London', 'Istanbul'),
    ('FL06', 'AC20', 'R08', '2026-06-03 14:00:00', 'Madrid', 'Lisbon'),
    ('FL07', 'AC05', 'R01', '2026-06-04 11:00:00', 'Istanbul', 'New York'),
    ('FL08', 'AC12', 'R14', '2026-06-04 19:20:00', 'Mexico City', 'Cancun'),
    ('FL09', 'AC01', 'R05', '2026-06-05 06:30:00', 'Tokyo', 'Singapore'),
    ('FL10', 'AC08', 'R10', '2026-06-05 15:10:00', 'Zurich', 'Munich'),
    ('FL11', 'AC02', 'R03', '2026-06-06 10:00:00', 'Paris', 'Dubai'),
    ('FL12', 'AC19', 'R20', '2026-06-06 18:30:00', 'Dublin', 'Edinburgh'),
    ('FL13', 'AC07', 'R07', '2026-06-07 08:45:00', 'Amsterdam', 'Barcelona'),
    ('FL14', 'AC10', 'R01', '2026-06-07 13:00:00', 'Istanbul', 'New York'),
    ('FL15', 'AC04', 'R15', '2026-06-08 21:00:00', 'Sao Paulo', 'Buenos Aires'),
    ('FL16', 'AC14', 'R09', '2026-06-08 09:00:00', 'Rome', 'Athens'),
    ('FL17', 'AC06', 'R11', '2026-06-09 12:15:00', 'Cairo', 'Doha'),
    ('FL18', 'AC18', 'R04', '2026-06-09 17:00:00', 'San Francisco', 'Los Angeles'),
    ('FL19', 'AC09', 'R17', '2026-06-10 07:00:00', 'Beijing', 'Shanghai'),
    ('FL20', 'AC11', 'R06', '2026-06-10 22:00:00', 'Frankfurt', 'Ankara');

INSERT INTO
    transactions (
        trans_id,
        flight_id,
        ps_id,
        booking_date
    )
VALUES 
    ('T01', 'FL03', 'PS12', '2026-04-01 10:00:00'),
    ('T02', 'FL01', 'PS05', '2026-04-01 14:20:00'),
    ('T03', 'FL14', 'PS12', '2026-04-02 09:10:00'),
    ('T04', 'FL07', 'PS01', '2026-04-02 16:00:00'),
    ('T05', 'FL02', 'PS19', '2026-04-03 11:30:00'),
    ('T06', 'FL10', 'PS03', '2026-04-03 18:45:00'),
    ('T07', 'FL05', 'PS08', '2026-04-04 08:15:00'),
    ('T08', 'FL05', 'PS01', '2026-04-04 12:00:00'),
    ('T09', 'FL12', 'PS14', '2026-04-05 09:50:00'),
    ('T10', 'FL09', 'PS20', '2026-04-05 15:30:00'),
    ('T11', 'FL04', 'PS07', '2026-04-06 10:20:00'),
    ('T12', 'FL18', 'PS03', '2026-04-06 17:00:00'),
    ('T13', 'FL06', 'PS11', '2026-04-07 11:10:00'),
    ('T14', 'FL20', 'PS04', '2026-04-07 14:25:00'),
    ('T15', 'FL11', 'PS15', '2026-04-08 08:00:00'),
    ('T16', 'FL15', 'PS09', '2026-04-08 19:00:00'),
    ('T17', 'FL08', 'PS18', '2026-04-09 10:40:00'),
    ('T18', 'FL17', 'PS02', '2026-04-09 13:15:00'),
    ('T19', 'FL13', 'PS16', '2026-04-10 16:20:00'),
    ('T20', 'FL16', 'PS06', '2026-04-10 21:00:00');  

COMMIT;