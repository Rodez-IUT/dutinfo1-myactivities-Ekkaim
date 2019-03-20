CREATE OR REPLACE FUNCTION to_log_action_on_activities() RETURNS TRIGGER AS $$
	DECLARE 
		idN bigint;
	BEGIN
		idN := OLD.id;
		INSERT INTO action_log (id, action_name, entity_name, entity_id, author)
		VALUES (nextval('id_generator'), lower(TG_OP), TG_RELNAME, idN, current_user);
	
		RETURN NULL;
	END;
$$LANGUAGE PLPGSQL;
	
CREATE TRIGGER to_log_action_on_activities
    AFTER DELETE ON activity
    FOR EACH ROW EXECUTE PROCEDURE to_log_action_on_activities();
		
			