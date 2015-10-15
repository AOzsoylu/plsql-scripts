select sid, row_wait_obj#, row_wait_file#, row_wait_block#, row_wait_row#
from v$session where sid = &sid
/
