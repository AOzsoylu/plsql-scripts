select 'alter user '||name||' identified by values '''||password||''';'
from user$
where type#=1
  and name not in ('SYS','SYSTEM','OUTLN','DIP','TSMSYS','DBSNMP','ORACLE_OCM',
                   'WMSYS','EXFSYS','APPQOSSYS','SYSMAN','ANONYMOUS','MDDATA','ORACLE_OCS',
                   'XS$NULL','XDB','MGMT_VIEW')
order by 1
/
