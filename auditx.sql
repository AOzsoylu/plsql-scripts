select sessionid, entryid, sqltext from aud$ where upper(sqltext) like Upper('%&text%')
/
