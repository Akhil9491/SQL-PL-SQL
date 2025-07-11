select * from ledger_1;
select * from statement_1;


--- Join's -- Performing operation on two or more tables to retrive common/matched records.

--- Inner Join -- Joining operation on two or more tables it retrives common records from tables.
             ---  (Not deals with Null values (NULL != NULL)) 


select l.security_id, l.ledger_date,s.statement_date, l.ledger_amount,
s.statement_amount, l.total_securities,s.total_securities from ledger_1 l

INNER JOIN

statement_1 s on l.security_id = s.security_id and l.ledger_date = s.statement_date
and l.total_securities = s.total_securities;



select l.country_code, s.country_code, l.security_id,s.security_id as S_SID, 
l.ledger_amount,s.statement_amount as S_AMNT,l.total_securities AS L_total_securities, 
s.total_securities AS s_total_securities
from ledger_1 l

INNER JOIN statement_1 s

on l.security_id = s.security_id and l.ledger_amount = s.statement_amount 
and round(l.total_securities) = round(s.total_securities) and l.country_code = s.country_code;


select l.assect_register_id, security_id , l.security_name as Security_name from ledger_1 l
join statement_1 s using (SECURITY_ID);



--- LEFT Join -- performing join operation on batch records from both tables and non match records from LEFT TABLE
              -- deals with null when left table has null retrives null(NULL != NULL)

select l.country_code, s.country_code, l.security_id,s.security_id as S_SID, 
l.ledger_amount,s.statement_amount as S_AMNT,l.total_securities AS L_total_securities, 
s.total_securities AS s_total_securities
from ledger_1 l

left JOIN statement_1 s

on l.security_id = s.security_id and l.ledger_amount = s.statement_amount 
and round(l.total_securities) = round(s.total_securities) and l.country_code = s.country_code

             --------------------------------------------------------------------------------


select l.country_code, s.country_code as S_CC, l.security_id,s.security_id as S_SID, 
l.ledger_amount,s.statement_amount as S_AMNT,l.total_securities AS L_total_securities, 
s.total_securities AS s_total_securities
from ledger_1 l

left JOIN statement_1 s

on l.security_id = s.security_id and l.ledger_amount = s.statement_amount 
and round(l.total_securities) = round(s.total_securities)
where s.country_code is null -- fetches only un matc records from left_table.
order by l.security_id desc;  


select l.assect_register_id, security_id , l.security_name as Security_name from ledger_1 l
left join statement_1 s using (SECURITY_ID);


--- Right Join -- performing operation on inner join + un-match records form rgth table it retrives null from only Table_B


select * from statement_1;


select l.assect_register_id, l.security_name, s.security_name,l.ledger_date
,s.statement_date, l.total_securities AS l_TS, s.total_securities AS s_TS
from ledger_1 l

Right join statement_1 s

on l.security_id = s.security_id and s.security_type = 'ISCEN'
fetch first 2 rows only;




-----------------------------------------------------------------------------------


--- FULL OUTER JOIN -- join operation on bot tables.(match records from table_A & Table_B, unmatched records from table_A and un matched records from Table_B)
---- if table_A, table_B has null i return on o/p.

select l.security_id,s.security_id, L.security_name, s.security_name from ledger_1 l

full outer join statement_1 s

on l.ledger_date = s.statement_date;




select l.security_id,s.security_id, L.security_name, s.security_name from ledger_1 l

full outer join statement_1 s

on l.ledger_date = s.statement_date
where s.security_id is null;




select l.security_id As l_sid, s.security_id, L.security_name, s.security_name from ledger_1 l

full outer join statement_1 s

on l.ledger_date = s.statement_date
where l.security_id is null  or s.security_id is null;




---------------------------------------------------------------------------------

--- SELF Join -- performing join operation on same table. helps to compare rows in same tabel and retrive data with in table

select l.security_id,s.assect_register_id from ledger_1 l
join ledger_1 s on l.assect_register_id = s.assect_register_id;


select l.assect_register_id, security_id , l.security_name as Security_name from ledger_1 l
join ledger_1 s using (SECURITY_ID);

  
--- Cross Join -- every row from first table combines with every row from second table(Cartesian product) M*N

select l.assect_register_id, s.security_id from ledger_1 l
cross join statement_1 s;

select * from ledger_1, statement_1;
