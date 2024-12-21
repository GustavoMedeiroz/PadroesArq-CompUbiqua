/*=========================================================*/
/* TABLE: SPECTRE_FINANCIAL                                */
/*=========================================================*/
ALTER TABLE IF EXISTS spectre_financial DROP CONSTRAINT IF EXISTS spectre_financial_report_fk;
ALTER TABLE IF EXISTS spectre_financial DROP COLUMN IF EXISTS report_id;

/*=========================================================*/
/* TABLE: SPECTRE_SENSOR                                   */
/*=========================================================*/
ALTER TABLE IF EXISTS spectre_sensor DROP CONSTRAINT IF EXISTS spectre_sensor_report_fk;
ALTER TABLE IF EXISTS spectre_sensor DROP COLUMN IF EXISTS report_id;

/*=========================================================*/
/* TABLE: SPECTRE_REPORT                                   */
/*=========================================================*/
DROP TABLE IF EXISTS spectre_report;

/*=========================================================*/
/* TABLE: SPECTRE_INFORMATION                              */
/*=========================================================*/
ALTER TABLE IF EXISTS spectre_information DROP CONSTRAINT IF EXISTS spectre_information_dashboard_fk;
ALTER TABLE IF EXISTS spectre_information DROP COLUMN IF EXISTS dashboard_id;

/*=========================================================*/
/* TABLE: SPECTRE_DASHBOARD                                */
/*=========================================================*/
DROP TABLE IF EXISTS spectre_dashboard;