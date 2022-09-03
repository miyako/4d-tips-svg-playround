//%attributes = {"invisible":true}
C_TEXT:C284($1; $2; $3)
C_POINTER:C301($4; $5)
C_BOOLEAN:C305($0)

$0:=False:C215

$dom:=$1
$objectId1:=$2
$objectId2:=$3

ARRAY TEXT:C222($objects; 0)
$objectsDom:=DOM Find XML element by ID:C1010($dom; "objects")
$object:=DOM Find XML element:C864($objectsDom; "objects/object"; $objects)

C_TEXT:C284($objectId)
ARRAY TEXT:C222($objectIds; 0)
For ($i; 1; Size of array:C274($objects))
	$object:=$objects{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "id"; $objectId)
	APPEND TO ARRAY:C911($objectIds; $objectId)
End for 

$findFrom:=Find in array:C230($objectIds; $objectId1)
$findTo:=Find in array:C230($objectIds; $objectId2)

If (-1#$findFrom) & (-1#$findTo)
	$4->:=$objects{$findFrom}
	$5->:=$objects{$findTo}
	$0:=True:C214
End if 