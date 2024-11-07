/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pf-json.sql

--Student ID: 33561826
--Student Name: Brandon Wee Yong Jing


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT json_object(
    '_id' VALUE c.clinic_id,
    'name' VALUE c.clinic_name,
    'address' VALUE c.clinic_address,
    'phone' VALUE c.clinic_phone,
    'head_vet' VALUE json_object(
        'id' VALUE hv.vet_id,
        'name' VALUE hv.vet_givenname || ' ' || hv.vet_familyname
    ),
    'no_of_vets' VALUE COUNT(v.vet_id),
    'vets' VALUE json_arrayagg(
        json_object(
            'id' VALUE v.vet_id,
            'name' VALUE v.vet_givenname || ' ' || v.vet_familyname,
            'specialisation' VALUE NVL(s.SPEC_DESCRIPTION, 'N/A')
        )
    ) FORMAT JSON ) 
|| ','
FROM clinic c
JOIN vet v ON c.clinic_id = v.clinic_id
LEFT JOIN vet hv ON c.vet_id = hv.vet_id
LEFT JOIN SPECIALISATION s ON v.SPEC_ID = s.SPEC_ID
GROUP BY c.clinic_id, c.clinic_name, c.clinic_address, c.clinic_phone, hv.vet_id, hv.vet_givenname, hv.vet_familyname;

