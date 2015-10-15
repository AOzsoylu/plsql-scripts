select scr from (
select 1 num, 'DELETE FROM sys.pending_sessions$ WHERE local_tran_id = '''||local_tran_id||''';' scr from dba_2pc_pending
union
select 2 num, 'DELETE FROM sys.pending_trans$ WHERE local_tran_id = '''||local_tran_id||''';' scr from dba_2pc_pending
union
select 3 num, 'DELETE FROM sys.pending_sub_sessions$ WHERE local_tran_id = '''||local_tran_id||''';' scr from dba_2pc_pending
union
select 4 num, 'COMMIT;' scr from dual
) order by num
/
