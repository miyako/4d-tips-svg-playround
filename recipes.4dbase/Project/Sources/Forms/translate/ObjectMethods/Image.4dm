$event:=Form event code:C388

If ($event=On Load:K2:1)
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"seal.svg"
	READ PICTURE FILE:C678($path; Self:C308->)
End if 