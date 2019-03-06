CREATE OR REPLACE FUNCTION get_default_owner() RETURNS "user" AS $$
	DECLARE
		defautlowner "user"%rawtype
	BEGIN
		SELECT * INTO defaultowner FROM "user" WHERE username='Default Owner';
		IF NOT FOUND THEN
			INSERT INTO "user"
				VALUES(nextval('id_generator'),'Default Owner');
			SELECT * INTO defaultowner FROM "user" WHERE username ='Default Owner';
		END IF;
		return defaultowner;
	END
$$ LANGUAGE SQL;