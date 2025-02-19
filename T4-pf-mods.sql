/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pf-mods.sql

--Student ID: 33561826
--Student Name: Brandon Wee Yong Jing


/* Comments for your marker:




*/

/*(a)*/

ALTER TABLE service ADD non_standard_cost_count NUMBER DEFAULT 0;

UPDATE service s
SET non_standard_cost_count = (
  SELECT COUNT(*)
  FROM visit v
  JOIN visit_service vs ON v.visit_id = vs.visit_id
  WHERE vs.SERVICE_CODE = s.service_code
    AND vs.VISIT_SERVICE_LINECOST != s.SERVICE_STD_COST
);

DESC service;

SELECT SERVICE_CODE, SERVICE_DESC, non_standard_cost_count
FROM service;


/*(b)*/

DROP TABLE payment;

CREATE TABLE payment (
  payment_id INT NOT NULL,
  visit_id INT NOT NULL,
  payment_date DATE,
  payment_method VARCHAR2(50),
  amount NUMBER(6, 2)
);

ALTER TABLE payment 
    ADD CONSTRAINT payment_pk PRIMARY KEY ( payment_id );

ALTER TABLE payment 
    ADD CONSTRAINT payment_fk FOREIGN KEY ( visit_id )
        REFERENCES visit ( visit_id );

DROP SEQUENCE payment_seq;

CREATE SEQUENCE payment_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO payment (payment_id, visit_id, payment_date, payment_method, amount)
SELECT payment_seq.NEXTVAL, v.visit_id, v.VISIT_DATE_TIME, 'Historical', v.VISIT_TOTAL_COST
FROM visit v;

DESC payment;

SELECT * FROM payment;