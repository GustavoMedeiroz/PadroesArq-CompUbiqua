/*=========================================================*/
/* TABLE: SPECTRE_SENSOR                                   */
/*=========================================================*/
ALTER TABLE IF EXISTS spectre_sensor
    ADD COLUMN IF NOT EXISTS current_value DOUBLE PRECISION;