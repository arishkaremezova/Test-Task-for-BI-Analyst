INSERT INTO pd_v (basel_contract_id, report_date, expect_default_flag)
VALUES 
('CONTRACT123', '2023-10-26', TRUE),
('CONTRACT003', '2024-10-26', TRUE),
('CONTRACT120', '2024-10-26', FALSE),
('CONTRACT121', '2025-10-26', TRUE),
('CONTRACT1', '2024-10-26', FALSE),
('CONTRACT11', '2024-11-26', TRUE),
('CONTRACT13', '2024-12-26', FALSE),
('CONTRACT14', '2024-10-27', FALSE),
('CONTRACT140', '2024-12-27', FALSE);

INSERT INTO score_v (basel_contract_id, report_date, pd_model_name_adj)
VALUES 
('CONTRACT123', '2023-10-26', 'MyAwesomeModel'),
('CONTRACT003', '2024-10-26', 'ModelBoost'),
('CONTRACT120', '2024-10-26', 'Arina'),
('CONTRACT121', '2025-10-26', 'Arina'),
('CONTRACT1', '2024-10-26', 'Arina'),
('CONTRACT11', '2024-11-26', 'ModelBoost'),
('CONTRACT13', '2024-12-26', 'Arina'),
('CONTRACT14', '2024-10-27', 'Arina'),
('CONTRACT140', '2024-12-27', 'Arina');
