create or replace function partcreate(part integer)
returns void as $$
DECLARE
partitions integer;
i integer;
rangestart integer;
rangeend integer;
valuestart integer;
valueend integer;

statement text;
BEGIN
partitions=part;
i=0;
rangestart=0;
rangeend=1000;
valuestart=0;
valueend=0;
CREATE TABLE abc (id SERIAL NOT NULL, a INT, dt TIMESTAMP) PARTITION BY RANGE (a);
while (i<part) loop
valuestart= i*1000;
valueend= ((i+1)*1000)-1;
rangestart= i*1000;
rangeend= (i+1)*1000;
statement := 'CREATE TABLE abc_' ||i|| ' PARTITION OF abc FOR VALUES START (' || rangestart || ') END ('|| rangeend || ');';
execute statement;
raise notice 'i%,rangestart %,rangeend %,valuestart %,valueend %',i,rangestart,rangeend,valuestart,valueend;
statement = 'INSERT INTO abc_'||i|| ' (a) SELECT generate_series(' || valuestart || ',' || valueend ||');';
execute statement;
i=i+1;
end loop;
END;
$$ language plpgsql;
