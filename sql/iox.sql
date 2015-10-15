SELECT Substr(df.name,1,50) as filename,
       fs.phyrds A,
       fs.phywrts B,
       fs.phyrds + fs.phywrts C
FROM v$datafile df, v$filestat fs
WHERE df.file# = fs.file#
  AND Substr(df.name,2,8) like '%&filesystem%'
ORDER BY C desc
/
