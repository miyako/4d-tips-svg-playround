//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_POINTER:C301($2)
C_BOOLEAN:C305($0)

C_BOOLEAN:C305($shouldRedraw)
C_TEXT:C284($clickObject)

$id:=$1

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

If (Match regex:C1019("(group-\\d+)"; $id; 1; $pos; $len))
	
	$clickObject:=Substring:C12($id; $pos{1}; $len{1})
	
	$2->:=$clickObject
	
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
	
	ARRAY TEXT:C222($oldSelection; 0)
	Editor_SELECT_GET_LIST($DomData->; ->$oldSelection)
	
	C_LONGINT:C283($oldCount; $newCount)
	$oldCount:=Size of array:C274($oldSelection)
	
	Editor_SELECT_Clear($DomData->; $DomImage->)
	
	ARRAY TEXT:C222($objects; 0)
	$group:=DOM Find XML element by ID:C1010($DomData->; $clickObject)
	$object:=DOM Find XML element:C864($group; "group/object"; $objects)
	
	C_TEXT:C284($objectId)
	
	For ($i; 1; Size of array:C274($objects))
		
		$object:=$objects{$i}
		
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "object-id"; $objectId)
		
		$f:=Find in array:C230($oldSelection; $objectId)
		
		If ($f#-1)
			DELETE FROM ARRAY:C228($oldSelection; $f)
		Else 
			$shouldRedraw:=True:C214
		End if 
		$newCount:=$newCount+Num:C11(Editor_SELECT_Add($objectId; True:C214; ->$clickObject))
	End for 
	
	$shouldRedraw:=$shouldRedraw | ($oldCount#$newCount)
	
End if 

$0:=$shouldRedraw