//%attributes = {"invisible":true}
C_TEXT:C284($1; $domData; $2; $domImage)
C_POINTER:C301($3; $Image)
C_REAL:C285($4; $scrollH; $5; $scrollV; $6; $zoom)
C_BOOLEAN:C305($7; $shouldRedraw)

$domData:=$1
$domImage:=$2
$Image:=$3
$scrollH:=$4
$scrollV:=$5
$zoom:=$6
$shouldRedraw:=$7

C_REAL:C285($sx; $sy)
$sx:=$zoom
$sy:=$zoom

ARRAY TEXT:C222($groups; 0)
$group:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($domData; "groups"); "groups/group"; $groups)

For ($i; 1; Size of array:C274($groups))
	
	$group:=$groups{$i}
	
	GROUP_UPDATE_ONE($domData; $domImage; $Image; $group; $sx; $sy; $scrollH; $scrollV; Not:C34($shouldRedraw))
	
End for 