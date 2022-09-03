C_TEXT:C284($xml)
$xml:=Editor_Get_data("Editor")

C_BLOB:C604($xmlData)
CONVERT FROM TEXT:C1011($xml; "utf-8"; $xmlData)

BLOB TO DOCUMENT:C526(System folder:C487(Desktop:K41:16)+"data.xml"; $xmlData)

OPEN URL:C673(System folder:C487(Desktop:K41:16)+"data.xml"; "atom")