-- Synthetic HR Hiring Pipeline Analysis

-- Hiring funnel totals
SELECT
    SUM(applicants) AS applicants,
    SUM(qualified_applicants) AS qualified_applicants,
    SUM(interviewed) AS interviewed,
    SUM(selected) AS selected
FROM synthetic_hr_hiring_pipeline;

-- Average time to fill by office
SELECT
    office,
    ROUND(AVG(time_to_fill_days), 1) AS avg_time_to_fill_days,
    COUNT(*) AS requisition_count
FROM synthetic_hr_hiring_pipeline
GROUP BY office
ORDER BY avg_time_to_fill_days DESC;

-- Requisitions over 90 days
SELECT
    requisition_id,
    fiscal_year,
    office,
    job_series,
    grade_level,
    time_to_fill_days,
    hiring_stage
FROM synthetic_hr_hiring_pipeline
WHERE time_to_fill_days > 90
ORDER BY time_to_fill_days DESC;

-- Conversion rates by job series
SELECT
    job_series,
    ROUND(AVG(qualification_rate), 2) AS avg_qualification_rate,
    ROUND(AVG(interview_rate), 2) AS avg_interview_rate,
    ROUND(AVG(selection_rate), 2) AS avg_selection_rate
FROM synthetic_hr_hiring_pipeline
GROUP BY job_series
ORDER BY avg_selection_rate ASC;
