CREATE TABLE parameters (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_uuid_parent TEXT NOT NULL DEFAULT '',t_name TEXT NOT NULL,t_value TEXT NOT NULL DEFAULT '',b_blob BLOB,d_lastmodifdate DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,i_tmp INTEGER NOT NULL DEFAULT 0);
CREATE TABLE doctransaction (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL,t_mode VARCHAR(1) DEFAULT 'U' CHECK (t_mode IN ('U', 'R')),d_date DATE NOT NULL,t_savestep VARCHAR(1) DEFAULT 'N' CHECK (t_savestep IN ('Y', 'N')),i_parent INTEGER, t_refreshviews VARCHAR(1) DEFAULT 'Y' CHECK (t_refreshviews IN ('Y', 'N')));
CREATE TABLE doctransactionitem (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, rd_doctransaction_id INTEGER NOT NULL,i_object_id INTEGER NOT NULL,t_object_table TEXT NOT NULL,t_action VARCHAR(1) DEFAULT 'I' CHECK (t_action IN ('I', 'U', 'D')),t_sqlorder TEXT NOT NULL DEFAULT '');
CREATE TABLE doctransactionmsg (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, rd_doctransaction_id INTEGER NOT NULL,t_message TEXT NOT NULL DEFAULT '',t_popup VARCHAR(1) DEFAULT 'Y' CHECK (t_popup IN ('Y', 'N')));
CREATE TABLE unit(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL,t_symbol TEXT NOT NULL DEFAULT '',t_country TEXT NOT NULL DEFAULT '',t_type VARCHAR(1) NOT NULL DEFAULT 'C' CHECK (t_type IN ('1', '2', 'C', 'S', 'I', 'O')),t_internet_code TEXT NOT NULL DEFAULT '',i_nbdecimal INT NOT NULL DEFAULT 2,rd_unit_id INTEGER NOT NULL DEFAULT 0, t_source TEXT NOT NULL DEFAULT '');
CREATE TABLE unitvalue(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rd_unit_id INTEGER NOT NULL,d_date DATE NOT NULL,f_quantity FLOAT NOT NULL CHECK (f_quantity>=0));
CREATE TABLE bank (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL DEFAULT '',t_bank_number TEXT NOT NULL DEFAULT '',t_icon TEXT NOT NULL DEFAULT '');
CREATE TABLE interest(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rd_account_id INTEGER NOT NULL,d_date DATE NOT NULL,f_rate FLOAT NOT NULL CHECK (f_rate>=0),t_income_value_date_mode VARCHAR(1) NOT NULL DEFAULT 'F' CHECK (t_income_value_date_mode IN ('F', '0', '1', '2', '3', '4', '5')),t_expenditure_value_date_mode VARCHAR(1) NOT NULL DEFAULT 'F' CHECK (t_expenditure_value_date_mode IN ('F', '0', '1', '2', '3', '4', '5')),t_base VARCHAR(3) NOT NULL DEFAULT '24' CHECK (t_base IN ('24', '360', '365')));
CREATE TABLE operation(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,i_group_id INTEGER NOT NULL DEFAULT 0,i_number INTEGER DEFAULT 0 CHECK (i_number>=0),d_date DATE NOT NULL DEFAULT '0000-00-00',rd_account_id INTEGER NOT NULL,t_mode TEXT NOT NULL DEFAULT '',r_payee_id INTEGER NOT NULL DEFAULT 0,t_comment TEXT NOT NULL DEFAULT '',rc_unit_id INTEGER NOT NULL,t_status VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_status IN ('N', 'P', 'Y')),t_bookmarked VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_bookmarked IN ('Y', 'N')),t_imported VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_imported IN ('Y', 'N', 'P', 'T')),t_template VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_template IN ('Y', 'N')),t_import_id TEXT NOT NULL DEFAULT '',i_tmp INTEGER NOT NULL DEFAULT 0,r_recurrentoperation_id INTEGER NOT NULL DEFAULT 0);
CREATE TABLE operationbalance(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,f_balance FLOAT NOT NULL DEFAULT 0,r_operation_id INTEGER NOT NULL);
CREATE TABLE refund (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL DEFAULT '',t_comment TEXT NOT NULL DEFAULT '',t_close VARCHAR(1) DEFAULT 'N' CHECK (t_close IN ('Y', 'N')));
CREATE TABLE payee (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL DEFAULT '',t_address TEXT NOT NULL DEFAULT '', t_bookmarked VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_bookmarked IN ('Y', 'N')));
CREATE TABLE suboperation(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_comment TEXT NOT NULL DEFAULT '',rd_operation_id INTEGER NOT NULL,r_category_id INTEGER NOT NULL DEFAULT 0,f_value FLOAT NOT NULL DEFAULT 0.0,i_tmp INTEGER NOT NULL DEFAULT 0,r_refund_id INTEGER NOT NULL DEFAULT 0, t_formula TEXT NOT NULL DEFAULT '');
CREATE TABLE rule (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_description TEXT NOT NULL DEFAULT '',t_definition TEXT NOT NULL DEFAULT '',t_action_description TEXT NOT NULL DEFAULT '',t_action_definition TEXT NOT NULL DEFAULT '',t_action_type VARCHAR(1) DEFAULT 'S' CHECK (t_action_type IN ('S', 'U', 'A')),t_bookmarked VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_bookmarked IN ('Y', 'N')),f_sortorder FLOAT);
CREATE TABLE budget (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rc_category_id INTEGER NOT NULL DEFAULT 0,t_including_subcategories TEXT NOT NULL DEFAULT 'N' CHECK (t_including_subcategories IN ('Y', 'N')),f_budgeted FLOAT NOT NULL DEFAULT 0.0,f_budgeted_modified FLOAT NOT NULL DEFAULT 0.0,f_transferred FLOAT NOT NULL DEFAULT 0.0,i_year INTEGER NOT NULL DEFAULT 2010,i_month INTEGER NOT NULL DEFAULT 0 CHECK (i_month>=0 AND i_month<=12));
CREATE TABLE budgetcategory(id INTEGER NOT NULL DEFAULT 0,id_category INTEGER NOT NULL DEFAULT 0);
CREATE TABLE budgetrule (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rc_category_id INTEGER NOT NULL DEFAULT 0,t_category_condition TEXT NOT NULL DEFAULT 'Y' CHECK (t_category_condition IN ('Y', 'N')),t_year_condition TEXT NOT NULL DEFAULT 'Y' CHECK (t_year_condition IN ('Y', 'N')),i_year INTEGER NOT NULL DEFAULT 2010,i_month INTEGER NOT NULL DEFAULT 0 CHECK (i_month>=0 AND i_month<=12),t_month_condition TEXT NOT NULL DEFAULT 'Y' CHECK (t_month_condition IN ('Y', 'N')),i_condition INTEGER NOT NULL DEFAULT 0 CHECK (i_condition IN (-1,0,1)),f_quantity FLOAT NOT NULL DEFAULT 0.0,t_absolute TEXT NOT NULL DEFAULT 'Y' CHECK (t_absolute IN ('Y', 'N')),rc_category_id_target INTEGER NOT NULL DEFAULT 0,t_category_target TEXT NOT NULL DEFAULT 'Y' CHECK (t_category_target IN ('Y', 'N')),t_rule TEXT NOT NULL DEFAULT 'N' CHECK (t_rule IN ('N', 'C', 'Y')));
CREATE TABLE "recurrentoperation" (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,d_date DATE NOT NULL DEFAULT '0000-00-00',rd_operation_id INTEGER NOT NULL,i_period_increment INTEGER NOT NULL DEFAULT 1 CHECK (i_period_increment>=0),t_period_unit TEXT NOT NULL DEFAULT 'M' CHECK (t_period_unit IN ('D', 'W', 'M', 'Y')),t_auto_write VARCHAR(1) DEFAULT 'Y' CHECK (t_auto_write IN ('Y', 'N')),i_auto_write_days INTEGER NOT NULL DEFAULT 5 CHECK (i_auto_write_days>=0),t_warn VARCHAR(1) DEFAULT 'Y' CHECK (t_warn IN ('Y', 'N')),i_warn_days INTEGER NOT NULL DEFAULT 5 CHECK (i_warn_days>=0),t_times VARCHAR(1) DEFAULT 'N' CHECK (t_times IN ('Y', 'N')),i_nb_times INTEGER NOT NULL DEFAULT 1 CHECK (i_nb_times>=0));
CREATE TABLE "category" (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL DEFAULT '' CHECK (t_name NOT LIKE '% > %'),t_fullname TEXT,rd_category_id INT,t_bookmarked VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_bookmarked IN ('Y', 'N')));
CREATE TABLE "account"(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL,t_number TEXT NOT NULL DEFAULT '',t_agency_number TEXT NOT NULL DEFAULT '',t_agency_address TEXT NOT NULL DEFAULT '',t_comment TEXT NOT NULL DEFAULT '',t_close VARCHAR(1) DEFAULT 'N' CHECK (t_close IN ('Y', 'N')),t_type VARCHAR(1) NOT NULL DEFAULT 'C' CHECK (t_type IN ('C', 'D', 'A', 'I', 'L', 'W', 'O')),t_bookmarked VARCHAR(1) NOT NULL DEFAULT 'N' CHECK (t_bookmarked IN ('Y', 'N')),rd_bank_id INTEGER NOT NULL);
CREATE TABLE "node" (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,t_name TEXT NOT NULL DEFAULT '' CHECK (t_name NOT LIKE '% > %'),t_fullname TEXT,t_icon TEXT DEFAULT '',f_sortorder FLOAT,t_autostart VARCHAR(1) DEFAULT 'N' CHECK (t_autostart IN ('Y', 'N')),t_data TEXT,rd_node_id INT CONSTRAINT fk_id REFERENCES node(id) ON DELETE CASCADE);
CREATE TABLE vm_category_display_tmp(;
CREATE TABLE vm_budget_tmp(;
CREATE INDEX idx_doctransaction_parent ON doctransaction (i_parent);
CREATE INDEX idx_doctransactionitem_i_object_id ON doctransactionitem (i_object_id);
CREATE INDEX idx_doctransactionitem_t_object_table ON doctransactionitem (t_object_table);
CREATE INDEX idx_doctransactionitem_t_action ON doctransactionitem (t_action);
CREATE INDEX idx_doctransactionitem_rd_doctransaction_id ON doctransactionitem (rd_doctransaction_id);
CREATE INDEX idx_doctransactionitem_optimization ON doctransactionitem (rd_doctransaction_id, i_object_id, t_object_table, t_action, id);
CREATE INDEX idx_unit_unit_id ON unitvalue(rd_unit_id);
CREATE INDEX idx_account_bank_id ON account(rd_bank_id);
CREATE INDEX idx_account_type ON account(t_type);
CREATE INDEX idx_category_category_id ON category(rd_category_id);
CREATE INDEX idx_category_t_fullname ON category(t_fullname);
CREATE INDEX idx_operation_account_id ON operation (rd_account_id);
CREATE INDEX idx_operation_tmp1_found_transfert ON operation (rc_unit_id, d_date);
CREATE INDEX idx_operation_grouped_operation_id ON operation (i_group_id);
CREATE INDEX idx_operation_i_number ON operation (i_number);
CREATE INDEX idx_operation_i_tmp ON operation (i_tmp);
CREATE INDEX idx_operation_rd_account_id ON operation (rd_account_id);
CREATE INDEX idx_operation_rc_unit_id ON operation (rc_unit_id);
CREATE INDEX idx_operation_t_status ON operation (t_status);
CREATE INDEX idx_operation_t_import_id ON operation (t_import_id);
CREATE INDEX idx_operation_t_template ON operation (t_template);
CREATE INDEX idx_operation_d_date ON operation (d_date);
CREATE INDEX idx_operationbalance_operation_id ON operationbalance (r_operation_id);
CREATE INDEX idx_suboperation_operation_id ON suboperation (rd_operation_id);
CREATE INDEX idx_suboperation_i_tmp ON suboperation (i_tmp);
CREATE INDEX idx_suboperation_category_id ON suboperation (r_category_id);
CREATE INDEX idx_suboperation_refund_id_id ON suboperation (r_refund_id);
CREATE INDEX idx_recurrentoperation_rd_operation_id ON recurrentoperation (rd_operation_id);
CREATE INDEX idx_refund_close ON refund(t_close);
CREATE INDEX idx_interest_account_id ON interest (rd_account_id);
CREATE INDEX idx_rule_action_type ON rule(t_action_type);
CREATE INDEX idx_budget_category_id ON budget(rc_category_id);
CREATE INDEX idx_budgetcategory_id ON budgetcategory (id);
CREATE INDEX idx_budgetcategory_id_category ON budgetcategory (id_category);
CREATE UNIQUE INDEX uidx_parameters_uuid_parent_name ON parameters (t_uuid_parent, t_name);
CREATE UNIQUE INDEX uidx_node_parent_id_name ON node(t_name,rd_node_id);
CREATE UNIQUE INDEX uidx_node_fullname ON node(t_fullname);
CREATE UNIQUE INDEX uidx_unit_name ON unit(t_name);
CREATE UNIQUE INDEX uidx_unit_symbol ON unit(t_symbol);
CREATE UNIQUE INDEX uidx_unitvalue ON unitvalue(d_date,rd_unit_id);
CREATE UNIQUE INDEX uidx_bank_name ON bank(t_name);
CREATE UNIQUE INDEX uidx_account_name ON account(t_name);
CREATE UNIQUE INDEX uidx_category_parent_id_name ON category(t_name,rd_category_id);
CREATE UNIQUE INDEX uidx_category_fullname ON  category(t_fullname);
CREATE UNIQUE INDEX uidx_refund_name ON refund(t_name);
CREATE UNIQUE INDEX uidx_payee_name ON payee(t_name);
CREATE UNIQUE INDEX uidx_interest ON interest(d_date,rd_account_id);
CREATE UNIQUE INDEX uidx_budget ON budget(i_year,i_month, rc_category_id);
CREATE VIEW v_node AS SELECT * from node;
CREATE VIEW v_node_displayname AS SELECT *, t_fullname AS t_displayname from node;
CREATE VIEW v_parameters_displayname AS SELECT *, t_name AS t_displayname from parameters;
CREATE TRIGGER fkdc_parameters_parameters_uuid BEFORE DELETE ON parameters FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'parameters'; END;
CREATE TRIGGER fkdc_node_parameters_uuid BEFORE DELETE ON node FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'node'; END;
CREATE TRIGGER cpt_node_fullname1 AFTER INSERT ON node BEGIN UPDATE node SET t_fullname=CASE WHEN new.rd_node_id IS NULL OR new.rd_node_id='' OR new.rd_node_id=0 THEN new.t_name ELSE (SELECT c.t_fullname from node c where c.id=new.rd_node_id)||' > '||new.t_name END WHERE id=new.id;END;
CREATE TRIGGER cpt_node_fullname2 AFTER UPDATE OF t_name, rd_node_id ON node BEGIN UPDATE node SET t_fullname=CASE WHEN new.rd_node_id IS NULL OR new.rd_node_id='' OR new.rd_node_id=0 THEN new.t_name ELSE (SELECT c.t_fullname from node c where c.id=new.rd_node_id)||' > '||new.t_name END WHERE id=new.id;UPDATE node SET t_name=t_name WHERE rd_node_id=new.id;END;
CREATE TRIGGER fki_account_bank_rd_bank_id_id BEFORE INSERT ON account FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (bank est utilisé par account)
Nom de la contrainte : fki_account_bank_rd_bank_id_id')   WHERE NEW.rd_bank_id!=0 AND NEW.rd_bank_id!='' AND (SELECT id FROM bank WHERE id = NEW.rd_bank_id) IS NULL; END;
CREATE TRIGGER fku_account_bank_rd_bank_id_id BEFORE UPDATE ON account FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (bank est utilisé par account)
Nom de la contrainte : fku_account_bank_rd_bank_id_id')       WHERE NEW.rd_bank_id!=0 AND NEW.rd_bank_id!='' AND (SELECT id FROM bank WHERE id = NEW.rd_bank_id) IS NULL; END;
CREATE TRIGGER fkdc_bank_account_id_rd_bank_id BEFORE DELETE ON bank FOR EACH ROW BEGIN     DELETE FROM account WHERE account.rd_bank_id = OLD.id; END;
CREATE TRIGGER fki_budget_category_rc_category_id_id BEFORE INSERT ON budget FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (category est utilisé par budget)
Nom de la contrainte : fki_budget_category_rc_category_id_id')   WHERE NEW.rc_category_id!=0 AND NEW.rc_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id) IS NULL; END;
CREATE TRIGGER fku_budget_category_rc_category_id_id BEFORE UPDATE ON budget FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (category est utilisé par budget)
Nom de la contrainte : fku_budget_category_rc_category_id_id')       WHERE NEW.rc_category_id!=0 AND NEW.rc_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id) IS NULL; END;
CREATE TRIGGER fkd_budget_category_rc_category_id_id BEFORE DELETE ON category FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de détruire un objet (category est utilisé par budget)
Nom de la contrainte : fkd_budget_category_rc_category_id_id')     WHERE (SELECT rc_category_id FROM budget WHERE rc_category_id = OLD.id) IS NOT NULL; END;
CREATE TRIGGER fki_budgetrule_category_rc_category_id_id BEFORE INSERT ON budgetrule FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (category est utilisé par budgetrule)
Nom de la contrainte : fki_budgetrule_category_rc_category_id_id')   WHERE NEW.rc_category_id!=0 AND NEW.rc_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id) IS NULL; END;
CREATE TRIGGER fku_budgetrule_category_rc_category_id_id BEFORE UPDATE ON budgetrule FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (category est utilisé par budgetrule)
Nom de la contrainte : fku_budgetrule_category_rc_category_id_id')       WHERE NEW.rc_category_id!=0 AND NEW.rc_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id) IS NULL; END;
CREATE TRIGGER fkd_budgetrule_category_rc_category_id_id BEFORE DELETE ON category FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de détruire un objet (category est utilisé par budgetrule)
Nom de la contrainte : fkd_budgetrule_category_rc_category_id_id')     WHERE (SELECT rc_category_id FROM budgetrule WHERE rc_category_id = OLD.id) IS NOT NULL; END;
CREATE TRIGGER fki_budgetrule_category_rc_category_id_target_id BEFORE INSERT ON budgetrule FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (category est utilisé par budgetrule)
Nom de la contrainte : fki_budgetrule_category_rc_category_id_target_id')   WHERE NEW.rc_category_id_target!=0 AND NEW.rc_category_id_target!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id_target) IS NULL; END;
CREATE TRIGGER fku_budgetrule_category_rc_category_id_target_id BEFORE UPDATE ON budgetrule FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (category est utilisé par budgetrule)
Nom de la contrainte : fku_budgetrule_category_rc_category_id_target_id')       WHERE NEW.rc_category_id_target!=0 AND NEW.rc_category_id_target!='' AND (SELECT id FROM category WHERE id = NEW.rc_category_id_target) IS NULL; END;
CREATE TRIGGER fkd_budgetrule_category_rc_category_id_target_id BEFORE DELETE ON category FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de détruire un objet (category est utilisé par budgetrule)
Nom de la contrainte : fkd_budgetrule_category_rc_category_id_target_id')     WHERE (SELECT rc_category_id_target FROM budgetrule WHERE rc_category_id_target = OLD.id) IS NOT NULL; END;
CREATE TRIGGER fki_category_category_rd_category_id_id BEFORE INSERT ON category FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (category est utilisé par category)
Nom de la contrainte : fki_category_category_rd_category_id_id')   WHERE NEW.rd_category_id!=0 AND NEW.rd_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rd_category_id) IS NULL; END;
CREATE TRIGGER fku_category_category_rd_category_id_id BEFORE UPDATE ON category FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (category est utilisé par category)
Nom de la contrainte : fku_category_category_rd_category_id_id')       WHERE NEW.rd_category_id!=0 AND NEW.rd_category_id!='' AND (SELECT id FROM category WHERE id = NEW.rd_category_id) IS NULL; END;
CREATE TRIGGER fkdc_category_category_id_rd_category_id BEFORE DELETE ON category FOR EACH ROW BEGIN     DELETE FROM category WHERE category.rd_category_id = OLD.id; END;
CREATE TRIGGER fki_doctransactionitem_doctransaction_rd_doctransaction_id_id BEFORE INSERT ON doctransactionitem FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (doctransaction est utilisé par doctransactionitem)
Nom de la contrainte : fki_doctransactionitem_doctransaction_rd_doctransaction_id_id')   WHERE NEW.rd_doctransaction_id!=0 AND NEW.rd_doctransaction_id!='' AND (SELECT id FROM doctransaction WHERE id = NEW.rd_doctransaction_id) IS NULL; END;
CREATE TRIGGER fku_doctransactionitem_doctransaction_rd_doctransaction_id_id BEFORE UPDATE ON doctransactionitem FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (doctransaction est utilisé par doctransactionitem)
Nom de la contrainte : fku_doctransactionitem_doctransaction_rd_doctransaction_id_id')       WHERE NEW.rd_doctransaction_id!=0 AND NEW.rd_doctransaction_id!='' AND (SELECT id FROM doctransaction WHERE id = NEW.rd_doctransaction_id) IS NULL; END;
CREATE TRIGGER fkdc_doctransaction_doctransactionitem_id_rd_doctransaction_id BEFORE DELETE ON doctransaction FOR EACH ROW BEGIN     DELETE FROM doctransactionitem WHERE doctransactionitem.rd_doctransaction_id = OLD.id; END;
CREATE TRIGGER fki_doctransactionmsg_doctransaction_rd_doctransaction_id_id BEFORE INSERT ON doctransactionmsg FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (doctransaction est utilisé par doctransactionmsg)
Nom de la contrainte : fki_doctransactionmsg_doctransaction_rd_doctransaction_id_id')   WHERE NEW.rd_doctransaction_id!=0 AND NEW.rd_doctransaction_id!='' AND (SELECT id FROM doctransaction WHERE id = NEW.rd_doctransaction_id) IS NULL; END;
CREATE TRIGGER fku_doctransactionmsg_doctransaction_rd_doctransaction_id_id BEFORE UPDATE ON doctransactionmsg FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (doctransaction est utilisé par doctransactionmsg)
Nom de la contrainte : fku_doctransactionmsg_doctransaction_rd_doctransaction_id_id')       WHERE NEW.rd_doctransaction_id!=0 AND NEW.rd_doctransaction_id!='' AND (SELECT id FROM doctransaction WHERE id = NEW.rd_doctransaction_id) IS NULL; END;
CREATE TRIGGER fkdc_doctransaction_doctransactionmsg_id_rd_doctransaction_id BEFORE DELETE ON doctransaction FOR EACH ROW BEGIN     DELETE FROM doctransactionmsg WHERE doctransactionmsg.rd_doctransaction_id = OLD.id; END;
CREATE TRIGGER fki_interest_account_rd_account_id_id BEFORE INSERT ON interest FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (account est utilisé par interest)
Nom de la contrainte : fki_interest_account_rd_account_id_id')   WHERE NEW.rd_account_id!=0 AND NEW.rd_account_id!='' AND (SELECT id FROM account WHERE id = NEW.rd_account_id) IS NULL; END;
CREATE TRIGGER fku_interest_account_rd_account_id_id BEFORE UPDATE ON interest FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (account est utilisé par interest)
Nom de la contrainte : fku_interest_account_rd_account_id_id')       WHERE NEW.rd_account_id!=0 AND NEW.rd_account_id!='' AND (SELECT id FROM account WHERE id = NEW.rd_account_id) IS NULL; END;
CREATE TRIGGER fkdc_account_interest_id_rd_account_id BEFORE DELETE ON account FOR EACH ROW BEGIN     DELETE FROM interest WHERE interest.rd_account_id = OLD.id; END;
CREATE TRIGGER fki_node_node_rd_node_id_id BEFORE INSERT ON node FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (node est utilisé par node)
Nom de la contrainte : fki_node_node_rd_node_id_id')   WHERE NEW.rd_node_id!=0 AND NEW.rd_node_id!='' AND (SELECT id FROM node WHERE id = NEW.rd_node_id) IS NULL; END;
CREATE TRIGGER fku_node_node_rd_node_id_id BEFORE UPDATE ON node FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (node est utilisé par node)
Nom de la contrainte : fku_node_node_rd_node_id_id')       WHERE NEW.rd_node_id!=0 AND NEW.rd_node_id!='' AND (SELECT id FROM node WHERE id = NEW.rd_node_id) IS NULL; END;
CREATE TRIGGER fkdc_node_node_id_rd_node_id BEFORE DELETE ON node FOR EACH ROW BEGIN     DELETE FROM node WHERE node.rd_node_id = OLD.id; END;
CREATE TRIGGER fki_operation_account_rd_account_id_id BEFORE INSERT ON operation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (account est utilisé par operation)
Nom de la contrainte : fki_operation_account_rd_account_id_id')   WHERE NEW.rd_account_id!=0 AND NEW.rd_account_id!='' AND (SELECT id FROM account WHERE id = NEW.rd_account_id) IS NULL; END;
CREATE TRIGGER fku_operation_account_rd_account_id_id BEFORE UPDATE ON operation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (account est utilisé par operation)
Nom de la contrainte : fku_operation_account_rd_account_id_id')       WHERE NEW.rd_account_id!=0 AND NEW.rd_account_id!='' AND (SELECT id FROM account WHERE id = NEW.rd_account_id) IS NULL; END;
CREATE TRIGGER fkdc_account_operation_id_rd_account_id BEFORE DELETE ON account FOR EACH ROW BEGIN     DELETE FROM operation WHERE operation.rd_account_id = OLD.id; END;
CREATE TRIGGER fki_operation_payee_r_payee_id_id BEFORE INSERT ON operation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (payee est utilisé par operation)
Nom de la contrainte : fki_operation_payee_r_payee_id_id')   WHERE NEW.r_payee_id!=0 AND NEW.r_payee_id!='' AND (SELECT id FROM payee WHERE id = NEW.r_payee_id) IS NULL; END;
CREATE TRIGGER fku_operation_payee_r_payee_id_id BEFORE UPDATE ON operation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (payee est utilisé par operation)
Nom de la contrainte : fku_operation_payee_r_payee_id_id')       WHERE NEW.r_payee_id!=0 AND NEW.r_payee_id!='' AND (SELECT id FROM payee WHERE id = NEW.r_payee_id) IS NULL; END;
CREATE TRIGGER fkd_operation_payee_r_payee_id_id BEFORE DELETE ON payee FOR EACH ROW BEGIN     UPDATE operation SET r_payee_id=0 WHERE r_payee_id=OLD.id; END;
CREATE TRIGGER fki_operation_unit_rc_unit_id_id BEFORE INSERT ON operation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (unit est utilisé par operation)
Nom de la contrainte : fki_operation_unit_rc_unit_id_id')   WHERE NEW.rc_unit_id!=0 AND NEW.rc_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rc_unit_id) IS NULL; END;
CREATE TRIGGER fku_operation_unit_rc_unit_id_id BEFORE UPDATE ON operation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (unit est utilisé par operation)
Nom de la contrainte : fku_operation_unit_rc_unit_id_id')       WHERE NEW.rc_unit_id!=0 AND NEW.rc_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rc_unit_id) IS NULL; END;
CREATE TRIGGER fkd_operation_unit_rc_unit_id_id BEFORE DELETE ON unit FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de détruire un objet (unit est utilisé par operation)
Nom de la contrainte : fkd_operation_unit_rc_unit_id_id')     WHERE (SELECT rc_unit_id FROM operation WHERE rc_unit_id = OLD.id) IS NOT NULL; END;
CREATE TRIGGER fki_operation_recurrentoperation_r_recurrentoperation_id_id BEFORE INSERT ON operation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (recurrentoperation est utilisé par operation)
Nom de la contrainte : fki_operation_recurrentoperation_r_recurrentoperation_id_id')   WHERE NEW.r_recurrentoperation_id!=0 AND NEW.r_recurrentoperation_id!='' AND (SELECT id FROM recurrentoperation WHERE id = NEW.r_recurrentoperation_id) IS NULL; END;
CREATE TRIGGER fku_operation_recurrentoperation_r_recurrentoperation_id_id BEFORE UPDATE ON operation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (recurrentoperation est utilisé par operation)
Nom de la contrainte : fku_operation_recurrentoperation_r_recurrentoperation_id_id')       WHERE NEW.r_recurrentoperation_id!=0 AND NEW.r_recurrentoperation_id!='' AND (SELECT id FROM recurrentoperation WHERE id = NEW.r_recurrentoperation_id) IS NULL; END;
CREATE TRIGGER fkd_operation_recurrentoperation_r_recurrentoperation_id_id BEFORE DELETE ON recurrentoperation FOR EACH ROW BEGIN     UPDATE operation SET r_recurrentoperation_id=0 WHERE r_recurrentoperation_id=OLD.id; END;
CREATE TRIGGER fki_operationbalance_operation_r_operation_id_id BEFORE INSERT ON operationbalance FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (operation est utilisé par operationbalance)
Nom de la contrainte : fki_operationbalance_operation_r_operation_id_id')   WHERE NEW.r_operation_id!=0 AND NEW.r_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.r_operation_id) IS NULL; END;
CREATE TRIGGER fku_operationbalance_operation_r_operation_id_id BEFORE UPDATE ON operationbalance FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (operation est utilisé par operationbalance)
Nom de la contrainte : fku_operationbalance_operation_r_operation_id_id')       WHERE NEW.r_operation_id!=0 AND NEW.r_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.r_operation_id) IS NULL; END;
CREATE TRIGGER fkd_operationbalance_operation_r_operation_id_id BEFORE DELETE ON operation FOR EACH ROW BEGIN     UPDATE operationbalance SET r_operation_id=0 WHERE r_operation_id=OLD.id; END;
CREATE TRIGGER fki_recurrentoperation_operation_rd_operation_id_id BEFORE INSERT ON recurrentoperation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (operation est utilisé par recurrentoperation)
Nom de la contrainte : fki_recurrentoperation_operation_rd_operation_id_id')   WHERE NEW.rd_operation_id!=0 AND NEW.rd_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.rd_operation_id) IS NULL; END;
CREATE TRIGGER fku_recurrentoperation_operation_rd_operation_id_id BEFORE UPDATE ON recurrentoperation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (operation est utilisé par recurrentoperation)
Nom de la contrainte : fku_recurrentoperation_operation_rd_operation_id_id')       WHERE NEW.rd_operation_id!=0 AND NEW.rd_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.rd_operation_id) IS NULL; END;
CREATE TRIGGER fkdc_operation_recurrentoperation_id_rd_operation_id BEFORE DELETE ON operation FOR EACH ROW BEGIN     DELETE FROM recurrentoperation WHERE recurrentoperation.rd_operation_id = OLD.id; END;
CREATE TRIGGER fki_suboperation_operation_rd_operation_id_id BEFORE INSERT ON suboperation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (operation est utilisé par suboperation)
Nom de la contrainte : fki_suboperation_operation_rd_operation_id_id')   WHERE NEW.rd_operation_id!=0 AND NEW.rd_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.rd_operation_id) IS NULL; END;
CREATE TRIGGER fku_suboperation_operation_rd_operation_id_id BEFORE UPDATE ON suboperation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (operation est utilisé par suboperation)
Nom de la contrainte : fku_suboperation_operation_rd_operation_id_id')       WHERE NEW.rd_operation_id!=0 AND NEW.rd_operation_id!='' AND (SELECT id FROM operation WHERE id = NEW.rd_operation_id) IS NULL; END;
CREATE TRIGGER fkdc_operation_suboperation_id_rd_operation_id BEFORE DELETE ON operation FOR EACH ROW BEGIN     DELETE FROM suboperation WHERE suboperation.rd_operation_id = OLD.id; END;
CREATE TRIGGER fki_suboperation_category_r_category_id_id BEFORE INSERT ON suboperation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (category est utilisé par suboperation)
Nom de la contrainte : fki_suboperation_category_r_category_id_id')   WHERE NEW.r_category_id!=0 AND NEW.r_category_id!='' AND (SELECT id FROM category WHERE id = NEW.r_category_id) IS NULL; END;
CREATE TRIGGER fku_suboperation_category_r_category_id_id BEFORE UPDATE ON suboperation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (category est utilisé par suboperation)
Nom de la contrainte : fku_suboperation_category_r_category_id_id')       WHERE NEW.r_category_id!=0 AND NEW.r_category_id!='' AND (SELECT id FROM category WHERE id = NEW.r_category_id) IS NULL; END;
CREATE TRIGGER fkd_suboperation_category_r_category_id_id BEFORE DELETE ON category FOR EACH ROW BEGIN     UPDATE suboperation SET r_category_id=0 WHERE r_category_id=OLD.id; END;
CREATE TRIGGER fki_suboperation_refund_r_refund_id_id BEFORE INSERT ON suboperation FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (refund est utilisé par suboperation)
Nom de la contrainte : fki_suboperation_refund_r_refund_id_id')   WHERE NEW.r_refund_id!=0 AND NEW.r_refund_id!='' AND (SELECT id FROM refund WHERE id = NEW.r_refund_id) IS NULL; END;
CREATE TRIGGER fku_suboperation_refund_r_refund_id_id BEFORE UPDATE ON suboperation FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (refund est utilisé par suboperation)
Nom de la contrainte : fku_suboperation_refund_r_refund_id_id')       WHERE NEW.r_refund_id!=0 AND NEW.r_refund_id!='' AND (SELECT id FROM refund WHERE id = NEW.r_refund_id) IS NULL; END;
CREATE TRIGGER fkd_suboperation_refund_r_refund_id_id BEFORE DELETE ON refund FOR EACH ROW BEGIN     UPDATE suboperation SET r_refund_id=0 WHERE r_refund_id=OLD.id; END;
CREATE TRIGGER fki_unit_unit_rd_unit_id_id BEFORE INSERT ON unit FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (unit est utilisé par unit)
Nom de la contrainte : fki_unit_unit_rd_unit_id_id')   WHERE NEW.rd_unit_id!=0 AND NEW.rd_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rd_unit_id) IS NULL; END;
CREATE TRIGGER fku_unit_unit_rd_unit_id_id BEFORE UPDATE ON unit FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (unit est utilisé par unit)
Nom de la contrainte : fku_unit_unit_rd_unit_id_id')       WHERE NEW.rd_unit_id!=0 AND NEW.rd_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rd_unit_id) IS NULL; END;
CREATE TRIGGER fkdc_unit_unit_id_rd_unit_id BEFORE DELETE ON unit FOR EACH ROW BEGIN     DELETE FROM unit WHERE unit.rd_unit_id = OLD.id; END;
CREATE TRIGGER fki_unitvalue_unit_rd_unit_id_id BEFORE INSERT ON unitvalue FOR EACH ROW BEGIN   SELECT RAISE(ABORT, 'Impossible d''ajouter un objet (unit est utilisé par unitvalue)
Nom de la contrainte : fki_unitvalue_unit_rd_unit_id_id')   WHERE NEW.rd_unit_id!=0 AND NEW.rd_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rd_unit_id) IS NULL; END;
CREATE TRIGGER fku_unitvalue_unit_rd_unit_id_id BEFORE UPDATE ON unitvalue FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de modifier un objet (unit est utilisé par unitvalue)
Nom de la contrainte : fku_unitvalue_unit_rd_unit_id_id')       WHERE NEW.rd_unit_id!=0 AND NEW.rd_unit_id!='' AND (SELECT id FROM unit WHERE id = NEW.rd_unit_id) IS NULL; END;
CREATE TRIGGER fkdc_unit_unitvalue_id_rd_unit_id BEFORE DELETE ON unit FOR EACH ROW BEGIN     DELETE FROM unitvalue WHERE unitvalue.rd_unit_id = OLD.id; END;
CREATE TRIGGER fkd_vm_budget_tmp_category_rc_category_id_id BEFORE DELETE ON category FOR EACH ROW BEGIN     SELECT RAISE(ABORT, 'Impossible de détruire un objet (category est utilisé par vm_budget_tmp)
Nom de la contrainte : fkd_vm_budget_tmp_category_rc_category_id_id')     WHERE (SELECT rc_category_id FROM vm_budget_tmp WHERE rc_category_id = OLD.id) IS NOT NULL; END;
CREATE TRIGGER fkdc_category_vm_category_display_tmp_id_rd_category_id BEFORE DELETE ON category FOR EACH ROW BEGIN     DELETE FROM vm_category_display_tmp WHERE vm_category_display_tmp.rd_category_id = OLD.id; END;
CREATE VIEW v_unit_displayname AS SELECT *, t_name||' ('||t_symbol||')' AS t_displayname FROM unit;
CREATE VIEW v_unit_tmp1 AS SELECT *,(SELECT count(*) FROM unitvalue s WHERE s.rd_unit_id=unit.id) AS i_NBVALUES, (CASE WHEN unit.rd_unit_id=0 THEN '' ELSE (SELECT (CASE WHEN s.t_symbol!='' THEN s.t_symbol ELSE s.t_name END) FROM unit s WHERE s.id=unit.rd_unit_id) END) AS t_UNIT,(CASE unit.t_type WHEN '1' THEN 'Monnaie principale' WHEN '2' THEN 'Monnaie secondaire' WHEN 'C' THEN 'Monnaie' WHEN 'S' THEN 'Action' WHEN 'I' THEN 'Indice' ELSE 'Objet' END) AS t_TYPENLS, (SELECT MIN(s.d_date) FROM  unitvalue s WHERE s.rd_unit_id=unit.id) AS d_MINDATE, (SELECT MAX(s.d_date) FROM  unitvalue s WHERE s.rd_unit_id=unit.id) AS d_MAXDATE from unit;
CREATE VIEW v_unit_tmp2 AS SELECT *,CASE WHEN v_unit_tmp1.t_type='1' THEN 1 ELSE IFNULL((SELECT s.f_quantity FROM unitvalue s WHERE s.rd_unit_id=v_unit_tmp1.id AND s.d_date=v_unit_tmp1.d_MAXDATE),1) END AS f_LASTVALUE from v_unit_tmp1;
CREATE VIEW v_unit AS SELECT *,v_unit_tmp2.f_LASTVALUE*IFNULL((SELECT s2.f_LASTVALUE FROM v_unit_tmp2 s2 WHERE s2.id=v_unit_tmp2.rd_unit_id) , 1) AS f_CURRENTAMOUNT from v_unit_tmp2;
CREATE VIEW v_unitvalue_displayname AS SELECT *, (SELECT t_displayname FROM v_unit_displayname WHERE unitvalue.rd_unit_id=v_unit_displayname.id)||' '||STRFTIME('%d/%m/%Y',d_date) AS t_displayname FROM unitvalue;
CREATE VIEW v_unitvalue AS SELECT * FROM unitvalue;
CREATE VIEW v_suboperation AS SELECT * FROM suboperation;
CREATE VIEW v_operation_numbers AS SELECT DISTINCT i_number, rd_account_id FROM operation;
CREATE VIEW v_operation_next_numbers AS SELECT T1.i_number+1 AS i_number FROM v_operation_numbers AS T1 LEFT OUTER JOIN v_operation_numbers T2 ON T2.rd_account_id=T1.rd_account_id AND T2.i_number=T1.i_number+1 WHERE T1.i_number!=0 AND (T2.i_number IS NULL) ORDER BY T1.i_number;
CREATE VIEW v_operation_tmp1 AS SELECT *,(SELECT t_name FROM payee s WHERE s.id=operation.r_payee_id) AS t_PAYEE,(SELECT TOTAL(s.f_value) FROM suboperation s WHERE s.rd_operation_id=operation.ID) AS f_QUANTITY,(SELECT count(*) FROM suboperation s WHERE s.rd_operation_id=operation.ID) AS i_NBSUBCATEGORY FROM operation;
CREATE VIEW v_operation AS SELECT *,(SELECT s.id FROM suboperation s WHERE s.rd_operation_id=v_operation_tmp1.id AND ABS(s.f_value)=(SELECT MAX(ABS(s2.f_value)) FROM suboperation s2 WHERE s2.rd_operation_id=v_operation_tmp1.id)) AS i_MOSTIMPSUBOP,((SELECT s.f_CURRENTAMOUNT FROM v_unit s WHERE s.id=v_operation_tmp1.rc_unit_id)*v_operation_tmp1.f_QUANTITY) AS f_CURRENTAMOUNT, (CASE WHEN v_operation_tmp1.i_group_id<>0 AND EXISTS (SELECT 1 FROM account a WHERE v_operation_tmp1.rd_account_id=a.id AND a.t_type<>'L') AND EXISTS (SELECT 1 FROM v_operation_tmp1 op2, account a WHERE op2.i_group_id=v_operation_tmp1.i_group_id AND op2.rd_account_id=a.id AND a.t_type<>'L' AND op2.rc_unit_id=v_operation_tmp1.rc_unit_id AND op2.f_QUANTITY=-v_operation_tmp1.f_QUANTITY) THEN 'Y' ELSE 'N' END) AS t_TRANSFER FROM v_operation_tmp1;
CREATE VIEW v_operation_displayname AS SELECT *, STRFTIME('%d/%m/%Y',d_date)||' '||IFNULL(t_PAYEE,'')||' '||v_operation.f_CURRENTAMOUNT||' '||(SELECT (CASE WHEN s.t_symbol!='' THEN s.t_symbol ELSE s.t_name END) FROM unit s WHERE s.id=v_operation.rc_unit_id) AS t_displayname FROM v_operation;
CREATE VIEW v_operation_delete AS SELECT *, (CASE WHEN t_status='Y' THEN 'Vous n''êtes pas autorisé à détruire cette opération car en état « rapproché »' END) t_delete_message FROM operation;
CREATE VIEW v_account AS SELECT *,(SELECT MAX(s.d_date) FROM  interest s WHERE s.rd_account_id=account.id) AS d_MAXDATE, (SELECT TOTAL(s.f_CURRENTAMOUNT) FROM v_operation s WHERE s.rd_account_id=account.id AND s.t_template='N') AS f_CURRENTAMOUNT FROM account;
CREATE VIEW v_account_delete AS SELECT *, (CASE WHEN EXISTS(SELECT 1 FROM operation WHERE rd_account_id=account.id AND d_date<>'0000-00-00' AND t_template='N' AND t_status='Y') THEN 'Vous n''êtes pas autorisé à détruire ce compte car il contient des opérations rapprochées' END) t_delete_message FROM account;
CREATE VIEW v_bank_displayname AS SELECT *, t_name AS t_displayname FROM bank;
CREATE VIEW v_account_displayname AS SELECT *, (SELECT t_displayname FROM v_bank_displayname WHERE account.rd_bank_id=v_bank_displayname.id)||'-'||t_name AS t_displayname FROM account;
CREATE VIEW v_bank AS SELECT *,(SELECT TOTAL(s.f_CURRENTAMOUNT) FROM v_account s WHERE s.rd_bank_id=bank.id) AS f_CURRENTAMOUNT FROM bank;
CREATE VIEW v_category_displayname AS SELECT *, t_fullname AS t_displayname FROM category;
CREATE VIEW v_category AS SELECT * FROM category;
CREATE VIEW v_recurrentoperation AS SELECT *,i_period_increment||' '||(CASE t_period_unit WHEN 'Y' THEN 'année(s)' WHEN 'M' THEN 'mois' WHEN 'W' THEN 'semaine(s)' ELSE 'jour(s)' END) AS t_PERIODNLS FROM recurrentoperation;
CREATE VIEW v_recurrentoperation_displayname AS SELECT *, STRFTIME('%d/%m/%Y',d_date)||' '||SUBSTR((SELECT t_displayname FROM v_operation_displayname WHERE v_operation_displayname.id=v_recurrentoperation.rd_operation_id), 11) AS t_displayname FROM v_recurrentoperation;
CREATE VIEW v_unitvalue_display AS SELECT *,IFNULL((SELECT (CASE WHEN s.t_symbol!='' THEN s.t_symbol ELSE s.t_name END) FROM unit s WHERE s.id=(SELECT s2.rd_unit_id FROM unit s2 WHERE s2.id=unitvalue.rd_unit_id)),'') AS t_UNIT,STRFTIME('%Y-%m',unitvalue.d_date) AS d_DATEMONTH,STRFTIME('%Y',unitvalue.d_date) AS d_DATEYEAR FROM unitvalue;
CREATE VIEW v_suboperation_display AS SELECT *,IFNULL((SELECT s.t_fullname FROM category s WHERE s.id=v_suboperation.r_category_id),'') AS t_CATEGORY, IFNULL((SELECT s.t_name FROM refund s WHERE s.id=v_suboperation.r_refund_id),'') AS t_REFUND, (CASE WHEN v_suboperation.f_value>=0 THEN v_suboperation.f_value ELSE 0 END) AS f_VALUE_INCOME, (CASE WHEN v_suboperation.f_value<=0 THEN v_suboperation.f_value ELSE 0 END) AS f_VALUE_EXPENSE FROM v_suboperation;
CREATE VIEW v_suboperation_displayname AS SELECT *, t_CATEGORY||' : '||f_value AS t_displayname FROM v_suboperation_display;
CREATE VIEW v_operation_display_all AS SELECT *,(SELECT s.t_name FROM account s WHERE s.id=v_operation.rd_account_id) AS t_ACCOUNT,(SELECT (CASE WHEN s.t_symbol!='' THEN s.t_symbol ELSE s.t_name END) FROM unit s WHERE s.id=v_operation.rc_unit_id) AS t_UNIT,(SELECT s.t_CATEGORY FROM v_suboperation_display s WHERE s.id=v_operation.i_MOSTIMPSUBOP) AS t_CATEGORY,(SELECT s.t_REFUND FROM v_suboperation_display s WHERE s.id=v_operation.i_MOSTIMPSUBOP) AS t_REFUND,(CASE WHEN v_operation.f_QUANTITY<0 THEN '-' WHEN v_operation.f_QUANTITY=0 THEN '' ELSE '+' END) AS t_TYPEEXPENSE, (CASE WHEN v_operation.f_QUANTITY<=0 THEN 'Dépense' ELSE 'Revenu' END) AS t_TYPEEXPENSENLS, STRFTIME('%Y-W%W',v_operation.d_date) AS d_DATEWEEK,STRFTIME('%Y-%m',v_operation.d_date) AS d_DATEMONTH,STRFTIME('%Y',v_operation.d_date)||'-Q'||(CASE WHEN STRFTIME('%m',v_operation.d_date)<='03' THEN '1' WHEN STRFTIME('%m',v_operation.d_date)<='06' THEN '2' WHEN STRFTIME('%m',v_operation.d_date)<='09' THEN '3' ELSE '4' END) AS d_DATEQUARTER, STRFTIME('%Y',v_operation.d_date)||'-S'||(CASE WHEN STRFTIME('%m',v_operation.d_date)<='06' THEN '1' ELSE '2' END) AS d_DATESEMESTER, STRFTIME('%Y',v_operation.d_date) AS d_DATEYEAR, (SELECT count(*) FROM v_recurrentoperation s WHERE s.rd_operation_id=v_operation.id) AS i_NBRECURRENT,  (CASE WHEN v_operation.f_QUANTITY>=0 THEN v_operation.f_QUANTITY ELSE 0 END) AS f_QUANTITY_INCOME, (CASE WHEN v_operation.f_QUANTITY<=0 THEN v_operation.f_QUANTITY ELSE 0 END) AS f_QUANTITY_EXPENSE, (SELECT o2.f_balance FROM operationbalance o2 WHERE o2.r_operation_id=v_operation.id ) AS f_BALANCE, (CASE WHEN v_operation.f_QUANTITY>=0 THEN v_operation.f_CURRENTAMOUNT ELSE 0 END) AS f_CURRENTAMOUNT_INCOME, (CASE WHEN v_operation.f_QUANTITY<=0 THEN v_operation.f_CURRENTAMOUNT ELSE 0 END) AS f_CURRENTAMOUNT_EXPENSE FROM v_operation;
CREATE VIEW v_operation_template_display AS SELECT * FROM v_operation_display_all WHERE t_template='Y';
CREATE VIEW v_operation_display AS SELECT * FROM v_operation_display_all WHERE d_date!='0000-00-00' AND t_template='N';
CREATE VIEW v_unit_display AS SELECT *,(SELECT TOTAL(o.f_QUANTITY) FROM v_operation_display o WHERE o.rc_unit_id=v_unit.id) AS f_QUANTITYOWNED FROM v_unit;
CREATE VIEW v_account_display AS SELECT (CASE t_type WHEN 'C' THEN 'Courant' WHEN 'D' THEN 'Carte de crédit' WHEN 'A' THEN 'Actif' WHEN 'I' THEN 'Investissement' WHEN 'W' THEN 'Portefeuille' WHEN 'L' THEN 'Prêt' WHEN 'O' THEN 'Autre' END) AS t_TYPENLS,bank.t_name  AS t_BANK,bank.t_bank_number AS t_BANK_NUMBER,bank.t_icon AS t_ICON,v_account.*,(v_account.f_CURRENTAMOUNT/(SELECT u.f_CURRENTAMOUNT FROM v_unit u, operation s WHERE u.id=s.rc_unit_id AND s.rd_account_id=v_account.id AND s.d_date='0000-00-00')) AS f_QUANTITY, (SELECT (CASE WHEN u.t_symbol!='' THEN u.t_symbol ELSE u.t_name END) FROM unit u, operation s WHERE u.id=s.rc_unit_id AND s.rd_account_id=v_account.id AND s.d_date='0000-00-00') AS t_UNIT, (SELECT TOTAL(s.f_CURRENTAMOUNT) FROM v_operation s WHERE s.rd_account_id=v_account.id AND s.t_status!='N' AND s.t_template='N') AS f_CHECKED, (SELECT TOTAL(s.f_CURRENTAMOUNT) FROM v_operation s WHERE s.rd_account_id=v_account.id AND s.t_status='N' AND s.t_template='N') AS f_COMING_SOON, (SELECT TOTAL(s.f_CURRENTAMOUNT) FROM v_operation s WHERE s.rd_account_id=v_account.id AND s.d_date<=date('now') AND s.t_template='N') AS f_TODAYAMOUNT, (SELECT count(*) FROM v_operation_display s WHERE s.rd_account_id=v_account.id) AS i_NBOPERATIONS, IFNULL((SELECT s.f_rate FROM interest s WHERE s.rd_account_id=v_account.id AND s.d_date=v_account.d_MAXDATE),0) AS f_RATE FROM v_account, bank WHERE bank.id=v_account.rd_bank_id;
CREATE VIEW v_operation_consolidated AS SELECT (SELECT s.t_TYPENLS FROM v_account_display s WHERE s.id=op.rd_account_id) AS t_ACCOUNTTYPE,(SELECT u.t_TYPENLS FROM v_unit u WHERE u.id=op.rc_unit_id) AS t_UNITTYPE,sop.id AS i_SUBOPID, sop.r_refund_id AS r_refund_id, (CASE WHEN sop.t_comment='' THEN op.t_comment ELSE sop.t_comment END) AS t_REALCOMMENT, sop.t_CATEGORY AS t_REALCATEGORY, sop.t_REFUND AS t_REALREFUND, sop.r_category_id AS i_IDCATEGORY, (CASE WHEN sop.f_value<0 THEN '-' WHEN sop.f_value=0 THEN '' ELSE '+' END) AS t_TYPEEXPENSE, (CASE WHEN sop.f_value<0 THEN 'Dépense' WHEN sop.f_value=0 THEN '' ELSE 'Revenu' END) AS t_TYPEEXPENSENLS, sop.f_value AS f_REALQUANTITY, sop.f_VALUE_INCOME AS f_REALQUANTITY_INCOME, sop.f_VALUE_EXPENSE AS f_REALQUANTITY_EXPENSE, ((SELECT u.f_CURRENTAMOUNT FROM v_unit u WHERE u.id=op.rc_unit_id)*sop.f_value) AS f_REALCURRENTAMOUNT, ((SELECT u.f_CURRENTAMOUNT FROM v_unit u WHERE u.id=op.rc_unit_id)*sop.f_VALUE_INCOME) AS f_REALCURRENTAMOUNT_INCOME, ((SELECT u.f_CURRENTAMOUNT FROM v_unit u WHERE u.id=op.rc_unit_id)*sop.f_VALUE_EXPENSE) AS f_REALCURRENTAMOUNT_EXPENSE, op.* FROM v_operation_display_all AS op, v_suboperation_display AS sop WHERE op.t_template='N' AND sop.rd_operation_id=op.ID;
CREATE VIEW v_operation_prop AS SELECT p.id AS i_PROPPID, p.t_name AS i_PROPPNAME, p.t_value AS i_PROPVALUE, op.* FROM v_operation_consolidated AS op LEFT OUTER JOIN parameters AS p ON p.t_uuid_parent=op.id||'-operation';
CREATE VIEW v_refund_delete AS SELECT *, (CASE WHEN EXISTS(SELECT 1 FROM v_operation_consolidated WHERE r_refund_id=refund.id AND t_status='Y') THEN 'Vous n''êtes pas autorisé à détruire ce suiveur car utilisé par des opérations rapprochées' END) t_delete_message FROM refund;
CREATE VIEW v_refund AS SELECT *, (SELECT TOTAL(o.f_REALCURRENTAMOUNT) FROM v_operation_consolidated o WHERE o.r_refund_id=refund.id) AS f_CURRENTAMOUNT FROM refund;
CREATE VIEW v_refund_display AS SELECT *,(SELECT MIN(o.d_date) FROM v_operation_consolidated o WHERE o.r_refund_id=v_refund.id) AS d_FIRSTDATE, (SELECT MAX(o.d_date) FROM v_operation_consolidated o WHERE o.r_refund_id=v_refund.id) AS d_LASTDATE  FROM v_refund;
CREATE VIEW v_refund_displayname AS SELECT *, t_name AS t_displayname FROM refund;
CREATE VIEW v_payee_delete AS SELECT *, (CASE WHEN EXISTS(SELECT 1 FROM operation WHERE r_payee_id=payee.id AND t_status='Y') THEN 'Vous n''êtes pas autorisé à détruire ce tiers car utilisé par des opérations rapprochées' END) t_delete_message FROM payee;
CREATE VIEW v_payee AS SELECT *, (SELECT TOTAL(o.f_CURRENTAMOUNT) FROM v_operation o WHERE o.r_payee_id=payee.id AND o.t_template='N') AS f_CURRENTAMOUNT FROM payee;
CREATE VIEW v_payee_display AS SELECT *  FROM v_payee;
CREATE VIEW v_payee_displayname AS SELECT *, t_name AS t_displayname FROM payee;
CREATE VIEW v_category_delete AS SELECT *, (CASE WHEN EXISTS(SELECT 1 FROM v_operation_consolidated WHERE (t_REALCATEGORY=category.t_fullname OR t_REALCATEGORY like category.t_fullname||'%') AND t_status='Y') THEN 'Vous n''êtes pas autorisé à détruire cette catégorie car utilisée par des opérations rapprochées' END) t_delete_message FROM category;
CREATE VIEW v_category_display_tmp AS SELECT *,(SELECT count(distinct(so.rd_operation_id)) FROM operation o, suboperation so WHERE so.rd_operation_id=o.id AND so.r_category_id=v_category.ID AND o.t_template='N') AS i_NBOPERATIONS, (SELECT TOTAL(o.f_REALCURRENTAMOUNT) FROM v_operation_consolidated o WHERE o.i_IDCATEGORY=v_category.ID) AS f_REALCURRENTAMOUNT FROM v_category;
CREATE VIEW v_category_display AS SELECT *,f_REALCURRENTAMOUNT+(SELECT TOTAL(c.f_REALCURRENTAMOUNT) FROM vm_category_display_tmp c WHERE c.t_fullname LIKE vm_category_display_tmp.t_fullname||' > %') AS f_SUMCURRENTAMOUNT, i_NBOPERATIONS+(SELECT CAST(TOTAL(c.i_NBOPERATIONS) AS INTEGER) FROM vm_category_display_tmp c WHERE c.t_fullname like vm_category_display_tmp.t_fullname||' > %') AS i_SUMNBOPERATIONS, (CASE WHEN t_bookmarked='Y' THEN 'Y' WHEN EXISTS(SELECT 1 FROM category c WHERE c.t_bookmarked='Y' AND c.t_fullname like vm_category_display_tmp.t_fullname||' > %') THEN 'C' ELSE 'N' END) AS t_HASBOOKMARKEDCHILD, (CASE WHEN vm_category_display_tmp.f_REALCURRENTAMOUNT<0 THEN '-' WHEN vm_category_display_tmp.f_REALCURRENTAMOUNT=0 THEN '' ELSE '+' END) AS t_TYPEEXPENSE,(CASE WHEN vm_category_display_tmp.f_REALCURRENTAMOUNT<0 THEN 'Dépense' WHEN vm_category_display_tmp.f_REALCURRENTAMOUNT=0 THEN '' ELSE 'Revenu' END) AS t_TYPEEXPENSENLS FROM vm_category_display_tmp;
CREATE VIEW v_recurrentoperation_display AS SELECT rop.*, op.t_ACCOUNT, op.i_number, op.t_mode, op.i_group_id, op.t_TRANSFER, op.t_PAYEE, op.t_comment, op.t_CATEGORY, op.t_status, op.f_CURRENTAMOUNT FROM v_recurrentoperation rop, v_operation_display_all AS op WHERE rop.rd_operation_id=op.ID;
CREATE VIEW v_rule AS SELECT *,(SELECT COUNT(1) FROM rule r WHERE r.f_sortorder<=rule.f_sortorder) AS i_ORDER FROM rule;
CREATE VIEW v_rule_displayname AS SELECT *, t_definition AS t_displayname FROM rule;
CREATE VIEW v_interest AS SELECT *,(SELECT s.t_name FROM account s WHERE s.id=interest.rd_account_id) AS t_ACCOUNT  FROM interest;
CREATE VIEW v_interest_displayname AS SELECT *, STRFTIME('%d/%m/%Y',d_date)||' '||f_rate||'%' AS t_displayname FROM interest;
CREATE VIEW v_budgetrule AS SELECT *, IFNULL((SELECT s.t_fullname FROM category s WHERE s.id=budgetrule.rc_category_id),'') AS t_CATEGORYCONDITION, IFNULL((SELECT s.t_fullname FROM category s WHERE s.id=budgetrule.rc_category_id_target),'') AS t_CATEGORY, (CASE WHEN budgetrule.i_condition=-1 THEN 'Négatif' WHEN budgetrule.i_condition=1 THEN 'Positif' WHEN budgetrule.i_condition=0 THEN 'Tous' END) AS t_WHENNLS, f_quantity||(CASE WHEN budgetrule.t_absolute='N' THEN '%' ELSE (SELECT t_symbol FROM unit WHERE t_type='1') END) AS t_WHATNLS,(CASE WHEN budgetrule.t_rule='N' THEN 'Suivant' WHEN budgetrule.t_rule='C' THEN 'Courant' WHEN budgetrule.t_rule='Y' THEN 'Année' END) AS t_RULENLS FROM budgetrule;
CREATE VIEW v_budgetrule_display AS SELECT *  FROM v_budgetrule;
CREATE VIEW v_budgetrule_displayname AS SELECT *, t_WHENNLS||' '||t_WHATNLS||' '||t_RULENLS||' '||t_CATEGORY AS t_displayname FROM v_budgetrule;
CREATE VIEW v_budget_tmp AS SELECT *, IFNULL((SELECT s.t_fullname FROM category s WHERE s.id=budget.rc_category_id),'') AS t_CATEGORY, (i_year||(CASE WHEN i_month=0 THEN '' WHEN i_month<10 THEN '-0'||i_month ELSE '-'||i_month END)) AS t_PERIOD, (SELECT TOTAL(o.f_REALCURRENTAMOUNT) FROM v_operation_consolidated o WHERE STRFTIME('%Y', o.d_date)=i_year AND (i_month=0 OR STRFTIME('%m', o.d_date)=i_month) AND o.i_IDCATEGORY IN (SELECT b2.id_category FROM budgetcategory b2 WHERE b2.id=budget.id)) AS f_CURRENTAMOUNT, (SELECT GROUP_CONCAT(v_budgetrule_displayname.t_displayname,',') FROM v_budgetrule_displayname WHERE (v_budgetrule_displayname.t_year_condition='N' OR budget.i_year=v_budgetrule_displayname.i_year) AND (v_budgetrule_displayname.t_month_condition='N' OR budget.i_month=v_budgetrule_displayname.i_month) AND (v_budgetrule_displayname.t_category_condition='N' OR budget.rc_category_id=v_budgetrule_displayname.rc_category_id) ORDER BY v_budgetrule_displayname.t_absolute DESC, v_budgetrule_displayname.id) AS t_RULES FROM budget;
CREATE VIEW v_budget AS SELECT *, (f_CURRENTAMOUNT-f_budgeted_modified) AS f_DELTABEFORETRANSFER, (f_CURRENTAMOUNT-f_budgeted_modified-f_transferred) AS f_DELTA FROM v_budget_tmp;
CREATE VIEW v_budget_display AS SELECT *, (f_CURRENTAMOUNT-f_budgeted_modified) AS f_DELTABEFORETRANSFER, (f_CURRENTAMOUNT-f_budgeted_modified-f_transferred) AS f_DELTA FROM vm_budget_tmp;
CREATE VIEW v_budget_displayname AS SELECT *, t_CATEGORY||' '||t_PERIOD||' '||f_budgeted_modified AS t_displayname FROM v_budget;
CREATE TRIGGER fkdc_bank_parameters_uuid BEFORE DELETE ON bank FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'bank'; END;
CREATE TRIGGER fkdc_account_parameters_uuid BEFORE DELETE ON account FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'account'; END;
CREATE TRIGGER fkdc_unit_parameters_uuid BEFORE DELETE ON unit FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'unit'; END;
CREATE TRIGGER fkdc_unitvalue_parameters_uuid BEFORE DELETE ON unitvalue FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'unitvalue'; END;
CREATE TRIGGER fkdc_category_parameters_uuid BEFORE DELETE ON category FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'category'; END;
CREATE TRIGGER fkdc_operation_parameters_uuid BEFORE DELETE ON operation FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'operation'; END;
CREATE TRIGGER fkdc_interest_parameters_uuid BEFORE DELETE ON interest FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'interest'; END;
CREATE TRIGGER fkdc_suboperation_parameters_uuid BEFORE DELETE ON suboperation FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'suboperation'; END;
CREATE TRIGGER fkdc_refund_parameters_uuid BEFORE DELETE ON refund FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'refund'; END;
CREATE TRIGGER fkdc_payee_parameters_uuid BEFORE DELETE ON payee FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'payee'; END;
CREATE TRIGGER fkdc_recurrentoperation_parameters_uuid BEFORE DELETE ON recurrentoperation FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'recurrentoperation'; END;
CREATE TRIGGER fkdc_rule_parameters_uuid BEFORE DELETE ON rule FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'rule'; END;
CREATE TRIGGER fkdc_budget_parameters_uuid BEFORE DELETE ON budget FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'budget'; END;
CREATE TRIGGER fkdc_budgetrule_parameters_uuid BEFORE DELETE ON budgetrule FOR EACH ROW BEGIN     DELETE FROM parameters WHERE parameters.t_uuid_parent=OLD.id||'-'||'budgetrule'; END;
CREATE TRIGGER cpt_category_fullname1 AFTER INSERT ON category BEGIN UPDATE category SET t_fullname=CASE WHEN rd_category_id IS NULL OR rd_category_id='' OR rd_category_id=0 THEN new.t_name ELSE (SELECT c.t_fullname FROM category c WHERE c.id=new.rd_category_id)||' > '||new.t_name END WHERE id=new.id;END;
CREATE TRIGGER cpt_category_fullname2 AFTER UPDATE OF t_name, rd_category_id ON category BEGIN UPDATE category SET t_fullname=CASE WHEN rd_category_id IS NULL OR rd_category_id='' OR rd_category_id=0 THEN new.t_name ELSE (SELECT c.t_fullname FROM category c WHERE c.id=new.rd_category_id)||' > '||new.t_name END WHERE id=new.id;UPDATE category SET t_name=t_name WHERE rd_category_id=new.id;END;
CREATE TRIGGER fkdc_category_delete BEFORE DELETE ON category FOR EACH ROW BEGIN     UPDATE suboperation SET r_category_id=OLD.rd_category_id WHERE r_category_id=OLD.id; END;
SELECT TOTAL(f_CURRENTAMOUNT), d_DATEMONTH;
WHERE d_DATEMONTH IN ('2012-05', '2012-04');
CREATE TABLE Resource (ID INTEGER NOT NULL PRIMARY KEY, Uri TEXT NOT
NULL, UNIQUE (Uri));
CREATE VIRTUAL TABLE fts USING fts4;
CREATE TABLE "mfo:Action" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mfo:Enclosure" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "mfo:optional:graph" INTEGER);
CREATE TABLE "mfo:FeedChannel" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "mfo:unreadCount" INTEGER, "mfo:unreadCount:graph" INTEGER,;
INTEGER, "mfo:action:graph" INTEGER, "mfo:type" INTEGER,;
CREATE TABLE "mfo:FeedElement" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "mfo:FeedMessage" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "mfo:FeedMessage_mfo:enclosureList" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "mfo:FeedSettings" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "mfo:downloadFlag" INTEGER, "mfo:downloadFlag:graph" INTEGER,;
CREATE TABLE "mfo:FeedType" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "mlo:GeoBoundingBox" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:GeoBoundingBox_mlo:bbNorthWest" (ID INTEGER NOT
NULL, "mlo:bbNorthWest" INTEGER NOT NULL, "mlo:bbNorthWest:graph"
INTEGER);
CREATE TABLE "mlo:GeoBoundingBox_mlo:bbSouthEast" (ID INTEGER NOT
NULL, "mlo:bbSouthEast" INTEGER NOT NULL, "mlo:bbSouthEast:graph"
INTEGER);
CREATE TABLE "mlo:GeoLocation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:GeoLocation_mlo:asBoundingBox" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "mlo:GeoLocation_mlo:asGeoPoint" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoLocation_mlo:asPostalAddress" (ID INTEGER NOT
NULL, "mlo:asPostalAddress" INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:GeoPoint_mlo:address" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:altitude" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:city" (ID INTEGER NOT NULL, "mlo:city"
TEXT NOT NULL, "mlo:city:graph" INTEGER);
CREATE TABLE "mlo:GeoPoint_mlo:country" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:latitude" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:longitude" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:state" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:GeoPoint_mlo:timestamp" (ID INTEGER NOT NULL,;
INTEGER NOT NULL);
CREATE TABLE "mlo:GeoSphere" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:GeoSphere_mlo:radius" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:Landmark" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:LandmarkCategory" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:LandmarkCategory_mlo:isRemovable" (ID INTEGER NOT
NULL, "mlo:isRemovable" INTEGER NOT NULL, "mlo:isRemovable:graph"
INTEGER);
CREATE TABLE "mlo:Landmark_mlo:belongsToCategory" (ID INTEGER NOT
NULL, "mlo:belongsToCategory" INTEGER NOT NULL,;
CREATE TABLE "mlo:Landmark_mlo:poiLocation" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:LocationBoundingBox" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:LocationBoundingBox_mlo:boxEastLimit" (ID INTEGER
NOT NULL, "mlo:boxEastLimit" INTEGER NOT NULL,;
CREATE TABLE "mlo:LocationBoundingBox_mlo:boxNorthLimit" (ID INTEGER
NOT NULL, "mlo:boxNorthLimit" INTEGER NOT NULL,;
CREATE TABLE "mlo:LocationBoundingBox_mlo:boxSouthWestCorner" (ID
INTEGER NOT NULL, "mlo:boxSouthWestCorner" INTEGER NOT NULL,;
CREATE TABLE "mlo:LocationBoundingBox_mlo:boxVerticalLimit" (ID
INTEGER NOT NULL, "mlo:boxVerticalLimit" INTEGER NOT NULL,;
CREATE TABLE "mlo:PointOfInterest" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:Route" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mlo:Route_mlo:endTime" (ID INTEGER NOT NULL,;
INTEGER NOT NULL);
CREATE TABLE "mlo:Route_mlo:routeDetails" (ID INTEGER NOT NULL,;
CREATE TABLE "mlo:Route_mlo:startTime" (ID INTEGER NOT NULL,;
INTEGER NOT NULL);
CREATE TABLE "mto:DownloadTransfer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mto:State" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mto:SyncTransfer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mto:Transfer" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "mto:created:graph" INTEGER, "mto:created:localDate" INTEGER,;
INTEGER);
CREATE TABLE "mto:TransferElement" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "mto:destination:graph" INTEGER, "mto:startedTime" INTEGER,;
INTEGER, "mto:completedTime:localTime" INTEGER, "mto:state" INTEGER,;
CREATE TABLE "mto:TransferMethod" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mto:Transfer_mto:transferList" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "mto:Transfer_mto:transferPrivacyLevel" (ID INTEGER NOT
NULL, "mto:transferPrivacyLevel" TEXT NOT NULL,;
CREATE TABLE "mto:UploadTransfer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "mto:UploadTransfer_mto:transferCategory" (ID INTEGER NOT
NULL, "mto:transferCategory" TEXT NOT NULL,;
CREATE TABLE "mtp:ScanType" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nao:Property" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nao:propertyValue" TEXT COLLATE NOCASE,;
CREATE TABLE "nao:Tag" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nao:Tag_tracker:isDefaultTag" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nao:Tag_tracker:tagRelatedTo" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "ncal:AccessClassification" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Alarm" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "ncal:AlarmAction" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Alarm_ncal:action" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:Attachment" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "ncal:AttachmentEncoding" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Attendee" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:member:graph" INTEGER, "ncal:role" INTEGER,;
INTEGER, "ncal:partstat" INTEGER, "ncal:partstat:graph" INTEGER);
CREATE TABLE "ncal:AttendeeOrOrganizer" (ID INTEGER NOT NULL PRIMARY
KEY, "ncal:dir" INTEGER, "ncal:dir:graph" INTEGER,;
CREATE TABLE "ncal:AttendeeRole" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:BydayRulePart" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:BydayRulePart_ncal:bydayModifier" (ID INTEGER NOT
NULL, "ncal:bydayModifier" INTEGER NOT NULL,;
CREATE TABLE "ncal:BydayRulePart_ncal:bydayWeekday" (ID INTEGER NOT
NULL, "ncal:bydayWeekday" INTEGER NOT NULL, "ncal:bydayWeekday:graph"
INTEGER);
CREATE TABLE "ncal:Calendar" (ID INTEGER NOT NULL PRIMARY KEY,;
TEXT COLLATE NOCASE, "ncal:prodid:graph" INTEGER, "ncal:version" TEXT
COLLATE NOCASE, "ncal:version:graph" INTEGER);
CREATE TABLE "ncal:CalendarDataObject" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:CalendarScale" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:CalendarUserType" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Calendar_ncal:component" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:Event" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "ncal:EventStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Freebusy" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:FreebusyPeriod" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "ncal:FreebusyType" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Freebusy_ncal:freebusy" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:Journal" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "ncal:JournalStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:NcalDateTime" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:date:localTime" INTEGER, "ncal:dateTime" INTEGER,;
CREATE TABLE "ncal:NcalPeriod" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:periodDuration" INTEGER, "ncal:periodDuration:graph"
INTEGER, "ncal:periodEnd" INTEGER, "ncal:periodEnd:graph" INTEGER,;
INTEGER);
CREATE TABLE "ncal:NcalTimeEntity" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Organizer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:ParticipationStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:RecurrenceFrequency" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:RecurrenceIdentifier" (ID INTEGER NOT NULL PRIMARY
KEY, "ncal:range" INTEGER, "ncal:range:graph" INTEGER,;
INTEGER);
CREATE TABLE "ncal:RecurrenceIdentifierRange" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:RecurrenceRule" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:interval:graph" INTEGER, "ncal:count" INTEGER,;
INTEGER);
CREATE TABLE "ncal:RecurrenceRule_ncal:byday" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:byhour" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:byminute" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:bymonth" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:bymonthday" (ID INTEGER NOT
NULL, "ncal:bymonthday" INTEGER NOT NULL, "ncal:bymonthday:graph"
INTEGER);
CREATE TABLE "ncal:RecurrenceRule_ncal:bysecond" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:bysetpos" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:byweekno" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:RecurrenceRule_ncal:byyearday" (ID INTEGER NOT
NULL, "ncal:byyearday" INTEGER NOT NULL, "ncal:byyearday:graph"
INTEGER);
CREATE TABLE "ncal:RequestStatus" (ID INTEGER NOT NULL PRIMARY KEY,;
COLLATE NOCASE, "ncal:returnStatus:graph" INTEGER,;
CREATE TABLE "ncal:TimeTransparency" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Timezone" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:standard:graph" INTEGER, "ncal:daylight" INTEGER,;
CREATE TABLE "ncal:TimezoneObservance" (ID INTEGER NOT NULL PRIMARY
KEY, "ncal:tzoffsetfrom" TEXT COLLATE NOCASE,;
NOCASE, "ncal:tzoffsetto:graph" INTEGER, "ncal:tzname" TEXT COLLATE
NOCASE, "ncal:tzname:graph" INTEGER);
CREATE TABLE "ncal:Todo" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:todoStatus" INTEGER, "ncal:todoStatus:graph" INTEGER,;
CREATE TABLE "ncal:TodoStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:Trigger" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:triggerDuration:graph" INTEGER);
CREATE TABLE "ncal:TriggerRelation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "ncal:UnionParentClass" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "ncal:trigger" INTEGER, "ncal:trigger:graph" INTEGER,;
COLLATE NOCASE, "ncal:comment:graph" INTEGER, "ncal:summaryAltRep"
INTEGER, "ncal:summaryAltRep:graph" INTEGER, "ncal:priority" INTEGER,;
NOCASE, "ncal:relatedToSibling:graph" INTEGER, "ncal:duration"
INTEGER, "ncal:duration:graph" INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:attach" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:attendee" (ID INTEGER NOT
NULL, "ncal:attendee" INTEGER NOT NULL, "ncal:attendee:graph"
INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:categories" (ID INTEGER NOT
NULL, "ncal:categories" TEXT NOT NULL, "ncal:categories:graph"
INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:exdate" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:exrule" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:hasAlarm" (ID INTEGER NOT
NULL, "ncal:hasAlarm" INTEGER NOT NULL, "ncal:hasAlarm:graph"
INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:ncalRelation" (ID INTEGER NOT
NULL, "ncal:ncalRelation" TEXT NOT NULL, "ncal:ncalRelation:graph"
INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:rdate" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:relatedToChild" (ID INTEGER
NOT NULL, "ncal:relatedToChild" TEXT NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:relatedToParent" (ID INTEGER
NOT NULL, "ncal:relatedToParent" TEXT NOT NULL,;
CREATE TABLE "ncal:UnionParentClass_ncal:resources" (ID INTEGER NOT
NULL, "ncal:resources" TEXT NOT NULL, "ncal:resources:graph" INTEGER);
CREATE TABLE "ncal:UnionParentClass_ncal:rrule" (ID INTEGER NOT NULL,;
CREATE TABLE "ncal:Weekday" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:Affiliation" (ID INTEGER NOT NULL PRIMARY KEY,;
NOCASE, "nco:role:graph" INTEGER);
CREATE TABLE "nco:Affiliation_nco:title" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:AuthorizationStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:BbsNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:CarPhoneNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:CellPhoneNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:Contact" (ID INTEGER NOT NULL PRIMARY KEY,;
COLLATE NOCASE, "nco:contactUID:graph" INTEGER, "nco:contactLocalUID"
TEXT COLLATE NOCASE, "nco:contactLocalUID:graph" INTEGER,;
INTEGER, "nco:birthDate:graph" INTEGER, "nco:birthDate:localDate"
INTEGER, "nco:birthDate:localTime" INTEGER, "nco:sound" INTEGER,;
CREATE TABLE "nco:ContactGroup" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nco:ContactList" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:ContactListDataObject" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:ContactList_nco:containsContact" (ID INTEGER NOT
NULL, "nco:containsContact" INTEGER NOT NULL,;
CREATE TABLE "nco:ContactMedium" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nco:Contact_ncal:anniversary" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Contact_ncal:birthday" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:Contact_nco:belongsToGroup" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Contact_nco:note" (ID INTEGER NOT NULL, "nco:note"
TEXT NOT NULL, "nco:note:graph" INTEGER);
CREATE TABLE "nco:Contact_scal:anniversary" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Contact_scal:birthday" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:DomesticDeliveryAddress" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:EmailAddress" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nco:FaxNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:Gender" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:IMAccount" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nco:imAccountType" TEXT COLLATE NOCASE,;
NOCASE, "nco:imDisplayName:graph" INTEGER, "nco:imEnabled" INTEGER,;
CREATE TABLE "nco:IMAccount_nco:hasIMContact" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:IMAddress" (ID INTEGER NOT NULL PRIMARY KEY,;
TEXT COLLATE NOCASE, "nco:imProtocol:graph" INTEGER,;
INTEGER);
CREATE TABLE "nco:IMAddress_nco:imCapability" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:IMCapability" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:InternationalDeliveryAddress" (ID INTEGER NOT NULL
PRIMARY KEY);
CREATE TABLE "nco:IsdnNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:MessagingNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:ModemNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:OrganizationContact" (ID INTEGER NOT NULL PRIMARY
KEY, "nco:logo" INTEGER, "nco:logo:graph" INTEGER);
CREATE TABLE "nco:PagerNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:ParcelDeliveryAddress" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:PcsNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:PersonContact" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nco:nameHonorificSuffix" TEXT COLLATE NOCASE,;
TEXT COLLATE NOCASE, "nco:nameHonorificPrefix:graph" INTEGER,;
CREATE TABLE "nco:PersonContact_nco:hasAffiliation" (ID INTEGER NOT
NULL, "nco:hasAffiliation" INTEGER NOT NULL,;
CREATE TABLE "nco:PhoneNumber" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nco:PostalAddress" (ID INTEGER NOT NULL PRIMARY KEY,;
NOCASE, "nco:streetAddress:graph" INTEGER, "nco:postalcode" TEXT
COLLATE NOCASE, "nco:postalcode:graph" INTEGER, "nco:locality" TEXT
COLLATE NOCASE, "nco:locality:graph" INTEGER, "nco:county" TEXT
COLLATE NOCASE, "nco:county:graph" INTEGER, "nco:district" TEXT
COLLATE NOCASE, "nco:district:graph" INTEGER, "nco:pobox" TEXT
COLLATE NOCASE, "nco:pobox:graph" INTEGER);
CREATE TABLE "nco:PresenceStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:Role" (ID INTEGER NOT NULL PRIMARY KEY, "nco:video"
INTEGER, "nco:video:graph" INTEGER);
CREATE TABLE "nco:Role_nco:blogUrl" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:Role_nco:foafUrl" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:Role_nco:hasContactMedium" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Role_nco:hasEmailAddress" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Role_nco:hasIMAddress" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Role_nco:hasPhoneNumber" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Role_nco:hasPostalAddress" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nco:Role_nco:url" (ID INTEGER NOT NULL, "nco:url"
INTEGER NOT NULL, "nco:url:graph" INTEGER);
CREATE TABLE "nco:Role_nco:websiteUrl" (ID INTEGER NOT NULL,;
CREATE TABLE "nco:VideoTelephoneNumber" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nco:VoicePhoneNumber" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:Application" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Archive" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:ArchiveItem" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nfo:Attachment" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Audio" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:rearChannels" INTEGER, "nfo:rearChannels:graph" INTEGER,;
CREATE TABLE "nfo:Bookmark" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:pageNumber" INTEGER, "nfo:pageNumber:graph" INTEGER,;
CREATE TABLE "nfo:BookmarkFolder" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:BookmarkFolder_nfo:containsBookmark" (ID INTEGER NOT
NULL, "nfo:containsBookmark" INTEGER NOT NULL,;
CREATE TABLE "nfo:BookmarkFolder_nfo:containsBookmarkFolder" (ID
INTEGER NOT NULL, "nfo:containsBookmarkFolder" INTEGER NOT NULL,;
CREATE TABLE "nfo:CompressionType" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Cursor" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:DataContainer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:DeletedResource" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:deletionDate:localTime" INTEGER);
CREATE TABLE "nfo:Document" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:EmbeddedFileDataObject" (ID INTEGER NOT NULL PRIMARY
KEY, "nfo:encoding" TEXT COLLATE NOCASE, "nfo:encoding:graph"
INTEGER);
CREATE TABLE "nfo:Equipment" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:model" TEXT COLLATE NOCASE, "nfo:model:graph" INTEGER,;
CREATE TABLE "nfo:Executable" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:FileDataObject" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:fileLastModified:localTime" INTEGER);
CREATE TABLE "nfo:FileHash" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nfo:Filesystem" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:FilesystemImage" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Folder" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Font" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:HardDiskPartition" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:HelpDocument" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:HtmlDocument" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Icon" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Image" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:horizontalResolution" INTEGER,;
CREATE TABLE "nfo:Image_nfo:depicts" (ID INTEGER NOT NULL,;
CREATE TABLE "nfo:Image_nfo:hasRegionOfInterest" (ID INTEGER NOT NULL,;
CREATE TABLE "nfo:Media" (ID INTEGER NOT NULL PRIMARY KEY, "nfo:count"
INTEGER, "nfo:count:graph" INTEGER, "nfo:duration" INTEGER,;
NOCASE, "nmm:genre:graph" INTEGER, "nmm:skipCounter" INTEGER,;
NOCASE, "nmm:dlnaProfile:graph" INTEGER, "nmm:dlnaMime" TEXT COLLATE
NOCASE, "nmm:dlnaMime:graph" INTEGER, "nmm:uPnPShared" INTEGER,;
CREATE TABLE "nfo:MediaFileListEntry" (ID INTEGER NOT NULL PRIMARY
KEY, "nfo:listPosition" REAL, "nfo:listPosition:graph" INTEGER,;
CREATE TABLE "nfo:MediaList" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:MediaList_nfo:hasMediaFileListEntry" (ID INTEGER NOT
NULL, "nfo:hasMediaFileListEntry" INTEGER NOT NULL,;
CREATE TABLE "nfo:MediaList_nfo:mediaListEntry" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nfo:MediaStream" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Media_mtp:hidden" (ID INTEGER NOT NULL, "mtp:hidden"
INTEGER NOT NULL, "mtp:hidden:graph" INTEGER);
CREATE TABLE "nfo:Media_nmm:alternativeMedia" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nfo:MindMap" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Note" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:OperatingSystem" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Orientation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:PaginatedTextDocument" (ID INTEGER NOT NULL PRIMARY
KEY, "nfo:pageCount" INTEGER, "nfo:pageCount:graph" INTEGER);
CREATE TABLE "nfo:PlainTextDocument" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Presentation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:RasterImage" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:RegionOfInterest" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:regionOfInterestHeight" REAL,;
INTEGER, "nfo:regionOfInterestType:graph" INTEGER, "nfo:roiRefersTo"
INTEGER, "nfo:roiRefersTo:graph" INTEGER);
CREATE TABLE "nfo:RegionOfInterestContent" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:RemoteDataObject" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:RemotePortAddress" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Software" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:SoftwareApplication" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:SoftwareCategory" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nfo:SoftwareItem" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:SoftwareService" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:SourceCode" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:programmingLanguage" TEXT COLLATE NOCASE,;
COLLATE NOCASE, "nfo:definesClass:graph" INTEGER,;
COLLATE NOCASE, "nfo:definesGlobalVariable:graph" INTEGER);
CREATE TABLE "nfo:Spreadsheet" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:TextDocument" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:Trash" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:VectorImage" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nfo:Video" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:frameCount:graph" INTEGER, "nfo:averageVideoBitrate"
REAL, "nfo:averageVideoBitrate:graph" INTEGER);
CREATE TABLE "nfo:Visual" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nfo:aspectRatio" REAL, "nfo:aspectRatio:graph" INTEGER,;
INTEGER, "nfo:colorDepth" INTEGER, "nfo:colorDepth:graph" INTEGER);
CREATE TABLE "nfo:WebHistory" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nfo:Website" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nid3:ID3Audio" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nid3:contentType" TEXT COLLATE NOCASE,;
NOCASE, "nid3:trackNumber:graph" INTEGER, "nid3:partOfSet" TEXT
COLLATE NOCASE, "nid3:partOfSet:graph" INTEGER, "nid3:comments" TEXT
COLLATE NOCASE, "nid3:comments:graph" INTEGER);
CREATE TABLE "nid3:ID3Audio_nid3:leadArtist" (ID INTEGER NOT NULL,;
CREATE TABLE "nie:DataObject" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nie:created" INTEGER, "nie:created:graph" INTEGER,;
INTEGER, "tracker:available" INTEGER, "tracker:available:graph"
INTEGER);
CREATE TABLE "nie:DataObject_nie:dataSource" (ID INTEGER NOT NULL,;
CREATE TABLE "nie:DataObject_nie:isPartOf" (ID INTEGER NOT NULL,;
CREATE TABLE "nie:DataSource" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nie:InformationElement" (ID INTEGER NOT NULL PRIMARY
KEY, "nie:title" TEXT COLLATE NOCASE, "nie:title:graph" INTEGER,;
INTEGER, "nie:contentLastModified:localDate" INTEGER,;
COLLATE NOCASE, "nie:subject:graph" INTEGER, "nie:mimeType" TEXT
COLLATE NOCASE, "nie:mimeType:graph" INTEGER, "nie:language" TEXT
COLLATE NOCASE, "nie:language:graph" INTEGER, "nie:plainTextContent"
TEXT COLLATE NOCASE, "nie:plainTextContent:graph" INTEGER,;
INTEGER, "nie:disclaimer" TEXT COLLATE NOCASE, "nie:disclaimer:graph"
INTEGER, "nie:depends" INTEGER, "nie:depends:graph" INTEGER,;
COLLATE NOCASE, "nie:copyright:graph" INTEGER, "nie:comment" TEXT
COLLATE NOCASE, "nie:comment:graph" INTEGER, "nie:isStoredAs"
INTEGER, "nie:isStoredAs:graph" INTEGER, "nie:version" TEXT COLLATE
NOCASE, "nie:version:graph" INTEGER, "nie:contentCreated" INTEGER,;
INTEGER, "nie:contentCreated:localTime" INTEGER, "nie:contentAccessed"
INTEGER, "nie:contentAccessed:graph" INTEGER,;
NOCASE, "nie:license:graph" INTEGER, "nie:identifier" TEXT COLLATE
NOCASE, "nie:identifier:graph" INTEGER, "nie:licenseType" TEXT
COLLATE NOCASE, "nie:licenseType:graph" INTEGER, "nie:characterSet"
TEXT COLLATE NOCASE, "nie:characterSet:graph" INTEGER,;
INTEGER, "slo:location" INTEGER, "slo:location:graph" INTEGER,;
TEXT COLLATE NOCASE, "osinfo:id:graph" INTEGER, "osinfo:mediaId" TEXT
COLLATE NOCASE, "osinfo:mediaId:graph" INTEGER);
CREATE TABLE "nie:InformationElement_mlo:location" (ID INTEGER NOT
NULL, "mlo:location" INTEGER NOT NULL, "mlo:location:graph" INTEGER);
CREATE TABLE "nie:InformationElement_nao:hasProperty" (ID INTEGER NOT
NULL, "nao:hasProperty" INTEGER NOT NULL, "nao:hasProperty:graph"
INTEGER);
CREATE TABLE "nie:InformationElement_nco:contributor" (ID INTEGER NOT
NULL, "nco:contributor" INTEGER NOT NULL, "nco:contributor:graph"
INTEGER);
CREATE TABLE "nie:InformationElement_nco:creator" (ID INTEGER NOT
NULL, "nco:creator" INTEGER NOT NULL, "nco:creator:graph" INTEGER);
CREATE TABLE "nie:InformationElement_nie:hasLogicalPart" (ID INTEGER
NOT NULL, "nie:hasLogicalPart" INTEGER NOT NULL,;
CREATE TABLE "nie:InformationElement_nie:hasPart" (ID INTEGER NOT
NULL, "nie:hasPart" INTEGER NOT NULL, "nie:hasPart:graph" INTEGER);
CREATE TABLE "nie:InformationElement_nie:informationElementDate" (ID
INTEGER NOT NULL, "nie:informationElementDate" INTEGER NOT NULL,;
CREATE TABLE "nie:InformationElement_nie:isLogicalPartOf" (ID INTEGER
NOT NULL, "nie:isLogicalPartOf" INTEGER NOT NULL,;
CREATE TABLE "nie:InformationElement_nie:keyword" (ID INTEGER NOT
NULL, "nie:keyword" TEXT NOT NULL, "nie:keyword:graph" INTEGER);
CREATE TABLE "nie:InformationElement_nie:relatedTo" (ID INTEGER NOT
NULL, "nie:relatedTo" INTEGER NOT NULL, "nie:relatedTo:graph"
INTEGER);
CREATE TABLE "nmm:AnalogRadio" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmm:Artist" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nmm:DigitalRadio" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmm:Flash" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmm:ImageList" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmm:MeteringMode" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmm:MusicAlbum" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmm:MusicAlbumDisc" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmm:MusicAlbum_nmm:albumArtist" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:MusicPiece" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmm:composer:graph" INTEGER, "nmm:lyricist" INTEGER,;
CREATE TABLE "nmm:MusicPiece_nmm:lyrics" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:Photo" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmm:flash:graph" INTEGER, "nmm:fnumber" REAL,;
CREATE TABLE "nmm:Playlist" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmm:RadioModulation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmm:RadioStation" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmm:radioPTY:graph" INTEGER);
CREATE TABLE "nmm:RadioStation_nmm:carrier" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:SynchronizedText" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nmm:Video" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmm:season:graph" INTEGER, "nmm:episodeNumber" INTEGER,;
NOCASE, "mtp:fourCC:graph" INTEGER, "mtp:waveformat" TEXT COLLATE
NOCASE, "mtp:waveformat:graph" INTEGER);
CREATE TABLE "nmm:Video_mtp:scantype" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:Video_nmm:director" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:Video_nmm:leadActor" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:Video_nmm:subtitle" (ID INTEGER NOT NULL,;
CREATE TABLE "nmm:WhiteBalance" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:Attachment" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:Call" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmo:CommunicationChannel" (ID INTEGER NOT NULL PRIMARY
KEY, "nmo:lastMessageDate" INTEGER, "nmo:lastMessageDate:graph"
INTEGER, "nmo:lastMessageDate:localDate" INTEGER,;
CREATE TABLE "nmo:CommunicationChannel_nmo:hasParticipant" (ID INTEGER
NOT NULL, "nmo:hasParticipant" INTEGER NOT NULL,;
CREATE TABLE "nmo:Conversation" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:DeliveryStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:Email" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmo:isRecent:graph" INTEGER, "nmo:status" TEXT COLLATE
NOCASE, "nmo:status:graph" INTEGER, "nmo:responseType" TEXT COLLATE
NOCASE, "nmo:responseType:graph" INTEGER);
CREATE TABLE "nmo:Email_nmo:contentMimeType" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nmo:IMMessage" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:MMSMessage" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "nmo:MailAccount" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmo:accountDisplayName" TEXT COLLATE NOCASE,;
CREATE TABLE "nmo:MailFolder" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nmo:MailboxDataObject" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:Message" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "nmo:isAnswered:graph" INTEGER, "nmo:isDeleted" INTEGER,;
INTEGER, "nmo:isSent" INTEGER, "nmo:isSent:graph" INTEGER,;
NOCASE, "nmo:messageId:graph" INTEGER, "nmo:messageSubject" TEXT
COLLATE NOCASE, "nmo:messageSubject:graph" INTEGER,;
INTEGER, "nmo:replyTo" INTEGER, "nmo:replyTo:graph" INTEGER,;
INTEGER, "nmo:conversation:graph" INTEGER, "nmo:communicationChannel"
INTEGER, "nmo:communicationChannel:graph" INTEGER,;
INTEGER, "nmo:reportReadStatus" INTEGER, "nmo:reportReadStatus:graph"
INTEGER, "nmo:mustAnswerReportRead" INTEGER,;
NOCASE, "nmo:mmsId:graph" INTEGER);
CREATE TABLE "nmo:MessageHeader" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "nmo:Message_nmo:bcc" (ID INTEGER NOT NULL, "nmo:bcc"
INTEGER NOT NULL, "nmo:bcc:graph" INTEGER);
CREATE TABLE "nmo:Message_nmo:cc" (ID INTEGER NOT NULL, "nmo:cc"
INTEGER NOT NULL, "nmo:cc:graph" INTEGER);
CREATE TABLE "nmo:Message_nmo:hasAttachment" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nmo:Message_nmo:inReplyTo" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:Message_nmo:messageHeader" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "nmo:Message_nmo:recipient" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:Message_nmo:references" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:Message_nmo:to" (ID INTEGER NOT NULL, "nmo:to"
INTEGER NOT NULL, "nmo:to:graph" INTEGER);
CREATE TABLE "nmo:MimePart" (ID INTEGER NOT NULL PRIMARY KEY,;
TEXT COLLATE NOCASE, "nmo:contentDescription:graph" INTEGER,;
CREATE TABLE "nmo:MimePart_nmo:mimeHeader" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:Multipart" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:Multipart_nmo:partBoundary" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:PermanentChannel" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:PhoneMessage" (ID INTEGER NOT NULL PRIMARY KEY,;
TEXT COLLATE NOCASE, "nmo:encoding:graph" INTEGER,;
CREATE TABLE "nmo:PhoneMessageFolder" (ID INTEGER NOT NULL PRIMARY
KEY, "nmo:phoneMessageFolderId" TEXT COLLATE NOCASE,;
CREATE TABLE "nmo:PhoneMessageFolder_nmo:containsPhoneMessage" (ID
INTEGER NOT NULL, "nmo:containsPhoneMessage" INTEGER NOT NULL,;
CREATE TABLE "nmo:PhoneMessageFolder_nmo:containsPhoneMessageFolder";
NULL, "nmo:containsPhoneMessageFolder:graph" INTEGER);
CREATE TABLE "nmo:PhoneMessage_nmo:toVCard" (ID INTEGER NOT NULL,;
CREATE TABLE "nmo:ReportReadStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:SMSMessage" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:TransientChannel" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nmo:VOIPCall" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "nrl:InverseFunctionalProperty" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "osinfo:Installer" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "poi:ObjectOfInterest" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "rdf:Property" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "rdfs:range:graph" INTEGER, "tracker:indexed" INTEGER,;
INTEGER, "tracker:fulltextIndexed:graph" INTEGER,;
INTEGER, "tracker:transient" INTEGER, "tracker:transient:graph"
INTEGER, "tracker:weight" INTEGER, "tracker:weight:graph" INTEGER,;
CREATE TABLE "rdf:Property_rdfs:subPropertyOf" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "rdfs:Class" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "rdfs:Class_rdfs:subClassOf" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Class_tracker:domainIndex" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "rdfs:Literal" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "rdfs:Resource" (ID INTEGER NOT NULL PRIMARY KEY,
Available INTEGER NOT NULL, "rdfs:comment" TEXT COLLATE NOCASE,;
INTEGER, "nao:lastModified:localTime" INTEGER);
CREATE TABLE "rdfs:Resource_dc:contributor" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_dc:date" (ID INTEGER NOT NULL, "dc:date"
INTEGER NOT NULL, "dc:date:graph" INTEGER, "dc:date:localDate" INTEGER
NOT NULL, "dc:date:localTime" INTEGER NOT NULL);
CREATE TABLE "rdfs:Resource_dc:relation" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_dc:source" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_nao:deprecated" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_nao:hasTag" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_nao:isRelated" (ID INTEGER NOT NULL,;
CREATE TABLE "rdfs:Resource_rdf:type" (ID INTEGER NOT NULL, "rdf:type"
INTEGER NOT NULL, "rdf:type:graph" INTEGER);
CREATE TABLE "scal:AccessLevel" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:AttendanceStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:Attendee" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "scal:attendeeRole" INTEGER, "scal:attendeeRole:graph"
INTEGER, "scal:attendeeContact" INTEGER, "scal:attendeeContact:graph"
INTEGER, "scal:rsvp" INTEGER, "scal:rsvp:graph" INTEGER,;
INTEGER);
CREATE TABLE "scal:AttendeeRole" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:Attendee_scal:delegated-from" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "scal:Attendee_scal:delegated-to" (ID INTEGER NOT NULL,;
INTEGER);
CREATE TABLE "scal:Attendee_scal:member" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:Attendee_scal:sent-by" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:Calendar" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:CalendarAlarm" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "scal:CalendarAlarm_scal:alarmAttendee" (ID INTEGER NOT
NULL, "scal:alarmAttendee" INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "scal:start" INTEGER, "scal:start:graph" INTEGER, "scal:end"
INTEGER, "scal:end:graph" INTEGER, "scal:isAllDay" INTEGER,;
CREATE TABLE "scal:CalendarItem_scal:access" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem_scal:attachment" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem_scal:attendee" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem_scal:belongsToCalendar" (ID INTEGER
NOT NULL, "scal:belongsToCalendar" INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem_scal:contact" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarItem_scal:rrule" (ID INTEGER NOT NULL,;
CREATE TABLE "scal:CalendarUserType" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:Event" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "scal:EventStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:Journal" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "scal:JournalStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:RSVPValues" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:RecurrenceRule" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "scal:recurrenceStartDate:graph" INTEGER, "scal:exception"
INTEGER, "scal:exception:graph" INTEGER);
CREATE TABLE "scal:TimePoint" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "scal:Todo" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER, "scal:due:graph" INTEGER, "scal:completed" INTEGER,;
CREATE TABLE "scal:TodoStatus" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "scal:TransparencyValues" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "slo:GeoLocation" (ID INTEGER NOT NULL PRIMARY KEY,;
REAL, "slo:longitude:graph" INTEGER, "slo:verticalAccuracy" REAL,;
REAL, "slo:boundingLatitudeMax:graph" INTEGER,;
INTEGER, "slo:boundingLongitudeMax" REAL,;
CREATE TABLE "slo:Landmark" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "slo:LandmarkCategory" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "slo:Landmark_slo:belongsToCategory" (ID INTEGER NOT
NULL, "slo:belongsToCategory" INTEGER NOT NULL,;
CREATE TABLE "slo:Landmark_slo:hasContact" (ID INTEGER NOT NULL,;
CREATE TABLE "slo:Route" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE TABLE "slo:Route_slo:routeDetails" (ID INTEGER NOT NULL,;
CREATE TABLE "tracker:Namespace" (ID INTEGER NOT NULL PRIMARY KEY,;
INTEGER);
CREATE TABLE "tracker:Ontology" (ID INTEGER NOT NULL PRIMARY KEY);
CREATE TABLE "tracker:Volume" (ID INTEGER NOT NULL PRIMARY KEY,;
CREATE UNIQUE INDEX "mfo:FeedMessage_mfo:enclosureList_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoBoundingBox_mlo:bbNorthWest_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoBoundingBox_mlo:bbSouthEast_ID_ID" ON;
CREATE INDEX "mlo:GeoLocation_mlo:asBoundingBox_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoLocation_mlo:asBoundingBox_ID_ID" ON;
CREATE INDEX "mlo:GeoLocation_mlo:asGeoPoint_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoLocation_mlo:asGeoPoint_ID_ID" ON;
CREATE INDEX "mlo:GeoLocation_mlo:asPostalAddress_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoLocation_mlo:asPostalAddress_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:address_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:altitude_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:city_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:country_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:latitude_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:longitude_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:state_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoPoint_mlo:timestamp_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:GeoSphere_mlo:radius_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:LandmarkCategory_mlo:isRemovable_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:Landmark_mlo:belongsToCategory_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:Landmark_mlo:poiLocation_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:LocationBoundingBox_mlo:boxEastLimit_ID_ID"
ON "mlo:LocationBoundingBox_mlo:boxEastLimit" (ID,;
CREATE UNIQUE INDEX "mlo:LocationBoundingBox_mlo:boxNorthLimit_ID_ID"
ON "mlo:LocationBoundingBox_mlo:boxNorthLimit" (ID,;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX "mlo:Route_mlo:endTime_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:Route_mlo:routeDetails_ID_ID" ON;
CREATE UNIQUE INDEX "mlo:Route_mlo:startTime_ID_ID" ON;
CREATE UNIQUE INDEX "mto:Transfer_mto:transferList_ID_ID" ON;
CREATE UNIQUE INDEX "mto:Transfer_mto:transferPrivacyLevel_ID_ID" ON;
CREATE UNIQUE INDEX "mto:UploadTransfer_mto:transferCategory_ID_ID" ON;
CREATE UNIQUE INDEX "nao:Tag_tracker:isDefaultTag_ID_ID" ON;
CREATE UNIQUE INDEX "nao:Tag_tracker:tagRelatedTo_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:Alarm_ncal:action_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:BydayRulePart_ncal:bydayModifier_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:BydayRulePart_ncal:bydayWeekday_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:Calendar_ncal:component_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:Freebusy_ncal:freebusy_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:byday_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:byhour_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:byminute_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:bymonth_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:bymonthday_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:bysecond_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:bysetpos_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:byweekno_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:RecurrenceRule_ncal:byyearday_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:attach_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:attendee_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:categories_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:exdate_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:exrule_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:hasAlarm_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:ncalRelation_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:rdate_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:relatedToChild_ID_ID"
ON "ncal:UnionParentClass_ncal:relatedToChild" (ID,;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:relatedToParent_ID_ID"
ON "ncal:UnionParentClass_ncal:relatedToParent" (ID,;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:resources_ID_ID" ON;
CREATE UNIQUE INDEX "ncal:UnionParentClass_ncal:rrule_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Affiliation_nco:title_ID_ID" ON;
CREATE UNIQUE INDEX "nco:ContactList_nco:containsContact_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_ncal:anniversary_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_ncal:birthday_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_nco:belongsToGroup_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_nco:note_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_scal:anniversary_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Contact_scal:birthday_ID_ID" ON;
CREATE UNIQUE INDEX "nco:IMAccount_nco:hasIMContact_ID_ID" ON;
CREATE UNIQUE INDEX "nco:IMAddress_nco:imCapability_ID_ID" ON;
CREATE UNIQUE INDEX "nco:PersonContact_nco:hasAffiliation_ID_ID" ON;
CREATE INDEX "nco:PersonContact_nco:nameFamily" ON "nco:PersonContact";
CREATE INDEX "nco:PhoneNumber_nco:phoneNumber" ON "nco:PhoneNumber";
CREATE UNIQUE INDEX "nco:Role_nco:blogUrl_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:foafUrl_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:hasContactMedium_ID_ID" ON;
CREATE INDEX "nco:Role_nco:hasEmailAddress_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:hasEmailAddress_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:hasIMAddress_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:hasPhoneNumber_ID_ID" ON;
CREATE INDEX "nco:Role_nco:hasPostalAddress_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:hasPostalAddress_ID_ID" ON;
CREATE UNIQUE INDEX "nco:Role_nco:url_ID_ID" ON "nco:Role_nco:url";
CREATE UNIQUE INDEX "nco:Role_nco:websiteUrl_ID_ID" ON;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX "nfo:BookmarkFolder_nfo:containsBookmark_ID_ID" ON;
CREATE INDEX "nfo:FileDataObject_nfo:fileLastModified" ON;
CREATE UNIQUE INDEX "nfo:Image_nfo:depicts_ID_ID" ON;
CREATE UNIQUE INDEX "nfo:Image_nfo:hasRegionOfInterest_ID_ID" ON;
CREATE UNIQUE INDEX "nfo:MediaList_nfo:hasMediaFileListEntry_ID_ID" ON;
CREATE UNIQUE INDEX "nfo:MediaList_nfo:mediaListEntry_ID_ID" ON;
CREATE UNIQUE INDEX "nfo:Media_mtp:hidden_ID_ID" ON;
CREATE UNIQUE INDEX "nfo:Media_nmm:alternativeMedia_ID_ID" ON;
CREATE INDEX "nfo:Visual_nie:contentCreated" ON "nfo:Visual";
CREATE UNIQUE INDEX "nid3:ID3Audio_nid3:leadArtist_ID_ID" ON;
CREATE UNIQUE INDEX "nie:DataObject_nie:dataSource_ID_ID" ON;
CREATE UNIQUE INDEX "nie:DataObject_nie:isPartOf_ID_ID" ON;
CREATE INDEX "nie:DataObject_nie:url" ON "nie:DataObject" ("nie:url");
CREATE INDEX "nie:InformationElement_mlo:location_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_mlo:location_ID_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_nao:hasProperty_ID_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_nco:contributor_ID_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_nco:creator_ID_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_nie:hasLogicalPart_ID_ID"
ON "nie:InformationElement_nie:hasLogicalPart" (ID,;
CREATE UNIQUE INDEX "nie:InformationElement_nie:hasPart_ID_ID" ON;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX "nie:InformationElement_nie:isLogicalPartOf_ID_ID"
ON "nie:InformationElement_nie:isLogicalPartOf" (ID,;
CREATE UNIQUE INDEX "nie:InformationElement_nie:keyword_ID_ID" ON;
CREATE UNIQUE INDEX "nie:InformationElement_nie:relatedTo_ID_ID" ON;
CREATE INDEX "nie:InformationElement_slo:location" ON;
CREATE INDEX "nmm:Artist_nmm:artistName" ON "nmm:Artist" ("nmm:artistName");
CREATE INDEX "nmm:MusicAlbum_nie:title" ON "nmm:MusicAlbum" ("nie:title");
CREATE UNIQUE INDEX "nmm:MusicAlbum_nmm:albumArtist_ID_ID" ON;
CREATE INDEX "nmm:MusicPiece_nie:title" ON "nmm:MusicPiece" ("nie:title");
CREATE UNIQUE INDEX "nmm:MusicPiece_nmm:lyrics_ID_ID" ON;
CREATE INDEX "nmm:MusicPiece_nmm:musicAlbum" ON "nmm:MusicPiece";
CREATE INDEX "nmm:MusicPiece_nmm:performer" ON "nmm:MusicPiece";
CREATE UNIQUE INDEX "nmm:RadioStation_nmm:carrier_ID_ID" ON;
CREATE UNIQUE INDEX "nmm:Video_mtp:scantype_ID_ID" ON;
CREATE UNIQUE INDEX "nmm:Video_nmm:director_ID_ID" ON;
CREATE UNIQUE INDEX "nmm:Video_nmm:leadActor_ID_ID" ON;
CREATE UNIQUE INDEX "nmm:Video_nmm:subtitle_ID_ID" ON;
CREATE INDEX "nmo:Call_nmo:sentDate" ON "nmo:Call" ("nmo:sentDate");
CREATE INDEX "nmo:CommunicationChannel_nmo:hasParticipant_ID" ON;
CREATE UNIQUE INDEX;
ID);
CREATE INDEX "nmo:CommunicationChannel_nmo:lastMessageDate" ON;
CREATE UNIQUE INDEX "nmo:Email_nmo:contentMimeType_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:bcc_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:cc_ID_ID" ON "nmo:Message_nmo:cc";
CREATE INDEX "nmo:Message_nmo:communicationChannel" ON "nmo:Message";
CREATE INDEX "nmo:Message_nmo:conversation" ON "nmo:Message";
CREATE INDEX "nmo:Message_nmo:from" ON "nmo:Message" ("nmo:from");
CREATE UNIQUE INDEX "nmo:Message_nmo:hasAttachment_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:inReplyTo_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:messageHeader_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:recipient_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Message_nmo:references_ID_ID" ON;
CREATE INDEX "nmo:Message_nmo:sender" ON "nmo:Message" ("nmo:sender");
CREATE INDEX "nmo:Message_nmo:sentDate" ON "nmo:Message" ("nmo:sentDate");
CREATE INDEX "nmo:Message_nmo:to_ID" ON "nmo:Message_nmo:to" (ID);
CREATE UNIQUE INDEX "nmo:Message_nmo:to_ID_ID" ON "nmo:Message_nmo:to";
CREATE UNIQUE INDEX "nmo:MimePart_nmo:mimeHeader_ID_ID" ON;
CREATE UNIQUE INDEX "nmo:Multipart_nmo:partBoundary_ID_ID" ON;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX;
CREATE UNIQUE INDEX "nmo:PhoneMessage_nmo:toVCard_ID_ID" ON;
CREATE UNIQUE INDEX "rdf:Property_rdfs:subPropertyOf_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Class_rdfs:subClassOf_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Class_tracker:domainIndex_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_dc:contributor_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_dc:date_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_dc:relation_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_dc:source_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_nao:deprecated_ID_ID" ON;
CREATE INDEX "rdfs:Resource_nao:hasTag_ID" ON "rdfs:Resource_nao:hasTag" (ID);
CREATE UNIQUE INDEX "rdfs:Resource_nao:hasTag_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_nao:isRelated_ID_ID" ON;
CREATE UNIQUE INDEX "rdfs:Resource_rdf:type_ID_ID" ON;
CREATE INDEX "rdfs:Resource_tracker:added" ON "rdfs:Resource" ("tracker:added");
CREATE UNIQUE INDEX "scal:Attendee_scal:delegated-from_ID_ID" ON;
CREATE UNIQUE INDEX "scal:Attendee_scal:delegated-to_ID_ID" ON;
CREATE UNIQUE INDEX "scal:Attendee_scal:member_ID_ID" ON;
CREATE UNIQUE INDEX "scal:Attendee_scal:sent-by_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarAlarm_scal:alarmAttendee_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:access_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:attachment_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:attendee_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:belongsToCalendar_ID_ID"
ON "scal:CalendarItem_scal:belongsToCalendar" (ID,;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:contact_ID_ID" ON;
CREATE UNIQUE INDEX "scal:CalendarItem_scal:rrule_ID_ID" ON;
CREATE INDEX "slo:GeoLocation_slo:postalAddress" ON "slo:GeoLocation";
CREATE UNIQUE INDEX "slo:Landmark_slo:belongsToCategory_ID_ID" ON;
CREATE UNIQUE INDEX "slo:Landmark_slo:hasContact_ID_ID" ON;
CREATE UNIQUE INDEX "slo:Route_slo:routeDetails_ID_ID" ON;
EXPLAIN SELECT "1_u", (SELECT "nco:fullname" FROM "nco:Contact" WHERE
ID = "1_u") COLLATE NOCASE, (SELECT "nco:nameFamily" FROM;
COLLATE NOCASE, (SELECT "nco:nameAdditional" FROM;
NOCASE, strftime("%s",(SELECT "nco:birthDate" FROM;
GROUP_CONCAT("2_u"||? COLLATE NOCASE||COALESCE((SELECT;
NOCASE, ? COLLATE NOCASE)||? COLLATE NOCASE||COALESCE((SELECT;
NOCASE, ? COLLATE NOCASE)||? COLLATE NOCASE||COALESCE((SELECT;
NOCASE, ? COLLATE NOCASE), '\n') FROM (SELECT;
GROUP_CONCAT("2_u"||? COLLATE NOCASE||(SELECT "nco:phoneNumber"
FROM "nco:PhoneNumber" WHERE ID = "4_u") COLLATE NOCASE, '\n')
FROM (SELECT "nco:PersonContact_nco:hasAffiliation4"."nco:hasAffiliation"
AS "2_u", "nco:Role_nco:hasPhoneNumber5"."nco:hasPhoneNumber" AS;
WHERE "1_u" = "nco:PersonContact_nco:hasAffiliation4"."ID" AND;
GROUP_CONCAT("2_u"||? COLLATE NOCASE||(SELECT "nco:emailAddress"
FROM "nco:EmailAddress" WHERE ID = "5_u") COLLATE NOCASE, ',')
FROM (SELECT "nco:PersonContact_nco:hasAffiliation6"."nco:hasAffiliation"
AS "2_u", "nco:Role_nco:hasEmailAddress7"."nco:hasEmailAddress"
AS "5_u" FROM "nco:PersonContact_nco:hasAffiliation" AS;
WHERE "1_u" = "nco:PersonContact_nco:hasAffiliation6"."ID" AND;
GROUP_CONCAT("2_u"||? COLLATE NOCASE||COALESCE((SELECT
GROUP_CONCAT((SELECT Uri FROM Resource WHERE ID =;
GROUP_CONCAT((SELECT Uri FROM Resource WHERE ID =;
GROUP_CONCAT((SELECT Uri FROM Resource WHERE ID = "nco:url"),',')
FROM "nco:Role_nco:url" WHERE ID = "2_u"), ? COLLATE NOCASE),;
GROUP_CONCAT("6_u", ',') FROM (SELECT;
Resource WHERE ID = "1_u"), (SELECT GROUP_CONCAT("2_u"||? COLLATE
NOCASE||COALESCE((SELECT "nco:role" FROM "nco:Affiliation" WHERE
ID = "2_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT "nco:department" FROM "nco:Affiliation"
WHERE ID = "2_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT GROUP_CONCAT("nco:title",',') FROM;
GROUP_CONCAT("nco:note",',') FROM "nco:Contact_nco:note" WHERE ID;
NOCASE||COALESCE((SELECT "nco:pobox" FROM "nco:PostalAddress"
WHERE ID = "7_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT "nco:district" FROM "nco:PostalAddress"
WHERE ID = "7_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT "nco:county" FROM "nco:PostalAddress"
WHERE ID = "7_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT "nco:locality" FROM "nco:PostalAddress"
WHERE ID = "7_u") COLLATE NOCASE, ? COLLATE NOCASE)||? COLLATE
NOCASE||COALESCE((SELECT "nco:postalcode" FROM;
NOCASE)||? COLLATE NOCASE||COALESCE((SELECT "nco:streetAddress"
FROM "nco:PostalAddress" WHERE ID = "7_u") COLLATE NOCASE, ?
COLLATE NOCASE)||? COLLATE NOCASE||COALESCE((SELECT Uri FROM
Resource WHERE ID = (SELECT "nco:addressLocation" FROM;
COLLATE NOCASE||COALESCE((SELECT "nco:extendedAddress" FROM;
NOCASE)||? COLLATE NOCASE||COALESCE((SELECT "nco:country" FROM;
NOCASE)||? COLLATE NOCASE||COALESCE((SELECT "nco:region" FROM;
NOCASE), '\n') FROM (SELECT;
AS "7_u" FROM "nco:PersonContact_nco:hasAffiliation" AS;
GROUP_CONCAT("10_u" COLLATE NOCASE, ',') FROM (SELECT;
NULL AND ("9_u" COLLATE NOCASE = ? COLLATE NOCASE))) FROM (SELECT;
DETACH x IS #1;
