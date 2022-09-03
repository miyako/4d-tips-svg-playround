//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_TEXT:C284($2; $3)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; Current method name:C684; *; "Image"; $2; $3)
	
Else 
	
	If (LINK_Delete($2; $3; True:C214))
		
		HISTORY_APPEND
		
		$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		$Image->:=Editor_Get_image($DomImage->)
		
	End if 
	
End if 