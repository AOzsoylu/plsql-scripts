select To_Char(sum(bytes),'fm999,999,999,999,999') as toplam from user_extents where segment_name = UPPER('&name')
/
