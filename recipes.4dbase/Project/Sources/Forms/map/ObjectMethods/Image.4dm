If (Form event code:C388=On Clicked:K2:4) | (Form event code:C388=On Load:K2:1)
	
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"map.4dsvg"
	$template:=Document to text:C1236($path; "utf-8")
	C_BLOB:C604($data)
	PROCESS 4D TAGS:C816($template; $data)
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	BLOB TO PICTURE:C682($data; $Image->; ".svg")
End if 