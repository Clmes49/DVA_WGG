{{config(materialized='view')}}

{%- set yaml_metadata -%}
source_model: 'base_webshop_kategorie'
ldts: 'ldts'
rsrc: '!WEBSHOP'
hashed_columns: 
  # Hubs:
  hk_kategorie_h:
    - katid
  hk_oberkategorie_h:
    - oberkatid

  # Links
  hk_kategorie_hierarchie_l:
    - katid
    - oberkatid

  # Satellite
  hd_kategorie_s:
    is_hashdiff: true
    columns: 
      - name
{%- endset -%}
{{datavault4dbt.stage(
    include_source_columns=true,
    yaml_metadata=yaml_metadata
)}}

