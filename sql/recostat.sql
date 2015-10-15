select usn, state, undoblockstotal "Total",
       undoblocksdone "Done",
       undoblockstotal-undoblocksdone "ToDo",
       decode(cputime,0,'unknown',To_Char(sysdate+(((undoblockstotal-undoblocksdone) / (undoblocksdone / cputime)) / 86400),'yyyy-mm-dd hh24:mi:ss')) "Estimated time"
from v$fast_start_transactions
/
