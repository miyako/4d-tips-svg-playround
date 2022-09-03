//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_LONGINT:C283($2; $width)
C_LONGINT:C283($3; $height)

$objectName:=$1

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	C_LONGINT:C283($l; $t; $r; $b)
	OBJECT GET COORDINATES:C663(*; $objectName; $l; $t; $r; $b)
	EXECUTE METHOD IN SUBFORM:C1085($objectName; Current method name:C684; *; "Image"; $r-$l; $b-$t)
Else 
	
	$width:=$2
	$height:=$3
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	
	$ScrollbarH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarH")
	$ScrollbarV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarV")
	
	C_REAL:C285($editorWidth; $editorHeight)
	$editorWidth:=($width-$ScrollbarH->)*$Zoom->
	$editorHeight:=($height-$ScrollbarV->)*$Zoom->
	
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
	DOM SET XML ATTRIBUTE:C866($DomImage->; \
		"editor:document-width"; $width; \
		"editor:document-height"; $height; \
		"width"; $editorWidth; \
		"height"; $editorHeight)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=Editor_Get_image($DomImage->)
	
End if 