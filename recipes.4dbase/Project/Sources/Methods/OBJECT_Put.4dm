//%attributes = {"invisible":true}
C_REAL:C285($1; $2; $3; $4; $5; $6; $7; $8; $9; $10)
C_TEXT:C284($11; $12)
C_REAL:C285($13; $14)
C_TEXT:C284($15)
C_REAL:C285($16; $17)
C_REAL:C285($18)
C_TEXT:C284($19; $20; $21; $22; $23; $24; $25; $26)
C_BOOLEAN:C305($27)
C_REAL:C285($28)
C_TEXT:C284($29)
C_BOOLEAN:C305($30)

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
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
$fontSize:=$18
$fontFamily:=$19
$fontStyle:=$20
$fontWeight:=$21
$textDecoration:=$22
$textAlign:=$23
$textValue:=$24
$textColor:=$25
$displayAlign:=$26
$wordWrap:=$27
$lineHeight:=$28
$objectId:=$29
$selected:=$30

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
$rotate:="rotate("+String:C10($r; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"

$transform:=$translate+" "+$scale+" "+$rotate

$g:=DOM Create XML element:C865($DomImage->; \
"g"; "id"; $objectId; \
"editor:object-id"; $objectId; \
"editor:x"; $x; \
"editor:y"; $y; \
"editor:tx"; $tx; \
"editor:ty"; $ty; \
"editor:sx"; $sx; \
"editor:sy"; $sy; \
"editor:cx"; $cx; \
"editor:cy"; $cy; \
"editor:r"; $r; \
"editor:width"; $width; \
"editor:height"; $height; \
"transform"; $transform)

$rectId:=$objectId+"-rect"

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
"; stroke-linejoin:"+"miter"+"}"

//"; filter:url(#dropShadow)"+\

DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "id"; $class); $style; *)  //CDATA

$rect:=DOM Create XML element:C865($g; "rect"; "id"; $rectId; \
"class"; $class; \
"rx"; 5; \
"ry"; 5; \
"x"; (-$width/2)-($strokeWidth/2); \
"y"; (-$height/2)-($strokeWidth/2); \
"width"; $width+$strokeWidth; \
"height"; $height+$strokeWidth; \
"editor:object-id"; $objectId; \
"shape-rendering"; "geometricPrecision")

$class:="class-"+$objectId+"-textArea"

$style:="."+$class+" {fill:"+$textColor+\
"; font-size:"+String:C10($fontSize; "&xml")+\
"; font-family:"+$fontFamily+\
"; font-style:"+$fontStyle+\
"; font-weight:"+$fontWeight+\
"; text-decoration:"+$textDecoration+\
"; text-align:"+$textAlign+\
"; display-align:"+$displayAlign+\
"; fill-opacity:1"+"}"

DOM SET XML ELEMENT VALUE:C868(DOM Create XML element:C865($defs; "style"; "type"; "text/css"; "id"; $class); $style; *)  //CDATA

$textId:=$objectId+"-textArea"

$textArea:=DOM Create XML element:C865($g; "textArea"; "id"; $textId; \
"class"; $class; \
"x"; (-$width/2); \
"y"; (-$height/2); \
"width"; $width; \
"height"; $height; \
"editor:object-id"; $objectId; \
"editor:x"; $x; \
"editor:y"; $y; \
"editor:width"; $width; \
"editor:height"; $height; \
"editor:tx"; $tx; \
"editor:ty"; $ty; \
"editor:sx"; $sx; \
"editor:sy"; $sy; \
"editor:cx"; $cx; \
"editor:cy"; $cy; \
"editor:r"; $r; \
"editor:line-height"; $lineHeight; \
"editor:word-wrap"; $wordWrap; \
"text-rendering"; "auto")

SVG_TEXTAREA_SET_TEXT($textArea; $textValue)

If ($selected)
	
	Editor_SELECT($DomImage->; $objectId; $tx; $ty; $sx; $sy; $width; $height; $r)
	
	If (Not:C34(Editor_SELECT_Find($DomData->; $objectId)))
		
		Editor_SELECT_APPEND($DomData->; $objectId)
		
	End if 
	
End if 