//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_TEXT:C284($2)
C_REAL:C285($3; $4)
C_TEXT:C284($5; $6; $7; $8; $9; $10; $11)
C_REAL:C285($12; $13)
C_TEXT:C284($14; $15)

ARRAY TEXT:C222($temp; 0)
APPEND TO ARRAY:C911($temp; $14)
APPEND TO ARRAY:C911($temp; $15)
SORT ARRAY:C229($temp)

$objectId1:=$temp{1}
$objectId2:=$temp{2}

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

$style:=$1

If ($style<1)
	$style:=1
End if 

If ($style>4)
	$style:=4
End if 

$color:=$2
$strokeWidth:=$3

$fontSize:=$4
$fontFamily:=$5

$fontStyle:=$6
$fontWeight:=$7
$textDecoration:=$8
$textAlign:=$9
$textValue:=$10
$textColor:=$11

$tx:=$12
$ty:=$13

If ($objectId1#$objectId2)
	C_TEXT:C284($objectFrom; $objectTo; $linkId)
	If (LINK_Objects_exist($DomData->; $objectId1; $objectId2; ->$objectFrom; ->$objectTo))
		
		C_REAL:C285($x; $y; $width; $height)
		
		DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "x"; $x)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "y"; $y)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "width"; $width)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectFrom; "height"; $height)
		
		$cxFrom:=$x+($width/2)
		$cyFrom:=$y+($height/2)
		$widthFrom:=$width/2
		$heightFrom:=$height/2
		
		DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "x"; $x)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "y"; $y)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "width"; $width)
		DOM GET XML ATTRIBUTE BY NAME:C728($objectTo; "height"; $height)
		
		$cxTo:=$x+($width/2)
		$cyTo:=$y+($height/2)
		$widthTo:=$width/2
		$heightTo:=$height/2
		
		C_REAL:C285($lineWidth; $lineHeight)
		
		OBJECT_COMPUTE_SIZE($textValue; $fontFamily; $fontSize; $fontStyle; $fontWeight; "start"; $textDecoration; ->$lineWidth; ->$lineHeight)
		
		$link:=LINK_Get($DomData->; $objectId1; $objectId2; ->$linkId)
		
		If (Length:C16($link)=0)
			$links:=DOM Find XML element by ID:C1010($DomData->; "links")
			$count:=DOM Count XML elements:C726($links; "link")
			$linkId:="link-"+String:C10($count+1)
			$link:=DOM Create XML element:C865($links; "link"; "id"; $linkId; \
				"from"; $objectId1; "to"; $objectId2; "style"; $style; \
				"color"; $color; "strokeWidth"; $strokeWidth; \
				"fontSize"; $fontSize; "fontFamily"; $fontFamily; \
				"fontStyle"; $fontStyle; "fontWeight"; $fontWeight; \
				"textDecoration"; $textDecoration; "textAlign"; $textAlign; \
				"textValue"; $textValue; "textColor"; $textColor; \
				"tx"; $tx; "ty"; $ty; "lineWidth"; $lineWidth; "lineHeight"; $lineHeight; \
				"cx-from"; $cxFrom; "cy-from"; $cyFrom; "width-from"; $widthFrom; "height-from"; $heightFrom; \
				"cx-to"; $cxTo; "cy-to"; $cyTo; "width-to"; $widthTo; "height-to"; $heightTo)
		Else 
			//modify existing link (element will be recreated in Put)
			$g:=DOM Find XML element by ID:C1010($DomImage->; $linkId)
			DOM REMOVE XML ELEMENT:C869($g)
			
			DOM SET XML ATTRIBUTE:C866($link; \
				"style"; $style; \
				"color"; $color; "strokeWidth"; $strokeWidth; \
				"fontSize"; $fontSize; "fontFamily"; $fontFamily; \
				"fontStyle"; $fontStyle; "fontWeight"; $fontWeight; \
				"textDecoration"; $textDecoration; "textAlign"; $textAlign; \
				"textValue"; $textValue; "textColor"; $textColor; \
				"tx"; $tx; "ty"; $ty; "lineWidth"; $lineWidth; "lineHeight"; $lineHeight; \
				"cx-from"; $cxFrom; "cy-from"; $cyFrom; "width-from"; $widthFrom; "height-from"; $heightFrom; \
				"cx-to"; $cxTo; "cy-to"; $cyTo; "width-to"; $widthTo; "height-to"; $heightTo)
		End if 
		
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
		
	End if 
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	
	$Image->:=Editor_Get_image($DomImage->)
	
	HISTORY_APPEND
	
End if 