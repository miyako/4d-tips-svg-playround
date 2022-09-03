//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Not:C34(Is nil pointer:C315($Container)))
	
	If (Type:C295($Container->)=Is undefined:K8:13)
		C_TEXT:C284($Container->)
	End if 
	
	$Init:=OBJECT Get pointer:C1124(Object named:K67:5; "Init")
	
	If (0=$Init->)
		If (Type:C295($Container->)=Is text:K8:3)
			
			Editor_SET_MENU
			
			$StepX:=OBJECT Get pointer:C1124(Object named:K67:5; "StepX")
			$StepY:=OBJECT Get pointer:C1124(Object named:K67:5; "StepY")
			
			$StepX->:=10
			$StepY->:=10
			
			CALL SUBFORM CONTAINER:C1086(-On Load:K2:1)
			
			$Debug:=OBJECT Get pointer:C1124(Object named:K67:5; "Debug")
			$Debug->:=Num:C11(Structure file:C489=Structure file:C489(*))
			
			$Platform:=OBJECT Get pointer:C1124(Object named:K67:5; "Platform")
			
			_O_PLATFORM PROPERTIES:C365($Platform->)
			
			$ScrollbarH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarH")
			$ScrollbarV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarV")
			
			Case of 
				: ($Platform->=Windows:K25:3)
					
					$ScrollbarH->:=17
					$ScrollbarV->:=17
					
				: ($Platform->=Mac OS:K25:2)
					
					$ScrollbarH->:=15
					$ScrollbarV->:=15
					
			End case 
			
			$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
			$Zoom->:=1
			
			$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
			
			$DomImage->:=Editor_New
			
			$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
			$DomData->:=DOM Create XML Ref:C861("document")
			
			$selects:=DOM Create XML element:C865($DomData->; "selects"; "id"; "selects")
			$groups:=DOM Create XML element:C865($DomData->; "groups"; "id"; "groups")
			$links:=DOM Create XML element:C865($DomData->; "links"; "id"; "links")
			$objects:=DOM Create XML element:C865($DomData->; "objects"; "id"; "objects")
			
			XML SET OPTIONS:C1090($DomData->; XML indentation:K45:34; XML with indentation:K45:35)
			
			$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
			$Image->:=Editor_Get_image($DomImage->)
			
			OBJECT SET VISIBLE:C603(*; "Bg"; False:C215)
			
		End if 
		
		$Init->:=1
		
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "Bg"; True:C214)
End if 