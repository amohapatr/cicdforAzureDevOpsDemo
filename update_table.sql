SET SERVEROUTPUT ON SIZE 1000000
DECLARE
  v_col_exists NUMBER 
BEGIN
  SELECT count(*) INTO v_col_exists
    FROM user_tab_cols
    WHERE column_name = 'EFFECTIVE_DATE'
      AND table_name = 'DEPARTMENTS';

   IF (v_col_exists = 0) THEN
      EXECUTE IMMEDIATE 'ALTER TABLE departments ADD effective_date DATE';
   ELSE
    DBMS_OUTPUT.PUT_LINE('The column effective_date already exists');
  END IF;
END;
/
