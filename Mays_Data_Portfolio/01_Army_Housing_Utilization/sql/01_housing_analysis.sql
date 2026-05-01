-- Synthetic Army Housing Utilization Analysis
-- This SQL is written for portfolio demonstration purposes.
-- The source data is fully synthetic and does not contain real government, military, personal, or operational data.

-- 1. Occupancy by installation
SELECT
    installation,
    SUM(total_beds) AS total_beds,
    SUM(occupied_beds) AS occupied_beds,
    SUM(vacant_beds) AS vacant_beds,
    ROUND(SUM(occupied_beds) * 100.0 / NULLIF(SUM(total_beds), 0), 2) AS net_use_percent
FROM cleaned_synthetic_army_housing_data
GROUP BY installation
ORDER BY net_use_percent ASC;

-- 2. Buildings below 70 percent utilization
SELECT
    month,
    installation,
    building_number,
    housing_type,
    total_beds,
    occupied_beds,
    vacant_beds,
    net_use_percent,
    priority_level
FROM cleaned_synthetic_army_housing_data
WHERE net_use_percent < 70
ORDER BY net_use_percent ASC;

-- 3. Vacancy by housing type
SELECT
    housing_type,
    SUM(vacant_beds) AS total_vacant_beds,
    ROUND(AVG(net_use_percent), 2) AS avg_net_use_percent
FROM cleaned_synthetic_army_housing_data
GROUP BY housing_type
ORDER BY total_vacant_beds DESC;

-- 4. Work order and utilization risk
SELECT
    installation,
    building_number,
    housing_type,
    condition_score,
    open_work_orders,
    net_use_percent,
    priority_level
FROM cleaned_synthetic_army_housing_data
WHERE priority_level = 'High'
ORDER BY open_work_orders DESC, net_use_percent ASC;
