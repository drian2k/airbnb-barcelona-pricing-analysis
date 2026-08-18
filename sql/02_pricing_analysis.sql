-- Median and average price by district and room type
SELECT
    neighbourhood_group_cleansed AS district,
    room_type,
    COUNT(*) AS listing_count,
    ROUND(AVG(price_clean), 2) AS avg_price,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_clean)::numeric, 2) AS median_price,
    ROUND(MIN(price_clean), 2) AS min_price,
    ROUND(MAX(price_clean), 2) AS max_price
FROM listings
WHERE room_type = 'Entire home/apt'
GROUP BY neighbourhood_group_cleansed, room_type
ORDER BY median_price DESC;


SELECT
    host_is_superhost,
    COUNT(*) AS listing_count,
    ROUND(AVG(price_clean), 2) AS avg_price,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_clean)::numeric, 2) AS median_price,
    ROUND(AVG(review_scores_rating), 2) AS avg_rating
FROM listings
WHERE room_type = 'Entire home/apt' AND client_district = true
GROUP BY host_is_superhost;