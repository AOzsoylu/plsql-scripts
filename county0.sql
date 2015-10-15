set serveroutput on size 200000
declare
  mycur    SYS_REFCURSOR;
  tsay     number;
  --
  cursor tabcur is
    SELECT tname, tabtype FROM tab
      -- WHERE tabtype IN ('TABLE','VIEW','SYNONYM') order by tname;
      WHERE tabtype IN ('TABLE') order by tname;
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
    If ( tsay != 0 ) Then
      dbms_output.put_line( RPAD(tabrec.tabtype,8,' ')||RPAD(tabrec.tname,32,' ')||'-> '||To_Char(tsay,'fm9999999999999990') );
    End If;
    Close mycur;
    --
  End Loop;
  Close tabcur;
end;
/
