

/*
SELECT m.name as tableName, 
       p.name as columnName
FROM sqlite_master m
left outer join pragma_table_info((m.name)) p
     on m.name <> p.name
order by tableName, columnName
;
*/

-- select name from pragma_table_info('sqlite_master');
 
 select name from pragma_table_info('fishbait');

 select name from pragma_table_info('meflintext');
 
 -- functor(T) :- select name from sqlite_master where type = 'table' and name = T;
  select name from sqlite_master where type = 'table' and name = 'fishbait';