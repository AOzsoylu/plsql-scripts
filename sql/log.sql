select inst_id, group#, thread#, sequence#, bytes/1048576 as MBytes, blocksize, members, archived, status, first_change#, first_time, next_change#, next_time from gv$log
/
