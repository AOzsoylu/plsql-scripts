select DECODE(Substr(a.account_status,1,1),
              'L','*',DECODE(DECODE(a.default_tablespace,'YAZGEL','AOZSOYLU',a.default_tablespace),
                             'AOZSOYLU',DECODE(a.username,
                                               'ATILLA',' ','>'),' ') ) as status
      ,a.username
      ,count(b.object_id) "object#"
      ,a.default_tablespace
      ,a.profile
      ,a.temporary_tablespace
      ,c.password
from sys.dba_users a, sys.dba_objects b, sys.user$ c
where a.username = b.owner(+)
  and a.account_status = 'OPEN'
  and a.user_id = c.user#
group by DECODE(Substr(a.account_status,1,1),
              'L','*',DECODE(DECODE(a.default_tablespace,'YAZGEL','AOZSOYLU',a.default_tablespace),
                             'AOZSOYLU',DECODE(a.username,
                                               'ATILLA',' ','>'),' ') ),
        a.username, a.default_tablespace, a.profile,
        a.temporary_tablespace,c.password
order by 1 desc,2 asc
/
