-- Creating Transactional Query
-- 1. Mencari mobil keluaran 2015 ke atas 
SELECT product_id, user_id, brand, model, year, price
FROM products
WHERE year >= 2015
ORDER BY year ASC;

--2.Menambahkan satu data bid produk baru 
INSERT INTO bids (product_id, user_id, date_bid, bid_price)
VALUES (151, 40, '2024-12-07 00:00:00', 151500000.00);
 -- Untuk  menmapilkan  produk baru yang  ditambahkan
SELECT * FROM bids
WHERE product_id = 151

--3.Melihat semua mobil yg dijual 1 akun dari yg paling baru	
SELECT product_id, brand AS merk, model, year, price, created_at AS date_post
FROM products
WHERE user_id = 2
ORDER BY created_at DESC;

--4.Mencari mobil bekas yang termurah berdasarkan keyword
SELECT product_id, brand AS merk, model, year,price
FROM products 
ORDER BY 
    price ASC
LIMIT 5

--5.Mencari mobil bekas yang terdekat berdasarkan sebuah id kota, jarak terdekat dihitung berdasarkan latitude longitude.
    --Perhitungan jarak dapat dihitung menggunakan rumus jarak euclidean berdasarkan latitude dan longitude.
WITH city_coordinates AS (
    SELECT latitude AS city_lat, longitude AS city_lon
    FROM locations
    WHERE location_id = 50
)
SELECT p.product_id,  p.brand AS merk,  p.model,  p.year,  p.price,
	ROUND(SQRT(POWER(l.latitude - city_coordinates.city_lat, 2) + POWER(l.longitude - city_coordinates.city_lon, 2)), 2) AS distance
FROM products p
JOIN locations l ON p.location_id = l.location_id
JOIN city_coordinates ON TRUE
ORDER BY 
    distance ASC;

--Creating Analytical Query
--1.Ranking popularitas model mobil berdasarkan jumlah bid 
SELECT p.model, 
       COUNT(p.product_id) AS count_product, 
       COUNT(b.bid_id) AS count_bid
FROM products p
LEFT JOIN bids b ON p.product_id = b.product_id
GROUP BY p.model
ORDER BY count_bid DESC;

--2.Membandingkan harga mobil berdasarkan harga rata-rata per kota. (4% bobot)
SELECT l.city, p.brand,  p.model, p.year,  p.price, 
       AVG(p.price) OVER (PARTITION BY l.city) AS avg_car_city
FROM products p
JOIN locations l ON p.location_id = l.location_id
ORDER BY l.city, p.price;

--3.cari perbandingan tanggal user melakukan bid dengan bid selanjutnya beserta harga tawar yang diberikan 
WITH BidRanks AS (
    SELECT 
        p.brand,
        b.user_id,
        b.date_bid,
        b.bid_price,
        ROW_NUMBER() OVER (PARTITION BY p.brand ORDER BY b.date_bid) AS bid_rank
    FROM 
        bids b
    JOIN 
        products p ON b.product_id = p.product_id
)
SELECT 
    a.brand,
    a.user_id,
    a.date_bid AS first_bid_date,
    COALESCE(b.date_bid, '1970-01-01'::timestamp) AS next_bid_date,  -- Menggunakan nilai timestamp default
    a.bid_price AS first_bid_price,
    COALESCE(b.bid_price, 0) AS next_bid_price
FROM 
    BidRanks a
LEFT JOIN 
    BidRanks b ON a.brand = b.brand AND a.bid_rank = b.bid_rank - 1
ORDER BY 
    a.date_bid;

--4.
-- Membandingkan persentase perbedaan rata-rata harga mobil berdasarkan modelnya dan rata-rata harga bid yang ditawarkan oleh customer pada 6 bulan terakhir (4% bobot)
-- Difference adalah selisih antara rata-rata harga model mobil(avg_price) dengan rata-rata harga bid yang ditawarkan terhadap model tersebut(avg_bid_6month)
-- Difference dapat bernilai negatif atau positif
-- Difference_percent adalah persentase dari selisih yang telah dihitung, yaitu dengan cara difference dibagi rata-rata harga model mobil(avg_price) dikali 100%
-- Difference_percent dapat bernilai negatif atau positif
WITH AvgBrandPrice AS (
    SELECT 
        p.brand,
        AVG(p.price) AS avg_price
    FROM 
        products p
    GROUP BY 
        p.brand
),
AvgBidLast6Months AS (
    SELECT 
        p.brand,
        AVG(b.bid_price) AS avg_bid_6month
    FROM 
        bids b
    JOIN 
        products p ON b.product_id = p.product_id
    WHERE 
        b.date_bid >= CURRENT_DATE - INTERVAL '6 months'
    GROUP BY 
        p.brand
)
SELECT 
    m.brand,
    m.avg_price,
    COALESCE(b.avg_bid_6month, 0) AS avg_bid_6month,
    m.avg_price - COALESCE(b.avg_bid_6month, 0) AS difference,
    CASE 
        WHEN m.avg_price <> 0 THEN 
            ((m.avg_price - COALESCE(b.avg_bid_6month, 0)) / m.avg_price) * 100
        ELSE 
            NULL
    END AS difference_percent
FROM 
    AvgBrandPrice m
LEFT JOIN 
    AvgBidLast6Months b ON m.brand = b.brand
ORDER BY 
    m.brand;



WITH BidHistory AS (
    SELECT 
        p.brand AS merk,
        p.model,
        b.bid_price,
        b.date_bid,
        ROW_NUMBER() OVER (PARTITION BY p.brand, p.model ORDER BY b.date_bid DESC) AS bid_rank
    FROM 
        bids b
    JOIN 
        products p ON b.product_id = p.product_id
    WHERE 
        b.date_bid >= CURRENT_DATE - INTERVAL '6 months'
)
SELECT 
    merk,
    model,
    MAX(CASE WHEN bid_rank = 1 THEN bid_price END) AS m_min_1,
    MAX(CASE WHEN bid_rank = 2 THEN bid_price END) AS m_min_2,
    MAX(CASE WHEN bid_rank = 3 THEN bid_price END) AS m_min_3,
    MAX(CASE WHEN bid_rank = 4 THEN bid_price END) AS m_min_4,
    MAX(CASE WHEN bid_rank = 5 THEN bid_price END) AS m_min_5,
    MAX(CASE WHEN bid_rank = 6 THEN bid_price END) AS m_min_6
FROM 
    BidHistory
GROUP BY 
    merk, model
ORDER BY 
    merk, model;









