//%attributes = {"invisible":true}
C_LONGINT:C283($x; $y; $b)
GET MOUSE:C468($x; $y; $b)

$MouseX:=$x-Editor_Get_offset_x
$MouseY:=$y-Editor_Get_offset_y

If ($b=0)
	
	SET TIMER:C645(0)
	SET CURSOR:C469(0)
	
	If (Editor_SELECT_End($MouseX; $MouseY))
		Editor_UPDATE
		HISTORY_APPEND
	End if 
	
Else 
	
	Editor_SELECT_DRAW($MouseX; $MouseY)
	
End if 