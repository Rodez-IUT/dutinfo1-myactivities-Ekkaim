CREATE OR REPLACE FUNCTION find_all_activities_for_owner(username varchar(500)) RETURNS setof activity AS $$
	SELECT activity.* FROM activity JOIN "user" ON "user".id = activity.owner_id
	WHERE "user".username = find_all_activities_for_owner.username ;
$$ LANGUAGE SQL;
	