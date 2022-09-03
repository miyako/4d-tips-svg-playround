$event:=Form event code:C388

Case of 
	: ($event=On Data Change:K2:15)
		
		If (Shift down:C543)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "text"; "4D-text"; Replace string:C233(Get edited text:C655; "\\"; "\r"; *))
		Else 
			SVG SET ATTRIBUTE:C1055(*; "Image"; "text"; "4D-text"; Get edited text:C655)
		End if 
		
		GOTO OBJECT:C206(*; OBJECT Get name:C1087(Object current:K67:2))
		
End case 