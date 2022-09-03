$event:=Form event code:C388

Case of 
	: ($event=On Unload:K2:2)
		
		SET TIMER:C645(0)
		
		$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
		DOM CLOSE XML:C722($DOM->)
		
	: ($event=On Timer:K2:25)
		
		GET MOUSE:C468($x; $y; $b)
		
		OBJECT SET VISIBLE:C603(*; "Rate"; ($b=1))
		OBJECT SET VISIBLE:C603(*; "L@"; False:C215)
		
		If ($b=0)
			SET TIMER:C645(0)
		Else 
			$focusObjectName:=OBJECT Get name:C1087(Object with focus:K67:3)
			$focusObject:=OBJECT Get pointer:C1124(Object with focus:K67:3)
			
			Case of 
				: ($focusObjectName="Image1")
					
					OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
					
					$R:=OBJECT Get pointer:C1124(Object named:K67:5; "R1")
					If (Caps lock down:C547)
						$R->:=$R->+Choose:C955($R->#0; -1; 359)
					Else 
						$R->:=$R->+Choose:C955($R->#360; 1; -360)
					End if 
					SVG SET ATTRIBUTE:C1055($focusObject->; "image"; "transform"; "rotate("+String:C10($R->)+",0,0)")
					
				: ($focusObjectName="Image2")
					
					OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L2@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L4@"; True:C214)
					
					$R:=OBJECT Get pointer:C1124(Object named:K67:5; "R2")
					If (Caps lock down:C547)
						$R->:=$R->+Choose:C955($R->#0; -1; 359)
					Else 
						$R->:=$R->+Choose:C955($R->#360; 1; -360)
					End if 
					$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
					DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "image"); "transform"; "rotate("+String:C10($R->)+",0,0)")
					SVG EXPORT TO PICTURE:C1017($DOM->; $focusObject->; Get XML data source:K45:16)
					
				: ($focusObjectName="Image3")
					
					OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
					OBJECT SET VISIBLE:C603(*; "L4@"; True:C214)
					
					$R:=OBJECT Get pointer:C1124(Object named:K67:5; "R3")
					If (Caps lock down:C547)
						$R->:=$R->+Choose:C955($R->#0; -1; 359)
					Else 
						$R->:=$R->+Choose:C955($R->#360; 1; -360)
					End if 
					SVG SET ATTRIBUTE:C1055($focusObject->; "image"; "transform"; "rotate("+String:C10($R->)+",0,0)"; *)
					
			End case 
			
			$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count")
			$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start")
			$Rate:=OBJECT Get pointer:C1124(Object named:K67:5; "Rate")
			
			$Count->:=$Count->+1
			$Rate->:=String:C10($Count->/(Milliseconds:C459-$Start->)*1000; "##0.## redraws / sec")
			
		End if 
		
	: ($event=On Clicked:K2:4) | ($event=On Load:K2:1)
		
		If ($event=On Load:K2:1)
			$PNG:=OBJECT Get pointer:C1124(Object named:K67:5; "PNG")
			$PNG->:=1
			$focusObjectName:="png"
		Else 
			$focusObjectName:=Lowercase:C14(OBJECT Get name:C1087(Object with focus:K67:3); *)
		End if 
		
		Case of 
			: ($focusObjectName="svg") | ($focusObjectName="png")
				
				$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"images.4dsvg"
				$imagePath:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"seal."+$focusObjectName
				
				$R:=OBJECT Get pointer:C1124(Object named:K67:5; "R1")
				$Image1:=OBJECT Get pointer:C1124(Object named:K67:5; "Image1")
				$Image2:=OBJECT Get pointer:C1124(Object named:K67:5; "Image2")
				$Image3:=OBJECT Get pointer:C1124(Object named:K67:5; "Image3")
				$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
				
				DOCUMENT TO BLOB:C525($path; $template)
				PROCESS 4D TAGS:C816($template; $template; $imagePath; $R->)
				BLOB TO PICTURE:C682($template; $Image1->; ".svg")
				
				$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"images.svg"
				DOCUMENT TO BLOB:C525($imagePath; $imageData)
				C_TEXT:C284($data)
				BASE64 ENCODE:C895($imageData; $data)
				
				If ($event=On Load:K2:1)
					SVG EXPORT TO PICTURE:C1017(DOM Parse XML source:C719($path); $Image3->; Own XML data source:K45:18)
					$DOM->:=DOM Parse XML source:C719($path)
				End if 
				
				DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "image"); "xlink:href"; "data:image/"+$focusObjectName+";base64,"+$data)
				DOM SET XML ELEMENT VALUE:C868(DOM Find XML element by ID:C1010($DOM->; "text"); "data:image/"+$focusObjectName+";base64,...")
				SVG EXPORT TO PICTURE:C1017($DOM->; $Image2->; Get XML data source:K45:16)
				
				$R:=OBJECT Get pointer:C1124(Object named:K67:5; "R3")
				SVG SET ATTRIBUTE:C1055($Image3->; "image"; "xlink:href"; "data:image/"+$focusObjectName+";base64,"+$data; "transform"; "rotate("+String:C10($R->)+",0,0)"; *)
				SVG SET ATTRIBUTE:C1055($Image3->; "text"; "4D-text"; "data:image/"+$focusObjectName+";base64,..."; *)
				
		End case 
		
End case 