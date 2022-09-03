$style:=4
$color:="#088A29"
$strokeWidth:=5

$fontSize:=14
$fontFamily:="'System Font Medium','Segoe UI','sans-serif'"

$fontStyle:="normal"
$fontWeight:="normal"
$textDecoration:="none"
$textAlign:="center"
$textValue:="Colleagues"
$textColor:="#088A29"

$tx:=-25
$ty:=30

ARRAY TEXT:C222($SelectedObjects; 0)
Editor_GET_SELECTED_OBJECTS("Editor"; ->$SelectedObjects)

For ($i; 2; Size of array:C274($SelectedObjects))
	
	For ($j; 1; $i-1)
		
		$objectId1:=$SelectedObjects{$j}
		$objectId2:=$SelectedObjects{$i}
		
		Editor_LINK_CREATE("Editor"; \
			$style; $color; $strokeWidth; \
			$fontSize; $fontFamily; $fontStyle; $fontWeight; \
			$textDecoration; $textAlign; $textValue; $textColor; \
			$tx; $ty; \
			$objectId1; $objectId2)
		
	End for 
	
End for 
