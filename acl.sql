column acl format a30
column host format a30
column principal format a20
column privilege format a10
column is_grant format a8
select acl, host, lower_port, upper_port from DBA_NETWORK_ACLS;
select acl , principal , privilege , is_grant from DBA_NETWORK_ACL_PRIVILEGES;
