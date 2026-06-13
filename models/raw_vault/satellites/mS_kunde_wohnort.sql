-- SATELLITE MODEL: mS_kunde_wohnort
-- Schicht:    Raw Vault
-- Typ:        Multi-Active Satellite
-- Parent:     Hub Kunde (hk_kunde_h)
-- Zweck:      Speichert mehrere gleichzeitig aktive Wohnadressen pro Kunde. Ein Kunde kann zu einem Zeitpunktmehrere gültige Adressen haben — unterschieden durch den Multi-Active Key "von" (Gültig-ab-Datum).

{{config(materialized='incremental')}} --  Inkrementelle Beladung: nur neue oder geänderte Adressen werden eingefügt

{%- set yaml_metadata -%}
source_model: 'stg_webshop_wohnort'  #  Quelle: Wohnortdaten aus dem Webshop
parent_hashkey: 'hk_kunde_h'         # Referenz auf Hub Kunde
src_hashdiff: 'hd_kunde_wohnort_s'   # Hash Diff zur Änderungserkennung
src_ma_key: 'von'     # Multi-Active Key: unterscheidet mehrere gleichzeitig aktive Datensätze, "von" = Gültigkeitsbeginn der Adresse 
src_payload: # Adress-Attribute (Payload)
    - bis
    - strasse
    - hausnummer
    - adresszusatz
    - plz
    - ort
    - land
{%- endset -%}
-- ma_sat_v0()-Makro aufgerufen — übernimmt automatisch: Mehrere aktive Datensätze pro Hash Key erlaubt (via src_ma_key), Änderungserkennung via Hash Diff pro Adresse und Historisierung via ldts
{{datavault4dbt.ma_sat_v0(yaml_metadata=yaml_metadata)}}