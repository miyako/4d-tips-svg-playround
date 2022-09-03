$thisName:=OBJECT Get name:C1087(Object current:K67:2)
$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1) & ($thisName#"Codec")
		
		OBJECT SET VISIBLE:C603(*; $thisName; True:C214)
		ARRAY TEXT:C222($codecs; 0)
		PICTURE CODEC LIST:C992($codecs)
		OBJECT SET TITLE:C194(*; $thisName; $codecs{Num:C11($thisName)})
		
	: ($event=On Clicked:K2:4)
		
		$Converted:=OBJECT Get pointer:C1124(Object named:K67:5; "Converted")
		$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
		
		$Converted->:=$Image->
		CONVERT PICTURE:C1002($Converted->; OBJECT Get title:C1068(*; $thisName))
		If (OK=0)
			CLEAR VARIABLE:C89($Converted->)
		End if 
		
		$Size:=OBJECT Get pointer:C1124(Object named:K67:5; "Size")
		$Size->:=String:C10(Picture size:C356($Converted->)/1024; "#,###,##0.## KB")
		
		C_PICTURE:C286($mask)
		$Equal:=OBJECT Get pointer:C1124(Object named:K67:5; "Equal")
		$Equal->:=Choose:C955(Equal pictures:C1196($Converted->; $Image->; $mask); "YES"; "NO")
		
End case 