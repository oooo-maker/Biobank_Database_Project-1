USE biobank_db;

INSERT INTO Donor
    (donor_code, date_of_birth, sex, blood_group, registration_date)
VALUES
    ('DNR001', '1995-03-12', 'F', 'A+', '2026-01-05'),
    ('DNR002', '1988-07-21', 'M', 'O+', '2026-01-07'),
    ('DNR003', '1992-11-03', 'F', 'B+', '2026-01-10'),
    ('DNR004', '1985-02-18', 'M', 'AB+', '2026-01-12'),
    ('DNR005', '1998-09-25', 'F', 'O-', '2026-01-15'),
    ('DNR006', '1990-06-14', 'M', 'A-', '2026-01-18'),
    ('DNR007', '1996-12-30', 'F', 'B-', '2026-01-20'),
    ('DNR008', '1983-04-09', 'M', 'O+', '2026-01-23'),
    ('DNR009', '1994-08-17', 'F', 'A+', '2026-01-25'),
    ('DNR010', '1989-10-06', 'M', 'AB-', '2026-01-28');
    INSERT INTO Sample_Type
    (type_name, description)
VALUES
    ('Blood', 'Whole blood specimen'),
    ('Plasma', 'Plasma separated from blood'),
    ('Serum', 'Serum specimen obtained from blood'),
    ('Tissue', 'Biological tissue specimen'),
    ('DNA', 'Purified DNA specimen'),
    ('RNA', 'Purified RNA specimen'),
    ('Saliva', 'Saliva specimen'),
    ('Urine', 'Urine specimen'),
    ('Bone Marrow', 'Bone marrow specimen'),
    ('CSF', 'Cerebrospinal fluid specimen');
    INSERT INTO Researcher
    (researcher_code, researcher_name, email, department, institution)
VALUES
    ('RES001', 'Ahmad Khalil', 'ahmad.khalil@biolab.org', 'Genetics', 'BioLab Research Center'),
    ('RES002', 'Sara Nasser', 'sara.nasser@biolab.org', 'Oncology', 'BioLab Research Center'),
    ('RES003', 'Omar Haddad', 'omar.haddad@medresearch.org', 'Molecular Biology', 'Medical Research Institute'),
    ('RES004', 'Lina Saad', 'lina.saad@medresearch.org', 'Immunology', 'Medical Research Institute'),
    ('RES005', 'Yousef Mansour', 'yousef.mansour@genomics.org', 'Genomics', 'Genomics Research Lab'),
    ('RES006', 'Maya Saleh', 'maya.saleh@genomics.org', 'Bioinformatics', 'Genomics Research Lab'),
    ('RES007', 'Khaled Omar', 'khaled.omar@biolab.org', 'Cell Biology', 'BioLab Research Center'),
    ('RES008', 'Rania Fares', 'rania.fares@cancerlab.org', 'Cancer Biology', 'Cancer Research Lab'),
    ('RES009', 'Tariq Amin', 'tariq.amin@cancerlab.org', 'Pathology', 'Cancer Research Lab'),
    ('RES010', 'Huda Sami', 'huda.sami@uniresearch.edu', 'Biomedical Sciences', 'University Research Center');

INSERT INTO Storage_Location
    (freezer_code, rack_code, box_code, position_code, temperature_c)
VALUES
    ('FZ01', 'R01', 'B01', 'A01', -80.00),
    ('FZ01', 'R01', 'B01', 'A02', -80.00),
    ('FZ01', 'R01', 'B01', 'A03', -80.00),
    ('FZ01', 'R01', 'B01', 'A04', -80.00),
    ('FZ01', 'R01', 'B01', 'A05', -80.00),
    ('FZ01', 'R01', 'B02', 'A01', -80.00),
    ('FZ01', 'R01', 'B02', 'A02', -80.00),
    ('FZ01', 'R01', 'B02', 'A03', -80.00),
    ('FZ02', 'R01', 'B01', 'A01', -80.00),
    ('FZ02', 'R01', 'B01', 'A02', -80.00);
    INSERT INTO Consent
    (donor_id, consent_date, consent_type, status, expiry_date)
VALUES
    (1, '2026-01-05', 'General Research', 'Active', '2028-01-05'),
    (2, '2026-01-07', 'Genetic Research', 'Active', '2028-01-07'),
    (3, '2026-01-10', 'General Research', 'Active', '2028-01-10'),
    (4, '2026-01-12', 'Genetic Research', 'Active', '2028-01-12'),
    (5, '2026-01-15', 'Cancer Research', 'Active', '2028-01-15'),
    (6, '2026-01-18', 'General Research', 'Active', '2028-01-18'),
    (7, '2026-01-20', 'Genetic Research', 'Active', '2028-01-20'),
    (8, '2026-01-23', 'Cancer Research', 'Active', '2028-01-23'),
    (9, '2026-01-25', 'General Research', 'Active', '2028-01-25'),
    (10, '2026-01-28', 'Genetic Research', 'Active', '2028-01-28');

INSERT INTO Collection_Event
    (donor_id, collection_date, collection_method, collected_by, notes)
VALUES
    (1, '2026-01-10', 'Blood Draw', 'Nurse Team A', 'Routine collection'),
    (2, '2026-01-12', 'Blood Draw', 'Nurse Team A', 'Routine collection'),
    (3, '2026-01-15', 'Blood Draw', 'Nurse Team B', 'Routine collection'),
    (4, '2026-01-18', 'Blood Draw', 'Nurse Team B', 'Routine collection'),
    (5, '2026-01-20', 'Blood Draw', 'Nurse Team A', 'Cancer study collection'),
    (6, '2026-01-22', 'Blood Draw', 'Nurse Team C', 'Routine collection'),
    (7, '2026-01-25', 'Blood Draw', 'Nurse Team C', 'Genetic study collection'),
    (8, '2026-01-27', 'Blood Draw', 'Nurse Team A', 'Cancer study collection'),
    (9, '2026-01-29', 'Blood Draw', 'Nurse Team B', 'Routine collection'),
    (10, '2026-02-01', 'Blood Draw', 'Nurse Team C', 'Genetic study collection');
    
    INSERT INTO Sample
    (collection_id, sample_type_id, sample_code, collection_date, volume_ml, sample_status)
VALUES
    (1, 1, 'SMP001', '2026-01-10', 10.00, 'Available'),
    (2, 2, 'SMP002', '2026-01-12', 8.00, 'Available'),
    (3, 3, 'SMP003', '2026-01-15', 7.50, 'Available'),
    (4, 4, 'SMP004', '2026-01-18', 15.00, 'Available'),
    (5, 5, 'SMP005', '2026-01-20', 5.00, 'Available'),
    (6, 6, 'SMP006', '2026-01-22', 4.00, 'Available'),
    (7, 7, 'SMP007', '2026-01-25', 12.00, 'Available'),
    (8, 8, 'SMP008', '2026-01-27', 20.00, 'Available'),
    (9, 9, 'SMP009', '2026-01-29', 6.00, 'Available'),
    (10, 10, 'SMP010', '2026-02-01', 9.00, 'Available');

INSERT INTO Aliquot
    (sample_id, aliquot_code, volume_ml, created_date, status, location_id)
VALUES
    (1, 'ALQ001', 2.00, '2026-01-10', 'Available', 1),
    (2, 'ALQ002', 2.00, '2026-01-12', 'Available', 2),
    (3, 'ALQ003', 1.50, '2026-01-15', 'Available', 3),
    (4, 'ALQ004', 3.00, '2026-01-18', 'Available', 4),
    (5, 'ALQ005', 1.00, '2026-01-20', 'Available', 5),
    (6, 'ALQ006', 1.00, '2026-01-22', 'Available', 6),
    (7, 'ALQ007', 2.50, '2026-01-25', 'Available', 7),
    (8, 'ALQ008', 4.00, '2026-01-27', 'Available', 8),
    (9, 'ALQ009', 1.50, '2026-01-29', 'Available', 9),
    (10, 'ALQ010', 2.00, '2026-02-01', 'Available', 10);
    INSERT INTO Sample_Request
    (researcher_id, sample_id, request_date, purpose, status)
VALUES
    (1, 1, '2026-02-05', 'Genetic analysis', 'Approved'),
    (2, 2, '2026-02-06', 'Cancer biomarker study', 'Approved'),
    (3, 3, '2026-02-07', 'Molecular analysis', 'Approved'),
    (4, 4, '2026-02-08', 'Immunology research', 'Approved'),
    (5, 5, '2026-02-09', 'Genomic sequencing', 'Approved'),
    (6, 6, '2026-02-10', 'Bioinformatics study', 'Approved'),
    (7, 7, '2026-02-11', 'Cell biology research', 'Approved'),
    (8, 8, '2026-02-12', 'Cancer research', 'Approved'),
    (9, 9, '2026-02-13', 'Pathology analysis', 'Approved'),
    (10, 10, '2026-02-14', 'Biomedical research', 'Approved');

INSERT INTO Sample_Usage
    (request_id, aliquot_id, usage_date, volume_used_ml, usage_purpose)
VALUES
    (1, 1, '2026-02-10', 0.50, 'Genetic analysis'),
    (2, 2, '2026-02-11', 0.75, 'Cancer biomarker study'),
    (3, 3, '2026-02-12', 0.50, 'Molecular analysis'),
    (4, 4, '2026-02-13', 1.00, 'Immunology research'),
    (5, 5, '2026-02-14', 0.50, 'Genomic sequencing'),
    (6, 6, '2026-02-15', 0.50, 'Bioinformatics study'),
    (7, 7, '2026-02-16', 1.00, 'Cell biology research'),
    (8, 8, '2026-02-17', 1.50, 'Cancer research'),
    (9, 9, '2026-02-18', 0.50, 'Pathology analysis'),
    (10, 10, '2026-02-19', 0.75, 'Biomedical research');

INSERT INTO Test_Request
    (sample_id, researcher_id, test_type, request_date, status, result)
VALUES
    (1, 1, 'DNA Quality', '2026-02-20', 'Completed', 'High Quality'),
    (2, 2, 'Cancer Biomarker', '2026-02-21', 'Completed', 'Positive Marker'),
    (3, 3, 'RNA Integrity', '2026-02-22', 'Completed', 'Good Integrity'),
    (4, 4, 'Immune Marker', '2026-02-23', 'Completed', 'Normal'),
    (5, 5, 'Whole Genome Sequencing', '2026-02-24', 'Completed', 'Passed QC'),
    (6, 6, 'DNA Concentration', '2026-02-25', 'Pending', NULL),
    (7, 7, 'Cell Viability', '2026-02-26', 'Completed', '92% Viability'),
    (8, 8, 'Cancer Marker Panel', '2026-02-27', 'Completed', 'Panel Detected'),
    (9, 9, 'Histopathology', '2026-02-28', 'Pending', NULL),
    (10, 10, 'Molecular Screening', '2026-03-01', 'Completed', 'No Abnormality');