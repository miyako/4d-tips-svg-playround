//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_BOOLEAN:C305($3)
C_BOOLEAN:C305($0)

$shouldRefresh:=$3
$shouldUpdate:=False:C215

ARRAY TEXT:C222($temp; 0)
APPEND TO ARRAY:C911($temp; $1)
APPEND TO ARRAY:C911($temp; $2)
SORT ARRAY:C229($temp)

$objectId1:=$temp{1}
$objectId2:=$temp{2}

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

If ($objectId1#$objectId2)
	C_TEXT:C284($objectFrom; $objectTo; $linkId)
	//from, to are not used; we delete their parent element
	If (Not:C34(LINK_Objects_exist($DomData->; $objectId1; $objectId2; ->$objectFrom; ->$objectTo)))
		
		$link:=LINK_Get($DomData->; $objectId1; $objectId2; ->$linkId)
		
		If (Length:C16($link)#0)
			
			//remove object from document 
			DOM REMOVE XML ELEMENT:C869($link)
			//remove object from canvas
			DOM REMOVE XML ELEMENT:C869(DOM Find XML element by ID:C1010($DomImage->; $linkId))
			
			If ($shouldRefresh)
				
				ARRAY TEXT:C222($links; 0)
				$linksDom:=DOM Find XML element by ID:C1010($DomData->; "links")
				$link:=DOM Find XML element:C864($linksDom; "links/link"; $links)
				$countLinks:=Size of array:C274($links)
				
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
					DOM SET XML ATTRIBUTE:C866($link; "id"; $newLinkId)
					DOM SET XML ATTRIBUTE:C866($oldLinks{$i}; "id"; $newLinkId)
				End for 
				
			End if 
			
			$shouldUpdate:=True:C214
			
		End if 
	End if 
End if 

$0:=$shouldUpdate