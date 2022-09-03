//%attributes = {"invisible":true}
C_REAL:C285($1; $2; $3; $4; $5; $6; $7; $8; $9; $10)
C_TEXT:C284($11; $12)
C_REAL:C285($13; $14)
C_TEXT:C284($15)
C_REAL:C285($16; $17)
C_REAL:C285($18)
C_TEXT:C284($19; $20; $21; $22; $23; $24; $25; $26)
C_BOOLEAN:C305($27)

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")

$objects:=DOM Find XML element by ID:C1010($DomData->; "objects")
$count:=DOM Count XML elements:C726($objects; "object")

$objectId:="object-"+String:C10($count+1)

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

C_REAL:C285($lineWidth; $lineHeight)

OBJECT_COMPUTE_SIZE($textValue; $fontFamily; $fontSize; $fontStyle; $fontWeight; "start"; $textDecoration; ->$lineWidth; ->$lineHeight)

$object:=DOM Create XML element:C865($objects; "object"; "id"; $objectId; "x"; $x; "y"; $y; "width"; $width; "height"; $height; "x1"; $x1; "y1"; $y1; "x2"; $x2; "y2"; $y2; "offset1"; $offset1; "offset2"; $offset2; "stopColor1"; $stopColor1; "stopColor2"; $stopColor2; "stopOpacity1"; $stopOpacity1; "stopOpacity2"; $stopOpacity2; "strokeColor"; $strokeColor; "strokeOpacity"; $strokeOpacity; "strokeWidth"; $strokeWidth; "fontSize"; $fontSize; "fontFamily"; $fontFamily; "fontStyle"; $fontStyle; "fontWeight"; $fontWeight; "textDecoration"; $textDecoration; "textAlign"; $textAlign; "displayAlign"; $displayAlign; "textValue"; $textValue; "textColor"; $textColor; "wordWrap"; $wordWrap; "lineHeight"; $lineHeight)

OBJECT_Put($x; $y; $width; $height; $x1; $y1; $x2; $y2; $offset1; $offset2; $stopColor1; $stopColor2; $stopOpacity1; $stopOpacity2; $strokeColor; $strokeOpacity; $strokeWidth; $fontSize; $fontFamily; $fontStyle; $fontWeight; $textDecoration; $textAlign; $textValue; $textColor; $displayAlign; $wordWrap; $lineHeight; $objectId; False:C215)

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$Image->:=Editor_Get_image($DomImage->)

HISTORY_APPEND