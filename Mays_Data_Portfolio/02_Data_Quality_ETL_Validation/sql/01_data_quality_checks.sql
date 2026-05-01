-- Data Quality Validation Framework
-- Fully synthetic data for portfolio demonstration.

-- Rule 1: Building number cannot be blank.
SELECT *
FROM messy_housing_data
WHERE building_number IS NULL
   OR building_number = '';

-- Rule 2: Occupied beds cannot exceed total beds.
SELECT *
FROM messy_housing_data
WHERE occupied_beds > total_beds;

-- Rule 3: Record ID should be unique.
SELECT
    record_id,
    COUNT(*) AS record_count
FROM messy_housing_data
GROUP BY record_id
HAVING COUNT(*) > 1;

-- Rule 4: Net Use Percent must equal Occupied Beds / Total Beds.
SELECT *
FROM messy_housing_data
WHERE ROUND(occupied_beds * 100.0 / NULLIF(total_beds, 0), 2) <> net_use_percent;

-- Rule 5: Design category code must be approved.
SELECT *
FROM messy_housing_data
WHERE design_category_code NOT IN ('72111','72112','72113','72114','72115','72116');

-- Rule 6: Installation naming should be standardized.
SELECT DISTINCT installation
FROM messy_housing_data
ORDER BY installation;
