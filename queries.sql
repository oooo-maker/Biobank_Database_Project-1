USE biobank_db;

-- Query 1: Display all donors
SELECT *
FROM Donor;


-- Query 2: Display female donors
SELECT *
FROM Donor
WHERE sex = 'F';


-- Query 3: Display donors with O+ blood group
SELECT *
FROM Donor
WHERE blood_group = 'O+';


-- Query 4: Display donors born after 1990
SELECT *
FROM Donor
WHERE date_of_birth > '1990-01-01';


-- Query 5: Display donors ordered by date of birth
SELECT *
FROM Donor
ORDER BY date_of_birth;

-- Query 6: Display samples with their sample types
SELECT
    s.sample_code,
    st.type_name,
    s.volume_ml,
    s.sample_status
FROM Sample s
JOIN Sample_Type st
    ON s.sample_type_id = st.sample_type_id;


-- Query 7: Display samples with donor information
SELECT
    s.sample_code,
    d.donor_code,
    d.sex,
    d.blood_group,
    st.type_name
FROM Sample s
JOIN Collection_Event ce
    ON s.collection_id = ce.collection_id
JOIN Donor d
    ON ce.donor_id = d.donor_id
JOIN Sample_Type st
    ON s.sample_type_id = st.sample_type_id;


-- Query 8: Display aliquots and their storage locations
SELECT
    a.aliquot_code,
    a.volume_ml,
    sl.freezer_code,
    sl.rack_code,
    sl.box_code,
    sl.position_code,
    sl.temperature_c
FROM Aliquot a
JOIN Storage_Location sl
    ON a.location_id = sl.location_id;


-- Query 9: Display researchers and their requested samples
SELECT
    r.researcher_name,
    r.department,
    s.sample_code,
    sr.request_date,
    sr.purpose,
    sr.status
FROM Researcher r
JOIN Sample_Request sr
    ON r.researcher_id = sr.researcher_id
JOIN Sample s
    ON sr.sample_id = s.sample_id;


-- Query 10: Display sample usage with researcher and aliquot information
SELECT
    r.researcher_name,
    s.sample_code,
    a.aliquot_code,
    su.usage_date,
    su.volume_used_ml,
    su.usage_purpose
FROM Sample_Usage su
JOIN Sample_Request sr
    ON su.request_id = sr.request_id
JOIN Researcher r
    ON sr.researcher_id = r.researcher_id
JOIN Aliquot a
    ON su.aliquot_id = a.aliquot_id
JOIN Sample s
    ON a.sample_id = s.sample_id;

-- Query 11: Count donors by blood group
SELECT
    blood_group,
    COUNT(*) AS donor_count
FROM Donor
GROUP BY blood_group;


-- Query 12: Count samples by sample type
SELECT
    st.type_name,
    COUNT(s.sample_id) AS sample_count
FROM Sample_Type st
LEFT JOIN Sample s
    ON st.sample_type_id = s.sample_type_id
GROUP BY st.type_name;


-- Query 13: Calculate total sample volume
SELECT
    SUM(volume_ml) AS total_sample_volume_ml
FROM Sample;


-- Query 14: Calculate average sample volume
SELECT
    AVG(volume_ml) AS average_sample_volume_ml
FROM Sample;


-- Query 15: Find researchers with more than one request
SELECT
    r.researcher_name,
    COUNT(sr.request_id) AS request_count
FROM Researcher r
JOIN Sample_Request sr
    ON r.researcher_id = sr.researcher_id
GROUP BY r.researcher_id, r.researcher_name
HAVING COUNT(sr.request_id) > 1;

-- Query 16: Find samples with volume greater than the average
SELECT
    sample_code,
    volume_ml
FROM Sample
WHERE volume_ml > (
    SELECT AVG(volume_ml)
    FROM Sample
);


-- Query 17: Find donors who have at least one collected sample
SELECT
    donor_code,
    sex,
    blood_group
FROM Donor
WHERE donor_id IN (
    SELECT donor_id
    FROM Collection_Event
);


-- Query 18: Find researchers who have submitted approved requests
SELECT
    researcher_name,
    department
FROM Researcher
WHERE researcher_id IN (
    SELECT researcher_id
    FROM Sample_Request
    WHERE status = 'Approved'
);


-- Query 19: Insert a new researcher
INSERT INTO Researcher
(researcher_code, researcher_name, email, department, institution)
VALUES
('RES011', 'Nour Ahmed', 'nour.ahmed@biolab.org',
 'Molecular Biology', 'BioLab Research Center');



-- Query 20: Update the status of a sample request
UPDATE Sample_Request
SET status = 'Completed'
WHERE request_id = 1;

-- Query 21: Delete the researcher added in Query 19
DELETE FROM Researcher
WHERE researcher_code = 'RES011';
