# Data Quality Rules

1. Record_ID must be unique.
2. Building_Number cannot be blank.
3. Installation cannot be blank or inconsistently named.
4. Occupied_Beds cannot exceed Total_Beds.
5. Vacant_Beds must equal Total_Beds minus Occupied_Beds.
6. Net_Use_Percent must equal Occupied_Beds divided by Total_Beds.
7. Design_Category_Code must match an approved synthetic code.
8. Priority_Level must follow documented logic based on utilization and work orders.
