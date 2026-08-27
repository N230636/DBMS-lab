##PART-A 
use gram_panchayat_db;

show tables;

select * from Citizen;

select * from certificate_application;

select * from certificate_type;

select * from panchayat_office;

##PART-B

##LEVEL-1

##TASK-1
create view certificate_application_view as
select * from certificate_application;

select * from certificate_application_view;

##TASK-2
create view application_details_view as
select application_id,citizen_id,application_status
from certificate_application;

select * from application_details_view;

##TASK-3
create view approved_application_view as
select *
from certificate_application
where application_status='Approved';

##TASK-4
select * from approved_application_view;

##TASK-5
show tables;

##LEVEL-2
##TASK-1
create view certificate_application_date_view as
select ca1.certificate_name,
ca2.application_date
from certificate_application ca1
join certificate_application ca2
on ca1.application_id=ca2.application_id;

select * from certificate_application_date_view;

##TASK-2
create view citizen_status_view as
select full_name,application_status
from citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id;

select * from citizen_status_view;

##TASK-3
create view application_office_view as
select a.certificate_name,p.office_name
from certificate_type a
join panchayat_office p
on a.certificate_type_id=p.office_id;

select * from application_office_view;

##TASK-4
create view certificate_count_view as
select certificate_name , count(*)
from certificate_application
group by certificate_name;

select * from certificate_count_view;

##TASK-5
create view office_count_view as
select p.office_name,count(*) 
from certificate_type ca
join panchayat_office p 
on ca.certificate_type_id=p.office_id
group by p.office_name;

select * from office_count_view;

##TASK-6
create view pending_application_view as
select certificate_name, application_status
from certificate_application
where application_status="Pending";

select * from pending_application_view;

##TASK-7
select full_name,application_status
from citizen_status_view
where application_status='Approved';

##TASK-8
show create view citizen_status_view;

##LEVEL-3
##TASK-1
create view certificate_total_view as
select certificate_name,count(*)
from certificate_application
group by certificate_name;

select * from certificate_total_view;

##TASK-2
create view office_more_than_one_view as
select p.office_name,count(*)
from certificate_type ca
join panchayat_office p
on ca.certificate_type_id=p.office_id
group by p.office_name
having count(*)>1;

select * from office_more_than_one_view;

##TASK-3
create view certificate_date_view as
select certificate_name ,min(application_date) ,max(application_date)
from certificate_application
group by certificate_name;

select * from certificate_date_view;

##TASK-4
create view citizen_applications_count_view as
select c.full_name, count(ca.application_id)
from citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
group by c.full_name,c.citizen_id;

select * from  citizen_applications_count_view;

##TASK-5
create view complete_application_view as
select c.full_name,ct.certificate_name,ca.application_date,ca.application_status
from citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
join certificate_type ct
on ct.certificate_name=ca.certificate_name;

select * from complete_application_view;

##TASK-6
create view approved_citizen_applications_view as
select c.full_name,ca.certificate_name,ca.application_status
from citizen c
join certificate_application ca
on c.citizen_id=ca.citizen_id
where ca.application_status='Approved';

select * from approved_citizen_applications_view;

##TASK-7
select *
from citizen_status_view
where application_status='Approved'
order by full_name asc;

##TASK-8
drop view citizen_status_view;

show full tables;