If (Form event code:C388=On Clicked:K2:4)
	
	SVG SET ATTRIBUTE:C1055(*; "Image"; "svg"; \
		"viewport-fill"; "#0000FF"; \
		"viewport-fill-opacity"; 0.5)
	
	OBJECT SET RGB COLORS:C628(*; "Image"; Foreground color:K23:1; Background color none:K23:10)
	
End if 