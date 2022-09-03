$event:=Form event code:C388


Case of 
	: ($event=On Clicked:K2:4) | ($event=On Load:K2:1)
		
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		$Source:=OBJECT Get pointer:C1124(Object named:K67:5; "Source")
		$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")
		
		DOM EXPORT TO VAR:C863($DOM->; $Source->)
		
		$Size:=OBJECT Get pointer:C1124(Object named:K67:5; "Size")
		$Size->:=String:C10(Picture size:C356($Image->)/1024; "#,###,###,##0.## KB")
		
End case 