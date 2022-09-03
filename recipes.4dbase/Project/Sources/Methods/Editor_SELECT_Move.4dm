//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_REAL:C285($2; $moveX)
C_REAL:C285($3; $moveY)
C_REAL:C285($4; $scrollH)
C_REAL:C285($5; $scrollV)
C_BOOLEAN:C305($6; $shouldRedraw)
C_BOOLEAN:C305($0; $shouldUpdate)

$id:=$1
$moveX:=$2
$moveY:=$3
$scrollH:=$4
$scrollV:=$5
$shouldRedraw:=$6

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$selectId:="select-"+$id

$dom:=DOM Find XML element by ID:C1010($DomImage->; $id)

C_REAL:C285($tx; $ty; $sx; $sy; $r; $cx; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)

$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
$tx:=$tx+($moveX*$Zoom->)
$ty:=$ty+($moveY*$Zoom->)

$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
$rotate:="rotate("+String:C10($r; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"

$transform:=$translate+" "+$scale+" "+$rotate
$transformSelect:=$translate+" "+$rotate

C_REAL:C285($x; $y; $width; $height)

If ($shouldRedraw)
	
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	$object:=DOM Find XML element by ID:C1010($DomData->; $id)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
	
	$moveX:=$moveX+($scrollH/$sx)
	$moveY:=$moveY+($scrollV/$sy)
	
	$x:=$x+$moveX
	$y:=$y+$moveY
	
	DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "y"; $y)
	
	$shouldUpdate:=($moveX#0) | ($moveY#0)
	
Else 
	
	//do not update the dom during this event, we need the original tx,ty during movement
	SVG SET ATTRIBUTE:C1055($Image->; $id; "transform"; $transform)
	SVG SET ATTRIBUTE:C1055($Image->; $selectId; "transform"; $transformSelect)
	
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:x"; $x)
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:y"; $y)
	
	//do not account for the scroll position!
	$x:=$x+$moveX
	$y:=$y+$moveY
	
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:x"; $x)
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:y"; $y)
	
End if 

$0:=$shouldUpdate