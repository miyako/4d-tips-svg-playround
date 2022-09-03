$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		Self:C308->:=Find in array:C230(Self:C308->; "100%")
		
	: ($event=On Clicked:K2:4)
		
		//%W-533.3
		Editor_SET_ZOOM("Editor"; Num:C11(Self:C308->{Self:C308->})/100)
		//%W+533.3
		
End case 