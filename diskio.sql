column A heading "Physical|Reads"  format 9,999,999,990
column B heading "Physical|Writes" format 9,999,999,990
column C heading "Total" format 9,999,999,990 
select Substr(df.name,1,Instr(Substr(df.name,2),'/')+1) as name,
       Sum(fs.phyrds) A,
       Sum(fs.phywrts) B,
       Sum(fs.phyrds + fs.phywrts) C
FROM v$datafile df, v$filestat fs
WHERE df.file# = fs.file#
GROUP BY Substr(df.name,1,Instr(Substr(df.name,2),'/')+1)
ORDER by c desc
/
