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
			If ($focusObjectName="Image@")
				C_LONGINT:C283($l; $t; $r; $b)
				OBJECT GET COORDINATES:C663(*; $focusObjectName; $l; $t; $r; $b)
				//convert to relative coordinates
				$MOUSEX:=$x-$l
				$MOUSEY:=$y-$t
				
				$w:=(201.5)-$MOUSEX
				$h:=(156)-$MOUSEY
				
				Case of 
					: ($w=0) & ($h>0)
						$r:=0
					: ($w<0) & ($h>0)
						$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
					: ($h=0) & ($W<0)
						$r:=90
					: ($w<0) & ($h<0)
						$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
					: ($w=0) & ($h<0)
						$r:=180
					: ($w>0) & ($h<0)
						$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
					Else 
						$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
				End case 
				
				$radianLeft:=Num:C11(String:C10($r))
				
				$w:=(225.5)-$MOUSEX
				$h:=(160)-$MOUSEY
				
				Case of 
					: ($w=0) & ($h>0)
						$r:=0
					: ($w<0) & ($h>0)
						$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
					: ($h=0) & ($W<0)
						$r:=90
					: ($w<0) & ($h<0)
						$r:=90+(Arctan:C20($h/$w)*Radian:K30:3)
					: ($w=0) & ($h<0)
						$r:=180
					: ($w>0) & ($h<0)
						$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
					Else 
						$r:=270+(Arctan:C20($h/$w)*Radian:K30:3)
				End case 
				
				$radianRight:=Num:C11(String:C10($r))
				
				$rotateLeftEye:="rotate("+String:C10($radianLeft; "&xml")+",201.5,156)"
				$rotateLeftEyeBall:="rotate("+String:C10(360-($radianLeft); "&xml")+",203,153.5)"
				$rotateRightEye:="rotate("+String:C10($radianRight; "&xml")+",225.5,160)"
				$rotateRightEyeBall:="rotate("+String:C10(360-($radianRight); "&xml")+",227.5,158)"
				
				Case of 
					: ($focusObjectName="Image1")
						
						OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
						
						SVG SET ATTRIBUTE:C1055($focusObject->; "left-eye"; "transform"; $rotateLeftEye)
						SVG SET ATTRIBUTE:C1055($focusObject->; "left-eye-ball"; "transform"; $rotateLeftEyeBall)
						SVG SET ATTRIBUTE:C1055($focusObject->; "right-eye"; "transform"; $rotateRightEye)
						SVG SET ATTRIBUTE:C1055($focusObject->; "right-eye-ball"; "transform"; $rotateRightEyeBall)
						
					: ($focusObjectName="Image2")
						
						OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L2@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L4@"; True:C214)
						
						$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "left-eye"); "transform"; $rotateLeftEye)
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "left-eye-ball"); "transform"; $rotateLeftEyeBall)
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "right-eye"); "transform"; $rotateRightEye)
						DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "right-eye-ball"); "transform"; $rotateRightEyeBall)
						SVG EXPORT TO PICTURE:C1017($DOM->; $focusObject->; Get XML data source:K45:16)
						
					: ($focusObjectName="Image3")
						
						OBJECT SET VISIBLE:C603(*; "L1@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L3@"; True:C214)
						OBJECT SET VISIBLE:C603(*; "L4@"; True:C214)
						
						SVG SET ATTRIBUTE:C1055($focusObject->; "left-eye"; "transform"; $rotateLeftEye; *)
						SVG SET ATTRIBUTE:C1055($focusObject->; "left-eye-ball"; "transform"; $rotateLeftEyeBall; *)
						SVG SET ATTRIBUTE:C1055($focusObject->; "right-eye"; "transform"; $rotateRightEye; *)
						SVG SET ATTRIBUTE:C1055($focusObject->; "right-eye-ball"; "transform"; $rotateRightEyeBall; *)
						
				End case 
				
				$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count")
				$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start")
				$Rate:=OBJECT Get pointer:C1124(Object named:K67:5; "Rate")
				
				$Count->:=$Count->+1
				$Rate->:=String:C10($Count->/(Milliseconds:C459-$Start->)*1000; "##0.## redraws / sec")
				
			End if 
			
		End if 
		
	: ($event=On Load:K2:1)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"eyes.svg"
		$Image1:=OBJECT Get pointer:C1124(Object named:K67:5; "Image1")
		READ PICTURE FILE:C678($path; $Image1->)
		
		$Image2:=OBJECT Get pointer:C1124(Object named:K67:5; "Image2")
		$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
		$DOM->:=DOM Parse XML source:C719($path)
		SVG EXPORT TO PICTURE:C1017($DOM->; $Image2->; Get XML data source:K45:16)
		
		$Image3:=OBJECT Get pointer:C1124(Object named:K67:5; "Image3")
		SVG EXPORT TO PICTURE:C1017(DOM Parse XML source:C719($path); $Image3->; Own XML data source:K45:18)
		
End case 