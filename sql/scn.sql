select To_Char(CURRENT_SCN,'fm99999999999999999990') as scn from v$database
union all
select To_Char(DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER,'fm99999999999999999990') as scn from dual
/
