CREATE OR REPLACE FUNCTION fix_activities_without_owner(username varchar(500)) RETURNS SETOF activity AS $$
	DECLARE 
		userN "user"%ROWTYPE;
	BEGIN
		userN := get_default_owner();
		RETURN QUERY UPDATE activity
					 SET owner_id = userN.id
					 WHERE owner_id IS NULL
					 RETURNING *;
					 
	END;
$$LANGUAGE PLPGSQL;