//%attributes = {"invisible":true}
$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

C_LONGINT:C283($i)
C_REAL:C285($x; $y)
C_REAL:C285($width; $height)

ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "selects"); "selects/select"; $selects)

For ($i; 1; Size of array:C274($selects))
	
	$select:=$selects{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($select; "object-id"; $objectId)
	
	$object:=DOM Find XML element by ID:C1010($DomData->; $objectId)
	$selectId:="select-"+$objectId
	$select:=DOM Find XML element by ID:C1010($DomImage->; $selectId)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "height"; $height)
	
	C_REAL:C285($sx; $sy)
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
	$transformSelect:=$translate+" "+$rotate
	
	$g:=DOM Find XML element by ID:C1010($DomImage->; $objectId)
	
	DOM SET XML ATTRIBUTE:C866($g; "transform"; $transform; \
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
		"editor:r"; $r)
	
	$x:=(-$width/2)
	$y:=(-$height/2)
	
	If ($width<1)
		$x:=$x-1
		$width:=1
	End if 
	
	If ($height<1)
		$y:=$y-1
		$height:=1
	End if 
	
	$textId:=$objectId+"-textArea"
	$textArea:=DOM Find XML element by ID:C1010($DomImage->; $textId)
	
	$rectId:=$objectId+"-rect"
	$rect:=DOM Find XML element by ID:C1010($DomImage->; $rectId)
	
	DOM SET XML ATTRIBUTE:C866($rect; \
		"x"; $x; \
		"y"; $y; \
		"width"; $width; \
		"height"; $height)
	
	DOM SET XML ATTRIBUTE:C866($textArea; \
		"x"; $x; \
		"y"; $y; \
		"width"; $width; \
		"height"; $height)
	
	DOM SET XML ATTRIBUTE:C866($select; "transform"; $transformSelect)
	
	$x:=(-$width/2)*$sx
	$y:=(-$height/2)*$sy
	$width:=$width*$sx
	$height:=$height*$sy
	
	$selectRectId:="select-rect-"+$objectId
	$selectRect:=DOM Find XML element by ID:C1010($DomImage->; $selectRectId)
	DOM SET XML ATTRIBUTE:C866($selectRect; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	$CanvasCurrentSelectTL:=DOM Find XML element by ID:C1010($DomImage->; "select-tl-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTL; "x"; $x-(10/2); "y"; $y-(10/2))
	
	$CanvasCurrentSelectTM:=DOM Find XML element by ID:C1010($DomImage->; "select-tm-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTM; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2))
	
	$CanvasCurrentSelectTR:=DOM Find XML element by ID:C1010($DomImage->; "select-tr-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTR; "x"; $x-(10/2)+$width; "y"; $y-(10/2))
	
	$CanvasCurrentSelectML:=DOM Find XML element by ID:C1010($DomImage->; "select-ml-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectML; "x"; $x-(10/2); "y"; $y-(10/2)+($height/2))
	
	$CanvasCurrentSelectMR:=DOM Find XML element by ID:C1010($DomImage->; "select-mr-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectMR; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+($height/2))
	
	$CanvasCurrentSelectBL:=DOM Find XML element by ID:C1010($DomImage->; "select-bl-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBL; "x"; $x-(10/2); "y"; $y-(10/2)+$height)
	
	$CanvasCurrentSelectBM:=DOM Find XML element by ID:C1010($DomImage->; "select-bm-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBM; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2)+$height)
	
	$CanvasCurrentSelectBR:=DOM Find XML element by ID:C1010($DomImage->; "select-br-"+$objectId)
	DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBR; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+$height)
	
End for 

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Image->:=Editor_Get_image($DomImage->)