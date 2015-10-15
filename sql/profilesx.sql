select b.name, a.resource#, c.name resource_name, a.type#, a.limit# from profile$ a, profname$ b, resource_map c
where a.profile# = b.profile#
  and a.resource# = c.resource#
order by a.profile#, a.resource#
/
