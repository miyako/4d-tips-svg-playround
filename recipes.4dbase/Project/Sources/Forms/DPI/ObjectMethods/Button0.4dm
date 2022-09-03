If (Form event code:C388=On Clicked:K2:4)
	
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"96dpi.svg"
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	READ PICTURE FILE:C678($path; $Image->)
	
End if 