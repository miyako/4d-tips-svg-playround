//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_REAL:C285($2; $3; $4; $5; $6; $7; $8; $9; $10; $11)
C_TEXT:C284($12; $13)
C_REAL:C285($14; $15)
C_TEXT:C284($16)
C_REAL:C285($17; $18)
C_REAL:C285($19)
C_TEXT:C284($20; $21; $22; $23; $24; $25; $26; $27)
C_BOOLEAN:C305($28)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; "OBJECT_CREATE"; *; \
		$2; $3; $4; $5; \
		$6; $7; $8; $9; \
		$10; $11; \
		$12; $13; \
		$14; $15; \
		$16; $17; $18; \
		$19; \
		$20; $21; $22; $23; $24; $25; $26; $27; $28)
End if 