SET search_path TO roadshow;

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
    rabatt numeric(5,2)  NULL 
);




