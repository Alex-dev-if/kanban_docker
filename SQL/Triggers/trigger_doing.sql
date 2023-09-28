CREATE OR REPLACE FUNCTION update_colunas_doing()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    UPDATE colunas
    SET doing = (
      SELECT COUNT(*)
      FROM tasks
      WHERE tasks.status = 'Doing'
    )
	WHERE id = 1;
  ELSIF TG_OP = 'DELETE' THEN
    UPDATE colunas
    SET doing = (
      SELECT COUNT(*)
      FROM tasks
      WHERE tasks.status = 'Doing'
    )
    WHERE id = 1;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_colunas_doing_trigger
AFTER INSERT OR UPDATE OR DELETE ON tasks
FOR EACH ROW
EXECUTE FUNCTION update_colunas_doing();