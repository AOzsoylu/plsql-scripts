SELECT Substr(df.name,2,8) as filesystem,
       Sum(fs.phyrds) as reads
FROM v$datafile df, v$filestat fs
WHERE df.file# = fs.file#
GROUP BY Substr(df.name,2,8)
ORDER BY 2 desc
/
