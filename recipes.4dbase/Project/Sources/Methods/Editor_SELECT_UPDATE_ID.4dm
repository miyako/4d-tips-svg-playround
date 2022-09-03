//%attributes = {"invisible":true}
C_POINTER:C301($1; $2)

$DomData:=$1
$DomImage:=$2

C_LONGINT:C283($i; $countObjects; $countSelects)

ARRAY TEXT:C222($objects; 0)
$objectsDom:=DOM Find XML element by ID:C1010($DomData->; "objects")
$object:=DOM Find XML element:C864($objectsDom; "objects/object"; $objects)
$countObjects:=Size of array:C274($objects)

ARRAY TEXT:C222($selects; 0)
$selectsDom:=DOM Find XML element by ID:C1010($DomData->; "selects")
$select:=DOM Find XML element:C864($selectsDom; "selects/select"; $selects)
$countSelects:=Size of array:C274($selects)

ARRAY TEXT:C222($links; 0)
$linksDom:=DOM Find XML element by ID:C1010($DomData->; "links")
$link:=DOM Find XML element:C864($linksDom; "links/link"; $links)
$countLinks:=Size of array:C274($links)

ARRAY TEXT:C222($groups; 0)
$groupsDom:=DOM Find XML element by ID:C1010($DomData->; "groups")
$group:=DOM Find XML element:C864($groupsDom; "groups/group"; $groups)
$countGroups:=Size of array:C274($groups)

C_TEXT:C284($objectId)

ARRAY TEXT:C222($oldIds; 0)
ARRAY TEXT:C222($newIds; 0)
ARRAY TEXT:C222($oldObjects; 0)
ARRAY TEXT:C222($oldGradients; 0)
ARRAY TEXT:C222($oldClasses; 0)
ARRAY TEXT:C222($oldRects; 0)
ARRAY TEXT:C222($oldTextAreas; 0)
ARRAY TEXT:C222($oldRectClasses; 0)
ARRAY TEXT:C222($oldTextAreaClasses; 0)

For ($i; 1; $countObjects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($objects{$i}; "id"; $objectId)
	
	APPEND TO ARRAY:C911($oldIds; $objectId)
	APPEND TO ARRAY:C911($newIds; "object-"+String:C10($i))
	APPEND TO ARRAY:C911($oldObjects; DOM Find XML element by ID:C1010($DomImage->; $objectId))
	APPEND TO ARRAY:C911($oldGradients; DOM Find XML element by ID:C1010($DomImage->; "gradient-"+$objectId+"-rect"))
	APPEND TO ARRAY:C911($oldClasses; DOM Find XML element by ID:C1010($DomImage->; "class-"+$objectId))
	APPEND TO ARRAY:C911($oldRects; DOM Find XML element by ID:C1010($DomImage->; $objectId+"-rect"))
	APPEND TO ARRAY:C911($oldTextAreas; DOM Find XML element by ID:C1010($DomImage->; $objectId+"-textArea"))
	APPEND TO ARRAY:C911($oldRectClasses; DOM Find XML element by ID:C1010($DomImage->; "class-"+$objectId+"-rect"))
	APPEND TO ARRAY:C911($oldTextAreaClasses; DOM Find XML element by ID:C1010($DomImage->; "class-"+$objectId+"-textArea"))
	
End for 

ARRAY TEXT:C222($oldHandleTL; 0)
ARRAY TEXT:C222($newHandleTL; 0)

ARRAY TEXT:C222($oldHandleTM; 0)
ARRAY TEXT:C222($newHandleTM; 0)

ARRAY TEXT:C222($oldHandleTR; 0)
ARRAY TEXT:C222($newHandleTR; 0)

ARRAY TEXT:C222($oldHandleML; 0)
ARRAY TEXT:C222($newHandleML; 0)

ARRAY TEXT:C222($oldHandleMR; 0)
ARRAY TEXT:C222($newHandleMR; 0)

ARRAY TEXT:C222($oldHandleBL; 0)
ARRAY TEXT:C222($newHandleBL; 0)

ARRAY TEXT:C222($oldHandleBM; 0)
ARRAY TEXT:C222($newHandleBM; 0)

ARRAY TEXT:C222($oldHandleBR; 0)
ARRAY TEXT:C222($newHandleBR; 0)

ARRAY TEXT:C222($oldRect; 0)
ARRAY TEXT:C222($newRect; 0)

ARRAY TEXT:C222($oldSelect; 0)
ARRAY TEXT:C222($newSelect; 0)

DOM_ELEMENT_REFRESH_ID($DomImage->)

If (False:C215)
	$t:=""
	DOM EXPORT TO VAR:C863($DomImage->; $t)
	SET TEXT TO PASTEBOARD:C523($t)
End if 

C_TEXT:C284($placeHolder; $CDATA)

For ($i; 1; $countSelects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
	$newObjectId:="object-"+String:C10(Find in array:C230($oldIds; $objectId))
	DOM SET XML ATTRIBUTE:C866($selects{$i}; "object-id"; $newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTL; DOM Find XML element by ID:C1010($DomImage->; "select-tl-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTL; "select-tl-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTM; DOM Find XML element by ID:C1010($DomImage->; "select-tm-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTM; "select-tm-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleTR; DOM Find XML element by ID:C1010($DomImage->; "select-tr-"+$objectId))
	APPEND TO ARRAY:C911($newHandleTR; "select-tr-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleML; DOM Find XML element by ID:C1010($DomImage->; "select-ml-"+$objectId))
	APPEND TO ARRAY:C911($newHandleML; "select-ml-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleMR; DOM Find XML element by ID:C1010($DomImage->; "select-mr-"+$objectId))
	APPEND TO ARRAY:C911($newHandleMR; "select-mr-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBL; DOM Find XML element by ID:C1010($DomImage->; "select-bl-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBL; "select-bl-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBM; DOM Find XML element by ID:C1010($DomImage->; "select-bm-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBM; "select-bm-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldHandleBR; DOM Find XML element by ID:C1010($DomImage->; "select-br-"+$objectId))
	APPEND TO ARRAY:C911($newHandleBR; "select-br-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldRect; DOM Find XML element by ID:C1010($DomImage->; "select-rect-"+$objectId))
	APPEND TO ARRAY:C911($newRect; "select-rect-"+$newObjectId)
	
	APPEND TO ARRAY:C911($oldSelect; DOM Find XML element by ID:C1010($DomImage->; "select-"+$objectId))
	APPEND TO ARRAY:C911($newSelect; "select-"+$newObjectId)
	
End for 

For ($i; 1; $countSelects)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
	$newObjectId:="object-"+String:C10(Find in array:C230($oldIds; $objectId))
	
	DOM SET XML ATTRIBUTE:C866($oldHandleTL{$i}; "id"; $newHandleTL{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleTM{$i}; "id"; $newHandleTM{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleTR{$i}; "id"; $newHandleTR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldHandleML{$i}; "id"; $newHandleML{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleMR{$i}; "id"; $newHandleMR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldHandleBL{$i}; "id"; $newHandleBL{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleBM{$i}; "id"; $newHandleBM{$i})
	DOM SET XML ATTRIBUTE:C866($oldHandleBR{$i}; "id"; $newHandleBR{$i})
	
	DOM SET XML ATTRIBUTE:C866($oldRect{$i}; "id"; $newRect{$i})
	DOM SET XML ATTRIBUTE:C866($oldSelect{$i}; "id"; $newSelect{$i})
	
End for 

//step.1
ARRAY TEXT:C222($oldLinks; 0)
For ($i; 1; $countLinks)
	$link:=$links{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "id"; $linkId)
	APPEND TO ARRAY:C911($oldLinks; DOM Find XML element by ID:C1010($DomImage->; $linkId))
End for 

//step.2
C_TEXT:C284($from; $to; $oldLinkId; $newLinkId)
For ($i; 1; $countLinks)
	$link:=$links{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "id"; $oldLinkId)
	$newLinkId:="link-"+String:C10($i)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "from"; $from)
	DOM GET XML ATTRIBUTE BY NAME:C728($link; "to"; $to)
	
	$from:="object-"+String:C10(Find in array:C230($oldIds; $from))
	$to:="object-"+String:C10(Find in array:C230($oldIds; $to))
	
	DOM SET XML ATTRIBUTE:C866($link; "from"; $from; "to"; $to; "id"; $newLinkId)
	DOM SET XML ATTRIBUTE:C866($oldLinks{$i}; "id"; $newLinkId)
End for 

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
	
	CLEAR VARIABLE:C89($groupObjects)
	$groupObject:=DOM Find XML element:C864($group; "group/object"; $groupObjects)
	//update member object ids
	For ($j; 1; Size of array:C274($groupObjects))
		$groupObject:=$groupObjects{$j}
		DOM GET XML ATTRIBUTE BY NAME:C728($groupObject; "object-id"; $groupObjectObjectId)
		$groupObjectObjectId:="object-"+String:C10(Find in array:C230($oldIds; $groupObjectObjectId))
		DOM SET XML ATTRIBUTE:C866($groupObject; "object-id"; $groupObjectObjectId)
	End for 
	
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

For ($i; 1; $countObjects)
	
	$oldId:=$oldIds{$i}
	$newId:=$newIds{$i}
	
	DOM SET XML ATTRIBUTE:C866($objects{$i}; "id"; $newId)
	DOM SET XML ATTRIBUTE:C866($oldObjects{$i}; "id"; $newId; "editor:object-id"; $newId)
	DOM SET XML ATTRIBUTE:C866($oldGradients{$i}; "id"; "gradient-"+$newId+"-rect")
	DOM SET XML ATTRIBUTE:C866($oldRects{$i}; "class"; "class-"+$newId+"-rect"; "id"; $newId+"-rect"; "editor:object-id"; $newId)
	DOM SET XML ATTRIBUTE:C866($oldTextAreas{$i}; "class"; "class-"+$newId+"-textArea"; "id"; $newId+"-textArea"; "editor:object-id"; $newId)
	
	DOM GET XML ELEMENT VALUE:C731($oldRectClasses{$i}; $placeHolder; $CDATA)
	$CDATA:=Replace string:C233($CDATA; "class-"+$oldId+"-rect"; "class-"+$newId+"-rect"; *)
	$CDATA:=Replace string:C233($CDATA; "fill:url(#gradient-"+$oldId+"-rect"; "fill:url(#gradient-"+$newId+"-rect"; *)
	DOM SET XML ELEMENT VALUE:C868($oldRectClasses{$i}; $CDATA; *)
	
	DOM GET XML ELEMENT VALUE:C731($oldTextAreaClasses{$i}; $placeHolder; $CDATA)
	$CDATA:=Replace string:C233($CDATA; "class-"+$oldId+"-textArea"; "class-"+$newId+"-textArea"; *)
	DOM SET XML ELEMENT VALUE:C868($oldTextAreaClasses{$i}; $CDATA; *)
	
	DOM SET XML ATTRIBUTE:C866($oldRectClasses{$i}; "id"; "class-"+$newId+"-rect")
	DOM SET XML ATTRIBUTE:C866($oldTextAreaClasses{$i}; "id"; "class-"+$newId+"-textArea")
	
End for 

DOM_ELEMENT_REFRESH_ID($DomData->)
DOM_ELEMENT_REFRESH_ID($DomImage->)

Editor_GROW_CLEAR