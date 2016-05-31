create table inh(a int, b int) partition by range ((a+b));
create table inh_1 partition of inh for values start (     0) end (  
10000);
create table inh_2 partition of inh for values start ( 10000) end (  
20000);
create table inh_3 partition of inh for values start ( 20000) end ( 
100000);

create index inh_1_a_idx on inh_1 (a);
create index inh_2_a_idx on inh_2 (a);
create index inh_3_a_idx on inh_3 (a);

insert into inh select i, i as j from generate_series(1, 10000) as f(i);


