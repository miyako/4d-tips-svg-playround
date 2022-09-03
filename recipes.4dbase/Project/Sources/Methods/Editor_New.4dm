//%attributes = {"invisible":true}
C_REAL:C285($1; $2; $3; $4)
C_TEXT:C284($0; $dom)

If (Count parameters:C259>3)
	
	$width:=$1
	$height:=$2
	$editorWidth:=$3
	$editorHeight:=$4
	
Else 
	
	$width:=0
	$height:=0
	$editorWidth:=0
	$editorHeight:=0
	
End if 

$dom:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
"xmlns:svg"; "http://www.w3.org/2000/svg"; \
"xmlns:xlink"; "http://www.w3.org/1999/xlink"; \
"xmlns:editor"; "http://www.4d.com/2015/editor")

DOM SET XML ATTRIBUTE:C866($dom; \
"editor:document-width"; $width; \
"editor:document-height"; $height; \
"editor:document-row"; 1; \
"editor:document-column"; 1; \
"viewport-fill"; "white"; \
"viewport-fill-opacity"; 0.1; \
"version"; "1.1"; \
"id"; "svg"; \
"width"; $editorWidth; \
"height"; $editorHeight)

$defs:=DOM Create XML element:C865($dom; "defs"; "id"; "defs")

$dropShadow:=DOM Create XML element:C865($defs; "filter"; "id"; "dropShadow")
$fe:=DOM Create XML element:C865($dropShadow; "feGaussianBlur"; "in"; "SourceAlpha"; "result"; "blur"; "stdDeviation"; 1)
$fe:=DOM Create XML element:C865($dropShadow; "feColorMatrix"; "in"; "blur"; "result"; "blur.alpha"; "type"; "matrix"; "values"; "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.7 0")
$fe:=DOM Create XML element:C865($dropShadow; "feOffset"; "in"; "blur.alpha"; "result"; "blur.alpha.offset"; "dx"; 1.7; "dy"; 1.7)
$fe:=DOM Create XML element:C865($dropShadow; "feBlend"; "in"; "SourceGraphic"; "in2"; "blur.alpha.offset"; "mode"; "normal")

$0:=$dom