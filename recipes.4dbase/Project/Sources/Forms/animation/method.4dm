$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		GOTO OBJECT:C206(*; "")
		
	: ($event=On Resize:K2:27)
		
		$Loading:=OBJECT Get pointer:C1124(Object named:K67:5; "Loading")
		
		If (1=$Loading->)
			$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start"; "Loading")
			$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count"; "Loading")
			$Start->:=Milliseconds:C459
			$Count->:=0x0000
		End if 
		
End case 