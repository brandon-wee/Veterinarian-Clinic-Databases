/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pf-insert.sql

--Student ID: 33561826
--Student Name: Brandon Wee Yong Jing

/* Comments for your marker:

 


*/

--------------------------------------
--INSERT INTO visit
--------------------------------------

-- animal 1 goes to see vet 1006 for checkup at clinic 1
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (1, TO_DATE('08-04-2024', 'dd-mm-yyyy'), 30, 'Checkup',            1.1,      276,  1, 1006, 1, NULL);
-- animal 2 goes to see vet 1003 for vaccination at clinic 2
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (2, TO_DATE('01-04-2024', 'dd-mm-yyyy'), 30, 'Vaccination',        2.2,   144.99,  2, 1003, 2, NULL);
-- animal 3 goes to see vet 1004 for checkup at clinic 3, awaiting follow up visit
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (3, TO_DATE('20-04-2024', 'dd-mm-yyyy'), 45, 'Skin Checkup',       3.3,     1199,  3, 1004, 3, NULL);
-- animal 4 goes to see vet 1007 for checkup at clinic 5, awaiting follow up visit
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (4, TO_DATE('01-04-2024', 'dd-mm-yyyy'), 45, 'Checkup',            4.4,      448,  4, 1007, 5, NULL);
-- animal 5 goes to see vet 1010 for vaccination at clinic 5
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (5, TO_DATE('01-04-2024', 'dd-mm-yyyy'), 60, 'Vaccination',        5.5,   144.99,  5, 1010, 5, NULL);
-- animal 6 goes to see vet 1002 for vaccination at clinic 4
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (6, TO_DATE('01-04-2024', 'dd-mm-yyyy'), 60, 'Vaccination',        6.6,   144.99,  6, 1002, 4, NULL);
-- animal 1 goes to see vet 1006 for checkup at clinic 1, follows up from visit with id 1
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (7, TO_DATE('09-04-2024', 'dd-mm-yyyy'), 75, 'Follow-up Checkup',  7.7,      110,  1, 1006, 1, 1);
-- animal 2 goes to see vet 1003 for vaccination at clinic 2, follows up from visit with id 2
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (8, TO_DATE('01-06-2024', 'dd-mm-yyyy'), 75, 'Vaccination',        8.8,   144.99,  2, 1003, 2, 2);
-- animal 3 goes to see vet 1004 for checkup at clinic 3, follows up from visit with id 3
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (9, TO_DATE('21-06-2024', 'dd-mm-yyyy'), 90, 'Follow-up Checkup',  9.9,     1199,  3, 1004, 3, 3);
-- animal 4 goes to see vet 1007 for checkup at clinic 5, follows up from visit with id 4, awaiting follow up visit
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (10, TO_DATE('02-04-2024', 'dd-mm-yyyy'), 90, 'Follow-up Checkup', 10.1,       60,  4, 1007, 5, 4);
-- 
INSERT INTO visit (visit_id, visit_date_time, visit_length, visit_notes, visit_weight, visit_total_cost, animal_id, vet_id, clinic_id, from_visit_id) VALUES (11, TO_DATE('02-05-2024', 'dd-mm-yyyy'), 90, 'Dental Checkup',    10.1,       90, 10, 1010, 5, NULL);

--------------------------------------
--INSERT INTO visit_service
--------------------------------------

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 2, 'S002', 45);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 5, 'S002', 45);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 6, 'S002', 45);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 8, 'S002', 45);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 1, 'S001', 60);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 3, 'S001', 60);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 4, 'S001', 60);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 7, 'S001', 60);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 9, 'S001', 60);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (10, 'S001', 60);

INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES (11, 'S006', 80);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 1, 'S003', 70);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 9, 'S009', 85);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 9, 'S008', 40);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 3, 'S009', 85);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 3, 'S008', 40);
INSERT INTO visit_service (visit_id, service_code, visit_service_linecost) VALUES ( 4, 'S004', 150);

--------------------------------------
--INSERT INTO visit_drug
--------------------------------------
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (2, 102, 'One', 'Once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (5, 102, 'One', 'Once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (6, 102, 'One', 'Once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (8, 102, 'One', 'Once', 1, 99.99);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (11, 106, 'One', 'Once', 1, 10);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (3, 101, '5mg/day', 'twice per day', 56, 672);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (3, 108, 'once', 'once per month', 2, 90);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (3, 109, '1mg/day', 'once per day', 56, 252);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (9, 101, '5mg/day', 'twice per day', 56, 672);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (9, 108, 'once', 'once per month', 2, 90);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (9, 109, '1mg/day', 'once per day', 56, 252);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (4, 101, '5mg/day', 'twice per day', 14, 168);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (4, 104, '10mg', 'Once', 1, 70);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (1, 103, 'One', 'Once', 1, 50);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (1, 107, '0.1mg/kg', 'once per month', 6, 96);
INSERT INTO visit_drug (visit_id, drug_id, visit_drug_dose, visit_drug_frequency, visit_drug_qtysupplied, visit_drug_linecost) VALUES (7, 105, 'One', 'Once', 1, 50);

COMMIT;