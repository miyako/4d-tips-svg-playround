//%attributes = {"invisible":true}
C_REAL:C285($1; $x)
C_REAL:C285($2; $y)
C_REAL:C285($3; $width)
C_REAL:C285($4; $height)
C_BOOLEAN:C305($0)

C_BOOLEAN:C305($shouldRedraw)
C_TEXT:C284($clickObject)

$x:=$1
$y:=$2
$width:=$3
$height:=$4

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

ARRAY TEXT:C222($oldSelection; 0)
Editor_SELECT_GET_LIST($DomData->; ->$oldSelection)

C_LONGINT:C283($oldCount; $newCount)
$oldCount:=Size of array:C274($oldSelection)

Editor_SELECT_Clear($DomData->; $DomImage->)

ARRAY TEXT:C222($objectsInRect; 0)
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
If (SVG Find element IDs by rect:C1109($Image->; $x; $y; $width; $height; $objectsInRect))
	C_LONGINT:C283($i; $f)
	For ($i; 1; Size of array:C274($objectsInRect))
		If ($objectsInRect{$i}#"select@")
			If (Editor_SELECT_Is_object($objectsInRect{$i}))
				$f:=Find in array:C230($oldSelection; $objectsInRect{$i})
				If ($f#-1)
					DELETE FROM ARRAY:C228($oldSelection; $f)
				Else 
					$shouldRedraw:=True:C214
				End if 
				$newCount:=$newCount+Num:C11(Editor_SELECT_Add($objectsInRect{$i}; True:C214; ->$clickObject))
			End if 
		End if 
	End for 
	$shouldRedraw:=$shouldRedraw | ($oldCount#$newCount)
End if 

$0:=$shouldRedraw