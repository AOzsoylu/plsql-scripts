set serveroutput on
declare
  tstring    varchar2(500) := '&1';
  thashval   varchar2(32);
  tret       varchar2(32);
Begin
  thashval := sys.dbms_obfuscation_toolkit.md5(input_string=> tstring);
  SELECT Lower(To_Char(RAWTOHEX(thashval))) INTO tret FROM dual;
  dbms_output.put_line( tret );
Exception
  When OTHERS Then
    dbms_output.put_line( sqlerrm );
end;
/
