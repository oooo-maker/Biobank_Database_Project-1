USE biobank_db;

CREATE OR REPLACE VIEW Sample_Inventory AS
SELECT
    s.sample_code,
    st.type_name AS sample_type,
    s.volume_ml AS sample_volume_ml,
    s.sample_status,
    a.aliquot_code,
    a.volume_ml AS aliquot_volume_ml,
    a.status AS aliquot_status,
    sl.freezer_code,
    sl.rack_code,
    sl.box_code,
    sl.position_code,
    sl.temperature_c
FROM Sample s
JOIN Sample_Type st
    ON s.sample_type_id = st.sample_type_id
JOIN Aliquot a
    ON s.sample_id = a.sample_id
JOIN Storage_Location sl
    ON a.location_id = sl.location_id;

CREATE OR REPLACE VIEW Research_Activity AS
SELECT
    r.researcher_name,
    r.department,
    s.sample_code,
    sr.request_date,
    sr.purpose AS request_purpose,
    sr.status AS request_status,
    a.aliquot_code,
    su.usage_date,
    su.volume_used_ml,
    su.usage_purpose
FROM Researcher r
JOIN Sample_Request sr
    ON r.researcher_id = sr.researcher_id
JOIN Sample s
    ON sr.sample_id = s.sample_id
JOIN Sample_Usage su
    ON sr.request_id = su.request_id
JOIN Aliquot a
    ON su.aliquot_id = a.aliquot_id;

SELECT *
FROM Sample_Inventory;

SELECT *
FROM Research_Activity;
SELECT * FROM sample_inventory;
SELECT * 
FROM Research_Activity;