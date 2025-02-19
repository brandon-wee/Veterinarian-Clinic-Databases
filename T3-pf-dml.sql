/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pf-dml.sql

--Student ID: 33561826
--Student Name: Brandon Wee Yong Jing

/* Comments for your marker:




*/

/*(a)*/


DROP SEQUENCE visit_seq;

CREATE SEQUENCE visit_seq
START WITH 100
INCREMENT BY 10;

/*(b)*/

INSERT INTO visit (
    visit_id,
    visit_date_time,
    visit_length,
    visit_notes,
    visit_weight,
    visit_total_cost,
    animal_id,
    vet_id,
    clinic_id,
    from_visit_id
) VALUES (
    visit_seq.CURRVAL,
    TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI'),
    30,
    'Consultation',
    3.5,
    ( SELECT service_std_cost FROM service WHERE service_code = 'S001' ),
    ( SELECT animal_id FROM animal WHERE upper(animal_name) = upper('Oreo') AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY') AND owner_id = ( SELECT owner_id FROM owner WHERE upper(owner_givenname) = upper('Jack') AND upper(owner_familyname) = upper('Jones') ) ),
    ( SELECT vet_id FROM vet WHERE upper(vet_givenname) = upper('Anna') AND upper(vet_familyname) = upper('Kowalski') ),
    3,
    NULL
);

INSERT INTO visit_service (
    visit_id,
    service_code,
    visit_service_linecost
) VALUES (
    visit_seq.CURRVAL,
    'S001',
    ( SELECT service_std_cost FROM service WHERE service_code = 'S001' )
);

/*(c)*/

INSERT INTO visit_service (
    visit_id,
    service_code,
    visit_service_linecost
) VALUES (
    ( SELECT visit_id FROM visit WHERE animal_id = ( ( SELECT animal_id FROM animal WHERE upper(animal_name) = upper('Oreo') AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY') AND owner_id = ( SELECT owner_id FROM owner WHERE upper(owner_givenname) = upper('Jack') AND upper(owner_familyname) = upper('Jones') ) ) ) AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI') ),
    ( SELECT service_code FROM service WHERE upper(service_desc) = upper('Ear Infection Treatment') ),
    ( SELECT service_std_cost FROM service WHERE upper(service_desc) = upper('Ear Infection Treatment') )
);

INSERT INTO visit_drug (
    visit_id,
    drug_id,
    visit_drug_dose,
    visit_drug_frequency,
    visit_drug_qtysupplied,
    visit_drug_linecost
) VALUES (
    ( SELECT visit_id FROM visit WHERE animal_id = ( ( SELECT animal_id FROM animal WHERE upper(animal_name) = upper('Oreo') AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY') AND owner_id = ( SELECT owner_id FROM owner WHERE upper(owner_givenname) = upper('Jack') AND upper(owner_familyname) = upper('Jones') ) ) ) AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI') ),
    ( SELECT drug_id FROM drug WHERE upper(drug_name) = upper('Clotrimazole') ),
    'One',
    'Once',
    1,
    ( SELECT drug_std_cost FROM drug WHERE upper(drug_name) = upper('Clotrimazole') )
);

UPDATE visit
SET
    visit_total_cost = visit_total_cost + (
        SELECT
            service_std_cost
        FROM
            service
        WHERE
            upper(service_desc) = upper('Ear Infection Treatment')
    ) + (
        SELECT
            drug_std_cost
        FROM
            drug
        WHERE
            upper(drug_name) = upper('Clotrimazole')
    )
WHERE
    visit_id = (
        SELECT
            visit_id
        FROM
            visit
        WHERE
            animal_id = (
                SELECT
                    animal_id
                FROM
                    animal
                WHERE
                    upper(animal_name) = upper('Oreo')
                    AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY')
                    AND owner_id = (
                        SELECT
                            owner_id
                        FROM
                            owner
                        WHERE
                            upper(owner_givenname) = upper('Jack')
                            AND upper(owner_familyname) = upper('Jones')
                    )
            )
            AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI')
    );

INSERT INTO visit (
    visit_id,
    visit_date_time,
    visit_length,
    visit_notes,
    visit_weight,
    visit_total_cost,
    animal_id,
    vet_id,
    clinic_id,
    from_visit_id
) VALUES (
    visit_seq.NEXTVAL,
    TO_DATE('26-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI'),
    30,
    'Follow up',
    3.5,
    ( SELECT service_std_cost FROM service WHERE service_code = 'S001' ),
    ( SELECT animal_id FROM animal WHERE upper(animal_name) = upper('Oreo') AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY') AND owner_id = ( SELECT owner_id FROM owner WHERE upper(owner_givenname) = upper('Jack') AND upper(owner_familyname) = upper('Jones') ) ),
    ( SELECT vet_id FROM vet WHERE upper(vet_givenname) = upper('Anna') AND upper(vet_familyname) = upper('Kowalski') ),
    3,
    ( SELECT visit_id FROM visit WHERE animal_id = ( ( SELECT animal_id FROM animal WHERE upper(animal_name) = upper('Oreo') AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY') AND owner_id = ( SELECT owner_id FROM owner WHERE upper(owner_givenname) = upper('Jack') AND upper(owner_familyname) = upper('Jones') ) ) ) AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI') )
);

INSERT INTO visit_service (
    visit_id,
    service_code,
    visit_service_linecost
) VALUES (
    visit_seq.CURRVAL,
    'S001',
    ( SELECT service_std_cost FROM service WHERE service_code = 'S001' )
);

/*(d)*/

DELETE FROM visit_service
WHERE
    visit_id = (
        SELECT
            visit_id
        FROM
            visit
        WHERE
            from_visit_id = (
                SELECT
                    visit_id
                FROM
                    visit
                WHERE
                    animal_id = ( (
                        SELECT
                            animal_id
                        FROM
                            animal
                        WHERE
                            upper(animal_name) = upper('Oreo')
                            AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY')
                            AND owner_id = (
                                SELECT
                                    owner_id
                                FROM
                                    owner
                                WHERE
                                    upper(owner_givenname) = upper('Jack')
                                    AND upper(owner_familyname) = upper('Jones')
                            )
                    ) )
                    AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI')
            )
    );

DELETE FROM visit_drug
WHERE
    visit_id = (
        SELECT
            visit_id
        FROM
            visit
        WHERE
            from_visit_id = (
                SELECT
                    visit_id
                FROM
                    visit
                WHERE
                    animal_id = ( (
                        SELECT
                            animal_id
                        FROM
                            animal
                        WHERE
                            upper(animal_name) = upper('Oreo')
                            AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY')
                            AND owner_id = (
                                SELECT
                                    owner_id
                                FROM
                                    owner
                                WHERE
                                    upper(owner_givenname) = upper('Jack')
                                    AND upper(owner_familyname) = upper('Jones')
                            )
                    ) )
                    AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI')
            )
    );

DELETE FROM visit
WHERE
    visit_id = (
        SELECT
            visit_id
        FROM
            visit
        WHERE
            from_visit_id = (
                SELECT
                    visit_id
                FROM
                    visit
                WHERE
                    animal_id = ( (
                        SELECT
                            animal_id
                        FROM
                            animal
                        WHERE
                            upper(animal_name) = upper('Oreo')
                            AND animal_born = TO_DATE('01-06-2018', 'DD-MM-YYYY')
                            AND owner_id = (
                                SELECT
                                    owner_id
                                FROM
                                    owner
                                WHERE
                                    upper(owner_givenname) = upper('Jack')
                                    AND upper(owner_familyname) = upper('Jones')
                            )
                    ) )
                    AND visit_date_time = TO_DATE('19-MAY-2024 14:00', 'DD-MON-YYYY HH24:MI')
            )
    );
    