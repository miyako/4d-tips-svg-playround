//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2)
C_BOOLEAN:C305($0)

$groupId:=$1
$shouldRefresh:=$2
$shouldUpdate:=False:C215

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

ARRAY TEXT:C222($groups; 0)
C_TEXT:C284($group)

If (GROUP_exist($DomData->; $groupId; ->$groups; ->$group))
	
	//remove object from document 
	DOM REMOVE XML ELEMENT:C869($group)
	
	//remove object from canvas (rect and textArea are children)
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $groupId))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; "class-"+$groupId+"-rect"))
	DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; "gradient-"+$groupId+"-rect"))
	
	If ($shouldRefresh)
		
		C_TEXT:C284($placeHolder; $CDATA)
		
		ARRAY TEXT:C222($groups; 0)
		$groupsDom:=DOM Find XML element by ID:C1010($DomData->; "groups")
		$group:=DOM Find XML element:C864($groupsDom; "groups/group"; $groups)
		$countGroups:=Size of array:C274($groups)
		
		//step.1
		ARRAY TEXT:C222($oldGroups; 0)
		ARRAY TEXT:C222($oldGroupRects; 0)
		ARRAY TEXT:C222($oldGroupRectClasses; 0)
		ARRAY TEXT:C222($oldGroupTextareas; 0)
		ARRAY TEXT:C222($oldGroupGradients; 0)
		
		For ($i; 1; $countGroups)
			$group:=$groups{$i}
			DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
			APPEND TO ARRAY:C911($oldGroups; DOM Find XML element by ID:C1010($DomImage->; $groupId))
			APPEND TO ARRAY:C911($oldGroupRects; DOM Find XML element by ID:C1010($DomImage->; $groupId+"-rect"))
			APPEND TO ARRAY:C911($oldGroupRectClasses; DOM Find XML element by ID:C1010($DomImage->; "class-"+$groupId+"-rect"))
			APPEND TO ARRAY:C911($oldGroupTextareas; DOM Find XML element by ID:C1010($DomImage->; $groupId+"-textArea"))
			APPEND TO ARRAY:C911($oldGroupGradients; DOM Find XML element by ID:C1010($DomImage->; "gradient-"+$groupId+"-rect"))
		End for 
		
		//step.2
		C_TEXT:C284($from; $to; $oldGroupId; $newGroupId)
		ARRAY TEXT:C222($groupObjects; 0)
		For ($i; 1; $countGroups)
			$group:=$groups{$i}
			DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $oldGroupId)
			$newGroupId:="group-"+String:C10($i)
			
			DOM SET XML ATTRIBUTE:C866($group; "id"; $newGroupId)
			DOM SET XML ATTRIBUTE:C866($oldGroups{$i}; "id"; $newGroupId)
			
			DOM GET XML ELEMENT VALUE:C731($oldGroupRectClasses{$i}; $placeHolder; $CDATA)
			$CDATA:=Replace string:C233($CDATA; "class-"+$oldGroupId+"-rect"; "class-"+$newGroupId+"-rect"; *)
			$CDATA:=Replace string:C233($CDATA; "fill:url(#gradient-"+$oldGroupId+"-rect"; "fill:url(#gradient-"+$newGroupId+"-rect"; *)
			DOM SET XML ELEMENT VALUE:C868($oldGroupRectClasses{$i}; $CDATA; *)
			
			DOM SET XML ATTRIBUTE:C866($oldGroupRects{$i}; "class"; "class-"+$newGroupId+"-rect"; "id"; $newGroupId+"-rect")
			DOM SET XML ATTRIBUTE:C866($oldGroupRectClasses{$i}; "id"; "class-"+$newGroupId+"-rect")
			DOM SET XML ATTRIBUTE:C866($oldGroupTextareas{$i}; "id"; $newGroupId+"-textArea")
			DOM SET XML ATTRIBUTE:C866($oldGroupGradients{$i}; "id"; "gradient-"+$newGroupId+"-rect")
			
		End for 
		
	End if 
	
	$shouldUpdate:=True:C214
	
End if 

$0:=$shouldUpdate