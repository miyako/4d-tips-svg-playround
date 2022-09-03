If (Form event code:C388=On Clicked:K2:4)
	
	SVG SET ATTRIBUTE:C1055(*; "Image"; "svg"; \
		"viewport-fill"; "none"; \
		"viewport-fill-opacity"; 0)
	
	OBJECT SET RGB COLORS:C628(*; "Image"; Foreground color:K23:1; Background color:K23:2)
	
End if 