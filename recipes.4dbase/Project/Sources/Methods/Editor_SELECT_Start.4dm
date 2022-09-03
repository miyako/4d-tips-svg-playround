//%attributes = {"invisible":true}
C_REAL:C285($1; $2)
C_TEXT:C284($0)

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
$SelectionChanged:=OBJECT Get pointer:C1124(Object named:K67:5; "SelectionChanged")

C_BOOLEAN:C305($shouldRedraw)
C_TEXT:C284($clickObject)

$MouseX:=$1
$MouseY:=$2

$select:=Editor_SELECT_Get
If (Length:C16($select)#0)
	//should not happen under normal circumstances
	DOM REMOVE XML ELEMENT:C869($select)
	Editor_SELECT_SET("")
End if 

$SelectionChanged->:=0

$clickedItem:=SVG Find element ID by coordinates:C1054($Image->; $MouseX; $MouseY)

Case of 
	: (Length:C16($clickedItem)=0)
		
		$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
		If (Editor_SELECT_Clear($DomData->; $DomImage->))
			//some objects were unselected
			$SelectionChanged->:=1
		End if 
		
		//no scaling;
		$translate:="translate("+String:C10($MouseX; "&xml")+","+String:C10($MouseY; "&xml")+")"
		$transform:=$translate
		
		//geometricPrecision
		//optimizeSpeed
		$select:=DOM Create XML element:C865($DomImage->; "rect"; "id"; "select"; \
			"transform"; $transform; \
			"x"; 0; \
			"y"; 0; \
			"width"; 0; \
			"height"; 0; \
			"editor:object-type"; ""; \
			"editor:object-id"; ""; \
			"shape-rendering"; "optimizeSpeed"; \
			"fill"; "#9999FF"; \
			"fill-opacity"; 0.1; \
			"stroke"; "#9999FF"; \
			"stroke-width"; 1; \
			"stroke-opacity"; 0.7)
		
		Editor_SELECT_SET($select)
		
		$shouldRedraw:=True:C214
		
	: ($clickedItem="select@")
		
		$clickObject:=Editor_SELECT_Handle($clickedItem)
		
	: ($clickedItem="group@")
		
		$shouldRedraw:=Editor_SELECT_Group($clickedItem; ->$clickObject)
		
	Else 
		
		$shouldRedraw:=Editor_SELECT_Add($clickedItem; Shift down:C543; ->$clickObject)
		
		//some objects were added
		$SelectionChanged->:=Num:C11($shouldRedraw)
		
End case 

SET TIMER:C645(-1)

If ($shouldRedraw)
	$Image->:=Editor_Get_image($DomImage->)
End if 

$0:=$clickObject