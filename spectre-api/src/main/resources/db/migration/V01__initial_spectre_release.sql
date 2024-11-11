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
/* TABLE: SPECTRE_NOTIFICATION                             */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_notification (
    id                  SERIAL,
    title               VARCHAR(100)            NOT NULL,
    message             TEXT                    NOT NULL,
    priority            VARCHAR(15)             NOT NULL,
    dashboard_id        INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_notification_pk PRIMARY KEY (id),
    CONSTRAINT spectre_notification_dashboard_fk FOREIGN KEY (dashboard_id) REFERENCES spectre_dashboard(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_FINANCIAL                                */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_financial (
    id                  SERIAL,
    cash_inflow         DECIMAL(10, 2)          NOT NULL,
    cash_outflow        DECIMAL(10, 2)          NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_financial_pk PRIMARY KEY (id)
);

/*=========================================================*/
/* TABLE: SPECTRE_PRODUCT                                  */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_product (
    id                  SERIAL,
    name                VARCHAR(100)            NOT NULL,
    price               DECIMAL(10, 2)          NOT NULL,
    unity_weight        DECIMAL(10, 2)          NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_product_pk PRIMARY KEY (id)
);

/*=========================================================*/
/* TABLE: SPECTRE_PRODUCT_ITEMS                            */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_product_items (
    id                  SERIAL,
    product_id          INTEGER                 NOT NULL,
    quantity            INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_product_items_pk PRIMARY KEY (id),
    CONSTRAINT spectre_product_items_product_fk FOREIGN KEY (product_id) REFERENCES spectre_product(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_REPORT                                   */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_report (
    id                  SERIAL,
    financial_id        INTEGER                 NOT NULL,
    product_items_id    INTEGER                 NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_report_pk PRIMARY KEY (id),
    CONSTRAINT spectre_report_financial_fk FOREIGN KEY (financial_id) REFERENCES spectre_financial(id),
    CONSTRAINT spectre_report_product_items_fk FOREIGN KEY (product_items_id) REFERENCES spectre_product_items(id)
);

/*=========================================================*/
/* TABLE: SPECTRE_SENSOR                                   */
/*=========================================================*/
CREATE TABLE IF NOT EXISTS spectre_sensor (
    id                  SERIAL,
    name                VARCHAR(100)            NOT NULL,
    type                VARCHAR(50)             NOT NULL,
    current_value       VARCHAR(50)             NOT NULL,
    status              VARCHAR(15)             NOT NULL,

    created_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT spectre_sensor_pk PRIMARY KEY (id)
);

-- INSERTS
/*=========================================================*/
/* TABLE: SPECTRE_PRODUCT                                  */
/*=========================================================*/
INSERT INTO spectre_product (id, name, price, unity_weight) VALUES (1, 'Leite', 1.99, 10);
INSERT INTO spectre_product (id, name, price, unity_weight) VALUES (2, 'Arroz', 4.99, 2000);

/*=========================================================*/
/* TABLE: SPECTRE_PRODUCT_ITEMS                            */
/*=========================================================*/
INSERT INTO spectre_product_items (id, product_id, quantity) VALUES (1, 1, 10);