select Substr(name,1,20) as adi, total_mb, free_mb, Substr(path,1,50) as path from v$asm_disk
order by 1
/
