set serveroutput on size 200000
declare
  cursor mycur is
    SELECT tname FROM tab WHERE tabtype='TABLE' ORDER BY tname;
  myrec      mycur%ROWTYPE;
  tmyscript  varchar2(300);
  towner     varchar2(100);
  tdblink    varchar2(100);
begin
  dbms_output.put_line('-------------------------------');
  dbms_output.put_line('@insertinto <dblink>');
  dbms_output.put_line('-------------------------------');
  towner := Upper(User);
  tdblink := Upper('&1');
  Open mycur;
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
