set serverout on
exec dbms_output.enable(100000);
declare
  pag number;
  len number;
  c varchar2(10);
  charpp number:=8132/2;
begin
  FOR R in ( select rowid rid, dbms_lob.getlength( &1 ) len
      from &2 )
  LOOP
    if r.len is not null then
      for page in 0 .. R.len/charpp
        loop
          BEGIN
            select dbms_lob.substr( &1 ,1,1+(page*charpp)) into c
              from &2 where rowid=R.rid;
          exception
            when others then
              dbms_output.put_line('Error on rowid ' ||R.rid||' page '||page);
              dbms_output.put_line(sqlerrm);
          END;
        end loop;
    END IF;
  END LOOP;
end;
/
