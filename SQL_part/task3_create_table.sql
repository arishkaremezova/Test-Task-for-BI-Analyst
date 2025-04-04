CREATE TABLE pd_v (
    basel_contract_id VARCHAR(255) NOT NULL,
    report_date DATE NOT NULL,
    expect_default_flag BOOLEAN,  
  
    PRIMARY KEY (basel_contract_id, report_date)
);


CREATE TABLE score_v (
    basel_contract_id VARCHAR(255) NOT NULL,
    report_date DATE NOT NULL,
    pd_model_name_adj VARCHAR(255),

PRIMARY KEY (basel_contract_id, report_date),

   
    FOREIGN KEY (basel_contract_id, report_date)
        REFERENCES pd_v (basel_contract_id, report_date)
);

