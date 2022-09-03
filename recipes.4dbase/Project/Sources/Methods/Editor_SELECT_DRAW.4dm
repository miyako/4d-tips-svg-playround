//%attributes = {"invisible":true}
C_REAL:C285($1; $2)

C_BOOLEAN:C305($shouldRedraw)

$MouseX:=$1
$MouseY:=$2

C_REAL:C285($scrollV; $scrollH)
OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrollV; $scrollH)

$MouseX:=$MouseX+$scrollH
$MouseY:=$MouseY+$scrollV

$select:=Editor_SELECT_Get

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")

If (Length:C16($select)#0)
	
	C_REAL:C285($width; $height)
	C_REAL:C285($x; $y)
	
	$width:=Abs:C99($MouseX-$ClickX->)
	$height:=Abs:C99($MouseY-$ClickY->)
	
	If ($MouseX>$ClickX->)
		$x:=$ClickX->
	Else 
		$x:=$MouseX
	End if 
	If ($MouseY>$ClickY->)
		$y:=$ClickY->
	Else 
		$y:=$MouseY
	End if 
	
	$translate:="translate("+String:C10($x; "&xml")+","+String:C10($y; "&xml")+")"
	$transform:=$translate
	
	If (Editor_SELECT_Objects($x; $y; $width; $height))
		//only update if the selection has changed
		$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
		$SelectionChanged->:=1
		$shouldRedraw:=True:C214
		DOM SET XML ATTRIBUTE:C866($select; "width"; $width; "height"; $height; "transform"; $transform)
		
	Else 
		//this is enough to simply draw the rect 
		SVG SET ATTRIBUTE:C1055($Image->; "select"; "width"; $width; "height"; $height; "transform"; $transform)
	End if 
	
Else   //handle manipulation
	
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	$HandleId:=OBJECT Get pointer:C1124(Object named:K67:5; "HandleId")
	
	$shouldUpdate:=False:C215
	
	If (Length:C16($HandleId->)#0)
		
		$shouldUpdate:=SELECT_Resize($DomData->; (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); $scrollH; $scrollV; False:C215)
		
	Else 
		
		$shouldUpdate:=SELECT_Move($DomData->; (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); $scrollH; $scrollV; False:C215)
		
	End if 
	
	If ($shouldUpdate)
		
		LINK_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; False:C215)
		GROUP_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; False:C215)
		
	End if 
	
	$shouldRedraw:=False:C215
	
End if 

If ($shouldRedraw)
	$Image->:=Editor_Get_image($DomImage->)
End if 