//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_TEXT:C284($0)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage"; $objectName)
	DOM EXPORT TO VAR:C863($DomImage->; $0)
	
End if 