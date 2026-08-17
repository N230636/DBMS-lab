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
select count(*) from Certificate_Application; 

-- Task-2
select count(*) from Citizen;

-- Task-3
select count(distinct certificate_name) from Certificate_Application;
 
-- Task-4
select min(application_date) from Certificate_Application; 

-- Task-5
select max(application_date) from Certificate_Application; 

-- Level-2
-- Task-1
select application_status, count(*) from Certificate_Application group by application_status; 

-- Task-2
select certificate_name, count(*) from Certificate_Application group by certificate_name; 

-- Task-3
select office_name, count(*) from Panchayat_Office group by office_name; 

-- Task-4
select full_name, count(*) from Citizen group by full_name; 

-- Task-5
select application_date, count(*) from Certificate_Application group by application_date; 

-- Task-6
select application_id,office_name, count(*) from Certificate_Application,Panchayat_Office group by application_id,office_name; 

-- Task-7
select c.certificate_name, count(*)
from Certificate_Application ca
join Certificate_Application c
on ca.certificate_id=c.certificate_id
group by c.certificate_name; 

-- Task-8
select p.office_name, count(*)
from Certificate_Application ca
join panchayat_Office p
on ca.application_id=p.office_id
group by p.office_name;

-- Level-3
-- Task-1
select certificate_name, count(*) 
from Certificate_Application
group by certificate_name 
having count(*)>2;

-- Task-2
select office_name,count(*)
from Panchayat_Office
group by office_name
having count(*)>2;

-- Task-3
select certificate_name, count(*) 
from Certificate_Application
group by certificate_name
order by count(*) desc;

-- Task-4
select office_id, count(*) 
from Certificate_Application
group by office_id
order by count(*) asc;

-- Task-5
select certificate_name, count(*) 
from Certificate_Application
group by certificate_name
having count(*)>2
order by count(*) desc;

-- Task-6
select certificate_name,office_id, count(*)
from Certificate_Application
group by certificate_name,office_id
order by count(*) desc limit 1;

-- Task-7
select application_status, count(*)
from Certificate_Application
group by application_status
order by count(*) desc limit 1;

-- Task-8
select application_status, count(*)
from Certificate_Application
group by application_status
order by count(*) asc limit 1;
