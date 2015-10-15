select b.status, d.name from v$backup b, v$datafile d
where b.file# = d.file#
order by 1,2
/
