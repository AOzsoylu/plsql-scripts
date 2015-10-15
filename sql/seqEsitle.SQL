declare
  tsayi    number;
  tseq     varchar2(100);
  tmysql   varchar2(500);
  bitti    boolean;
  tx       number;
  mycur    SYS_REFCURSOR;
begin
  tseq := Upper('&sequence_name');
  tsayi := &sondeger;
  tmysql := 'select '||tseq||'.nextval from all_objects';
  bitti := false;
  while not bitti loop
    open mycur for tmysql;
    loop
      fetch mycur INTO tx;
      exit when mycur%notfound;
      if ( tx >= (tsayi-1) ) then
        bitti := true;
	exit;
      end if;
    end loop;
    close mycur;
  end loop;
end;
/
