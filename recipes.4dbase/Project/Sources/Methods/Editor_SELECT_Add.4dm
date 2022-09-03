//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_BOOLEAN:C305($2; $shouldAppend)
C_POINTER:C301($3)
C_BOOLEAN:C305($0; $shouldRedraw)

$id:=$1
$shouldAppend:=$2

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

$dom:=DOM Find XML element by ID:C1010($DomImage->; $id)

C_TEXT:C284($objectType; $objectId)

DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:object-id"; $objectId)

If (Length:C16($objectId)#0)
	
	$dom:=DOM Find XML element by ID:C1010($DomImage->; $objectId)
	
	If (Not:C34(Editor_SELECT_Find($DomData->; $objectId)))
		//not currently selected
		If (Not:C34($shouldAppend))
			$shouldRedraw:=Editor_SELECT_Clear($DomData->; $DomImage->)
		End if 
		
		If (Not:C34(Editor_SELECT_Find($DomData->; $objectId)))
			
			$3->:=$objectId
			
			$shouldRedraw:=Editor_SELECT_Object($dom; $objectId)
			
		End if 
		
	End if 
	
Else 
	
	ARRAY LONGINT:C221($pos; 0)
	ARRAY LONGINT:C221($len; 0)
	
	Case of 
		: ((Match regex:C1019("link-\\d+-path"; $id)))
			
			$3->:=$id
			
			$shouldRedraw:=Editor_SELECT_Clear($DomData->; $DomImage->)
			
		: ((Match regex:C1019("link-\\d+-textArea"; $id)))
			
			$3->:=$id
			
			$shouldRedraw:=Editor_SELECT_Clear($DomData->; $DomImage->)
			
		: ((Match regex:C1019("(link-\\d+)-marker-.+"; $id; 1; $pos; $len)))
			
			$3->:=Substring:C12($id; $pos{1}; $len{1})+"-path"
			
			$shouldRedraw:=Editor_SELECT_Clear($DomData->; $DomImage->)
			
	End case 
	
End if 

$0:=$shouldRedraw