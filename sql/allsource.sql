SET SERVEROUTPUT ON SIZE 1000000
SET ECHO OFF VERIFY OFF FEEDBACK OFF TRIMSPOOL ON PAGES 0 LINES 512 TERMOUT OFF
SPOOL allsourcex.sql
DECLARE
  CURSOR mycur IS
    SELECT distinct us.name, us.type,
           us.name||decode(us.type, 'PACKAGE BODY', 'B.SQL', '.SQL') spool_file
    FROM  user_source us
    ORDER BY us.name, us.type;
BEGIN
  FOR myrec IN mycur LOOP
    dbms_output.put_line('spool d:\proje\new\'||myrec.spool_file);
    dbms_output.put_line('@usersource '||myrec.name||' "'||myrec.type||'"');
    dbms_output.put_line('spool off');
  END LOOP;
END;
/
SPOOL OFF
@allsourcex.sql
SET FEEDBACK ON VERIFY ON TERMOUT ON HEAD ON
PROMPT Export complete!
