//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_BOOLEAN:C305($0; $shouldRedraw)

$domData:=$1
$domImage:=$2

C_LONGINT:C283($count)
ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($domData; "selects"); "selects/select"; $selects)
$count:=Size of array:C274($selects)

If (0#$count)
	
	C_TEXT:C284($objectId)
	
	C_LONGINT:C283($i)
	For ($i; 1; $count)
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
		$selectId:="select-"+$objectId
		
		$selectObject:=DOM Find XML element by ID:C1010($domImage; $selectId)
		
		If ($selectObject#"0000000000000000")
			DOM REMOVE XML ELEMENT:C869($selectObject)
		Else 
			//some objects were selected when the document was saved
		End if 
		
		DOM REMOVE XML ELEMENT:C869($selects{$i})
		
	End for 
	
	//new, change
	Editor_GROW_CLEAR
	
	$shouldRedraw:=True:C214
	
End if 

$0:=$shouldRedraw