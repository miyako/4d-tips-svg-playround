//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_TEXT:C284($0)

$objectName:=$1

$ClickObject:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickObject"; $objectName)

If (Not:C34(Is nil pointer:C315($ClickObject)))
	
	$0:=$ClickObject->
	
End if 