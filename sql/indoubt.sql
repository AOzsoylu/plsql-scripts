select local_tran_id, Substr(global_tran_id,1,30) "global_tran_id", state, mixed, Substr(host,1,20) "host", commit#, fail_time
  from dba_2pc_pending
/
