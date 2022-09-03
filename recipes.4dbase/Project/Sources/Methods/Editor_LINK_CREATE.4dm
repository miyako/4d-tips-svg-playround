//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_LONGINT:C283($2)
C_TEXT:C284($3)
C_REAL:C285($4; $5)
C_TEXT:C284($6; $7; $8; $9; $10; $11; $12)
C_REAL:C285($13; $14)
C_TEXT:C284($15; $16)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; "LINK_CREATE"; *; \
		$2; $3; $4; \
		$5; $6; $7; $8; $9; \
		$10; $11; $12; \
		$13; $14; \
		$15; $16)
End if 