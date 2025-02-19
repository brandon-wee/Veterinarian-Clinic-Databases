/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-pf-select.sql

--Student ID: 33561826
--Student Name: Brandon Wee Yong Jing


/* Comments for your marker:




*/


/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    c.clinic_id                                         AS clinicid,
    vt.vet_id                                           AS vetid,
    vt.vet_givenname
    || ' '
    || vt.vet_familyname                                AS vetname,
    CASE
        WHEN c.vet_id = vt.vet_id THEN
            'HEAD VET'
        ELSE
            ''
    END                                                 AS ishead,
    at.atype_description                                AS animaltype,
    lpad(to_char(COUNT(at.atype_description)), 11, ' ') AS numberappts,
    lpad(to_char((COUNT(at.atype_description) * 100.0 / SUM(COUNT(at.atype_description)) OVER (PARTITION BY vt.vet_id)), '990.9'), 11, ' ')
    || '%'                                              AS percentappts
FROM
    visit       vs
    JOIN animal a
    ON vs.animal_id = a.animal_id
    JOIN vet vt
    ON vs.vet_id = vt.vet_id
    JOIN clinic c
    ON vs.clinic_id = c.clinic_id
    JOIN animal_type at
    ON a.atype_id = at.atype_id
WHERE
    upper(at.atype_description) IN ('DOG', 'CAT')
GROUP BY
    c.clinic_id,
    vt.vet_id,
    vt.vet_givenname,
    vt.vet_familyname,
    at.atype_description,
    c.vet_id
ORDER BY
    c.clinic_id,
    ishead,
    vt.vet_id,
    at.atype_description;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    vs.service_code,
    s.service_desc,
    vt.vet_id,
    vt.vet_givenname || ' ' || vt.vet_familyname AS vetname,
    c.clinic_id,
    c.clinic_name,
    v.visit_id,
    v.VISIT_DATE_TIME,
    vs.VISIT_SERVICE_LINECOST
FROM
    visit_service vs
    JOIN visit v ON vs.VISIT_ID = v.VISIT_ID
    JOIN vet vt ON v.vet_id = vt.vet_id
    JOIN clinic c ON v.clinic_id = c.clinic_id
    JOIN service s ON vs.service_code = s.service_code
WHERE
    vs.VISIT_SERVICE_LINECOST > (
        SELECT AVG(VISIT_SERVICE_LINECOST)
        FROM visit_service
        WHERE service_code = vs.service_code
    )
ORDER BY
    vs.service_code,
    vt.vet_id,
    vs.visit_id;



