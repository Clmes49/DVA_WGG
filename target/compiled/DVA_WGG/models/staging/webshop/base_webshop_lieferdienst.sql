

select
    LieferDienstID,
    Name,
    Telefon,
    Fax,
    Email,
    Hausnummer,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."lieferdienst"