declare
  cursor mycur ( powner  varchar2, pname  varchar2 ) is
    select text from dba_views where owner = powner and view_name = pname;
  temp     varchar2(200);
  tbuf     long;
  towner   varchar2(100);
  tvname   varchar2(100);
  tlen     number;
  tpos     number;
  tx       number;
begin
  towner := Upper('&1');
  tvname := Upper('&2');
  dbms_output.put_line( '========================================' );
  open mycur( towner, tvname );
  fetch mycur INTO tbuf;
  if mycur%FOUND Then
    tlen := Length( tbuf );
    tpos := 1;
    While tpos < tlen Loop
       temp := Substr( tbuf, tpos, 200 );
       tx := Instr(temp, CHR(10));
       If tx > 0 Then
         tx := tx+1;
         temp := Substr(temp,1,tx-2);
       Else
         tx := 200;
       End If;
       dbms_output.put_line( ' '||temp );
       tpos := (tpos + tx)-1 ;
    End Loop;
  End If;
  Close mycur;
  dbms_output.put_line( '========================================' );
End;
/
