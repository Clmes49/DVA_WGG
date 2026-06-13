-- SATELLITE MODEL: sEff_kunde
-- Schicht:    Raw Vault
-- Typ:        Effectivity Satellite
-- Parent:     Hub Kunde (hk_kunde_h)
-- Zweck:      Trackt ob ein Kunde aktuell aktiv ist oder nicht. Kein Payload — nur die Existenz/Aktivität wird historisiert. Wenn ein Kunde aus der Quelle verschwindet, wird er als inaktiv markiert.

{{config(materialized='incremental')}} --Inkrementelle Beladung: nur Statusänderungen werden eingefügt

{%- set yaml_metadata -%}
tracked_hashkey: hk_kunde_h   # Referenz auf Hub Kunde — dessen Aktivität wird getrackt
is_active_alias: 'active'      # Spaltenname für den Aktivitätsstatus (true/false)
source_model: stg_webshop_kunde   
{%- endset -%}

-- eff_sat_v0()-Makro aufgerufen — übernimmt automatisch: Erkennung ob ein Hash Key noch in der Quelle vorhanden ist, Setzen des active-Flags (true = aktiv, false = inaktiv) und Historisierung der Statusänderungen via ldts

{{datavault4dbt.eff_sat_v0(yaml_metadata=yaml_metadata)}}
