$event:=Form event code:C388

If (OBJECT Get name:C1087(Object with focus:K67:3)="Text")
	$data:=Get edited text:C655
Else 
	$data:=(OBJECT Get pointer:C1124(Object named:K67:5; "Text")->)
End if 

If ($event=On Load:K2:1)
	C_BLOB:C604(TEMPLATE_TEXTAREA)  //logically static
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"textarea.4dsvg"
	DOCUMENT TO BLOB:C525($path; TEMPLATE_TEXTAREA)
	GOTO OBJECT:C206(*; "Text")
End if 

Case of 
	: ($event=On Load:K2:1) | ($event=On Resize:K2:27)
		
		C_LONGINT:C283($left; $top; $right; $bottom)
		OBJECT GET COORDINATES:C663(*; "Image"; $left; $top; $right; $bottom)
		$width:=$right-$left
		$height:=$bottom-$top
		
		C_OBJECT:C1216($params)
		OB SET:C1220($params; \
			"width"; $width; \
			"height"; $height)
		
		C_BLOB:C604($template)
		PROCESS 4D TAGS:C816(TEMPLATE_TEXTAREA; $template; $data; $params)
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		BLOB TO PICTURE:C682($template; $Image->; ".svg")
		
End case 