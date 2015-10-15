set trimspool on
set serveroutput on size 200000
declare
  TYPE MyTabType is TABLE OF varchar2(200)
    index by binary_integer;
  mytab1    MyTabType;
  mytab2    MyTabType;
  mytab1len number(10);
  mytab2len number(10);
  --
  cursor mycur (pname  varchar2) is
    SELECT column_name from user_tab_columns
       WHERE table_name = pname;
  myrec      mycur%ROWTYPE;
  towner     varchar2(100);
  ttabname   varchar2(100);
  tdblink    varchar2(100);
begin
  dbms_output.put_line('---------------------------------');
  dbms_output.put_line('@insertintoy <tablename> <dblink>');
  dbms_output.put_line('---------------------------------');
  towner := Upper(User);
  ttabname := Upper('&1');
  tdblink := Upper('&2');
  mytab1len := 1;
  mytab1(mytab1len) := '| INSERT INTO '||ttabname||'( ';
  mytab2len := 1;
  mytab2(mytab2len) := '| SELECT';
  Open mycur( ttabname );
  Loop
    Fetch mycur INTO myrec;
    Exit When mycur%NOTFOUND;
    mytab1len := mytab1len + 1;
    mytab2len := mytab2len + 1;
    If ( mycur%rowcount = 1 ) Then
      mytab1(mytab1len) := '|      '||myrec.column_name;
      mytab2(mytab2len) := '|      '||myrec.column_name;
    Else
      mytab1(mytab1len) := '|      ,'||myrec.column_name;
      mytab2(mytab2len) := '|      ,'||myrec.column_name;
    End If;
  End Loop;
  Close mycur;
  mytab1(mytab1len) := mytab1(mytab1len)||' )';
  mytab2len := mytab2len + 1;
  mytab2(mytab2len) := '| FROM '||Upper(towner)||'.'||ttabname||'@'||Upper(tdblink)||';';
  For i IN 1..Mytab1Len Loop
    dbms_output.put_line( mytab1(i) );
  End Loop;
  For i IN 1..Mytab2Len Loop
    dbms_output.put_line( mytab2(i) );
  End Loop;
  dbms_output.put_line( '| COMMIT;' );
end;
/
