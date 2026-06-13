-- Link Model: l_lieferung
-- Schicht: Raw Vault
-- Typ: Non-Historized Link (Transaktionaler Link)
-- Zweck:   Speichert Liefertransaktionen als unveränderliche Fakten. Verbindet drei Hubs und enthält ein eigenes Attribut (payload): das Lieferdatum. Transaktionen ändern sich nie.

{{ config(materialized='incremental') }} -- Inkrementelle Beladung: nur neue Transaktionen werden hinzugefügt
  
{%- set yaml_metadata -%}
link_hashkey: 'hk_lieferung_l'   # Liefertransaktion Hash Key
foreign_hashkeys:       # Fremdschlüssel zu den drei verbundenen Hubs
   - 'hk_bestellung_h'
   - 'hk_lieferadresse_h'
   - 'hk_lieferdienst_h'
payload:   # Payload: eigene Attribute der Transaktion
   - lieferdatum       
source_models: stg_webshop_lieferung   
{%- endset -%}
-- nh_link()Makro (non-historized link) aufgerufen — übernimmt automatisch: Inkrementelles Beladen der Transaktionen, Payload-Spalten werden direkt am Link gespeichert.
{{ datavault4dbt.nh_link(yaml_metadata=yaml_metadata) }}
