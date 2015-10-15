column column_name format a40
select owner, table_name, column_name, segment_name, tablespace_name
from dba_lobs
where owner NOT IN
        (  'SYS'
          ,'SYSTEM'
          ,'EXFSYS'
          ,'WMSYS'
          ,'DBSNMP'
          ,'OPTIM'
          ,'OUTLN'
          ,'CTXSYS'
          ,'SYSMAN','MGMT_VIEW','SYSMAN_MDS','SYSMAN_RO'
          ,'QUEST'
          ,'PERFSTAT'
          ,'DMSYS'
          ,'MDSYS'
          ,'ORDSYS'
          ,'XDB'
          ,'OLAPSYS'
          ,'ORDPLUGINS'
          ,'ORACLE_OCM'
          ,'FLOWS_020100'
          ,'APEX_030200'
          ,'CAST_LOCAL'
          ,'CAST_MNGT'
        )
  and segment_name in ( select segment_name from dba_segments where segment_type like '%LOB%' )
order by owner, table_name, column_name
/
