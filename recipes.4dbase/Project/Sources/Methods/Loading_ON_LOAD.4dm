//%attributes = {"invisible":true}
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

If (Picture size:C356($Image->)=0)
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"loading.svg"
	$dom:=DOM Parse XML source:C719($path)
	SVG EXPORT TO PICTURE:C1017($dom; $Image->; Own XML data source:K45:18)
	
	If (Folder separator:K24:12#":")
		SVG SET ATTRIBUTE:C1055(*; "Image"; ""; "4d-enableD2D"; True:C214)
	End if 
	
End if 