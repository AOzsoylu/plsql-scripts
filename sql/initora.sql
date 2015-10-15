SELECT Substr(name,1,40) as name,
       DECODE(isdefault,'TRUE','Default',' ') as IsDefault,
       Substr(Decode(type, 1, 'boolean', 2, 'string', 3, 'number', 4, 'file', 6, 'amount', type ),1,10) as type,
       value
FROM v$parameter
order by name
/
