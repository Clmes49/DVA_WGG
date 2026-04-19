

select
    KundeID,
    Von,
    Bis,
    Strasse,
    Hausnummer,
    Adresszusatz,
    Plz,
    Ort,
    Land,
    current_timestamp as ldts
from "postgres"."webshop"."lieferdienst"