-- Part-A
use gram_panchayat_db;
show tables;

-- Level-1
-- Task-1 
select c.full_name , ct.certificate_name
from Citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Certificate_Type ct
on ca.certificate_id=
ct.certificate_type_id;

-- Task-2
select c.full_name , po.office_name
from Citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Panchayat_Office po
on ca.office_id=po.office_id;

-- Task-3
select ca.application_id, c.full_name , ca.application_status
from Citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id;

-- Task-4
select c.full_name ,ct.certificate_name, ca.application_date
 from citizen c
 inner join Certificate_Application ca 
 on c.citizen_id=ca.citizen_id
 inner join Certificate_Type ct
 on ca.certificate_id=ct.certificate_type_id;
 
-- Task-5
select c.full_name,ct.certificate_name,po.office_name,ca.application_status
from Citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id
inner join Panchayat_Office po
on ca.office_id=po.office_id; 

-- Level-2
-- Task-6
select c.full_name,po.office_name
from citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id
inner join Panchayat_Office po
on ca.office_id=po.office_id
where ct.certificate_name='Property Certificate';

-- Task-7
select ca.certificate_id,c.citizen_id
from Citizen c
inner join Certificate_application ca
on ca.citizen_id=c.citizen_id
inner join Panchayat_Office po
on ca.office_id=po.office_id
where po.office_name='Ramapuram Gram Panchayat';

-- Task-8
select ct.certificate_name,ca.application_status
from Certificate_Application ca
inner join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id;

-- Task-9
select c.full_name,c.village_name,ct.certificate_name,po.office_name,ca.application_date
from citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id
inner join Panchayat_Office po
on ca.office_id=po.office_id;

-- Task-10
select c.*,ct.*,po.*,ca.*
from Citizen c
inner join Certificate_Application ca
on c.citizen_id=ca.citizen_id
inner join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id
inner join Panchayat_Office po
on ca.office_id=po.office_id;

-- Level-3
-- Task-11
select c.full_name,ca.application_id,ca.application_status
from citizen c
left outer join Certificate_Application ca
on c.citizen_id=ca.citizen_id;

-- Task-12
select ct.certificate_name,ct.certificate_type_id
from Certificate_Application ca
right outer join Certificate_Type ct
on ca.certificate_id=ct.certificate_type_id
where ca.certificate_id is null;

-- Task-13
select c.full_name,ca.application_id,ca.application_status
from Citizen c
left outer join 
Certificate_Application ca
on c.citizen_id=ca.citizen_id
union
select c.full_name,ca.application_id,ca.application_status
from Citizen c
right outer join
Certificate_Application ca
on c.citizen_id=ca.citizen_id;

-- Task-14
select c.full_name,ct.certificate_name
from Citizen c
cross join Certificate_Type ct;

-- Task-15
select c1.full_name as Citizen1,c2.full_name as Citizen2,c1.village_name
from Citizen c1
inner join Citizen c2
on c1.village_name=c2.village_name
and c1.citizen_id<c2.citizen_id;
