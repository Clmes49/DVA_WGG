-- Link Model: l_kunde_vereinspartner
-- Schicht: Raw Vault
-- Typ: Standard Link
-- Zweck: Speichert die Beziehung zwischen Kunde und Vereinspartner. Enthält keine eigenen Attribute — nur die Verbindung zwischen zwei Hubs.

{{config(materialized='incremental')}} -- Inkrementelle Beladung: nur neue Beziehungen werden hinzugefügt

{%- set yaml_metadata -%}
link_hashkey: 'hk_kunde_vereinspartner_l'    # Link Hash Key
foreign_hashkeys:    # Fremdschlüssel zu den verbundenen Hubs
   - hk_kunde_h     # Referenz auf Hub Kunde
   - hk_vereinspartner_h     # Referenz auf Hub Vereinspartner
source_models:      # Quellmodelle die diese Beziehung enthalten
   - name: stg_webshop_kunde     
   - name: stg_roadshow_rsbestellung
{%- endset -%}
-- link()-makro wird dafür aufgerufen
{{datavault4dbt.link(yaml_metadata=yaml_metadata)}}