\set var random(1, 1000 *2)
BEGIN;
SELECT * FROM abc WHERE a = :var;
END;

