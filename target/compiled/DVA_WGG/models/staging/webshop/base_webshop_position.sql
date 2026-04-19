

select
    BestellungID,
    PosID,
    ProduktID,
    SpezLieferAdrID,
    Menge,
    Preis,
    current_timestamp as ldts
from "postgres"."webshop"."position"