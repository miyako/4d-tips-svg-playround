//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_LONGINT:C283($2; $x)
C_LONGINT:C283($3; $y)
C_LONGINT:C283($4; $width)
C_LONGINT:C283($5; $height)

$objectName:=$1
$x:=$2
$y:=$3
$width:=$4
$height:=$5

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; Current method name:C684; *; "Image"; $x; $y; $width; $height)
	EXECUTE METHOD IN SUBFORM:C1085($objectName; "Editor_RESIZE"; *; "Image"; $width; $height)
Else 
	
	Editor_SET_Direct2D(True:C214)
	
	OBJECT MOVE:C664(*; "Bg"; 0; 0; $width; $height; *)
	OBJECT MOVE:C664(*; "Image"; 0; 0; $width; $height; *)
	
	$OffsetX:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetX")
	$OffsetY:=OBJECT Get pointer:C1124(Object named:K67:5; "OffsetY")
	
	C_LONGINT:C283($l; $t; $r; $b)
	OBJECT GET COORDINATES:C663(*; "Image"; $l; $t; $r; $b)
	
	$OffsetX->:=$x+$l
	$OffsetY->:=$y+$t
	
End if 