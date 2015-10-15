declare
  mycur    SYS_REFCURSOR;
  tsay     number;
  --
  cursor tabcur is
    SELECT tname, tabtype FROM tab
      WHERE tabtype IN ('SYNONYM') order by tname;
  tabrec   tabcur%ROWTYPE;
  --
  tmysql   varchar2(500);
begin
  Open tabcur;
  Loop
    Fetch tabcur INTO tabrec;
    Exit when tabcur%NOTFOUND;
    --
    begin
      tmysql := 'SELECT count(*) FROM '||tabrec.tname;
      Open mycur FOR tmysql;
      Fetch mycur INTO tsay;
      dbms_output.put_line( RPAD(tabrec.tabtype,8,' ')||RPAD(tabrec.tname,32,' ')||'-> '||To_Char(tsay,'fm9999999999999990') );
      Close mycur;
    exception
      when others then
      dbms_output.put_line( RPAD(tabrec.tabtype,8,' ')||RPAD(tabrec.tname,32,' ')||'-> ?' );
    end;
    --
  End Loop;
  Close tabcur;
end;
/
