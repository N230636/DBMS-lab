-- Part-A
use gram_panchayat_db;
show tables;

-- Part-B
-- level-1
-- Citizen names into uppercase 
select upper(full_name) as FULL_NAME from Citizen;
-- Village names into lowercase
select lower(village_name) as village_name from Citizen;
-- length citizen names
select length(full_name) from Citizen;
-- first 4 characters of refernce number
select left(reference_number,4)  from Certificate_Application;
-- Concatenate citizen_name with village_name
select concat(full_name,village_name) from Citizen;

-- Level-2
-- replace certificate as certi
select replace(certificate_name,'Certificate','certi') from Certificate_Application;
-- removing spaces from certificate_name
select trim(certificate_name) from Certificate_Application;
-- first name of every citizen
select substring_index(full_name,'',1) from Citizen;

-- Level-3
-- displying in format
select concat('Citizen: ',full_name,' Village: ',village_name) from Citizen;
-- reference number
select *from Certificate_Application where reference_number like 'GP2026%';

-- Part-C
-- Level-1
-- Round Application fee
select round(fee_paid) from Certificate_Application;

-- Absolute Processing days
select abs(processing_days) from Certificate_Type;

-- Square Processing days
select power(processing_days,2) from Certificate_Type;

-- Level-3
-- Remainder when divided by 3
select mod(processing_days,3) from Certificate_Type;

-- Round application fees
select round(fee_paid,1) from Certificate_Application;

-- Ceil and floor
select ceil(fee_paid) from Cer