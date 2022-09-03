//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_REAL:C285($3)
C_TEXT:C284($4; $5; $6; $7)
C_POINTER:C301($8; $9)

$textValue:=$1
$fontFamily:=$2
$fontSize:=$3
$fontStyle:=$4
$fontWeight:=$5
$textValueAlign:=$6
$textValueDecoration:=$7

$svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
"xmlns:svg"; "http://www.w3.org/2000/svg"; \
"xmlns:xlink"; "http://www.w3.org/1999/xlink")

$dom:=DOM Create XML element:C865($svg; "text"; \
"x"; 0; \
"y"; 0; \
"fill"; "red"; \
"fill-opacity"; 0.4; \
"font-family"; $fontFamily; \
"font-size"; $fontSize; \
"font-style"; $fontStyle; \
"font-weight"; $fontWeight; \
"text-anchor"; $textValueAlign; \
"text-decoration"; $textValueDecoration; \
"text-rendering"; "auto")

//to compute the handing height of the last line

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

$line:=$textValue

If (Match regex:C1019(".*$"; $textValue; 1; $pos; $len))
	$line:=Substring:C12($textValue; $pos{0}; $len{0})
End if 

DOM SET XML ELEMENT VALUE:C868($dom; $line)

SVG EXPORT TO PICTURE:C1017($svg; $image)
C_REAL:C285($width; $height; $height2)
PICTURE PROPERTIES:C457($image; $width; $height)

DOM SET XML ATTRIBUTE:C866($dom; "fill-opacity"; 0)

$dom:=DOM Create XML element:C865($svg; "textArea"; \
"x"; 0; \
"y"; 0; \
"fill"; "red"; \
"fill-opacity"; 0.4; \
"font-family"; $fontFamily; \
"font-size"; $fontSize; \
"font-style"; $fontStyle; \
"font-weight"; $fontWeight; \
"text-align"; $textValueAlign; \
"text-decoration"; $textValueDecoration; \
"text-rendering"; "auto")

SVG_TEXTAREA_SET_TEXT($dom; $textValue)

SVG EXPORT TO PICTURE:C1017($svg; $image)
PICTURE PROPERTIES:C457($image; $width; $height2)

DOM SET XML ATTRIBUTE:C866($dom; "height"; $height2+$height)

$dom:=DOM Create XML element:C865($svg; "rect"; \
"x"; 0; \
"y"; 0; \
"width"; $width; \
"height"; $height2+$height-4; \
"fill-opacity"; 0.1; \
"shape-rendering"; "geometricPrecision")

SVG EXPORT TO PICTURE:C1017($svg; $image)

PICTURE PROPERTIES:C457($image; $width; $height)

DOM CLOSE XML:C722($svg)

$8->:=$width
$9->:=$height
