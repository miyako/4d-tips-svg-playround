//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_POINTER:C301($2)
C_TEXT:C284($0)

If (Count parameters:C259>1)
	If (Not:C34(Is nil pointer:C315($2)))
		If (Type:C295($2->)=Text array:K8:16)
			
			$objectName:=$1
			$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData"; $objectName)
			
			If (Not:C34(Is nil pointer:C315($DomData)))
				
				ARRAY TEXT:C222($selects; 0)
				$select:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "selects"); "selects/select"; $selects)
				
				C_LONGINT:C283($i)
				C_TEXT:C284($objectId)
				
				ARRAY TEXT:C222($objectIds; 0)
				
				For ($i; 1; Size of array:C274($selects))
					
					DOM GET XML ATTRIBUTE BY NAME:C728($selects{$i}; "object-id"; $objectId)
					APPEND TO ARRAY:C911($objectIds; $objectId)
					
				End for 
				//%W-518.1
				COPY ARRAY:C226($objectIds; $2->)
				//%W+518.1
			End if 
		End if 
	End if 
End if 