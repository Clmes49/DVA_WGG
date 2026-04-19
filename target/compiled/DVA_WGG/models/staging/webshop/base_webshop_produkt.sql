

select
    ProduktID,
    KatID,
    Bezeichnung,
    Umfang,
    Typ,
    Preis,
    Pflanzort,
    Pflanzabstand,
    current_timestamp as ldts
from "postgres"."webshop"."produkt"