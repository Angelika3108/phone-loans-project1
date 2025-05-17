-- 1. To extract only loans coverted from leads not in Nairobi region. Is there anything interesting? 

select lead_id, lead_date, region, vehicle_model, l.application_id, 
agr.agreement_id, agr.status, agreement_created, term_in_weeks, model, bad_customer
from leads l
right join agreements agr on
l.application_id=agr.application_id
where region!='Nairobi';

-- 2. SQL query would return result on how many loans are going to be repaid each week in 2023-2024.
SELECT 
  YEAR(STR_TO_DATE(agreement_created, '%d/%m/%Y')) + 1 AS year_load_paid,
  WEEK(STR_TO_DATE(agreement_created, '%d/%m/%Y'), 1) AS week_number,
  COUNT(*) AS total
FROM agreements
WHERE status = 'Active'
GROUP BY 
  YEAR(STR_TO_DATE(agreement_created, '%d/%m/%Y')) + 1,
  WEEK(STR_TO_DATE(agreement_created, '%d/%m/%Y'), 1)
ORDER BY year_load_paid, week_number;

