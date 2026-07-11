-- Hotel Revenue Analysis
-- Hansi hotel brendi en cox gelir getirir ve niye?
-- 8 hotel brendi: Kempinski, Hilton, Marriott, Sheraton, Hyatt, InterContinental, Holiday Inn Express, Best Western


-- 1. Her brendin umumi geliri, booking sayi ve orta geliri
SELECT 
    h.HOTEL_NAME,
    COUNT(r.RES_ID) AS TOTAL_BOOKINGS,
    SUM(rm.ROOM_PRICE * r.NO_OF_DAYS) AS TOTAL_REVENUE,
    ROUND(AVG(rm.ROOM_PRICE * r.NO_OF_DAYS), 2) AS AVG_REVENUE_PER_BOOKING
FROM ROOM rm
JOIN RESERVATION r 
    ON rm.RES_ID = r.RES_ID 
    AND rm.HOTEL_NAME = r.HOTEL_NAME
JOIN HOTEL h 
    ON rm.HOTEL_NAME = h.HOTEL_NAME
GROUP BY h.HOTEL_NAME
ORDER BY TOTAL_REVENUE DESC;


-- 2. Orta otaq qiyməti və orta qalma müddəti - gəlirin "niyə"sini tapmaq üçün
SELECT 
    h.HOTEL_NAME,
    h.STAR_RATING,
    ROUND(AVG(rm.ROOM_PRICE), 2) AS AVG_ROOM_PRICE,
    ROUND(AVG(r.NO_OF_DAYS), 2) AS AVG_NIGHTS_STAYED
FROM ROOM rm
JOIN RESERVATION r 
    ON rm.RES_ID = r.RES_ID 
    AND rm.HOTEL_NAME = r.HOTEL_NAME
JOIN HOTEL h 
    ON rm.HOTEL_NAME = h.HOTEL_NAME
GROUP BY h.HOTEL_NAME, h.STAR_RATING
ORDER BY AVG_ROOM_PRICE DESC;


-- 3. Hamısı bir cədvəldə - Tableau-ya idxal üçün
SELECT 
    h.HOTEL_NAME,
    h.STAR_RATING,
    COUNT(r.RES_ID) AS TOTAL_BOOKINGS,
    SUM(rm.ROOM_PRICE * r.NO_OF_DAYS) AS TOTAL_REVENUE,
    ROUND(AVG(rm.ROOM_PRICE), 2) AS AVG_ROOM_PRICE,
    ROUND(AVG(r.NO_OF_DAYS), 2) AS AVG_NIGHTS_STAYED,
    ROUND(AVG(rm.ROOM_PRICE * r.NO_OF_DAYS), 2) AS AVG_REVENUE_PER_BOOKING
FROM ROOM rm
JOIN RESERVATION r 
    ON rm.RES_ID = r.RES_ID 
    AND rm.HOTEL_NAME = r.HOTEL_NAME
JOIN HOTEL h 
    ON rm.HOTEL_NAME = h.HOTEL_NAME
GROUP BY h.HOTEL_NAME, h.STAR_RATING
ORDER BY TOTAL_REVENUE DESC;


-- 4. Mövsüm üzrə qiymət dəyişimi (Tableau line chart üçün)
SELECT 
    s.HOTEL_NAME,
    s.SEASON_NAME,
    ROUND(AVG(s.PRICE), 2) AS AVG_SEASONAL_PRICE
FROM SEASON s
GROUP BY s.HOTEL_NAME, s.SEASON_NAME
ORDER BY s.HOTEL_NAME, 
    CASE s.SEASON_NAME
        WHEN 'Spring' THEN 1
        WHEN 'Summer' THEN 2
        WHEN 'Autumn' THEN 3
        WHEN 'Winter' THEN 4
    END;


-- 5. Müştəri məmnuniyyəti səviyyələrinin paylanması (pie chart üçün)
SELECT 
    SATISFACTION_LEVEL,
    COUNT(*) AS TOTAL_COUNT
FROM SATISFACTION
GROUP BY SATISFACTION_LEVEL
ORDER BY SATISFACTION_LEVEL DESC;
