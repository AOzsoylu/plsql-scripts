column tarih format a20
select owner, table_name, to_char(last_analyzed,'dd/mm/yyyy hh24:mi:ss') tarih,
       'exec dbms_stats.gather_table_stats(ownname=>'''||owner||''',tabname=>'''||
       table_name||''', cascade=>true)' as analyze
from all_tables
where owner NOT IN ( 'SYS','SYSTEM','SYSMAN','DBSNMP','XDB','WMSYS',
                     'CTXSYS','OLAPSYS','EXFSYS','MDSYS','ORDSYS',
                     'OUTLN','TSMSYS','DMSYS', 'PERFSTAT',
                     'CRMPLAN' )
  AND last_analyzed is not null
order by owner, last_analyzed desc
/
