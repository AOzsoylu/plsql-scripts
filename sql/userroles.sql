select lpad(' ', 2*level)||granted_role "Users-Roles-Privileges"
from
  (
    select null     grantee,
           username granted_role
    from dba_users
    where username like Upper('&username'||'%')
    union
    select grantee,
           granted_role
    from dba_role_privs
    union
    select grantee,
           privilege
    from dba_sys_privs
  )
start with grantee is null
connect by grantee = prior granted_role
/
