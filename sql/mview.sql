select 'exec dbms_mview.refresh('''||mv.owner||'.'||mv.mview_name||''') ; ' refresh, substr(refresh_group||' - '||r.name,1,20) refresh_group,
        substr(mv.owner,1,12) "Owner",
        substr(mv.mview_name,1,20) "MView",
        substr(s.table_name,1,15) "Table",
        substr(decode(t.partitioned, 'YES', 'N/A', t.tablespace_name),1,15) "Tablespace",
        mv.refresh_mode "ref.mode",
        mv.refresh_method "ref.method",
        mv.build_mode "build_mode",
        mv.fast_refreshable "fast_refreshable",
        mv.last_refresh_type "last_refresh_type",
        to_char(mv.last_refresh_date,'DD-MM-YYYY hh24:mi:ss') "last_refresh_date",
        mv.use_no_index "use_no_index"
from dba_mviews mv, dba_snapshots s, dba_rgroup  r, dba_tables t
where t.owner = s.owner and t.table_name = s.table_name
  and refresh_group = r.refgroup(+)
  and s.owner = mv.owner and s.name = mv.mview_name
order by 1, 2
/
