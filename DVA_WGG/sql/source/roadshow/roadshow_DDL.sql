SET search_path TO roadshow;

-- Transaktion beginnen
BEGIN;

-- Tabellen erstellen
CREATE TABLE kunde (
    kundeid char(13)  NOT NULL ,
    vereinspartnerid varchar(30)  NULL ,
    vorname varchar(128)  NOT NULL ,
    name varchar(128)  NOT NULL ,
    geschlecht char  NULL ,
    geburtsdatum date  NOT NULL ,
    telefon varchar(20)  NULL ,
    mobil varchar(20)  NULL ,
    email varchar(128)  NULL ,
    kreditkarte varchar(30)  NOT NULL ,
    gueltigbis char(5)  NOT NULL ,
    kkfirma varchar(128)  NOT NULL
);



CREATE TABLE vereinspartner (
    vereinspartnerid varchar(30)  NOT NULL ,
    kundeidverein char(13)  NOT NULL ,
    rabatt1 int  NOT NULL ,
    rabatt2 int  NOT NULL ,
    rabatt3 int  NOT NULL
);


CREATE TABLE produkt (
    produktid int  NOT NULL ,
    katid varchar(50)  NOT NULL ,
    bezeichnung varchar(512)  NOT NULL ,
    umfang varchar(128)  NOT NULL ,
    typ int  NOT NULL ,
    preis decimal(5,2)  NOT NULL ,
    pflanzort varchar(128)  NOT NULL ,
    pflanzabstand varchar(128)  NOT NULL
);

CREATE TABLE rs_bestellung (
    bestellungid varchar(128)  NOT NULL ,
    kundeid char(13)  NULL ,
    vereinspartnerid varchar(30)  NOT NULL ,
    kaufdatum date  NOT NULL ,
    kreditkarte varchar(30)  NULL ,
    gueltigbis char(5)  NULL ,
    kkfirma varchar(128)  NULL ,
    produktid int  NOT NULL ,
    menge int  NOT NULL ,
    preis numeric(10,2)  NOT NULL ,
    rabatt numeric(5,2)  NULL ,
);


-- Transaktion beenden
COMMIT;