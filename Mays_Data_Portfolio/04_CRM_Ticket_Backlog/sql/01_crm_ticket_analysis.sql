-- Synthetic CRM Ticket Backlog Analysis

-- Ticket volume by category
SELECT
    category,
    COUNT(*) AS ticket_count
FROM synthetic_crm_ticket_backlog
GROUP BY category
ORDER BY ticket_count DESC;

-- Average resolution time by assigned team
SELECT
    assigned_team,
    ROUND(AVG(days_open), 1) AS avg_days_open,
    COUNT(*) AS ticket_count
FROM synthetic_crm_ticket_backlog
GROUP BY assigned_team
ORDER BY avg_days_open DESC;

-- SLA performance by team
SELECT
    assigned_team,
    sla_status,
    COUNT(*) AS ticket_count
FROM synthetic_crm_ticket_backlog
GROUP BY assigned_team, sla_status
ORDER BY assigned_team, sla_status;

-- Aging open tickets
SELECT
    ticket_id,
    created_date,
    office,
    category,
    priority,
    status,
    assigned_team,
    days_open,
    aging_bucket
FROM synthetic_crm_ticket_backlog
WHERE status <> 'Closed'
ORDER BY days_open DESC;
