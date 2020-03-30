/* Lógico_1: */

CREATE TABLE status (
    id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    e_mail VARCHAR,
    password VARCHAR
);

CREATE TABLE physical (
    cpf VARCHAR,
    fk_people_id INTEGER PRIMARY KEY
);

CREATE TABLE legal (
    cnpj VARCHAR,
    fk_people_id INTEGER PRIMARY KEY
);

CREATE TABLE type (
    id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE employee (
    fk_physical_fk_people_id INTEGER PRIMARY KEY,
    fk_positions_id INTEGER
);

CREATE TABLE positions (
    id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE company (
    fk_legal_fk_people_id INTEGER PRIMARY KEY,
    fk_address_id INTEGER,
    fantasy_name VARCHAR
);

CREATE TABLE address (
    neighborhood VARCHAR,
    cep VARCHAR,
    number INTEGER,
    id INTEGER PRIMARY KEY,
    street VARCHAR,
    fk_country_id INTEGER
);

CREATE TABLE country (
    id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE content (
    id INTEGER PRIMARY KEY,
    description VARCHAR
);

CREATE TABLE activity (
    title VARCHAR,
    fk_content_id INTEGER PRIMARY KEY,
    fk_status_id INTEGER
);

CREATE TABLE score (
    value INTEGER,
    fk_content_id INTEGER PRIMARY KEY
);

CREATE TABLE project (
    fk_activity_fk_content_id INTEGER PRIMARY KEY
);

CREATE TABLE task (
    fk_activity_fk_content_id INTEGER PRIMARY KEY,
    fk_type_id INTEGER,
    data_entry DATE,
    data_end DATE
);

CREATE TABLE employee_company (
    fk_company_fk_legal_fk_people_id INTEGER,
    fk_employee_fk_physical_fk_people_id INTEGER
);

CREATE TABLE project_company (
    fk_company_fk_legal_fk_people_id INTEGER,
    fk_project_fk_activity_fk_content_id INTEGER
);

CREATE TABLE project_task (
    fk_project_fk_activity_fk_content_id INTEGER,
    fk_task_fk_activity_fk_content_id INTEGER
);

CREATE TABLE task_score (
    fk_task_fk_activity_fk_content_id INTEGER,
    fk_score_fk_content_id INTEGER
);

CREATE TABLE employee_task (
    fk_employee_fk_physical_fk_people_id INTEGER,
    fk_task_fk_activity_fk_content_id INTEGER
);
 
ALTER TABLE physical ADD CONSTRAINT FK_physical_2
    FOREIGN KEY (fk_people_id)
    REFERENCES people (id)
    ON DELETE CASCADE;
 
ALTER TABLE legal ADD CONSTRAINT FK_legal_2
    FOREIGN KEY (fk_people_id)
    REFERENCES people (id)
    ON DELETE CASCADE;
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_2
    FOREIGN KEY (fk_physical_cpf???, fk_physical_fk_people_id)
    REFERENCES physical (???, fk_people_id)
    ON DELETE CASCADE;
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_3
    FOREIGN KEY (fk_positions_id)
    REFERENCES positions (id)
    ON DELETE CASCADE;
 
ALTER TABLE company ADD CONSTRAINT FK_company_2
    FOREIGN KEY (fk_legal_cnpj???, fk_legal_fk_people_id)
    REFERENCES legal (???, fk_people_id)
    ON DELETE CASCADE;
 
ALTER TABLE company ADD CONSTRAINT FK_company_3
    FOREIGN KEY (fk_address_id)
    REFERENCES address (id)
    ON DELETE RESTRICT;
 
ALTER TABLE address ADD CONSTRAINT FK_address_2
    FOREIGN KEY (fk_country_id)
    REFERENCES country (id)
    ON DELETE CASCADE;
 
ALTER TABLE activity ADD CONSTRAINT FK_activity_2
    FOREIGN KEY (fk_content_id)
    REFERENCES content (id)
    ON DELETE CASCADE;
 
ALTER TABLE activity ADD CONSTRAINT FK_activity_3
    FOREIGN KEY (fk_status_id)
    REFERENCES status (id)
    ON DELETE CASCADE;
 
ALTER TABLE score ADD CONSTRAINT FK_score_2
    FOREIGN KEY (fk_content_id)
    REFERENCES content (id)
    ON DELETE CASCADE;
 
ALTER TABLE project ADD CONSTRAINT FK_project_2
    FOREIGN KEY (fk_activity_fk_content_id)
    REFERENCES activity (fk_content_id)
    ON DELETE CASCADE;
 
ALTER TABLE task ADD CONSTRAINT FK_task_2
    FOREIGN KEY (fk_activity_fk_content_id)
    REFERENCES activity (fk_content_id)
    ON DELETE CASCADE;
 
ALTER TABLE task ADD CONSTRAINT FK_task_3
    FOREIGN KEY (fk_type_id)
    REFERENCES type (id)
    ON DELETE CASCADE;
 
ALTER TABLE employee_company ADD CONSTRAINT FK_employee_company_1
    FOREIGN KEY (fk_company_fk_legal_cnpj???, fk_company_fk_legal_fk_people_id)
    REFERENCES company (???, fk_legal_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_company ADD CONSTRAINT FK_employee_company_2
    FOREIGN KEY (fk_employee_fk_physical_cpf???, fk_employee_fk_physical_fk_people_id)
    REFERENCES employee (???, fk_physical_fk_people_id)
    ON DELETE SET NULL;
 
ALTER TABLE project_company ADD CONSTRAINT FK_project_company_1
    FOREIGN KEY (fk_company_fk_legal_cnpj???, fk_company_fk_legal_fk_people_id)
    REFERENCES company (???, fk_legal_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE project_company ADD CONSTRAINT FK_project_company_2
    FOREIGN KEY (fk_project_fk_activity_fk_content_id)
    REFERENCES project (fk_activity_fk_content_id)
    ON DELETE SET NULL;
 
ALTER TABLE project_task ADD CONSTRAINT FK_project_task_1
    FOREIGN KEY (fk_project_fk_activity_fk_content_id)
    REFERENCES project (fk_activity_fk_content_id)
    ON DELETE RESTRICT;
 
ALTER TABLE project_task ADD CONSTRAINT FK_project_task_2
    FOREIGN KEY (fk_task_fk_activity_fk_content_id)
    REFERENCES task (fk_activity_fk_content_id)
    ON DELETE SET NULL;
 
ALTER TABLE task_score ADD CONSTRAINT FK_task_score_1
    FOREIGN KEY (fk_task_fk_activity_fk_content_id)
    REFERENCES task (fk_activity_fk_content_id)
    ON DELETE SET NULL;
 
ALTER TABLE task_score ADD CONSTRAINT FK_task_score_2
    FOREIGN KEY (fk_score_fk_content_id)
    REFERENCES score (fk_content_id)
    ON DELETE SET NULL;
 
ALTER TABLE employee_task ADD CONSTRAINT FK_employee_task_1
    FOREIGN KEY (fk_employee_fk_physical_cpf???, fk_employee_fk_physical_fk_people_id)
    REFERENCES employee (???, fk_physical_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_task ADD CONSTRAINT FK_employee_task_2
    FOREIGN KEY (fk_task_fk_activity_fk_content_id)
    REFERENCES task (fk_activity_fk_content_id)
    ON DELETE SET NULL;