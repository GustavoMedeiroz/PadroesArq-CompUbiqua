/*=========================================================*/
/* TABLE: SPECTRE_PERSONA                                  */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_persona (
   id                  SERIAL,
   name                VARCHAR(100)            NOT NULL,
   taxId               VARCHAR(20)             NOT NULL,
   phone               VARCHAR(20)             NOT NULL,

   created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

   CONSTRAINT spectre_persona_pk PRIMARY KEY (id),
   CONSTRAINT spectre_persona_taxId_uk UNIQUE (taxId)
);

/*=========================================================*/
/* TABLE: SPECTRE_USER                                     */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_user (
    id                  SERIAL,
    email               VARCHAR(100)            NOT NULL,
    password            VARCHAR(100)            NOT NULL,
    role                VARCHAR(15)             NOT NULL,
    persona_id          INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_user_pk PRIMARY KEY (id),
    CONSTRAINT spectre_user_email_uk UNIQUE (email),
    CONSTRAINT spectre_user_persona_fk FOREIGN KEY (persona_id) REFERENCES spectre_persona(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_DASHBOARD                                */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_dashboard (
    id                  SERIAL,
    title               VARCHAR(100)            NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_dashboard_pk PRIMARY KEY (id)
);

/*=========================================================*/
/* TABLE: SPECTRE_INFORMATION                              */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_information (
    id                  SERIAL,
    sensor_id           INTEGER                 NOT NULL,
    dashboard_id        INTEGER                 NOT NULL,
    title               VARCHAR(100)            NOT NULL,
    type                VARCHAR(15)             NOT NULL,
    priority            VARCHAR(15)             NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_information_pk PRIMARY KEY (id),
    CONSTRAINT spectre_information_sensor_fk FOREIGN KEY (sensor_id) REFERENCES spectre_sensor(id),
    CONSTRAINT spectre_information_dashboard_fk FOREIGN KEY (dashboard_id) REFERENCES spectre_dashboard(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_REPORT                                   */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_report (
    id                  SERIAL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_report_pk PRIMARY KEY (id)
);

/*=========================================================*/
/* TABLE: SPECTRE_FINANCIAL                                */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_financial (
    id                  SERIAL,
    cash_inflow         DECIMAL(10, 2)          NOT NULL,
    cash_outflow        DECIMAL(10, 2)          NOT NULL,
    report_id           INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_financial_pk PRIMARY KEY (id),
    CONSTRAINT spectre_financial_report_fk FOREIGN KEY (report_id) REFERENCES spectre_report(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_SENSOR                                   */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_sensor (
    id                  SERIAL,
    name                VARCHAR(100)            NOT NULL,
    current_value       VARCHAR(50)             NOT NULL,
    type                VARCHAR(15)             NOT NULL,
    status              VARCHAR(15)             NOT NULL,
    report_id           INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_sensor_pk PRIMARY KEY (id),
    CONSTRAINT spectre_sensor_report_fk FOREIGN KEY (report_id) REFERENCES spectre_report(id)
);