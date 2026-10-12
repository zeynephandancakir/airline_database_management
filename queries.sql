--Şirketin aç uçağı var?
SELECT COUNT(*) AS toplam_ucak_sayisi FROM aircraft;

--Şirketin kaç tane Airbus A320 uçağı var?
SELECT COUNT(*) FROM aircraft WHERE airc_type = 'Airbus A320';

--Hangi uçağın maksimum ve minimum kapasitesi var?
SELECT airc_id, airc_type, capacity
FROM aircraft
WHERE
    capacity = (
        SELECT MAX(capacity)
        FROM aircraft
    )
    OR capacity = (
        SELECT MIN(capacity)
        FROM aircraft
    );

--Şirketin kaç kayıtlı müşterisi var?
SELECT COUNT(*) AS toplam_musteri FROM passenger;

--Hangi uçağın en fazla tarifeli uçuşu var?
SELECT a.airc_id, a.airc_type, COUNT(f.flight_id) AS ucus_sayisi
FROM aircraft a
    JOIN flight_schedule f ON a.airc_id = f.airc_id
GROUP BY
    a.airc_id,
    a.airc_type
ORDER BY ucus_sayisi DESC
LIMIT 1;

--Tüm uçakların koltuk sayısı nedir?
SELECT SUM(capacity) AS toplam_koltuk_sayisi FROM aircraft;

--Yolcu Sophie Martin'in uçuş bilgileri nedir?
SELECT c.name, fs.flight_id, fs.departure, fs.destination, fs.flight_date
FROM
    contact_details c
    JOIN passenger p ON c.cid = p.cid
    JOIN transactions t ON p.ps_id = t.ps_id
    JOIN flight_schedule fs ON t.flight_id = fs.flight_id
WHERE
    c.name = 'Sophie Martin';

--Hangi rotada en fazla uçuş var?
SELECT r.route_id, r.dept_airport, r.dest_airport, COUNT(f.flight_id) AS ucus_sayisi
FROM flight_schedule f
    JOIN route r ON f.route_id = r.route_id
GROUP BY
    r.route_id,
    r.dept_airport,
    r.dest_airport
ORDER BY ucus_sayisi DESC
LIMIT 1;

--JFK havalimanına ilk tarifeli uçuş hangisi?
SELECT *
FROM flight_schedule
WHERE
    destination = 'New York'
    OR route_id IN (
        SELECT route_id
        FROM route
        WHERE
            dest_airport = 'JFK'
    )
ORDER BY flight_date ASC
LIMIT 1;

-- En eski uçak hangi rotada faaliyet göstermektedir?
SELECT a.airc_id, a.airc_type, a.manf_year, f.route_id, f.departure, f.destination
FROM aircraft a
    JOIN flight_schedule f ON a.airc_id = f.airc_id
WHERE
    a.manf_year = (
        SELECT MIN(manf_year)
        FROM aircraft
    );

--1'den fazla bilet alan yolcular ve aldıkları bilet sayıları?
SELECT p.ps_id, cd.name, COUNT(t.trans_id) AS ticket_count
FROM
    transactions t
    JOIN passenger p ON t.ps_id = p.ps_id
    JOIN contact_details cd ON p.cid = cd.cid
GROUP BY
    p.ps_id,
    cd.name
HAVING
    COUNT(t.trans_id) > 1;

--Hangi kalkış havalimanından toplam kaç tane uçuş planlamış?
SELECT r.dept_airport, COUNT(f.flight_id) AS total_flights
FROM flight_schedule f
    JOIN route r ON f.route_id = r.route_id
GROUP BY
    r.dept_airport;

--Hangi yolcu hangi uçuşla hangi tarihte seyahat ediyor?
R.name AS passenger_name,
t.flight_id,
f.flight_date
FROM
    transactions t
    JOIN passenger p ON t.ps_id = p.ps_id
    JOIN contact_details r ON p.cid = r.cid
    JOIN flight_schedule f ON t.flight_id = f.flight_id
ORDER BY f.flight_date;

-- İptal edilen işlemleri ve tetikleyicinin  çalışmasını test etme örneği(terminalde yazılır)
INSERT INTO
    cancellations (
        cancel_id,
        trans_id,
        cancel_date
    )
VALUES (
        'C01',
        'T01',
        '2026-06-10 12:00:00'
    );
--bu işlemden sonra transactions tablosu kontrol edildiğinde verinin eksildiği görülür