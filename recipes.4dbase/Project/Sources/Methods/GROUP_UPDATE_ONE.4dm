//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_POINTER:C301($3)
C_TEXT:C284($4)
C_REAL:C285($5; $sx; $6; $sy; $7; $scrollH; $8; $scrollV)
C_BOOLEAN:C305($9)

$domData:=$1
$domImage:=$2
$Image:=$3
$group:=$4
$sx:=$5
$sy:=$6
$scrollH:=$7
$scrollV:=$8
$volatile:=$9

C_TEXT:C284($groupId)
C_REAL:C285($strokeWidth; $marginX; $marginY)
DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
DOM GET XML ATTRIBUTE BY NAME:C728($group; "strokeWidth"; $strokeWidth)
DOM GET XML ATTRIBUTE BY NAME:C728($group; "marginX"; $marginX)
DOM GET XML ATTRIBUTE BY NAME:C728($group; "marginY"; $marginY)

C_REAL:C285($x; $y; $width; $height)
C_REAL:C285($l; $t; $r; $b)

GROUP_GET_SIZE($group; ->$x; ->$y; ->$width; ->$height; Not:C34($volatile); $domData)

C_REAL:C285($tx; $ty)
$tx:=(($width/2)+$x)*$sx
$ty:=(($height/2)+$y)*$sy

C_REAL:C285($cx; $cy; $r)

$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
$transform:=$translate+" "+$scale

$rectId:=$groupId+"-rect"
$textId:=$groupId+"-textArea"

$x:=(-$width/2)-($strokeWidth/2)-$marginX
$y:=(-$height/2)-($strokeWidth/2)-$marginY
$width:=$width+$strokeWidth+($marginX*2)
$height:=$height+$strokeWidth+($marginY*2)

If (Not:C34($volatile))
	
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $groupId); "transform"; $transform)
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $rectId); "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($domImage; $textId); "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
Else 
	
	SVG SET ATTRIBUTE:C1055($Image->; $groupId; "transform"; $transform)
	SVG SET ATTRIBUTE:C1055($Image->; $rectId; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	SVG SET ATTRIBUTE:C1055($Image->; $textId; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
End if 