--- Views are Virtual tables stored in meta data level except(Materlized view). fields in views base on DB tables

select * from ledger_1;
select * from statement_1;

--- Simple view -- A view based on single table doesnt have any group by or distinct or any system define function.
                 -- it stores only query on data dictionary.
                 
                 
create or replace view Simple_view1 AS select assect_register_id, security_id, ledger_date, security_name 
from ledger_1;

select * from simple_view1;

create view simple_view2 AS SELECT security_name, security_id, ledger_date
from ledger_1 where ledger_date = ledger_date;

select * from simple_view2;
select sum(security_id),count(ledger_date)from simple_view2;

update simple_view2 set security_name = 'Security A' where security_id = 11;


create or replace view simple_view3 as select security_name, security_id from ledger_1 where security_name = 'Security';

select * from simple_view3;

select count(security_id) from simple_view3;

drop view simple_view3;



---With read only simple view doesnt allow DML operation on view.

create or replace view with_read_only as
select L_account_id, country_name, security_id, source_bic from statement_1
with read only;

select * from with_read_only;


--- With CHECK on Simple view allow DML operation only when condition matches.

create or replace view check_view as
select s_account_id, cstd_name, l_account_id, country_code,security_id from statement_1
where cstd_name = 'DNB'
with check option;

select * from check_view;




select * from user_views where view_name in ('check_view');


------ Complex view -- virtual table based on one are more tables, which contain group by, functions, distinct 
---- DML are not allowed on complex view - queries stored at data dictionary.


create or replace view complex_view1 AS
select L_ACCOUNT_ID, COUNTRY_CODE,SECURITY_NAME, SECURITY_ID,
SECURITY_TYPE, LEDGER_DATE, LEDGER_AMOUNT, TOTAL_SECURITIES,
sum(ledger_amount) as Total_amount from ledger_1

group by L_ACCOUNT_ID, COUNTRY_CODE,SECURITY_NAME, SECURITY_ID,
SECURITY_TYPE, LEDGER_DATE, LEDGER_AMOUNT, TOTAL_SECURITIES

union

select S_ACCOUNT_ID, COUNTRY_CODE, SECURITY_NAME, SECURITY_ID,
SECURITY_TYPE, STATEMENT_DATE, STATEMENT_AMOUNT, TOTAL_SECURITIES, 
sum(statement_amount) as Total_amount from statement_1

group by S_ACCOUNT_ID, COUNTRY_CODE, SECURITY_NAME, SECURITY_ID,
SECURITY_TYPE, STATEMENT_DATE, STATEMENT_AMOUNT, TOTAL_SECURITIES
order by security_id ASC;

select * from complex_view1;


                         ---------------------------------

                         
create or replace view complex_view2 AS
select S_ACCOUNT_ID, CSTD_NAME, L_ACCOUNT_ID, COUNTRY_NAME, SECURITY_ID, SECURITY_TYPE,
TOTAL_SECURITIES, count(country_name) as C_C, count(cstd_name) as C_N
from statement_1
where country_name = 'India'
group by S_ACCOUNT_ID, CSTD_NAME, L_ACCOUNT_ID, COUNTRY_NAME, SECURITY_ID, SECURITY_TYPE,
TOTAL_SECURITIES
order by total_securities desc;

select * from complex_view2;

select max(total_securities) from complex_view2;

update statement_1 set security_id = 161 where total_securities = 7;

select * from statement_1;


                           -------------------------------------
                           
                           
--- Materlized view-- the virtual table stored in real DB MV, it allows DML operation base on Refresh or on Schedule.
--- deals with one or more tables and view contain sys function, group by having distinct......



create MATERIALIZED view statement_1_cstd
as
select s_account_id, cstd_name, country_code, security_name, security_id from statement_1
where cstd_name = 'BNY';

select * from statement_1_cstd;

drop MATERIALIZED view statement_1_cstd;    -- to drop view

-- data dictionary view's
select * from user_objects where object_name = 'statement_1_cstd';

-- MATERIALIZED REFRESH
begin
dbms_mview.refresh('statement_1_cstd', 'F');
end;

---------------------------------------------------------------------------------    

select * from statement_1;

       


CREATE MATERIALIZED VIEW mv_summary
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
SELECT DISTINCT
    s_account_id,
    COUNT(cstd_name) AS cnt_cstd,
    security_name, 
    security_id,
    SUM(total_securities) AS sum_securities
FROM 
    statement_1
GROUP BY 
    security_id, s_account_id, security_name
ORDER BY 
    security_id ASC;

select * from mv_summary;






CREATE MATERIALIZED VIEW mv_transaction_summary
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE
AS
SELECT 
    l.l_account_id,
    l.security_id,
    s.security_type,
    SUM(l.ledger_amount) AS total_ledger_amount,
    SUM(s.statement_amount) AS total_statement_amount,
    COUNT(*) AS transaction_count
FROM 
    ledger_1 l
JOIN 
    statement_1 s ON l.security_id = s.security_id
GROUP BY 
    l.l_account_id, l.security_id, s.security_type;
    
    
    
----------------------------------------------------------------------------------


Select * from statement_1;


begin
dbms_mview.refresh('View_name');
end;
