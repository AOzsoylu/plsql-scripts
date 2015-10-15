SELECT Substr(filesystem,1,7) as name, Sum(readwrites) as toplamio
FROM ( SELECT Substr(df.name,2,8) as filesystem,
              Sum(fs.phyrds) as reads,
              Sum(fs.phywrts) as writes,
              Sum(fs.phyrds+fs.phywrts) as readwrites
       FROM v$datafile df, v$filestat fs
       WHERE df.file# = fs.file#
       GROUP BY Substr(df.name,2,8)
       UNION ALL
       SELECT Substr(df.name,2,8) as filesystem,
              Sum(fs.phyrds) as reads,
              Sum(fs.phywrts) as writes,
              Sum(fs.phyrds+fs.phywrts) as readwrites
       FROM v$tempfile df, v$filestat fs
       WHERE df.file# = fs.file#
       GROUP BY Substr(df.name,2,8) )
GROUP BY Substr(filesystem,1,7)
ORDER BY 2 DESC
/
