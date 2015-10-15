   select ktuxeusn, to_char(sysdate,'DD-MON-YYYY HH24:MI:SS') "Time", ktuxesiz, ktuxesta
   from x$ktuxe
   where ktuxecfl = 'DEAD'
/
