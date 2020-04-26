/* Lógico_1: */

CREATE TABLE status (
    id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    password VARCHAR,
    e_mail VARCHAR
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
    level INTEGER,
    fk_physical_fk_people_id INTEGER PRIMARY KEY,
    fk_positions_id INTEGER
);

CREATE TABLE positions (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    access_level INTEGER,
    descripition VARCHAR
);

CREATE TABLE company (
    fantasy_name VARCHAR,
    fk_legal_fk_people_id INTEGER PRIMARY KEY,
    fk_address_id INTEGER
);

CREATE TABLE address (
    neighborhood VARCHAR,
    cep VARCHAR,
    number INTEGER,
    id INTEGER PRIMARY KEY,
    street VARCHAR,
    city VARCHAR,
    state VARCHAR
);

CREATE TABLE content (
    id INTEGER PRIMARY KEY,
    description VARCHAR
);

CREATE TABLE activity (
    title VARCHAR,
    data_entry DATATIME,
    data_end DATETIME,
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
    fk_score_fk_content_id INTEGER,
    fk_status_id INTEGER
);

CREATE TABLE level_project (
    level INTEGER,
    fk_project_fk_activity_fk_content_id INTEGER,
    fk_employee_fk_physical_fk_people_id INTEGER
);

CREATE TABLE company_employee (
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

CREATE TABLE employee_task (
    fk_employee_fk_physical_fk_people_id INTEGER,
    fk_task_fk_activity_fk_content_id INTEGER
);

CREATE TABLE company_positions (
    fk_company_fk_legal_fk_people_id INTEGER,
    fk_positions_id INTEGER
);

CREATE TABLE project_task_type (
    fk_project_fk_activity_fk_content_id INTEGER,
    fk_type_id INTEGER
);

CREATE TABLE company_score (
    fk_company_fk_legal_fk_people_id INTEGER,
    fk_score_fk_content_id INTEGER
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
    FOREIGN KEY (fk_physical_fk_people_id)
    REFERENCES physical (fk_people_id)
    ON DELETE CASCADE;
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_3
    FOREIGN KEY (fk_positions_id)
    REFERENCES positions (id)
    ON DELETE CASCADE;
 
ALTER TABLE company ADD CONSTRAINT FK_company_2
    FOREIGN KEY (fk_legal_fk_people_id)
    REFERENCES legal (fk_people_id)
    ON DELETE CASCADE;
 
ALTER TABLE company ADD CONSTRAINT FK_company_3
    FOREIGN KEY (fk_address_id)
    REFERENCES address (id)
    ON DELETE RESTRICT;
 
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
 
ALTER TABLE task ADD CONSTRAINT FK_task_4
    FOREIGN KEY (fk_score_fk_content_id)
    REFERENCES score (fk_content_id)
    ON DELETE CASCADE;
 
ALTER TABLE task ADD CONSTRAINT FK_task_5
    FOREIGN KEY (fk_status_id???)
    REFERENCES ??? (???);
 
ALTER TABLE level_project ADD CONSTRAINT FK_level_project_1
    FOREIGN KEY (fk_project_fk_activity_fk_content_id)
    REFERENCES project (fk_activity_fk_content_id);
 
ALTER TABLE level_project ADD CONSTRAINT FK_level_project_2
    FOREIGN KEY (fk_employee_fk_physical_fk_people_id)
    REFERENCES employee (fk_physical_fk_people_id);
 
ALTER TABLE company_employee ADD CONSTRAINT FK_company_employee_1
    FOREIGN KEY (fk_company_fk_legal_fk_people_id)
    REFERENCES company (fk_legal_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE company_employee ADD CONSTRAINT FK_company_employee_2
    FOREIGN KEY (fk_employee_fk_physical_fk_people_id)
    REFERENCES employee (fk_physical_fk_people_id)
    ON DELETE SET NULL;
 
ALTER TABLE project_company ADD CONSTRAINT FK_project_company_1
    FOREIGN KEY (fk_company_fk_legal_fk_people_id)
    REFERENCES company (fk_legal_fk_people_id)
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
 
ALTER TABLE employee_task ADD CONSTRAINT FK_employee_task_1
    FOREIGN KEY (fk_employee_fk_physical_fk_people_id)
    REFERENCES employee (fk_physical_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_task ADD CONSTRAINT FK_employee_task_2
    FOREIGN KEY (fk_task_fk_activity_fk_content_id)
    REFERENCES task (fk_activity_fk_content_id)
    ON DELETE SET NULL;
 
ALTER TABLE company_positions ADD CONSTRAINT FK_company_positions_1
    FOREIGN KEY (fk_company_fk_legal_fk_people_id)
    REFERENCES company (fk_legal_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE company_positions ADD CONSTRAINT FK_company_positions_2
    FOREIGN KEY (fk_positions_id)
    REFERENCES positions (id)
    ON DELETE SET NULL;
 
ALTER TABLE project_task_type ADD CONSTRAINT FK_project_task_type_1
    FOREIGN KEY (fk_project_fk_activity_fk_content_id)
    REFERENCES project (fk_activity_fk_content_id)
    ON DELETE RESTRICT;
 
ALTER TABLE project_task_type ADD CONSTRAINT FK_project_task_type_2
    FOREIGN KEY (fk_type_id)
    REFERENCES type (id)
    ON DELETE SET NULL;
 
ALTER TABLE company_score ADD CONSTRAINT FK_company_score_1
    FOREIGN KEY (fk_company_fk_legal_fk_people_id)
    REFERENCES company (fk_legal_fk_people_id)
    ON DELETE RESTRICT;
 
ALTER TABLE company_score ADD CONSTRAINT FK_company_score_2
    FOREIGN KEY (fk_score_fk_content_id)
    REFERENCES score (fk_content_id)
    ON DELETE SET NULL;