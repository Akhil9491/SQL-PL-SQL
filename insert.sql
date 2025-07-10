select * from ledger_1;
select * from statement_1;

drop table statement_1;
TRUNCATE TABLE ledger_1;

INSERT INTO ledger_1 (l_account_id, country_code, country_name, security_name, assect_register_id, security_id, security_type, source_bicID, source_bic, ledger_date, ledger_amount, total_securities) VALUES 
(10100212, 'US', 'United States', 'Security A', 5123, 0011, 'ISCEN', 1001, 'BIC001', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1500.000, 10.000);
INSERT INTO ledger_1 VALUES (21231121, 'CA', 'Canada', 'Security B', 62134, 212, 'CUSIP', 1002, 'BIC002', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 2500.000, 20.300);
INSERT INTO ledger_1 VALUES (32132111, 'GB', 'United Kingdom', 'Security C', 722432, 1223, 'SIDOL', 1001, 'BIC003', TO_DATE('2023-01-03', 'YYYY-MM-DD'), 3000.000, 15.100);
INSERT INTO ledger_1 VALUES (42316543, 'AU', 'Australia', 'Security D', 832145, 4211, 'Tinker', 1002, 'BIC004', TO_DATE('2023-01-04', 'YYYY-MM-DD'), 2000.000, 25.2);
INSERT INTO ledger_1 VALUES (52342322, 'DE', 'Germany', 'Security E', 923765, 1245, 'ISCEN', 1002, 'BIC001', TO_DATE('2023-01-05', 'YYYY-MM-DD'), 1800.000, 30.012);
INSERT INTO ledger_1 VALUES (63212389, 'FR', 'France', 'Security F', 1023456, 6123, 'CUSIP', 1006, 'BIC002', TO_DATE('2023-01-06', 'YYYY-MM-DD'), 2200.000, 12.020);
INSERT INTO ledger_1 VALUES (79876423, 'JP', 'Japan', 'Security G', 112322, 712, 'SIDOL', 1007, 'BIC003', TO_DATE('2023-01-07', 'YYYY-MM-DD'), 2700.000, 18.010);
INSERT INTO ledger_1 VALUES (83421962, 'IN', 'India', 'Security H', 12321, 8231, 'Tinker', 1008, 'BIC004', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 3200.000, 22.00);
INSERT INTO ledger_1 VALUES (91232452, 'BR', 'Brazil', 'Security I', 13432, 9873, 'ISCEN', 1009, 'BIC005', TO_DATE('2023-01-09', 'YYYY-MM-DD'), 1900.000, 14.00);
INSERT INTO ledger_1 VALUES (10123198, 'MX', 'Mexico', 'Security J', 149876, 10102, 'CUSIP', 1010, 'BIC010', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 2100.000, 16.20);
INSERT INTO ledger_1 VALUES (11231322, 'CN', 'China', 'Security K', 152345, 1112, 'SIDOL', 1011, 'BIC011', TO_DATE('2023-01-11', 'YYYY-MM-DD'), 2300.000, 19.13);
INSERT INTO ledger_1 VALUES (12243112, 'RU', 'Russia', 'Security L', 16231, 1322, 'Tinker', 1012, 'BIC06', TO_DATE('2023-01-12', 'YYYY-MM-DD'), 2400.000, 21.123);
INSERT INTO ledger_1 VALUES (13214564, 'ZA', 'South Africa', 'Security M', 176524, 1173, 'ISCEN', 1013, 'BIC08', TO_DATE('2023-01-13', 'YYYY-MM-DD'), 2600.000, 23.050);
INSERT INTO ledger_1 VALUES (14984533, 'IT', 'Italy', 'Security N', 181542, 1314, 'CUSIP', 1014, 'BIC014', TO_DATE('2023-01-14', 'YYYY-MM-DD'), 2800.000, 24.076);
INSERT INTO ledger_1 VALUES (15235366, 'ES', 'Spain', 'Security O', 1928754, 1985, 'SIDOL', 1015, 'BIC015', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 2900.000, 26.230);
INSERT INTO ledger_1 VALUES (16342653, 'SE', 'Sweden', 'Security P', 209563, 1621, 'Tinker', 1016, 'BIC03', TO_DATE('2023-01-16', 'YYYY-MM-DD'), 3000.000, 27.652);
INSERT INTO ledger_1 VALUES (134263, 'SE', 'Sweden', 'Security', 20951, 161, 'Tinker', 1153, 'BIC04', TO_DATE('2023-01-16', 'YYYY-MM-DD'), 300.20, 7);






INSERT INTO statement_1 VALUES (101, 'JohnDoe', 10100212, 'US', 'United States', 'Security A', 0011, 'ISCEN', 1001, 'BIC001', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1500.10, 10.00);
INSERT INTO statement_1 VALUES (221, 'DNB', 21231121, 'CA', 'Canada', 'Security B', 212, 'Cusip', 1002, 'BIC002', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 2500.000, 20.300);
INSERT INTO statement_1 VALUES (312, 'BNY', 32132111, 'GB', 'United Kingdom', 'Security C', 1223, 'Sidol', 1003, 'BIC003', TO_DATE('2023-01-03', 'YYYY-MM-DD'), 3000.000, 15.10);
INSERT INTO statement_1 VALUES (124, 'BNY', 42316543, 'AU', 'Australia', 'Security D', 4211, 'Tinker', 1004, 'BIC004', TO_DATE('2023-01-04', 'YYYY-MM-DD'), 200.000, 25.20);



INSERT INTO statement_1 VALUES (5122, 'CharlieJo', 52342322, 'DE', 'Germany', 'Security E', 5, 'ISCEN', 1412, 'BIC015', TO_DATE('2023-01-05', 'YYYY-MM-DD'), 1800.000, 30.012);
INSERT INTO statement_1 VALUES (1236, 'DavidWill', 63212389, 'FR', 'France', 'Security F', 6, 'Cusip', 106, 'BIC016', TO_DATE('2023-01-06', 'YYYY-MM-DD'), 2200.000, 12.020);
INSERT INTO statement_1 VALUES (2137, 'DNB', 79876423, 'JP', 'Japan', 'Security G', 7, 'Sidol', 1207, 'BIC02', TO_DATE('2023-01-07', 'YYYY-MM-DD'), 2700.000, 18.010);
INSERT INTO statement_1 VALUES (3128, 'FrankMil', 83421962, 'IN', 'India', 'Security H', 8231, 'Tinker', 3212, 'BIC121', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 300.000, 15.50);
INSERT INTO statement_1 VALUES (3127, 'FrankMil', 134263, 'IN', 'India', 'Security', 161, 'Tinker', 3212, 'BIC121', TO_DATE('2023-01-16', 'YYYY-MM-DD'), 300.20, 7);

commit;