select 'Dosya : '||name||' file# : '||a.file#||' block# : '||block#||'      fiziksel bozulma var.'
 from ( select file#, block# from v$backup_corruption
        union
        select file#, block# from v$copy_corruption ) a,
       v$datafile b
 where a.file# = b.file#
/
