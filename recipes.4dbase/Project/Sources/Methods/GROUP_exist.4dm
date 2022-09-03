//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_POINTER:C301($3; $4)
C_BOOLEAN:C305($0)

$0:=False:C215

$dom:=$1

ARRAY TEXT:C222($groups; 0)
$groupsDom:=DOM Find XML element by ID:C1010($dom; "groups")
$group:=DOM Find XML element:C864($groupsDom; "groups/group"; $groups)
//%W-518.1
COPY ARRAY:C226($groups; $3->)
//%W+518.1
C_LONGINT:C283($i)
C_TEXT:C284($groupId)

ARRAY TEXT:C222($groupIds; 0)
For ($i; 1; Size of array:C274($groups))
	$group:=$groups{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
	APPEND TO ARRAY:C911($groupIds; $groupId)
End for 

$find:=Find in array:C230($groupIds; $2)

If (-1#$find)
	$4->:=$groups{$find}
	$0:=True:C214
End if 