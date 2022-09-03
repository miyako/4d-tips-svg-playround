//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)

$dom:=$1
$objectId:=$2

$selects:=DOM Find XML element by ID:C1010($dom; "selects")
$select:=DOM Create XML element:C865($selects; "select"; "object-id"; $objectId)
