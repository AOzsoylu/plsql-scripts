select to_char(sysdate,'dd-mm-yyyy hh24:mi:ss')||' '||
       DECODE(Substr(to_char(sysdate,'DAY'),1,3),
                                     'SUN', 'PAZAR',
                                     'MON', 'PAZARTES�',
                                     'TUE', 'SALI',
                                     'WED', '�AR�AMBA',
                                     'THU', 'PER�EMBE',
                                     'FRI', 'CUMA',
                                     'SAT', 'CUMARTES�') "tarih      saat     g�n"
 from dual
/
