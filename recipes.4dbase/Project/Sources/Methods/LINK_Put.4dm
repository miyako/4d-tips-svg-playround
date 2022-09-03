//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_REAL:C285($2; $3)
C_TEXT:C284($4; $5; $6; $7; $8; $9; $10)
C_REAL:C285($11; $12; $13; $14; $15; $16; $17; $18; $19; $20; $21; $22)
C_LONGINT:C283($23)
C_TEXT:C284($24)

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

$color:=$1
$strokeWidth:=$2
$fontSize:=$3
$fontFamily:=$4
$fontStyle:=$5
$fontWeight:=$6
$textDecoration:=$7
$textAlign:=$8
$textValue:=$9
$textColor:=$10
$lineWidth:=$11
$lineHeight:=$12
$tx:=$13
$ty:=$14
$cxFrom:=$15
$cyFrom:=$16
$widthFrom:=$17
$heightFrom:=$18
$cxTo:=$19
$cyTo:=$20
$widthTo:=$21
$heightTo:=$22
$style:=$23
$linkId:=$24

C_REAL:C285($sx; $sy)
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
$sx:=$Zoom->
$sy:=$Zoom->

$g:=DOM Create XML element:C865($DomImage->; "g"; "id"; $linkId; \
"editor:style"; $style; \
"editor:cx-to"; $cxTo; \
"editor:cy-to"; $cyTo; \
"editor:cx-from"; $cxFrom; \
"editor:cy-from"; $cyFrom; \
"editor:width-to"; $widthTo; \
"editor:height-to"; $heightTo; \
"editor:width-from"; $widthFrom; \
"editor:height-from"; $cyFrom; \
"editor:tx"; $tx; \
"editor:ty"; $ty; \
"color"; $color)

LINK_SIDES(->$cxTo; ->$cyTo; ->$cxFrom; ->$cyFrom; ->$widthTo; ->$heightTo; ->$widthFrom; ->$heightFrom)

$translate:="translate("+String:C10($cxFrom*$sx; "&xml")+","+String:C10($cyFrom*$sy; "&xml")+")"
$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
$transform:=$translate+" "+$scale

DOM SET XML ATTRIBUTE:C866($g; "transform"; $transform)

Case of 
	: ($style=1)
		
		$markerIdStart:=$linkId+"-marker-start"
		
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdStart; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$polyline:=DOM Create XML element:C865($marker; "polyline"; \
			"points"; "2,2 4,4 2,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel")
		
		$markerIdEnd:=$linkId+"-marker-end"
		
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdEnd; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$polyline:=DOM Create XML element:C865($marker; "polyline"; \
			"points"; "6,2 4,4 6,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel")
		
		$path:=DOM Create XML element:C865($g; "path"; \
			"id"; $linkId+"-path"; \
			"editor:object-id"; ""; \
			"marker-start"; "url(#"+$markerIdStart+")"; \
			"marker-end"; "url(#"+$markerIdEnd+")"; \
			"stroke-width"; $strokeWidth; \
			"stroke"; "currentColor")
		
	: ($style=2)
		
		$markerIdStart:=$linkId+"-marker-start"
		
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdStart; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$polyline:=DOM Create XML element:C865($marker; "polyline"; \
			"points"; "6,2 4,4 6,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel")
		
		$markerIdEnd:=$linkId+"-marker-end"
		
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdEnd; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$polyline:=DOM Create XML element:C865($marker; "polyline"; \
			"points"; "2,2 4,4 2,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel")
		
		$path:=DOM Create XML element:C865($g; "path"; \
			"id"; $linkId+"-path"; \
			"editor:object-id"; ""; \
			"marker-start"; "url(#"+$markerIdStart+")"; \
			"marker-end"; "url(#"+$markerIdEnd+")"; \
			"stroke-width"; $strokeWidth; \
			"stroke"; "currentColor")
		
	: ($style=3)
		
		$markerIdMid:=$linkId+"-marker-mid"
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdMid; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$path:=DOM Create XML element:C865($marker; "path"; \
			"d"; "M2,2 C2,2 3.25,3.75 2,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel"; \
			"stroke-linecap"; "round")
		
		$path:=DOM Create XML element:C865($g; "path"; \
			"id"; $linkId+"-path"; \
			"editor:object-id"; ""; \
			"marker-mid"; "url(#"+$markerIdMid+")"; \
			"marker-end"; "url(#"+$markerIdMid+")"; \
			"stroke-width"; $strokeWidth; \
			"stroke"; "none")
		
	: ($style=4)
		
		$markerIdMid:=$linkId+"-marker-mid"
		$marker:=DOM Create XML element:C865($g; "marker"; \
			"id"; $markerIdMid; \
			"editor:object-id"; ""; \
			"markerUnits"; "strokeWidth"; \
			"markerWidth"; 10; \
			"markerHeight"; 10; \
			"refX"; 4; \
			"refY"; 4; \
			"orient"; "auto")
		
		$path:=DOM Create XML element:C865($marker; "path"; \
			"d"; "M6,2 C6,2 4.75,3.75 6,6"; \
			"viewBox"; "0 0 10 10"; \
			"fill"; "none"; \
			"stroke"; "currentColor"; \
			"stroke-linejoin"; "bevel"; \
			"stroke-linecap"; "round")
		
		$path:=DOM Create XML element:C865($g; "path"; \
			"id"; $linkId+"-path"; \
			"editor:object-id"; ""; \
			"marker-start"; "url(#"+$markerIdMid+")"; \
			"marker-mid"; "url(#"+$markerIdMid+")"; \
			"stroke-width"; $strokeWidth; \
			"stroke"; "none")
		
End case 

$pathId:=$linkId+"-path"

C_REAL:C285($linkWidth; $linkHeight)
$linkWidth:=($cxTo-$cxFrom)
$linkHeight:=($cyTo-$cyFrom)

C_REAL:C285($linkLength)
$linkLength:=Square root:C539(($linkWidth^2)+($linkHeight^2))

C_LONGINT:C283($n)
$n:=$linkLength\9

$mx:=String:C10($linkWidth/$n; "&xml")
$my:=String:C10($linkHeight/$n; "&xml")

$m:=" l"+$mx+","+$my
$l:=$m*$n
$d:="M0,0"+$l

DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DomImage->; $pathId); "d"; $d)

$x:=$linkWidth/2
$y:=$linkHeight/2

$textId:=$linkId+"-textArea"

$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
$transform:=$translate

$textArea:=DOM Create XML element:C865($g; "textArea"; "id"; $textId; \
"editor:object-id"; ""; \
"x"; $x; "y"; $y; \
"width"; $lineWidth; \
"height"; $lineHeight; \
"fill"; $textColor; \
"text-align"; $textAlign; \
"font-size"; $fontSize; \
"font-style"; $fontStyle; \
"font-weight"; $fontWeight; \
"font-family"; $fontFamily; \
"transform"; $transform; \
"text-rendering"; "auto")

SVG_TEXTAREA_SET_TEXT($textArea; $textValue)