//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_BOOLEAN:C305($0; $shouldRedraw; $shouldUpdate)

$MouseX:=$1
$MouseY:=$2

C_REAL:C285($scrollV; $scrollH)
OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrollV; $scrollH)

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")

//did selection change?
$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
$SelectionChanged->:=HISTORY_Is_new_selection($DomData->)

$select:=Editor_SELECT_Get
If (Length:C16($select)#0)
	DOM REMOVE XML ELEMENT:C869($select)
	Editor_SELECT_SET("")
	$shouldRedraw:=True:C214
Else   //handle manipulation
	
	$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
	$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
	
	C_LONGINT:C283($count; $i)
	
	ARRAY TEXT:C222($selects; 0)
	$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "selects"); "selects/select"; $selects)
	
	$count:=Size of array:C274($selects)
	
	$HandleId:=OBJECT Get pointer:C1124(Object named:K67:5; "HandleId")
	
	If ($count#0)
		If (Length:C16($HandleId->)#0)
			For ($i; 1; $count)
				DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
				$shouldUpdate:=$shouldUpdate | Editor_SELECT_Resize($objectId; (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); $scrollH; $scrollV; True:C214)
			End for 
		Else 
			For ($i; 1; $count)
				DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
				$shouldUpdate:=$shouldUpdate | Editor_SELECT_Move($objectId; (($MouseX-$ClickX->)/$Zoom->); (($MouseY-$ClickY->)/$Zoom->); $scrollH; $scrollV; True:C214)
			End for 
		End if 
		$HandleId->:=""
		$shouldRedraw:=True:C214
		
		LINK_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; True:C214)
		GROUP_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; True:C214)
		
	End if 
End if 

If ($shouldRedraw)
	//this will erase the selection rect
	$Image->:=Editor_Get_image($DomImage->)
End if 

$0:=$shouldUpdate