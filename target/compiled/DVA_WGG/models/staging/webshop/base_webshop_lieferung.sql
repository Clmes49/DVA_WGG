

select
    BestellungID,
    PosID,
    LieferAdrID,
    LieferDienstID,
    Lieferdatum,
    current_timestamp as ldts
from "postgres"."webshop"."lieferung"