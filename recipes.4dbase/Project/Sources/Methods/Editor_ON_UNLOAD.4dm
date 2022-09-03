//%attributes = {"invisible":true}
$Container:=OBJECT Get pointer:C1124(Object subform container:K67:4)

If (Not:C34(Is nil pointer:C315($Container)))
	
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	
	DOM CLOSE XML:C722($DomImage->)
	DOM CLOSE XML:C722($DomData->)
	
End if 