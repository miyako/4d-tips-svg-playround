$event:=Form event code:C388

Case of 
	: ($event=On Clicked:K2:4) | ($event=On Load:K2:1)
		
		$Source:=OBJECT Get pointer:C1124(Object named:K67:5; "Source")
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		
		PICTURE TO BLOB:C692($Image->; $SVG; ".svg")
		$Source->:=Convert to text:C1012($SVG; "utf-8")
		
		$Size:=OBJECT Get pointer:C1124(Object named:K67:5; "Size")
		$Size->:=String:C10(Picture size:C356($Image->)/1024; "#,###,###,##0.## KB")
		
End case 