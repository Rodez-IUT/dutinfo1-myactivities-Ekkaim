CREATE OR REPLACE FUNCTION delete_activities_older_than(old_date date) RETURNS integer AS $$
  SELECT 1;
$$ LANGUAGE SQL;