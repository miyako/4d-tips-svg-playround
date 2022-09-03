$event:=Form event code:C388

Case of 
	: ($event=On Getting Focus:K2:7)
		
		Self:C308->:=1
		
		If (1=Self:C308->)
			$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start"; OBJECT Get name:C1087(Object current:K67:2))
			$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count"; OBJECT Get name:C1087(Object current:K67:2))
			$Start->:=Milliseconds:C459
			$Count->:=0x0000
		End if 
		
	: ($event=On Losing Focus:K2:8)
		
		Self:C308->:=0
		
End case 