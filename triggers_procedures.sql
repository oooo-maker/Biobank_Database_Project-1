USE biobank_db;

DELIMITER //

CREATE TRIGGER check_usage_volume
BEFORE INSERT ON Sample_Usage
FOR EACH ROW
BEGIN
    DECLARE available_volume DECIMAL(10,2);

    SELECT volume_ml
    INTO available_volume
    FROM Aliquot
    WHERE aliquot_id = NEW.aliquot_id;

    IF NEW.volume_used_ml > available_volume THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Used volume exceeds available aliquot volume.';
    END IF;
END //

DELIMITER ;

INSERT INTO Sample_Usage
(request_id, aliquot_id, usage_date, volume_used_ml, usage_purpose)
VALUES
(1, 1, '2026-03-02', 0.50, 'Trigger valid usage test');

INSERT INTO Sample_Usage
(request_id, aliquot_id, usage_date, volume_used_ml, usage_purpose)
VALUES
(1, 1, '2026-03-03', 5.00, 'Trigger invalid usage test');
DELETE FROM Sample_Usage
WHERE usage_purpose = 'Trigger valid usage test';
SELECT usage_id, usage_purpose
FROM Sample_Usage
WHERE usage_purpose = 'Trigger valid usage test';
DELETE FROM Sample_Usage
WHERE usage_id = 11;