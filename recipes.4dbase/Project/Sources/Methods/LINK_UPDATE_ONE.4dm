//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_POINTER:C301($3)
C_TEXT:C284($4)
C_REAL:C285($5; $sx; $6; $sy; $7; $scrollH; $8; $scrollV)
C_BOOLEAN:C305($9)

$domData:=$1
$domImage:=$2
$Image:=$3
$link:=$4
$sx:=$5
$sy:=$6
$scrollH:=$7
$scrollV:=$8
$volatile:=$9

C_TEXT:C284($from; $to; $linkId)
DOM GET XML ATTRIBUTE BY NAME:C728($link; "from"; $from)
DOM GET XML ATTRIBUTE BY NAME:C728($link; "to"; $to)
DOM GET XML ATTRIBUTE BY NAME:C728($link; "id"; $linkId)

C_REAL:C285($x; $y; $width; $height)

If (Not:C34($volatile))
	$objectFrom:=DOM Find XML element by ID:C1010($domData; $from)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "height"; $height)
Else 
	SVG GET ATTRIBUTE:C1056(*; "Image"; $from; "editor:x"; $x)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $from; "editor:y"; $y)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $from; "editor:width"; $width)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $from; "editor:height"; $height)
End if 

$cxFrom:=$x+($width/2)
$cyFrom:=$y+($height/2)
$widthFrom:=$width/2
$heightFrom:=$height/2

If (Not:C34($volatile))
	$objectTo:=DOM Find XML element by ID:C1010($domData; $to)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "height"; $height)
Else 
	SVG GET ATTRIBUTE:C1056(*; "Image"; $to; "editor:x"; $x)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $to; "editor:y"; $y)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $to; "editor:width"; $width)
	SVG GET ATTRIBUTE:C1056(*; "Image"; $to; "editor:height"; $height)
End if 

$cxTo:=$x+($width/2)
$cyTo:=$y+($height/2)
$widthTo:=$width/2
$heightTo:=$height/2

If (Not:C34($volatile))
	$link:=DOM Find XML element by ID:C1010($domData; $linkId)
	DOM SET XML ATTRIBUTE:C866($link; \
		"cx-to"; $cxTo; \
		"cy-to"; $cyTo; \
		"cx-from"; $cxFrom; \
		"cy-from"; $cyFrom; \
		"width-to"; $widthTo; \
		"height-to"; $heightTo; \
		"width-from"; $widthFrom; \
		"height-from"; $heightFrom)
End if 

LINK_SIDES(->$cxTo; ->$cyTo; ->$cxFrom; ->$cyFrom; ->$widthTo; ->$heightTo; ->$widthFrom; ->$heightFrom)

$translate:="translate("+String:C10($cxFrom*$sx; "&xml")+","+String:C10($cyFrom*$sy; "&xml")+")"
$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
$transform:=$translate+" "+$scale

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

$x:=$linkWidth/2
$y:=$linkHeight/2

$textId:=$linkId+"-textArea"

If (Not:C34($volatile))
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $pathId); "d"; $d)
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $linkId); "transform"; $transform)
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $textId); "x"; $x; "y"; $y)
Else 
	SVG SET ATTRIBUTE:C1055($Image->; $pathId; "d"; $d)
	SVG SET ATTRIBUTE:C1055($Image->; $linkId; "transform"; $transform)
	SVG SET ATTRIBUTE:C1055($Image->; $textId; "x"; $x; "y"; $y)
End if 