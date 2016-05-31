create or replace function partcheck(partitions integer)
returns table (id integer, ax integer, dt timestamp) as $func$
DECLARE
var integer;
BEGIN
var := floor(random()*1000*partitions);
RAISE NOTICE 'var %.', var;
Return Query
select * FROM abc WHERE a = var;
END
$func$ language plpgsql
