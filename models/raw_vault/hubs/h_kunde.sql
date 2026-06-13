-- Hub Model: h_kunde
-- Schicht: Raw Vault
-- Zweck: Speichert alle einzigartigen Kunden-Business-Keys aus allen Quellsystemen. Ein Hub enthält genau eine Zeile pro eindeutigem Business Key.

{{config(materialized='incremental')}} -- Inkrementelle Beladung, nur neue Business Keys werden hinzugefügt

{%- set yaml_metadata -%}

hashkey: 'hk_kunde_h'  # Hash Key Spalte
business_keys:  # Business Key der Kunden, Basis der Hash Keys
   - kundeid
source_models: # Alle Staging-Modelle, die einen kundeid enthalten
   - name: stg_webshop_kunde
   - name: stg_webshop_bestellung
   - name: stg_roadshow_rsbestellung
   - name: stg_webshop_lieferadresse 
   - name: stg_webshop_vereinspartner
   - name: stg_webshop_wohnort

{%- endset -%}
-- hub()-Makro aufgerufen — übernimmt automatisch: UNION aller source_models, Deduplizierung auf den Business Key und inkrementelles Beladen der Hash Keys, Business Keys, ldts und rsrc 
{{datavault4dbt.hub(yaml_metadata=yaml_metadata)}}