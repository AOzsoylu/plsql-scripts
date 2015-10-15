set serveroutput on size 200000
declare
  mycur    SYS_REFCURSOR;
  tsay     number;
  --
  cursor tabcur is
    SELECT tname FROM tab WHERE tabtype='TABLE' order by tname;
  tabrec   tabcur%ROWTYPE;
  --
  tmysql   varchar2(500);
begin
  Open tabcur;
  Loop
    Fetch tabcur INTO tabrec;
    Exit when tabcur%NOTFOUND;
    --
    tmysql := 'SELECT count(*) FROM '||tabrec.tname;
    Open mycur FOR tmysql;
    Fetch mycur INTO tsay;
    if ( NVL(tsay,0) > 0 ) then
      dbms_output.put_line( tabrec.tname );
    end if;
    Close mycur;
    --
  End Loop;
  Close tabcur;
end;
/
