 CREATE DATABASE biobank_db;

USE biobank_db;
CREATE TABLE Donor (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_code VARCHAR(20) NOT NULL UNIQUE,
    date_of_birth DATE,
    sex VARCHAR(10),
    blood_group VARCHAR(5),
    registration_date DATE NOT NULL
);
CREATE TABLE Consent (
    consent_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    consent_date DATE NOT NULL,
    consent_type VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    expiry_date DATE,
    
    CONSTRAINT fk_consent_donor
        FOREIGN KEY (donor_id)
        REFERENCES Donor(donor_id)
);
CREATE TABLE Collection_Event (
    collection_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    collection_date DATE NOT NULL,
    collection_method VARCHAR(50) NOT NULL,
    collected_by VARCHAR(100),
    notes VARCHAR(255),

    CONSTRAINT fk_collection_donor
        FOREIGN KEY (donor_id)
        REFERENCES Donor(donor_id)
);
CREATE TABLE Sample_Type (
    sample_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255)
);
CREATE TABLE Sample (
    sample_id INT AUTO_INCREMENT PRIMARY KEY,
    collection_id INT NOT NULL,
    sample_type_id INT NOT NULL,
    sample_code VARCHAR(20) NOT NULL UNIQUE,
    collection_date DATE NOT NULL,
    volume_ml DECIMAL(10,2) NOT NULL,
    sample_status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_sample_collection
        FOREIGN KEY (collection_id)
        REFERENCES Collection_Event(collection_id),

    CONSTRAINT fk_sample_type
        FOREIGN KEY (sample_type_id)
        REFERENCES Sample_Type(sample_type_id),

    CONSTRAINT chk_sample_volume
        CHECK (volume_ml > 0)
);
CREATE TABLE Storage_Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    freezer_code VARCHAR(20) NOT NULL,
    rack_code VARCHAR(20) NOT NULL,
    box_code VARCHAR(20) NOT NULL,
    position_code VARCHAR(20) NOT NULL,
    temperature_c DECIMAL(5,2) NOT NULL,

    CONSTRAINT uq_storage_position
        UNIQUE (freezer_code, rack_code, box_code, position_code)
);
CREATE TABLE Aliquot (
    aliquot_id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT NOT NULL,
    aliquot_code VARCHAR(20) NOT NULL UNIQUE,
    volume_ml DECIMAL(10,2) NOT NULL,
    created_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    location_id INT NOT NULL,

    CONSTRAINT fk_aliquot_sample
        FOREIGN KEY (sample_id)
        REFERENCES Sample(sample_id),

    CONSTRAINT fk_aliquot_location
        FOREIGN KEY (location_id)
        REFERENCES Storage_Location(location_id),

    CONSTRAINT chk_aliquot_volume
        CHECK (volume_ml > 0)
);
CREATE TABLE Researcher (
    researcher_id INT AUTO_INCREMENT PRIMARY KEY,
    researcher_code VARCHAR(20) NOT NULL UNIQUE,
    researcher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(100),
    institution VARCHAR(100)
);
CREATE TABLE Sample_Request (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    researcher_id INT NOT NULL,
    sample_id INT NOT NULL,
    request_date DATE NOT NULL,
    purpose VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_request_researcher
        FOREIGN KEY (researcher_id)
        REFERENCES Researcher(researcher_id),

    CONSTRAINT fk_request_sample
        FOREIGN KEY (sample_id)
        REFERENCES Sample(sample_id)
);
CREATE TABLE Sample_Usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT NOT NULL,
    aliquot_id INT NOT NULL,
    usage_date DATE NOT NULL,
    volume_used_ml DECIMAL(10,2) NOT NULL,
    usage_purpose VARCHAR(255) NOT NULL,

    CONSTRAINT fk_usage_request
        FOREIGN KEY (request_id)
        REFERENCES Sample_Request(request_id),

    CONSTRAINT fk_usage_aliquot
        FOREIGN KEY (aliquot_id)
        REFERENCES Aliquot(aliquot_id),

    CONSTRAINT chk_usage_volume
        CHECK (volume_used_ml > 0)
);
CREATE TABLE Test_Request (
    test_request_id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT NOT NULL,
    researcher_id INT NOT NULL,
    test_type VARCHAR(100) NOT NULL,
    request_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    result VARCHAR(255),

    CONSTRAINT fk_test_sample
        FOREIGN KEY (sample_id)
        REFERENCES Sample(sample_id),

    CONSTRAINT fk_test_researcher
        FOREIGN KEY (researcher_id)
        REFERENCES Researcher(researcher_id)
);