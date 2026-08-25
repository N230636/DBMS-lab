-- Part-A
use gram_panchayat_db; 

show tables;

select * from Citizen;

select * from Certificate_Application;

select * from Certificate_Type;

select * from Panchayat_Office;

-- Part-B 
-- Level-1
-- Task-1
select * from Certificate_Application 
where application_date=(
	select max(application_date) from Certificate_Application);
    
-- Task-2
select * from Certificate_Application
where application_date=(
	select min(application_date) from Certificate_Application);
    
    