//%attributes = {"invisible":true}
C_LONGINT:C283($1)

$position:=$1

$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$Snapshots:=OBJECT Get pointer:C1124(Object named:K67:5; "Snapshots")

$size:=Size of array:C274($Snapshots->)

C_BOOLEAN:C305($shouldUpdate)
If ($position>0)
	If ($position<=$size)
		If ($position#$HistoryIndex->)
			$HistoryIndex->:=$position
			$shouldUpdate:=True:C214
		End if 
	End if 
End if 

If ($shouldUpdate)
	
	LISTBOX SELECT ROW:C912(*; "History"; $HistoryIndex->; lk replace selection:K53:1)
	$Snapshots:=OBJECT Get pointer:C1124(Object named:K67:5; "Snapshots")
	C_TEXT:C284($containerData)
	
	//%W-533.3
	$containerData:=$Snapshots->{$HistoryIndex->}
	//%W+533.3
	
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
	
	DOM CLOSE XML:C722($DomData->)
	$DomData->:=DOM Parse XML variable:C720($containerData)
	
	C_REAL:C285($width; $height; $editorWidth; $editorHeight)
	DOM GET XML ATTRIBUTE BY NAME:C728($DomImage->; "editor:document-width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($DomImage->; "editor:document-height"; $height)
	DOM GET XML ATTRIBUTE BY NAME:C728($DomImage->; "width"; $editorWidth)
	DOM GET XML ATTRIBUTE BY NAME:C728($DomImage->; "height"; $editorHeight)
	
	DOM CLOSE XML:C722($DomImage->)
	
	$DomImage->:=Editor_New($width; $height; $editorWidth; $editorHeight)
	
	ARRAY TEXT:C222($selects; 0)
	Editor_SELECT_GET_LIST($DomData->; ->$selects)
	
	ARRAY TEXT:C222($objects; 0)
	$object:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "objects"); "objects/object"; $objects)
	
	For ($i; 1; Size of array:C274($objects))
		
		$object:=$objects{$i}
		
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "displayAlign"; $displayAlign)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "fontFamily"; $fontFamily)
		C_REAL:C285($fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "fontSize"; $fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "fontStyle"; $fontStyle)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "fontWeight"; $fontWeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "height"; $height)
		C_REAL:C285($lineHeight; $offset1; $offset2; $stopOpacity1; $stopOpacity2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "lineHeight"; $lineHeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "offset1"; $offset1)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "offset2"; $offset2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "stopColor1"; $stopColor1)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "stopColor2"; $stopColor2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "stopOpacity1"; $stopOpacity1)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "stopOpacity2"; $stopOpacity2)
		C_REAL:C285($strokeOpacity; $strokeWidth; $width)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "strokeColor"; $strokeColor)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "strokeOpacity"; $strokeOpacity)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "strokeWidth"; $strokeWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "textAlign"; $textAlign)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "textColor"; $textColor)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "textDecoration"; $textDecoration)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "textValue"; $textValue)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "width"; $width)
		C_BOOLEAN:C305($wordWrap)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "wordWrap"; $wordWrap)
		C_REAL:C285($x; $x1; $x2; $y; $y1; $y2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "x1"; $x1)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "x2"; $x2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "y1"; $y1)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "y2"; $y2)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "id"; $objectId)
		
		OBJECT_Put(\
			$x; \
			$y; \
			$width; \
			$height; \
			$x1; \
			$y1; \
			$x2; \
			$y2; \
			$offset1; \
			$offset2; \
			$stopColor1; \
			$stopColor2; \
			$stopOpacity1; \
			$stopOpacity2; \
			$strokeColor; \
			$strokeOpacity; \
			$strokeWidth; \
			$fontSize; \
			$fontFamily; \
			$fontStyle; \
			$fontWeight; \
			$textDecoration; \
			$textAlign; \
			$textValue; \
			$textColor; \
			$displayAlign; \
			$wordWrap; \
			$lineHeight; \
			$objectId; (Find in array:C230($selects; $objectId)#-1))
		
	End for 
	
	ARRAY TEXT:C222($links; 0)
	$link:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "links"); "links/link"; $links)
	
	C_TEXT:C284($from; $to)
	
	For ($i; 1; Size of array:C274($links))
		
		$link:=$links{$i}
		
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "to"; $to)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "from"; $from)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "color"; $color)
		C_REAL:C285($strokeWidth; $fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "strokeWidth"; $strokeWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "fontSize"; $fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "fontFamily"; $fontFamily)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "fontStyle"; $fontStyle)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "fontWeight"; $fontWeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "textDecoration"; $textDecoration)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "textAlign"; $textAlign)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "textValue"; $textValue)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "textColor"; $textColor)
		C_REAL:C285($lineWidth; $lineHeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "lineWidth"; $lineWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "lineHeight"; $lineHeight)
		C_REAL:C285($tx; $ty; $style)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "tx"; $tx)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "ty"; $ty)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "style"; $style)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "id"; $linkId)
		
		C_REAL:C285($cxFrom; $cyFrom; $widthFrom; $heightFrom)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "cx-from"; $cxFrom)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "cy-from"; $cyFrom)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "width-from"; $widthFrom)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "height-from"; $heightFrom)
		
		C_REAL:C285($cxTo; $cyTo; $widthTo; $heightTo)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "cx-to"; $cxTo)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "cy-to"; $cyTo)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "width-to"; $widthTo)
		DOM GET XML ATTRIBUTE BY NAME:C728($link; "height-to"; $heightTo)
		
		LINK_Put(\
			$color; \
			$strokeWidth; \
			$fontSize; \
			$fontFamily; \
			$fontStyle; \
			$fontWeight; \
			$textDecoration; \
			$textAlign; \
			$textValue; \
			$textColor; \
			$lineWidth; \
			$lineHeight; \
			$tx; \
			$ty; \
			$cxFrom; \
			$cyFrom; \
			$widthFrom; \
			$heightFrom; \
			$cxTo; \
			$cyTo; \
			$widthTo; \
			$heightTo; \
			$style; \
			$linkId)
		
	End for 
	
	ARRAY TEXT:C222($groups; 0)
	$group:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "groups"); "groups/group"; $groups)
	
	For ($i; 1; Size of array:C274($groups))
		
		$group:=$groups{$i}
		
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
		C_REAL:C285($x1; $y1; $x2; $y2; $offset1; $offset2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "x1"; $x1)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "y1"; $y1)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "x2"; $x2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "y2"; $y2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "offset1"; $offset1)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "offset2"; $offset2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "stopColor1"; $stopColor1)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "stopColor2"; $stopColor2)
		C_REAL:C285($stopOpacity1; $stopOpacity2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "stopOpacity1"; $stopOpacity1)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "stopOpacity2"; $stopOpacity2)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "strokeColor"; $strokeColor)
		C_REAL:C285($strokeOpacity; $strokeWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "strokeOpacity"; $strokeOpacity)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "strokeWidth"; $strokeWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "strokeDashArray"; $strokeDashArray)
		C_REAL:C285($fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "fontSize"; $fontSize)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "fontFamily"; $fontFamily)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "fontStyle"; $fontStyle)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "fontWeight"; $fontWeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "textDecoration"; $textDecoration)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "textAlign"; $textAlign)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "textValue"; $textValue)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "textColor"; $textColor)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "displayAlign"; $displayAlign)
		C_REAL:C285($tx; $ty; $lineWidth; $lineHeight)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "tx"; $tx)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "ty"; $ty)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "lineWidth"; $lineWidth)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "lineHeight"; $lineHeight)
		C_BOOLEAN:C305($wordWrap)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "wordWrap"; $wordWrap)
		C_REAL:C285($marginX; $marginY)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "marginX"; $marginX)
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "marginY"; $marginY)
		
		C_REAL:C285($x; $y; $width; $height)
		GROUP_GET_SIZE($group; ->$x; ->$y; ->$width; ->$height; True:C214; $DomData->)
		
		GROUP_Put(\
			$x; \
			$y; \
			$width; \
			$height; \
			$x1; \
			$y1; \
			$x2; \
			$y2; \
			$offset1; \
			$offset2; \
			$stopColor1; \
			$stopColor2; \
			$stopOpacity1; \
			$stopOpacity2; \
			$strokeColor; \
			$strokeOpacity; \
			$strokeWidth; \
			$strokeDashArray; \
			$fontSize; \
			$fontFamily; \
			$fontStyle; \
			$fontWeight; \
			$textDecoration; \
			$textAlign; \
			$textValue; \
			$textColor; \
			$displayAlign; \
			$tx; \
			$ty; \
			$wordWrap; \
			$marginX; \
			$marginY; \
			$groupId)
		
	End for 
	
	HISTORY_UPDATE_SELECTS($DomData->)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Image->:=Editor_Get_image($DomImage->)
	
	CALL SUBFORM CONTAINER:C1086(-On Data Change:K2:15)
	
End if 
