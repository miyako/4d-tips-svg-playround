//%attributes = {"invisible":true}
C_REAL:C285($1; $2; $3; $4; $5; $6; $7; $8; $9; $10)
C_TEXT:C284($11; $12)
C_REAL:C285($13; $14)
C_TEXT:C284($15)
C_REAL:C285($16; $17)
C_TEXT:C284($18)
C_REAL:C285($19)
C_TEXT:C284($20; $21; $22; $23; $24; $25; $26; $27)
C_REAL:C285($28; $29)
C_BOOLEAN:C305($30)
C_REAL:C285($31; $32)
C_TEXT:C284($33)

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$defs:=DOM Find XML element by ID:C1010($DomImage->; "defs")

$x:=$1
$y:=$2
$width:=$3
$height:=$4
$x1:=$5
$y1:=$6
$x2:=$7
$y2:=$8
$offset1:=$9
$offset2:=$10
$stopColor1:=$11
$stopColor2:=$12
$stopOpacity1:=$13
$stopOpacity2:=$14
$strokeColor:=$15
$strokeOpacity:=$16
$strokeWidth:=$17
$strokeDashArray:=$18

$fontSize:=$19
$fontFamily:=$20
$fontStyle:=$21
$fontWeight:=$22
$textDecoration:=$23
$textAlign:=$24
$textValue:=$25
$textColor:=$26
$displayAlign:=$27
$text_tx:=$28
$text_ty:=$29
$wordWrap:=$30
$marginX:=$31
$marginY:=$32
$groupId:=$33

C_REAL:C285($sx; $sy)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
$sx:=$Zoom->
$sy:=$Zoom->

C_REAL:C285($tx; $ty)
$tx:=(($width/2)+$x)*$sx
$ty:=(($height/2)+$y)*$sy

C_REAL:C285($cx; $cy; $r)

$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
$transform:=$translate+" "+$scale

$g:=DOM Create XML element:C865($DomImage->; "g"; "editor:object-id"; ""; "transform"; $transform)
$domClone:=DOM Insert XML element:C1083($DomImage->; $g; 2)
DOM REMOVE XML ELEMENT:C869($g)
DOM SET XML ATTRIBUTE:C866($domClone; "id"; $groupId)
$g:=$domClone

$x:=$width/2
$y:=$height/2

$rectId:=$groupId+"-rect"

$class:="class-"+$rectId
$gradientId:="gradient-"+$rectId

$linearGradient:=DOM Create XML element:C865($defs; "linearGradient"; \
"id"; $gradientId; \
"x1"; $x1; \
"y1"; $y1; \
"x2"; $x2; \
"y2"; $y2)

$stop:=DOM Create XML element:C865($linearGradient; "stop"; \
"offset"; $offset1; \
"style"; "stop-color:"+$stopColor1+\
"; stop-opacity:"+String:C10($stopOpacity1; "&xml"))

$stop:=DOM Create XML element:C865($linearGradient; "stop"; \
"offset"; $offset2; \
"style"; "stop-color:"+$stopColor2+\
"; stop-opacity:"+String:C10($stopOpacity2; "&xml"))

$style:="."+$class+" {fill:url(#"+$gradientId+")"+\
"; stroke:"+$strokeColor+\
"; stroke-width:"+String:C10($strokeWidth; "&xml")+\
"; stroke-opacity:"+String:C10($strokeOpacity; "&xml")+\
"; stroke-dasharray:"+"3,3"+\
"; stroke-linejoin:"+"miter"+"}"

DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "id"; $class); $style; *)  //CDATA

$x:=(-$width/2)-($strokeWidth/2)-$marginX
$y:=(-$height/2)-($strokeWidth/2)-$marginY
$width:=$width+$strokeWidth+($marginX*2)
$height:=$height+$strokeWidth+($marginY*2)

$rect:=DOM Create XML element:C865($g; "rect"; \
"class"; $class; \
"id"; $rectId; \
"rx"; 5; \
"ry"; 5; \
"x"; $x; \
"y"; $y; \
"width"; $width; \
"height"; $height; \
"editor:object-id"; ""; \
"shape-rendering"; "geometricPrecision")

$textId:=$groupId+"-textArea"

$translate:="translate("+String:C10($text_tx; "&xml")+","+String:C10($text_ty; "&xml")+")"
$transform:=$translate

$textArea:=DOM Create XML element:C865($g; "textArea"; "id"; $textId; \
"editor:object-id"; ""; \
"x"; $x; "y"; $y; \
"width"; $width; \
"height"; $height; \
"fill"; $textColor; \
"text-align"; $textAlign; \
"font-size"; $fontSize; \
"font-style"; $fontStyle; \
"font-weight"; $fontWeight; \
"font-family"; $fontFamily; \
"transform"; $transform; \
"text-rendering"; "auto")

SVG_TEXTAREA_SET_TEXT($textArea; $textValue)

