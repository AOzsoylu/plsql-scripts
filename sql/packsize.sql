select * from user_object_size
  where type in ('FUNCTION','PROCEDURE','PACKAGE','PACKAGE BODY')
  order by name, type
/
