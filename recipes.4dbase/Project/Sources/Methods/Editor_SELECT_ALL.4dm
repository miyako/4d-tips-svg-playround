//%attributes = {"invisible":true}
C_BOOLEAN:C305($shouldRedraw)
C_TEXT:C284($clickObject)

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

ARRAY TEXT:C222($oldSelection; 0)
Editor_SELECT_GET_LIST($DomData->; ->$oldSelection)

C_LONGINT:C283($oldCount; $newCount)
$oldCount:=Size of array:C274($oldSelection)

Editor_SELECT_Clear($DomData->; $DomImage->)

ARRAY TEXT:C222($objectsInRect; 0)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

ARRAY TEXT:C222($objectsInRect; 0)
$object:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "objects"); "objects/object"; $objectsInRect)

If (Size of array:C274($objectsInRect)#0)
	C_LONGINT:C283($i; $f)
	C_TEXT:C284($objectId)
	For ($i; 1; Size of array:C274($objectsInRect))
		DOM GET XML ATTRIBUTE BY NAME:C728($objectsInRect{$i}; "id"; $objectId)
		If ($objectId#"select@")
			SVG GET ATTRIBUTE:C1056($Image->; $objectId; "editor:object-id"; $id)
			If ($id=$objectId)
				$f:=Find in array:C230($oldSelection; $objectId)
				If ($f#-1)
					DELETE FROM ARRAY:C228($oldSelection; $f)
				Else 
					$shouldRedraw:=True:C214
				End if 
				$newCount:=$newCount+Num:C11(Editor_SELECT_Add($objectId; True:C214; ->$clickObject))
			End if 
		End if 
	End for 
	$shouldRedraw:=$shouldRedraw | ($oldCount#$newCount)
End if 

$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")

If ($shouldRedraw)
	$SelectionChanged->:=1
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=Editor_Get_image($DomImage->)
Else 
	$SelectionChanged->:=0
End if 