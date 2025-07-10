select * from ledger_1;
select * from statement_1;
select count(source_bicID) from ledger_1 where source_bicID = 1001;



--- UNION -- perform distinct operation on two or more set of sql queries and allow null in result set(Only once).

select l_account_id, security_name, security_id, source_bicID from ledger_1 where source_bicID = 1002
UNION
select s_account_id, security_name, security_id, null AS source_bicID from statement_1;

--- Union ALL -- it perform operation on two or more set of sql statements/queries, deals WITH DUPLICATES include null values.

select l_account_id, source_bicID, security_name, security_id from ledger_1
where source_bicID = 1001
UNION ALL
select s_account_id, source_bicID, security_name, security_id from statement_1 
where source_bicID = 1001;


--- Intercept -- operation on two are more sql statements, retrive COMMON/UNIQUE values in bw table, Includes NUll if both table has.

select country_code, source_bicID, security_id from ledger_1 where security_id > 161
INTERSECT
select country_code,source_bicID, security_id from statement_1 where security_id > 161;


select security_id from ledger_1
INTERSECT
select security_id from statement_1;

select ledger_date, total_securities from ledger_1
INTERSECT
select sataement_date, total_securities from statement_1;



--- Minus/Except/NOT IN -- perform operation on two or more set of queries and retrive records from tableA/table/B - includes NULL.

select security_id, country_code from statement_1
MINUS
select security_id, country_code from ledger_1;

select ledger_date, total_securities from ledger_1
minus
select sataement_date, null as total_securities from statement_1;


select ledger_date,total_securities from ledger_1
minus
select sataement_date, total_securities from statement_1;




------------ deals with NULL VALUES IN Set Operations ---------------------

select null as null_column1, null as null_column2 from dual
Union   -- NVL retrive one time
select null as nvl_column, null as null_column1 from dual;


select null as null_column1, null as null_column2 from dual
Union All  -- NVL retrive 2 one from each
select null as nvl_column, null as null_column1 from dual;


select null as null_column1, null as null_column2 from dual
INTERSECT   -- NVL retrive one time as common in bw table
select null as nvl_column, null as null_column1 from dual;



select null as null_column1, null as null_column2 from dual
Minus  -- 0 NVL retrivel 
select null as nvl_column, null as null_column1 from dual;



select security_id from statement_1 where total_securities >25;


select total_securities, security_id from ledger_1 where total_securities > 40 and source_BIC = 'BIC004'
UNION
select total_securities, security_id from statement_1 where total_securities > 25 and source_bic = 'BIC004';