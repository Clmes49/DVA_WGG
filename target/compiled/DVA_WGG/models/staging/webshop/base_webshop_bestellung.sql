

select
    BestellungID,
    KundeID,
    AllgLieferAdrID,
    Bestelldatum,
    Wunschdatum,
    Rabatt,
    current_timestamp as ldts
from "postgres"."webshop"."bestellung"