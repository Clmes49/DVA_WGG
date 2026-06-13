-- SATELLITE MODEL: s_kunde
-- Schicht: Raw Vault
-- Typ: Standard Satellite
-- Parent: Hub Kunde (hk_kunde_h)
-- Zweck: Speichert historische Änderungen der Kunden-Stammdaten. Jede Attributänderung erzeugt einen neuen Datensatz mit neuem ldts.

{{ config(materialized='incremental') }} -- Inkrementelle Beladung 

{%- set yaml_metadata -%}
parent_hashkey: 'hk_kunde_h'  # Referenz auf den Parent Hub Kunde
src_hashdiff: 'hd_kunde_s'  # Hash Diff zur Änderungserkennung
src_payload:    # Attribute die historisiert werden (Payload)
- vorname
- name
- geschlecht
- geburtsdatum
- telefon
- mobil
- email  
source_model: 'stg_webshop_kunde'
{%- endset -%}    
-- sat_v0()-Makro aufgerufen — übernimmt automatisch: Vergleich des Hash Diffs mit dem letzten bekannten Wert, inkrementelles Einfügen nur bei Änderungen, Historisierung via ldts (INSERT-Only)
{{ datavault4dbt.sat_v0(yaml_metadata=yaml_metadata) }}