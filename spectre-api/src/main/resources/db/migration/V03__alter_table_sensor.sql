/*=========================================================*/
/* TABLE: SPECTRE_SENSOR                                   */
/*=========================================================*/
ALTER TABLE IF EXISTS spectre_sensor
    DROP COLUMN IF EXISTS current_value;

ALTER TABLE IF EXISTS spectre_sensor
    ADD COLUMN IF NOT EXISTS min_value DOUBLE PRECISION;

ALTER TABLE IF EXISTS spectre_sensor
    ADD COLUMN IF NOT EXISTS max_value DOUBLE PRECISION;