ARRAY TEXT:C222($SelectedObjects; 0)
Editor_GET_SELECTED_OBJECTS("Editor"; ->$SelectedObjects)

For ($i; 1; Size of array:C274($SelectedObjects))
	For ($j; 1; Size of array:C274($SelectedObjects))
		
		$objectId1:=$SelectedObjects{$j}
		$objectId2:=$SelectedObjects{$i}
		
		Editor_LINK_DELETE("Editor"; \
			$objectId1; $objectId2)
		
	End for 
	
End for 