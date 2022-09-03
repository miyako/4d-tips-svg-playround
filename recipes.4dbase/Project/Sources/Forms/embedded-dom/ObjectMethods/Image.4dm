$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"digit.svg"
		$DOM:=DOM Parse XML source:C719($path)
		SVG EXPORT TO PICTURE:C1017($DOM; Self:C308->; Own XML data source:K45:18)
		
	: ($event=On Unload:K2:2)
		
		//no need to close the DOM, it is embedded in the picture
		
	: ($event=On Clicked:K2:4)
		
		$clicked:=SVG Find element ID by coordinates:C1054(Self:C308->; MOUSEX; MOUSEY)
		
		If ($clicked#"")
			
			C_REAL:C285($fillOpacity)
			
			SVG GET ATTRIBUTE:C1056(Self:C308->; $clicked; "fill-opacity"; $fillOpacity)
			
			If ($fillOpacity=1)
				SVG SET ATTRIBUTE:C1055(Self:C308->; $clicked; "fill-opacity"; 0.2; *)
			Else 
				SVG SET ATTRIBUTE:C1055(Self:C308->; $clicked; "fill-opacity"; 1; *)
			End if 
			
		End if 
		
End case 