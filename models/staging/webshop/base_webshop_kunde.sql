-- Base Model: base_webshop_kunde
-- Schicht: Staging, Stufe 1 von 2
-- Quelle: webshop.kunde
-- Zweck: Rohdaten-Selektion aus der Quelltabelle und Hinzufügen des Load Date Timestamps. Keine Transformation, nur Spaltenauswahl


{{ config(materialized='view') }} -- Materialisierung als View gesetzt

select
    kundeid, 
    vereinspartnerid,
    vorname,
    name,
    geschlecht,
    geburtsdatum,
    telefon,
    mobil,
    email,
    kreditkarte,
    gueltigbis,
    kkfirma,
    cast('{{var("batch_ldts")}}' as timestamptz) as ldts -- Ladezeitpunkt wird dynamisch per CLI übergeben
from {{ source('webshop', 'kunde') }} -- Referenz aus src_willibald.yml


