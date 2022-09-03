$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		Loading_ON_LOAD
		
		If (Not:C34(Is nil pointer:C315($Container)))
			
			C_LONGINT:C283($width; $height)
			OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
			OBJECT MOVE:C664(*; "Image"; 0; 0; $width; $height; *)
			OBJECT MOVE:C664(*; "Rate"; $width-128; $height-17; $width; $height; *)
			
			$type:=Type:C295($Container->)
			
			Case of 
				: ($type=Is undefined:K8:13)
					
					C_LONGINT:C283($Container->)
					
				: ($type=Is longint:K8:6)
					$Container->:=0
				: ($type=Is real:K8:4)
					$Container->:=0
			End case 
			
			OBJECT SET VISIBLE:C603(*; "Image"; False:C215)
			
			$event:=On Bound Variable Change:K2:52
			
		Else 
			
			OBJECT SET VISIBLE:C603(*; "Rate"; False:C215)
			SET TIMER:C645(-1)
			
		End if 
		
End case 

Case of 
	: ($event=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-($Container->))
		
		OBJECT SET VISIBLE:C603(*; "Image"; $Container->#0)
		OBJECT SET VISIBLE:C603(*; "Rate"; $Container->#0)
		
	: ($event=On Timer:K2:25)
		
		Loading_ON_TIMER
		
	: ($event=On Unload:K2:2)
		
		Loading_ON_UNLOAD
		
End case 