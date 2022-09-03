$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		Editor_ON_LOAD
		
	: ($event=On Activate:K2:9)
		
		Editor_ON_FOCUS
		
	: ($event=On Deactivate:K2:10)
		
		Editor_ON_BLUR
		
	: ($event=On Unload:K2:2)
		
		Editor_ON_UNLOAD
		
	: ($event=On Timer:K2:25)
		
		Editor_ON_TIMER
		
End case 