$event:=Form event code:C388

Case of 
	: ($event=On Clicked:K2:4)
		
		SET TIMER:C645(-1)
		
		$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start")
		$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count")
		$Start->:=Milliseconds:C459
		$Count->:=0x0000
		
End case 