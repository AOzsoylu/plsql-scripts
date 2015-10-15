select 'ALTER '||object_type||' "'||owner||'"."'||object_name||'" COMPILE TIMESTAMP ''2001-01-01:01:01:01'';'
  from all_objects
  where ( owner NOT IN
          (  'SYS'
            ,'SYSTEM'
            ,'EXFSYS'
            ,'WMSYS'
            ,'DBSNMP'
            ,'OUTLN'
            ,'CTXSYS'
            ,'SYSMAN'
            ,'QUEST'
            ,'PERFSTAT'
            ,'YAZGEL'
            ,'DMSYS'
            ,'MDSYS'
            ,'ORDSYS'
            ,'XDB'
            ,'OLAPSYS'
            ,'ORDPLUGINS'
            ,'ORACLE_OCM'
            ,'FLOWS_020100'
            ,'CAST_LOCAL'
          )
          AND object_type IN ('FUNCTION','PROCEDURE','PACKAGE','JAVA SOURCE' )
        )
    AND object_type IN ('FUNCTION','PROCEDURE','PACKAGE','JAVA SOURCE' )
    AND timestamp != '2001-01-01:01:01:01'
order by owner, object_name
/
