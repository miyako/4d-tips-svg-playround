//%attributes = {"invisible":true}
C_TEXT:C284($1; $2; $3)
C_POINTER:C301($4)
C_TEXT:C284($0)

$0:=""

$dom:=$1

ARRAY TEXT:C222($links; 0)
$link:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($dom; "links"); "links/link"; $links)

For ($i; 1; Size of array:C274($links))
	$link:=$links{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "from"; $from)
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "to"; $to)
	If ($from=$2) & ($to=$3)
		C_TEXT:C284($id)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "id"; $id)
		$4->:=$id
		$0:=$link
	End if 
End for 