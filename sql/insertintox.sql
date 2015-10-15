declare
  cursor mycur (pname  varchar2) is
    SELECT tname FROM tab WHERE tabtype='TABLE' AND tname like '%'||pname||'%' ORDER BY tname;
  myrec      mycur%ROWTYPE;
  tmyscript  varchar2(300);
  towner     varchar2(100);
  ttabname   varchar2(100);
  tdblink    varchar2(100);
begin
  dbms_output.put_line('---------------------------------');
  dbms_output.put_line('@insertintox <tablename> <dblink>');
  dbms_output.put_line('---------------------------------');
  towner := Upper(User);
  ttabname := Upper('&1');
  tdblink := Upper('&2');
  Open mycur( ttabname );
  Loop
    Fetch mycur INTO myrec;
    Exit When mycur%NOTFOUND;
    tmyscript := 'INSERT INTO '||myrec.tname||' SELECT * FROM '||Upper(towner)||'.'||myrec.tname||'@'||Upper(tdblink)||';';
    dbms_output.put_line( tmyscript );
    dbms_output.put_line( 'COMMIT;' );
  End Loop;
  Close mycur;
end;
/
