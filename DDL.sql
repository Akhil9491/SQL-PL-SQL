create table ledger_1(

l_account_id number Primary key,
country_code varchar2(5) NOT NULL,
country_name varchar2(50) NOT NULL,
security_name varchar2(50) Unique,
assect_register_id number Unique check (assect_register_id > 4),
security_id number Unique check (security_id > 0),
security_type varchar(6) check (security_type in('ISCEN', 'CUSIP', 'SIDOL', 'Tinker')),
source_bicID number(4) Not Null,
source_bic varchar2(10) Not Null,
ledger_date date,
ledger_amount number(15,3) check (ledger_amount != 0 and ledger_amount > 0),
total_securities number(5,3) check (total_securities > 0.5)

);




create table statement_1(
s_account_id number primary key,
cstd_name varchar2(10),
l_account_id number,
country_code varchar2(5) Not Null,
country_name varchar(50) Not Null,
security_name varchar(50) Unique,
security_id number unique check (security_id > 0),
security_type varchar(6) check(security_type in('ISCEN', 'Cusip', 'Sidol', 'Tinker')),
source_bicID number(4) Not Null,
source_bic varchar2(10) Not Null,
sataement_date date,
statement_amount number(15,3) check (statement_amount > 0),
total_securities number(5,3) check (total_securities > 0.5),
foreign key(l_account_id) references ledger_1(l_account_id) on delete set null
);


select * from ledger_1;
select * from statement_1;

alter table statement_1 MODIFY security_name varchar2(50); 
alter table statement_1 MODIFY country_name varchar2(50);

alter table statement_1 rename column sataement_date to statement_date;

