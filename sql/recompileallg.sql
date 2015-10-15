set head off feedback off verify off trimspool on
set linesize 1000
set pagesize 10000
spool recompileallg.lst
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
order by owner, object_name;
spool off
@recompileallg.lst
set head on feedback on verify on trimspool on
set linesize 1000
set pagesize 1000
host del recompileallg.lst
