select script from (
select 1 as sira, 'alter user &1 identified by &1;' as script from dual
union
select 2 as sira, 'connect &1/&1@&2' as script from dual
union
select 3 as sira, 'alter user &1 identified by values '''||password||''';'as script
  from   sys.dba_users
  where  username = upper('&1')
    and  username <> user )
order by sira
/
