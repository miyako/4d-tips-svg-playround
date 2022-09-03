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

$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

$growState:=Editor_GROW_Get($id)

If (Length:C16($growState)=0)
	$handleId:=Substring:C12((OBJECT Get pointer:C1124(Object named:K67:5; "HandleId")->); 8; 2)
Else 
	$handleId:=$growState
End if 

If ($shouldRedraw)
	
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	$object:=DOM Find XML element by ID:C1010($DomData->; $id)
	
	C_REAL:C285($x; $y; $width; $height)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "height"; $height)
	
	$moveX:=$moveX+($scrollH/$Zoom->)
	$moveY:=$moveY+($scrollV/$Zoom->)
	
	Case of 
		: ($handleId="tl")
			
			$x:=$x+$moveX
			$y:=$y+$moveY
			$width:=$width-$moveX
			$height:=$height-$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width; "y"; $y; "height"; $height)
			
		: ($handleId="tm")
			
			$y:=$y+$moveY
			$height:=$height-$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "y"; $y; "height"; $height)
			
		: ($handleId="tr")
			
			$y:=$y+$moveY
			$height:=$height-$moveY
			$width:=$width+$moveX
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width; "y"; $y; "height"; $height)
			
		: ($handleId="ml")
			
			$x:=$x+$moveX
			$width:=$width-$moveX
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width)
			
		: ($handleId="mr")
			
			$width:=$width+$moveX
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width)
			
			
		: ($handleId="bl")
			
			$x:=$x+$moveX
			$width:=$width-$moveX
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width; "y"; $y; "height"; $height)
			
		: ($handleId="bm")
			
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "y"; $y; "height"; $height)
			
		: ($handleId="br")
			
			$width:=$width+$moveX
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
				If (Length:C16($growState)#0)
					Editor_GROW_REVERSE($id)
				End if 
			End if 
			
			DOM SET XML ATTRIBUTE:C866($object; "x"; $x; "width"; $width; "y"; $y; "height"; $height)
			
	End case 
	
	$shouldUpdate:=($moveX#0) | ($moveY#0)
	//$shouldUpdate:=True
	
Else 
	
	$selectId:="select-"+$id
	$selectRectId:="select-rect-"+$id
	
	$selectTLId:="select-tl-"+$id
	$selectTMId:="select-tm-"+$id
	$selectTRId:="select-tr-"+$id
	$selectMLId:="select-ml-"+$id
	$selectMRId:="select-mr-"+$id
	$selectBLId:="select-bl-"+$id
	$selectBMId:="select-bm-"+$id
	$selectBRId:="select-br-"+$id
	
	$dom:=DOM Find XML element by ID:C1010($DomImage->; $id)
	
	C_REAL:C285($tx; $ty; $sx; $sy; $r; $cx; $cy)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)
	
	C_TEXT:C284($objectType; $objectId)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-id"; $objectId)
	
	C_REAL:C285($x; $y; $width; $height)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)
	
	$offsetX:=Num:C11(String:C10((Cos:C18(($r)*Degree:K30:2)*$moveX*$sx)+(Sin:C17(($r)*Degree:K30:2)*$moveY*$sy)))
	$offsetY:=Num:C11(String:C10((Cos:C18(($r)*Degree:K30:2)*$moveY*$sy)+(-Sin:C17(($r)*Degree:K30:2)*$moveX*$sx)))
	
	Case of 
		: ($handleId="tl")
			
			$width:=(($width*$sx)-$offsetX)
			$height:=(($height*$sy)-$offsetY)
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))))
			$ty:=$ty+Num:C11(String:C10((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))))
			
		: ($handleId="tm")
			
			$width:=$width*$sx
			$height:=($height*$sy)-$offsetY
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx-Num:C11(String:C10(($offsetY/2)*Sin:C17(($r)*Degree:K30:2)))
			$ty:=$ty+Num:C11(String:C10(($offsetY/2)*Cos:C18(($r)*Degree:K30:2)))
			
		: ($handleId="tr")
			
			$width:=($width*$sx)+$offsetX
			$height:=($height*$sy)-$offsetY
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))))
			$ty:=$ty+Num:C11(String:C10((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))))
			
		: ($handleId="ml")
			
			$width:=($width*$sx)-$offsetX
			$height:=$height*$sy
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
			$ty:=$ty+Num:C11(String:C10(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
			
		: ($handleId="mr")
			
			$width:=($width*$sx)+$offsetX
			$height:=$height*$sy
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(($offsetX/2)*Cos:C18(($r)*Degree:K30:2)))
			$ty:=$ty+Num:C11(String:C10(($offsetX/2)*Sin:C17(($r)*Degree:K30:2)))
			
		: ($handleId="bl")
			
			$width:=($width*$sx)-$offsetX
			$height:=($height*$sy)+$offsetY
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))))
			$ty:=$ty+Num:C11(String:C10((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))))
			
		: ($handleId="bm")
			
			$width:=$width*$sx
			$height:=($height*$sy)+$offsetY
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx-Num:C11(String:C10(($offsetY/2)*Sin:C17(($r)*Degree:K30:2)))
			$ty:=$ty+Num:C11(String:C10(($offsetY/2)*Cos:C18(($r)*Degree:K30:2)))
			
		: ($handleId="br")
			
			$width:=($width*$sx)+$offsetX
			$height:=($height*$sy)+$offsetY
			$x:=-($width/2)
			$y:=-($height/2)
			
			$tx:=$tx+Num:C11(String:C10(-(($offsetY/2)*Sin:C17(($r)*Degree:K30:2))+(($offsetX/2)*Cos:C18(($r)*Degree:K30:2))))
			$ty:=$ty+Num:C11(String:C10((($offsetY/2)*Cos:C18(($r)*Degree:K30:2))+(($offsetX/2)*Sin:C17(($r)*Degree:K30:2))))
			
	End case 
	
	$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
	$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
	$rotate:="rotate("+String:C10($r; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"
	
	$transform:=$translate+" "+$scale+" "+$rotate
	$transformSelect:=$translate+" "+$rotate
	
	C_BOOLEAN:C305($flipX; $flipY)
	
	//flip
	If ($width<0)
		$x:=$x+$width
		$width:=-$width
		$x1:=$x+$width
		$x2:=$x
		$flipX:=True:C214
	Else 
		$x1:=$x
		$x2:=$x+$width
	End if 
	
	If ($height<0)
		$y:=$y+$height
		$height:=-$height
		$y1:=$y+$height
		$y2:=$y
		$flipY:=True:C214
	Else 
		$y1:=$y
		$y2:=$y+$height
	End if 
	
	//do not update the dom during this event, we need the original tx,ty during movement
	
	If ($width<1)
		$x:=$x-1
		$width:=1
	End if 
	
	If ($height<1)
		$y:=$y-1
		$height:=1
	End if 
	
	//move the target
	C_REAL:C285($strokeWidth)
	SVG GET ATTRIBUTE:C1056($Image->; $id+"-rect"; "stroke-width"; $strokeWidth)
	SVG SET ATTRIBUTE:C1055($Image->; $id+"-rect"; \
		"x"; ($x/$sx); \
		"y"; ($y/$sy); \
		"width"; ($width/$sx); \
		"height"; ($height/$sy))
	
	C_TEXT:C284($wordWrap)
	SVG GET ATTRIBUTE:C1056($Image->; $id+"-textArea"; "editor:word-wrap"; $wordWrap)
	
	If ($wordWrap="false")
		C_REAL:C285($lineHeight; $rectHeight)
		SVG GET ATTRIBUTE:C1056($Image->; $id+"-textArea"; "editor:line-height"; $lineHeight)
		$rectHeight:=($height/$sy)
		If ($lineHeight>$rectHeight)
			$lineHeight:=$rectHeight
		End if 
		SVG SET ATTRIBUTE:C1055($Image->; $id+"-textArea"; "x"; $x/$sx; "y"; $y/$sy; "width"; $width/$sx; "height"; $lineHeight)
	Else 
		SVG SET ATTRIBUTE:C1055($Image->; $id+"-textArea"; "x"; $x/$sx; "y"; $y/$sy; "width"; $width/$sx; "height"; $height/$sy)
	End if 
	
	//move the primitive or group
	SVG SET ATTRIBUTE:C1055($Image->; $id; "transform"; $transform)
	
	//move the object
	SVG SET ATTRIBUTE:C1055($Image->; $selectId; "transform"; $transformSelect)
	
	//move the rect
	SVG SET ATTRIBUTE:C1055($Image->; $selectRectId; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
	
	//move the handles
	SVG SET ATTRIBUTE:C1055($Image->; $selectTLId; "x"; $x-5; "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectTMId; "x"; $x-5+($width/2); "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectTRId; "x"; $x-5+$width; "y"; $y-5)
	SVG SET ATTRIBUTE:C1055($Image->; $selectMLId; "x"; $x-5; "y"; $y-5+($height/2))
	SVG SET ATTRIBUTE:C1055($Image->; $selectMRId; "x"; $x-5+$width; "y"; $y-5+($height/2))
	SVG SET ATTRIBUTE:C1055($Image->; $selectBLId; "x"; $x-5; "y"; $y-5+$height)
	SVG SET ATTRIBUTE:C1055($Image->; $selectBMId; "x"; $x-5+($width/2); "y"; $y-5+$height)
	SVG SET ATTRIBUTE:C1055($Image->; $selectBRId; "x"; $x-5+$width; "y"; $y-5+$height)
	
	//$moveX:=$moveX+($scrollH/$Zoom->)
	//$moveY:=$moveY+($scrollV/$Zoom->)
	
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:x"; $x)
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:y"; $y)
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:width"; $width)
	SVG GET ATTRIBUTE:C1056($Image->; $id; "editor:height"; $height)
	
	Case of 
		: ($handleId="tl")
			
			$x:=$x+$moveX
			$y:=$y+$moveY
			$width:=$width-$moveX
			$height:=$height-$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
		: ($handleId="tm")
			
			$y:=$y+$moveY
			$height:=$height-$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
		: ($handleId="tr")
			
			$y:=$y+$moveY
			$height:=$height-$moveY
			$width:=$width+$moveX
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
		: ($handleId="ml")
			
			$x:=$x+$moveX
			$width:=$width-$moveX
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
		: ($handleId="mr")
			
			$width:=$width+$moveX
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
		: ($handleId="bl")
			
			$x:=$x+$moveX
			$width:=$width-$moveX
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
		: ($handleId="bm")
			
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
		: ($handleId="br")
			
			$width:=$width+$moveX
			$height:=$height+$moveY
			
			If ($height<0)
				$y:=$y+$height
				$height:=-$height
			End if 
			
			If ($width<0)
				$x:=$x+$width
				$width:=-$width
			End if 
			
	End case 
	
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:x"; $x)
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:y"; $y)
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:width"; $width)
	SVG SET ATTRIBUTE:C1055($Image->; $id; "editor:height"; $height)
	
End if 

$0:=$shouldUpdate