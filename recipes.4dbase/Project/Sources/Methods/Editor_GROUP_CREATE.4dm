//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_REAL:C285($2; $3; $4; $5; $6; $7)
C_TEXT:C284($8; $9)
C_REAL:C285($10; $11)
C_TEXT:C284($12)
C_REAL:C285($13; $14)
C_TEXT:C284($15)
C_REAL:C285($16)
C_TEXT:C284($17; $18; $19; $20; $21; $22; $23; $24)
C_REAL:C285($25; $26)
C_BOOLEAN:C305($27)
C_REAL:C285($28; $29)
C_POINTER:C301($30)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	If (Count parameters:C259>29)
		If (Not:C34(Is nil pointer:C315($30)))
			If (Type:C295($30->)=Text array:K8:16)
				If (Size of array:C274($30->)>1)
					EXECUTE METHOD IN SUBFORM:C1085($objectName; "GROUP_CREATE"; *; \
						$2; $3; $4; \
						$5; $6; $7; $8; $9; \
						$10; $11; $12; \
						$13; $14; \
						$15; $16; \
						$17; $18; $19; $20; $21; $22; $23; $24; $25; $26; $27; $28; $29; $30)
				End if 
			End if 
		End if 
	End if 
End if 