select rpad(substr(NVL(name,' '),1,30),30,' ')
     ||rpad(substr(NVL(value,' '),1,30),30,' ')
     ||DATUM_TIME
 as sonuc from V$DATAGUARD_STATS
/
