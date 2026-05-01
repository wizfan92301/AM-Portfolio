# Tableau Calculated Fields

## Army Housing Dashboard

### Net Use %
If using raw fields:
`SUM([Occupied_Beds]) / SUM([Total_Beds])`

Format as percentage.

### Vacancy Rate
`SUM([Vacant_Beds]) / SUM([Total_Beds])`

### Utilization Status
```
IF [Net_Use_Percent] < 70 THEN "Below Target"
ELSEIF [Net_Use_Percent] < 85 THEN "Watch"
ELSE "Healthy"
END
```

### Work Order Risk
```
IF [Open_Work_Orders] > 25 THEN "High"
ELSEIF [Open_Work_Orders] > 15 THEN "Medium"
ELSE "Low"
END
```

## HR Dashboard

### Qualification Rate
`SUM([Qualified_Applicants]) / SUM([Applicants])`

### Interview Rate
`SUM([Interviewed]) / SUM([Qualified_Applicants])`

### Selection Rate
`SUM([Selected]) / SUM([Interviewed])`

### Long Running Requisition
```
IF [Time_To_Fill_Days] > 90 THEN "Over 90 Days"
ELSE "Within Target"
END
```

## CRM Dashboard

### SLA Met Flag
```
IF [SLA_Status] = "Met" THEN 1 ELSE 0 END
```

### SLA Compliance %
`SUM([SLA Met Flag]) / COUNT([Ticket_ID])`

### Open Ticket Flag
```
IF [Status] <> "Closed" THEN 1 ELSE 0 END
```
