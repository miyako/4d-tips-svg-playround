//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_PICTURE:C286($0; $image)

$dom:=$1

SVG EXPORT TO PICTURE:C1017($dom; $image; Copy XML data source:K45:17)

REDRAW WINDOW:C456(Current form window:C827)

If (Editor_Is_debug)
	$RefreshIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "RefreshIndex")
	$RefreshIndex->:=$RefreshIndex->+1
End if 

$0:=$image