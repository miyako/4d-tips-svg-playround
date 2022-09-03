$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"digit.svg"
		$DOM->:=DOM Parse XML source:C719($path)
		SVG EXPORT TO PICTURE:C1017($DOM->; Self:C308->; Get XML data source:K45:16)
		
	: ($event=On Unload:K2:2)
		
		DOM CLOSE XML:C722($DOM->)
		
	: ($event=On Clicked:K2:4)
		
		$clicked:=SVG Find element ID by coordinates:C1054(Self:C308->; MOUSEX; MOUSEY)
		
		If ($clicked#"")
			
			C_REAL:C285($fillOpacity)
			
			SVG GET ATTRIBUTE:C1056(Self:C308->; $clicked; "fill-opacity"; $fillOpacity)
			
			If ($fillOpacity=1)
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; $clicked); "class"; "digits-dark")
			Else 
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; $clicked); "class"; "digits-bright")
			End if 
			
			$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
			SVG EXPORT TO PICTURE:C1017($DOM->; $Image->; Get XML data source:K45:16)
			
		End if 
		
End case 