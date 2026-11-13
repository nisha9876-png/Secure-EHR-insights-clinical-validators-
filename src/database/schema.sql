-- src/database/schema.sql
-- Single flat table, same design as the tutor's patient_encounters.
-- Column order follows MIMIC_IV_Trasncript.csv.

CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS patient_encounters (
    id                 SERIAL PRIMARY KEY,
    subject_id         BIGINT,
    hadm_id            BIGINT,
    admission_type     VARCHAR(50),
    admission_location VARCHAR(100),
    discharge_location VARCHAR(100),
    insurance          VARCHAR(50),
    marital_status     VARCHAR(50),
    race               VARCHAR(100),
    gender             VARCHAR(10),
    anchor_age         INT,
    drug               VARCHAR(150),
    formulary_drug_cd  VARCHAR(100),
    prod_strength      VARCHAR(150),
    dose_val_rx        VARCHAR(100),
    dose_unit_rx       VARCHAR(50),
    form_unit_disp     VARCHAR(50),
    route              VARCHAR(50),
    eventtype          VARCHAR(50),
    careunit           VARCHAR(100),
    order_type         VARCHAR(50),
    order_subtype      VARCHAR(100),
    transaction_type   VARCHAR(50),
    spec_type_desc     VARCHAR(100),
    test_name          VARCHAR(150),
    org_name           VARCHAR(100),
    ab_name            VARCHAR(100),
    comments           TEXT,
    drg_type           VARCHAR(20),
    description        VARCHAR(255),
    drg_severity       NUMERIC,
    drg_mortality      NUMERIC
);

CREATE INDEX IF NOT EXISTS idx_encounters_subject ON patient_encounters (subject_id);
CREATE INDEX IF NOT EXISTS idx_encounters_hadm    ON patient_encounters (hadm_id);

-- The embedding column comes in the next step, for example:
-- ALTER TABLE patient_encounters ADD COLUMN note_embedding vector(384);
