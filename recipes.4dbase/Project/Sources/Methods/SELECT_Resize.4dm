//%attributes = {"invisible":true}
C_TEXT:C284($1; $dom)
C_REAL:C285($2; $3; $x; $y)
C_REAL:C285($4; $5; $scrollH; $scrollV)
C_BOOLEAN:C305($6; $0)

$dom:=$1
$x:=$2
$y:=$3
$scrollH:=$4
$scrollV:=$5
$volatile:=$6

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "selects"); "selects/select"; $selects)

C_TEXT:C284($objectId)

C_LONGINT:C283($i; $count)

$count:=Size of array:C274($selects)

For ($i; 1; $count)
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
	Editor_SELECT_Resize($objectId; $x; $y; $scrollH; $scrollV; $volatile)
End for 

$0:=($count#0)