CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$
	DECLARE
		defaultowner "user"%ROWTYPE;
	BEGIN
		SELECT * INTO defaultowner FROM "user" WHERE username='Default Owner';
		IF NOT FOUND THEN
			INSERT INTO "user"
				VALUES(nextval('id_generator'),'Default Owner');
			SELECT * INTO defaultowner FROM "user" WHERE username ='Default Owner';
		END IF;
		return defaultowner;
	END
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION fix_activities_without_owner() RETURNS SETOF activity AS $$
	DECLARE 
		userN bigint;
	BEGIN
		SELECT id INTO userN FROM "user" WHERE username = 'Default Owner';
		UPDATE activity SET owner_id = userN WHERE owner_id IS NULL;
		RETURN QUERY SELECT * FROM activity WHERE owner_id = unserN;				 
	END
$$LANGUAGE PLPGSQL;