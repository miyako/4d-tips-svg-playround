//%attributes = {"invisible":true}
C_LONGINT:C283($x; $y; $b)
C_REAL:C285($MouseX; $MouseY)

Editor_SET_OFFSET

$ClickX:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickX")
$ClickY:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickY")
$ClickObject:=OBJECT Get pointer:C1124(Object named:K67:5; "ClickObject")

GET MOUSE:C468($x; $y; $b)

C_REAL:C285($scrollV; $scrollH)
OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrollV; $scrollH)

$MouseX:=$x-Editor_Get_offset_x+$scrollH
$MouseY:=$y-Editor_Get_offset_y+$scrollV

$ClickX->:=$MouseX
$ClickY->:=$MouseY

Editor_GROW_CLEAR

$ClickObject->:=Editor_SELECT_Start($MouseX; $MouseY)

If (Contextual click:C713)
	
	CALL SUBFORM CONTAINER:C1086(-On Menu Selected:K2:14)
	
Else 
	
	CALL SUBFORM CONTAINER:C1086(-On Clicked:K2:4)
	
End if 