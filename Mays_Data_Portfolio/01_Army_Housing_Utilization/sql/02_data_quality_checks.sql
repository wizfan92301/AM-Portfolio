-- Data Quality Checks for Synthetic Housing Data

-- Missing building numbers
SELECT *
FROM raw_synthetic_army_housing_data
WHERE building_number IS NULL
   OR building_number = '';

-- Invalid occupancy where occupied beds exceed total beds
SELECT *
FROM raw_synthetic_army_housing_data
WHERE occupied_beds > total_beds;

-- Duplicate Record_ID values
SELECT
    record_id,
    COUNT(*) AS record_count
FROM raw_synthetic_army_housing_data
GROUP BY record_id
HAVING COUNT(*) > 1;

-- Incorrect Net Use Percent
SELECT *
FROM raw_synthetic_army_housing_data
WHERE ROUND(occupied_beds * 100.0 / NULLIF(total_beds, 0), 2) <> net_use_percent;

-- Invalid design category code
SELECT *
FROM raw_synthetic_army_housing_data
WHERE design_category_code NOT IN ('72111','72112','72113','72114','72115','72116');
