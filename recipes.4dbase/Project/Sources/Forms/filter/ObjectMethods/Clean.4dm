If (Form event code:C388=On Clicked:K2:4)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"summit-logo.png"
	READ PICTURE FILE:C678($path; $Image->)
	
End if 