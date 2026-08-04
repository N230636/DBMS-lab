-- PART_A
use gram_panchayat_db;
show tables;
select * from Citizen;
select * from Certificate_Type;
select * from Panchayat_Office;
select * from Certificate_Application;

-- PART-B
-- Activity-2
-- add new columns
alter table Certificate_Application add column certificate_id int;
alter table Certificate_Application add column office_id int;
-- Activity-3
update Certificate_Application ca 
join Certificate_Type ct 
on ca.certificate_name=
ct.certificate_name 
set ca.certificate_id=
ct.certificate_type_id;

set sql_safe_updates=0;
update Certificate_Application ca 
join Panchayat_Office po
on ca.certificate_id=po.office_id
set ca.office_id=po.office_id;
-- Activity-4
-- Foreign key constraints
alter table Certificate_Application
add constraint fk_citizen
foreign key(citizen_id)
references Citizen(citizen_id);

alter table Certificate_Application
add constraint fk_certificate
foreign key(certificate_id)
references Certificate_Type(certificate_type_id);

alter table Certificate_Application
add constraint fk_office
foreign key(office_id)
references Panchayat_Office(office_id);
-- Activity-5
show create table Certificate_Application;

-- Activity-6
INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_name, application_date, purpose, application_status, fee_paid, reference_number, office_id, certificate_id)
VALUES
(7, 999, 'Income Certificate', '2026-08-04', 'Testing', 'Pending', 50.00, 'REF007', 1, 1);

INSERT INTO Certificate_Application
(application_id, citizen_id, certificate_name, application_date, purpose, application_status, fee_paid, reference_number, office_id, certificate_id)
VALUES
(8, 1, 'Income Certificate', '2026-08-04', 'Testing', 'Pending', 50.00, 'REF008', 1, 999);

delete from Citizen where citizen_id=1;
select *from Citizen;
delete from Citizen where citizen_id=101;

delete from Certificate_type where certificate_type_id=1;

-- PART-C
-- Level-0 
select * from Citizen;

select * from Certificate_Application;

select full_name from Citizen order by full_name ASC;

select distinct village_name from Citizen;

select distinct certificate_name from Certificate_Type;

select distinct office_name from Panchayat_Office;

select * from Certificate_Application where application_status='Pending';

select * from Citizen where village_name='Ramapuram';

select * from Certificate_Application where year(application_date)=2026;

select * from Certificate_Application order by application_date desc;

select ca.*
from Certificate_Application ca
join Panchayat_Office po
on ca.office_id=po.office_id
where po.office_name='Nuzvid Panchayat Office';

select c.full_name
from Citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
join Certificate_Type ct
on ca.certificate_id = ct.certificate_type_id
where ct.certificate_name = 'Income Certificate';

-- Level-1
-- Citizens applied for both income and residence certificate using union
select c.full_name
from Citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
join Certificate_Type ct
on ca.certificate_id = ct.certificate_type_id
where ct.certificate_name = 'Income Certificate'

union

select c.full_name
from Citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
join Certificate_Type ct
on ca.certificate_id = ct.certificate_type_id
where ct.certificate_name = 'Residence Certificate';

-- Citizens applied during january and february
select *
from Certificate_Application
where month(application_date) = 1

union

select *
from Certificate_Application
where month(application_date) = 2;

-- Citizens belonged to ramapuram and Lakshmipuram
select * from Citizen where village_name='Ramapuram'
union
select * from Citizen where village_name='Laxmipuram';

-- Citizens who applied for both income and residence certificate 
select c.full_name
from citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
join Certificate_Type ct
on ca.certificate_id = ct.certificate_type_id
where ct.certificate_name IN ('Income Certificate', 'Residence Certificate')
group by c.citizen_id, c.full_name
having COUNT(distinct ct.certificate_name) = 2;

-- Citizens who submit during both 2025 and 2026
select c.full_name
from Citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
where year(ca.application_date) IN (2025, 2026)
group by c.citizen_id, c.full_name
having COUNT(DISTINCT YEAR(ca.application_date)) = 2;

-- Citizens who applied for income Certificate but not for residence certificate
select c.full_name
from Citizen c
join Certificate_Application ca
on c.citizen_id = ca.citizen_id
join Certificate_Type ct
on ca.certificate_id = ct.certificate_type_id
where ct.certificate_name = 'Income Certificate'
and c.citizen_id not in
(
    select ca.citizen_id
    from Certificate_Application ca
    join Certificate_Type ct
    on ca.certificate_id = ct.certificate_type_id
    where ct.certificate_name = 'Residence Certificate'
);

-- Citizens who submitted during 2026 but not during 2025
 select *
from Certificate_Application
where year(application_date) = 2026
and application_id not in
(
    select application_id
    from Certificate_Application
    where year(application_date) = 2025
);

-- Invalid citizen_id
insert into Certificate_Application
(application_id, citizen_id, certificate_name, application_date,
purpose, application_status, fee_paid, reference_number,
office_id, certificate_id)
values
(10, 999, 'Income Certificate', '2026-08-04',
'Testing', 'Pending', 50.00, 'REF010', 1, 1);

-- Delete a citizen
delete from Citizen where citizen_id=101;

select *
from Citizen
where village_name in (
    select c.village_name
    from Citizen c
    join Certificate_Application ca
        on c.citizen_id = ca.citizen_id
    join Certificate_Type ct
        on ca.certificate_id = ct.certificate_type_id
    where ct.certificate_name = 'Income Certificate'
);

select *
from Panchayat_Office
where office_id not in (
    select office_id
    from Certificate_Application
);

select *
from Certificate_Type ct
where exists (
    select 1
    from Certificate_Application ca
    where ca.certificate_id = ct.certificate_type_id
);

select *
from Certificate_Type ct
where not exists (
    select 1
    from Certificate_Application ca
    where ca.certificate_id = ct.certificate_type_id
);

select *
from Certificate_Type
where processing_days > any (
    select processing_days
    from Certificate_Type ca
    join panchayat_office po
    on ca.office_id = po.office_id
    where po.office_name = 'Nuzvid Panchayat Office'
);

desc Certificate_Type;

desc Certificate_Application;

select *
from certificate_type
where processing_days > any (
    select ct.processing_days
    from certificate_application ca
    join certificate_type ct
        on ca.certificate_id = ct.certificate_type_id
    join panchayat_office po
        on ca.office_id = po.office_id
    where po.office_name = 'Nuzvid Panchayat Office'
);

select *
from certificate_type
where processing_days > all (
    select ct.processing_days
    from certificate_application ca
    join certificate_type ct
        on ca.certificate_id = ct.certificate_type_id
    join panchayat_office po
        on ca.office_id = po.office_id
    where po.office_name = 'Nuzvid Panchayat Office'
);