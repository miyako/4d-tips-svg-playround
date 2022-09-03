$event:=Form event code:C388

Case of 
	: ($event=On Drag Over:K2:13)
		
		
		
	: ($event=On Drop:K2:12)
		
		
		
	: ($event=On Clicked:K2:4)
		
		Editor_ON_CLICK
		
	: ($event=On Double Clicked:K2:5)
		
		CALL SUBFORM CONTAINER:C1086(-On Double Clicked:K2:5)
		
End case 