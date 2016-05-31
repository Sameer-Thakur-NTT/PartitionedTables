\set start random(1, :partitions) * 1000
BEGIN;
SELECT * FROM abc WHERE a >= :start and a < :start + 1000;
END;
