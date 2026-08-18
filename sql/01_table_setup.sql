CREATE TABLE listings (
    id BIGINT,
    name VARCHAR(255),
    neighbourhood_cleansed VARCHAR(100),
    neighbourhood_group_cleansed VARCHAR(50),
    latitude NUMERIC(10,6),
    longitude NUMERIC(10,6),
    property_type VARCHAR(100),
    room_type VARCHAR(50),
    is_entire_apt BOOLEAN,
    client_district BOOLEAN,
    accommodates INTEGER,
    bedrooms NUMERIC(4,1),
    beds NUMERIC(4,1),
    price_clean NUMERIC(10,2),
    minimum_nights NUMERIC(6,1),
    availability_365 INTEGER,
    number_of_reviews INTEGER,
    review_scores_rating NUMERIC(3,2),
    host_is_superhost BOOLEAN,
    estimated_occupancy_l365d INTEGER,
    estimated_revenue_l365d NUMERIC(12,2)
);



