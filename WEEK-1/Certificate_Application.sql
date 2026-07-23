use gram_panchayat_db;
create table Certificate_Application(
application_id int primary key,
citizen_id int not null,
certificate_name varchar(100) not null,
application_date date not null,
purpose varchar(200) not null,
application_status varchar(30) not null,
fee_paid decimal(8,2),
reference_number varchar(30) unique
);
insert into Certificate_Application(application_id,citizen_id,certificate_name,application_date,purpose,application_status,fee_paid,reference_number)values
(1001,101,"Residence Certificate","2026-08-09","Bank account documentation","Submitted",30.00,"GP2026001"),
(1002,102,"Family Member Certificate","2026-09-12","Welfare scheme application","UnderReview",40.00,"GP2026002"),
(1003,103,"Property Certificate","2026-07-06","Property documentation","Submitted",50.00,"GP2026003"),
(1004,104,"Residence Certificate","2026-07-08","College Admission","Approved",20.00,"GP2026004"),
(1005,105,"No-Dues Certificate","2026-08-14","Local serive requirement","Under Review",25.00,"GP2026005"),
(1006,106,"Birth Record REquirements","2026-08-23","Personal documentation","Rejected",20.00,"GP2026006");
select * from Certificate_Application;

update Certificate_Application set application_status="Under review" where application_id=1001;

update Certificate_Application set application_status="Approved" where application_id=1002;

alter table Certificate_Application add issued_date date;

insert into Certificate_Application(application_id,citizen_id,certificate_name,application_date,purpose,application_status,fee_paid,reference_number)values
(1008,108,"Residency Certificate","2026-08-19","Bank account documentation","Submitted",30.00,"GP2026001");