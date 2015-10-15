select to_char(sysdate,'dd-mm-yyyy hh24:mi:ss')||' '||
       DECODE(Substr(to_char(sysdate,'DAY'),1,3),
                                     'SUN', 'PAZAR',
                                     'MON', 'PAZARTESÝ',
                                     'TUE', 'SALI',
                                     'WED', 'ÇARÞAMBA',
                                     'THU', 'PERÞEMBE',
                                     'FRI', 'CUMA',
                                     'SAT', 'CUMARTESÝ') "tarih      saat     gün"
 from dual
/
