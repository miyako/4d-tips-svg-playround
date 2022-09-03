//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; "HISTORY_FORWARD")
End if 