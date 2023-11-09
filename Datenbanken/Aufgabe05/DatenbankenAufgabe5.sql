Datenbanken Aufgaben 05
9.11.2023
Julian Niethammer

Nr.1

a)
	
	- In keiner Spalte kann int genutzt werden
	
	- Taxa, Type, Sample ID können not Null sein
	
	- Voucher ID, rpoB, rpoC, matK, tmH-psbA, rpl32-tmL können unique sein
	
	- type hat nur wenig verschiedene Werte
	
	- ein künstlich erzeugter Primärschlüssel ist die beste Option
	
b)
	41, 1, 11, 21, 9, 68, 8, 8, 8, 8, 8
	
c)
	create table barcodes (
	id int generated always as identity primary key,
	taxon varchar(41) not null,
	type varchar(1),
	voucherID varchar(11) unique,
	gardenID varchar(21),
	sampleID varchar(9) not null,
	origin varchar(68),
	rpoB varchar(8) unique,
	rpoC varchar(8) unique,
	matK varchar(8) unique,
	trnHpsbA varchar(8) unique,
	rpl32 varchar(8) unique
	)
	
Nr.2

a)
	insert into barcodes (Taxon, Type, VoucherID, GardenID, SampleID, Origin, rpoB, rpoC, matK, trnhpsbA, rpl32)
	select *
	from csvread('C:\Users\julia\Downloads\Aufgabenblatt+05\barcodes.csv')
	
b)
	select * from barcodes
	
c)
	SELECT Type, COUNT(*)
	FROM barcodes
	GROUP BY type
	HAVING COUNT(*) > 1;
	
	Taxon, ID, GardenID, SampleId, origin,  hat Dupletten
	
Nr.3

a)
	Select distinct Taxon from barcodes
	
	gibt 75 Datensätze zurück
	
b)
	create table taxa(
		id int generated always as identity primary key,
		name varchar(48) unique
	)

c)
	INSERT INTO taxa(name)(SELECT DISTINCT taxon FROM barcodes)
	
d)
	SELECT distinct * FROM TAXA -> 75 Datensätze
	SELECt * FROM TAXA 			-> 75 Datensätze
	
e)	
	ALTER TABLE barcodes add column taxonid int
	
	Die Werte sind alle null
	
f)
	füllt in in Tabelle t1 die werte C21 aus tabelle t2 bei denen c12 = c22

g)
	update barcodes
	set taxonid=(select id from taxa where barcodes.taxon=taxa.name);
	
h)
	ALTER table barcodes add CONSTRAINT constraint_taxa FOREIGN KEY (taxonid) REFERENCES taxa (id);
	
i)
	alter table barcodes drop column taxon
	

	
