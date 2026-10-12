CREATE TABLE aircraft (
    airc_id VARCHAR(50) PRIMARY KEY NOT NULL,
    airc_type VARCHAR(20) NOT NULL,
    capacity INTEGER,
    manf_year INTEGER
);

CREATE TABLE route (
    route_id VARCHAR(20) PRIMARY KEY NOT NULL,
    dept_airport VARCHAR(5),
    dest_airport VARCHAR(5)
);

CREATE TABLE contact_details (
    cid VARCHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR(50),
    age INTEGER,
    nationality VARCHAR(15),
    email VARCHAR(50),
    mobile VARCHAR(20)
);

CREATE TABLE passenger (
    ps_id VARCHAR(10) PRIMARY KEY NOT NULL,
    cid VARCHAR(5) NOT NULL,
    FOREIGN KEY (cid) REFERENCES contact_details (cid)
);

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

INSERT INTO aircraft (airc_id, airc_type, capacity, manf_year)
VALUES 
    ('AC01', 'Boeing 737', 180, 2015),
    ('AC02', 'Airbus A320', 150, 2018),
    ('AC03', 'Boeing 777', 300, 2012),
    ('AC04', 'Airbus A350', 350, 2020),
    ('AC05', 'Boeing 787', 250, 2019),
    ('AC06', 'Embraer E190', 100, 2017),
    ('AC07', 'Airbus A380', 500, 2014),
    ('AC08', 'Boeing 747', 400, 2010),
    ('AC09', 'Bombardier CRJ', 70, 2016),
    ('AC10', 'Airbus A321', 200, 2021),
    ('AC11', 'Boeing 737 Max', 190, 2022),
    ('AC12', 'Airbus A330', 280, 2013),
    ('AC13', 'ATR 72', 72, 2011),
    ('AC14', 'Boeing 767', 220, 2008),
    ('AC15', 'Airbus A319', 120, 2015),
    ('AC16', 'Fokker 100', 100, 2005),
    ('AC17', 'Boeing 757', 200, 2007),
    ('AC18', 'Airbus A220', 130, 2021),
    ('AC19', 'MD-80', 140, 2000),
    ('AC20', 'Boeing 717', 110, 2004);

INSERT INTO
    route (
        route_id,
        dept_airport,
        dest_airport
    )
VALUES 
    ('R01', 'IST', 'JFK'),
    ('R02', 'LHR', 'IST'),
    ('R03', 'CDG', 'DXB'),
    ('R04', 'SFO', 'LAX'),
    ('R05', 'HND', 'SIN'),
    ('R06', 'FRA', 'ESB'),
    ('R07', 'AMS', 'BCN'),
    ('R08', 'MAD', 'LIS'),
    ('R09', 'FCO', 'ATH'),
    ('R10', 'ZRH', 'MUC'),
    ('R11', 'CAI', 'DOH'),
    ('R12', 'SYD', 'AKL'),
    ('R13', 'YYZ', 'YUL'),
    ('R14', 'MEX', 'CUN'),
    ('R15', 'GRU', 'EZE'),
    ('R16', 'DEL', 'BOM'),
    ('R17', 'PEK', 'SHA'),
    ('R18', 'CPH', 'OSL'),
    ('R19', 'ARN', 'HEL'),
    ('R20', 'DUB', 'EDI');

INSERT INTO
    contact_details (
        cid,
        name,
        age,
        nationality,
        email,
        mobile
    )
VALUES 
    ('C01', 'Ahmet Yilmaz', 34, 'Turkish', 'ahmet@mail.com', '5321110001'),
    ('C02', 'Elif Demir', 28, 'Turkish', 'elif@mail.com', '5321110002'),
    ('C03', 'John Doe', 45, 'American', 'john@mail.com', '12025550101'),
    ('C04', 'Maria Garcia', 31, 'Spanish', 'maria@mail.com', '34612345678'),
    ('C05', 'Hans Müller', 52, 'German', 'hans@mail.com', '49151234567'),
    ('C06', 'Zeynep Kaya', 22, 'Turkish', 'zeynep@mail.com', '5321110006'),
    ('C07', 'Yuki Tanaka', 29, 'Japanese', 'yuki@mail.com', '81901234567'),
    ('C08', 'Ali Reza', 38, 'Iranian', 'ali@mail.com', '98912123456'),
    ('C09', 'Sarah Smith', 25, 'British', 'sarah@mail.com', '447712345678'),
    ('C10', 'Luca Rossi', 41, 'Italian', 'luca@mail.com', '393471234567'),
    ('C11', 'Ayse Fatma', 60, 'Turkish', 'ayse@mail.com', '5321110011'),
    ('C12', 'Chen Wei', 33, 'Chinese', 'chen@mail.com', '8613912345678'),
    ('C13', 'Sofia Silva', 27, 'Brazilian', 'sofia@mail.com', '5511912345678'),
    ('C14', 'Dmitry Ivanov', 44, 'Russian', 'dmitry@mail.com', '79161234567'),
    ('C15', 'Fatima Al-Sayed', 30, 'Egyptian', 'fatima@mail.com', '201012345678'),
    ('C16', 'Jean Dupont', 48, 'French', 'jean@mail.com', '33612345678'),
    ('C17', 'Oliver Brown', 36, 'Australian', 'oliver@mail.com', '61412345678'),
    ('C18', 'Kim Min-su', 24, 'S. Korean', 'kim@mail.com', '821012345678'),
    ('C19', 'Ravi Kumar', 32, 'Indian', 'ravi@mail.com', '919812345678'),
    ('C20', 'Marta Nielsen', 39, 'Danish', 'marta@mail.com', '4520123456');

INSERT INTO
    passenger (ps_id, cid)
VALUES 
    ('PS01', 'C01'),
    ('PS02', 'C02'),
    ('PS03', 'C03'),
    ('PS04', 'C04'),
    ('PS05', 'C05'),
    ('PS06', 'C06'),
    ('PS07', 'C07'),
    ('PS08', 'C08'),
    ('PS09', 'C09'),
    ('PS10', 'C10'),
    ('PS11', 'C11'),
    ('PS12', 'C12'),
    ('PS13', 'C13'),
    ('PS14', 'C14'),
    ('PS15', 'C15'),
    ('PS16', 'C16'),
    ('PS17', 'C17'),
    ('PS18', 'C18'),
    ('PS19', 'C19'),
    ('PS20', 'C20');

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
    ('FL01', 'AC01', 'R01', '2026-06-01 08:00:00', 'Istanbul', 'New York'),
    ('FL02', 'AC02', 'R02', '2026-06-01 12:00:00', 'London', 'Istanbul'),
    ('FL03', 'AC03', 'R03', '2026-06-02 10:00:00', 'Paris', 'Dubai'),
    ('FL04', 'AC04', 'R04', '2026-06-02 15:00:00', 'San Francisco', 'Los Angeles'),
    ('FL05', 'AC05', 'R05', '2026-06-03 09:00:00', 'Tokyo', 'Singapore'),
    ('FL06', 'AC06', 'R06', '2026-06-03 20:00:00', 'Frankfurt', 'Ankara'),
    ('FL07', 'AC07', 'R07', '2026-06-04 11:30:00', 'Amsterdam', 'Barcelona'),
    ('FL08', 'AC08', 'R08', '2026-06-04 18:00:00', 'Madrid', 'Lisbon'),
    ('FL09', 'AC09', 'R09', '2026-06-05 07:00:00', 'Rome', 'Athens'),
    ('FL10', 'AC10', 'R10', '2026-06-05 22:00:00', 'Zurich', 'Munich'),
    ('FL11', 'AC11', 'R11', '2026-06-06 13:00:00', 'Cairo', 'Doha'),
    ('FL12', 'AC12', 'R12', '2026-06-06 17:00:00', 'Sydney', 'Auckland'),
    ('FL13', 'AC13', 'R13', '2026-06-07 06:00:00', 'Toronto', 'Montreal'),
    ('FL14', 'AC14', 'R14', '2026-06-07 14:00:00', 'Mexico City', 'Cancun'),
    ('FL15', 'AC15', 'R15', '2026-06-08 19:00:00', 'Sao Paulo', 'Buenos Aires'),
    ('FL16', 'AC16', 'R16', '2026-06-08 05:00:00', 'Delhi', 'Mumbai'),
    ('FL17', 'AC17', 'R17', '2026-06-09 10:30:00', 'Beijing', 'Shanghai'),
    ('FL18', 'AC18', 'R18', '2026-06-09 21:00:00', 'Copenhagen', 'Oslo'),
    ('FL19', 'AC19', 'R19', '2026-06-10 16:00:00', 'Stockholm', 'Helsinki'),
    ('FL20', 'AC20', 'R20', '2026-06-10 08:45:00', 'Dublin', 'Edinburgh');

INSERT INTO
    transactions (
        trans_id,
        flight_id,
        ps_id,
        booking_date
    )
VALUES 
    ('T01', 'FL01', 'PS01', '2026-04-01 10:00:00'),
    ('T02', 'FL02', 'PS02', '2026-04-01 11:00:00'),
    ('T03', 'FL03', 'PS03', '2026-04-02 09:30:00'),
    ('T04', 'FL04', 'PS04', '2026-04-02 14:00:00'),
    ('T05', 'FL05', 'PS05', '2026-04-03 16:45:00'),
    ('T06', 'FL06', 'PS06', '2026-04-03 20:00:00'),
    ('T07', 'FL07', 'PS07', '2026-04-04 12:15:00'),
    ('T08', 'FL08', 'PS08', '2026-04-04 08:00:00'),
    ('T09', 'FL09', 'PS09', '2026-04-05 13:20:00'),
    ('T10', 'FL10', 'PS10', '2026-04-05 22:10:00'),
    ('T11', 'FL11', 'PS11', '2026-04-06 11:00:00'),
    ('T12', 'FL12', 'PS12', '2026-04-06 17:30:00'),
    ('T13', 'FL13', 'PS13', '2026-04-07 10:00:00'),
    ('T14', 'FL14', 'PS14', '2026-04-07 15:00:00'),
    ('T15', 'FL15', 'PS15', '2026-04-08 09:00:00'),
    ('T16', 'FL16', 'PS16', '2026-04-08 19:40:00'),
    ('T17', 'FL17', 'PS17', '2026-04-09 07:15:00'),
    ('T18', 'FL18', 'PS18', '2026-04-09 14:25:00'),
    ('T19', 'FL19', 'PS19', '2026-04-10 18:00:00'),
    ('T20', 'FL20', 'PS20', '2026-04-10 11:30:00');
