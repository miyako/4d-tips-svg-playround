ASSERT:C1129(FORM Get current page:C276<2)

$event:=Form event code:C388

$thisName:=OBJECT Get name:C1087(Object current:K67:2)

Case of 
	: ($event=-On Load:K2:1)
		
		//workaround for missing GET CONTAINER SIZE command in v12
		C_LONGINT:C283($l; $t; $r; $b)
		OBJECT GET COORDINATES:C663(*; $thisName; $l; $t; $r; $b)
		Editor_INIT($thisName; $l; $t; $r-$l; $b-$t)
		
		CLEAR VARIABLE:C89(ClickedObject)
		CLEAR VARIABLE:C89(Event)
		
	: ($event=-On Clicked:K2:4)
		
		ClickedObject:=Editor_Get_clicked_object($thisName)
		Event:="On Click"
		
	: ($event=-On Double Clicked:K2:5)
		
		ClickedObject:=Editor_Get_clicked_object($thisName)
		Event:="On Double Click"
		
	: ($event=-On Menu Selected:K2:14)
		
		ClickedObject:=Editor_Get_clicked_object($thisName)
		Event:="On Contextual Click"
		
	: ($event=On Getting Focus:K2:7)
		
		OBJECT SET ENABLED:C1123(*; "Tool@"; True:C214)
		
	: ($event=On Losing Focus:K2:8)
		
		OBJECT SET ENABLED:C1123(*; "Tool@"; False:C215)
		
End case 