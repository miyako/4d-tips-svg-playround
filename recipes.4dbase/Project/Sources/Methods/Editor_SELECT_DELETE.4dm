//%attributes = {"invisible":true}
$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

C_LONGINT:C283($count)
ARRAY TEXT:C222($selects; 0)
$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "selects"); "selects/select"; $selects)
$count:=Size of array:C274($selects)

If (0#$count)
	
	$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")
	//if the selection has been changed without moving or resizing, it is not yet in history
	If ($SelectionChanged->=1)
		HISTORY_APPEND
	End if 
	
	ARRAY TEXT:C222($objectIds; 0)
	
	C_TEXT:C284($objectId; $objectType)
	
	C_LONGINT:C283($i)
	
	For ($i; 1; $count)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
		
		APPEND TO ARRAY:C911($objectIds; $objectId)
		
		$selectId:="select-"+$objectId
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $selectId))
		
		$class:="gradient-"+$objectId+"-rect"
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $class))
		
		$class:="class-"+$objectId+"-rect"
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $class))
		
		$class:="class-"+$objectId+"-textArea"
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $class))
		
		//remove object from canvas 
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $objectId))
		
		//remove object from document 
		DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomData->; $objectId))
		
		//remove object from container/selects 
		DOM REMOVE XML ELEMENT:C869($selects{$i})
		
	End for 
	
	ARRAY TEXT:C222($links; 0)
	$link:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "links"); "links/link"; $links)
	
	C_TEXT:C284($from; $to)
	For ($i; 1; Size of array:C274($links))
		$link:=$links{$i}
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "from"; $from)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "to"; $to)
		//LINK_Delete ($from;$to;False)  //false: because we call Editor_SELECT_UPDATE_ID later
	End for 
	
	ARRAY TEXT:C222($groups; 0)
	$group:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "groups"); "groups/group"; $groups)
	
	ARRAY TEXT:C222($objects; 0)
	
	For ($i; 1; Size of array:C274($groups))
		$group:=$groups{$i}
		CLEAR VARIABLE:C89($objects)
		$object:=DOM Find XML element:C864($group; "group/object"; $objects)
		For ($j; 1; Size of array:C274($objects))
			$object:=$objects{$j}
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "object-id"; $objectId)
			If (-1#Find in array:C230($objectIds; $objectId))
				DOM REMOVE XML ELEMENT:C869($object)
			End if 
		End for 
		
		//remove empty group
		If (0=DOM Count XML elements:C726($group; "object"))
			
			DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
			
			GROUP_Delete($groupId; False:C215)  //false: because we call Editor_SELECT_UPDATE_ID later
			
		End if 
		
	End for 
	
	Editor_SELECT_UPDATE_ID($DomData; $DomImage)
	
	Editor_UPDATE
	
	HISTORY_APPEND
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=Editor_Get_image($DomImage->)
	
End if 
