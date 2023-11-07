Aufgabenblatt 04 Datenbanken
Julian Niethammer
30.10.23

Nr.1
a)
	c darf nicht null werden können
b)
	create table t(
	c int not null
	);
	alter table t add primary key(c);
	
Nr.2
a)

b)
	drop table if exists t1;
	drop table if exists t2;

	create table t1(
	id int primary key
	);
	INSERT into t1 VALUES(4711);
	
	create table t2(
	id int primary key,
	c int REFERENCES t1
	);
	INSERT into t2 VALUES(0,4711);
	DELETE FROM t2;
	DELETE FROM t1;
		
c)
	drop table t1;
	create table t1(
	id int primary key
	);
	INSERT into t1 values(4711);
	drop table t2;
	create table t2(
	id int primary key,
	c int REFERENCES t1 on DELETE set null
	);
	INSERT into t2 values(0,4711);
	DELETE from t1;
	
	Wenn t1 gelöschst wird, wird die Referenz in t2 auf Null gesetzt
	
d)
	drop table t1;
	create table t1(
	id int primary key
	);
	INSERT into t1 values(4711);
	drop table t2;
	create table t2(
	id int primary key,
	c int REFERENCES t1 on DELETE CASCADE
	);
	INSERT into t2 values (0,4711);
	DELETE from t1;
	
	Wenn t1 gelöschst wird, wird die Referenz in t2 auf gelöscht
	
e)
	drop table t1;
	create table t1(
	id int primary key
	);
	INSERT into t1 values(4711);
	
	drop table t2;
	create table t2(
	id int primary key,
	c int REFERENCES t1 on DELETE CASCADE
	);
	INSERT into t2 values(1,4711);
	
	drop table t3;
	create table t3(
	id int primary key,
	c int REFERENCES t2 on DELETE CASCADE
	);
	INSERT into t3 values (0,1);
	
f)
	ALTER TABLE t1 ADD c DEFAULT 0;
	
g)
	ALTER table t1 add CONSTRAINT constraint_t3 FOREIGN KEY (c) REFERENCES t3;
	
h)

i)
	INSERT into t1 VALUES(2,89);
	
	Nicht möglich da in jeder Tabelle CONSTRAINTs verletzt werden
	
	
	(alter table t1 drop constraint CONSTRAINT_T3)
	
j)
	create table t1(
	id int primary key
	c int
	);
	INSERT into t1 values(1, 2);
	
	create table t2(
	id int primary key,
	c int REFERENCES t1 on DELETE CASCADE
	);
	INSERT into t2 values(3,1);
	
	create table t3(
	id int primary key,
	c int REFERENCES t2 on DELETE CASCADE
	);
	INSERT into t3 values (2,3);
	
k.
	Wenn ein Datensatz aus t3 gelöscht wird werden durch cascade die referenzierten Datensätze mit entfernt
	
Nr.3

a)
	ALTER TABLE TITANIC embarkedID int

b)
	ALTER table titanic add CONSTRAINT constraint_embarked FOREIGN KEY (embarkedID) REFERENCES embarkedcity (id);
	
c)
	UPDATE TITANIC set embarkedID = 2 WHERE Embarked = 'C'
	UPDATE TITANIC set embarkedID = 3 WHERE Embarked = 'Q'
	UPDATE TITANIC set embarkedID = 4 WHERE Embarked = 'S'
	
d)
	alter table titanic drop column embarked
	
f)
	alter table embarkedcity add constraint cityunique unique (city_name)
	
g)
	delete from embarkedcity where city_name = null
