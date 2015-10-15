SELECT Substr(df.name,2,8) as filesystem,
       Sum(fs.phywrts) as writes
FROM v$datafile df, v$filestat fs
WHERE df.file# = fs.file#
GROUP BY Substr(df.name,2,8)
ORDER BY 2 desc
/
