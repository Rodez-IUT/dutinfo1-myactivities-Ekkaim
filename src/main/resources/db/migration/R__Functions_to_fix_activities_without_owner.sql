CREATE OR REPLACE FUNCTION fix_activities_without_owner(username varchar(500)) RETURNS  AS $$
	IF NOT FOUND THEN
	INSERT INTO "user"
	VALUES(<<id_default_owner>>,'Default Owner')
$$ LANGUAGE SQL;