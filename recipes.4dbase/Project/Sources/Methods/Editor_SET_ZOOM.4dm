//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1; $objectName)
C_REAL:C285($2; $zoomValue)

$objectName:=$1
$zoomValue:=$2

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image"; $objectName)

If (Not:C34(Is nil pointer:C315($Image)))
	EXECUTE METHOD IN SUBFORM:C1085($objectName; Current method name:C684; *; "Image"; $zoomValue)
Else 
	
	$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
	$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	$Zoom:=OBJECT Get pointer:C1124(Object named:K67:5; "Zoom")
	
	If ($Zoom->#$zoomValue)
		
		C_REAL:C285($scrollV; $scrollH)
		OBJECT GET SCROLL POSITION:C1114(*; "Image"; $scrollV; $scrollH)
		
		$Zoom->:=$zoomValue
		
		C_REAL:C285($width; $height)
		
		SVG GET ATTRIBUTE:C1056($Image->; "svg"; "editor:document-width"; $width)
		SVG GET ATTRIBUTE:C1056($Image->; "svg"; "editor:document-height"; $height)
		
		$ScrollbarH:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarH")
		$ScrollbarV:=OBJECT Get pointer:C1124(Object named:K67:5; "ScrollbarV")
		
		C_REAL:C285($editorWidth; $editorHeight)
		If (1<$Zoom->)
			$editorWidth:=($width-$ScrollbarH->)*$Zoom->
			$editorHeight:=($height-$ScrollbarV->)*$Zoom->
		Else 
			$editorWidth:=($width-$ScrollbarH->)
			$editorHeight:=($height-$ScrollbarV->)
		End if 
		
		DOM SET XML ATTRIBUTE:C866($DomImage->; "width"; $editorWidth; "height"; $editorHeight)
		
		C_LONGINT:C283($i)
		C_TEXT:C284($objectId)
		
		ARRAY TEXT:C222($objects; 0)
		$object:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "objects"); "objects/object"; $objects)
		
		For ($i; 1; Size of array:C274($objects))
			
			$object:=$objects{$i}
			DOM GET XML ATTRIBUTE BY NAME:C728($object; "id"; $objectId)
			
			$g:=DOM Find XML element by ID:C1010($DomImage->; $objectId)
			
			C_REAL:C285($sx; $sy)
			$sx:=$Zoom->
			$sy:=$Zoom->
			
			C_REAL:C285($x; $y; $width; $height)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:x"; $x)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:y"; $y)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:width"; $width)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:height"; $height)
			
			C_REAL:C285($tx; $ty)
			$tx:=(($width/2)+$x)*$sx
			$ty:=(($height/2)+$y)*$sy
			
			C_REAL:C285($cx; $cy; $r)
			
			$translate:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
			$scale:="scale("+String:C10($sx; "&xml")+","+String:C10($sy; "&xml")+")"
			$rotate:="rotate("+String:C10($r; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")"
			
			$transform:=$translate+" "+$scale+" "+$rotate
			
			DOM SET XML ATTRIBUTE:C866($g; \
				"editor:tx"; $tx; \
				"editor:ty"; $ty; \
				"editor:sx"; $sx; \
				"editor:sy"; $sy; \
				"transform"; $transform)
			
		End for 
		
		ARRAY TEXT:C222($selects; 0)
		$object:=DOM Find XML element:C864(DOM Find XML element by ID:C1010($DomData->; "selects"); "selects/select"; $selects)
		
		For ($i; 1; Size of array:C274($selects))
			
			$select:=$selects{$i}
			
			DOM GET XML ATTRIBUTE BY NAME:C728($select; "object-id"; $objectId)
			
			$g:=DOM Find XML element by ID:C1010($DomImage->; $objectId)
			
			C_REAL:C285($tx; $ty)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:tx"; $tx)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:ty"; $ty)
			
			$transform:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"
			
			$selectId:="select-"+$objectId
			$select:=DOM Find XML element by ID:C1010($DomImage->; $selectId)
			DOM SET XML ATTRIBUTE:C866($select; "transform"; $transform)
			
			C_REAL:C285($sx; $sy)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:sx"; $sx)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:sy"; $sy)
			
			C_REAL:C285($width; $height)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:width"; $width)
			DOM GET XML ATTRIBUTE BY NAME:C728($g; "editor:height"; $height)
			
			$x:=(-$width/2)*$sx
			$y:=(-$height/2)*$sy
			$width:=$width*$sx
			$height:=$height*$sy
			
			$selectId:="select-rect-"+$objectId
			$selectRect:=DOM Find XML element by ID:C1010($DomImage->; $selectId)
			DOM SET XML ATTRIBUTE:C866($selectRect; "x"; $x; "y"; $y; "width"; $width; "height"; $height)
			
			$CanvasCurrentSelectTL:=DOM Find XML element by ID:C1010($DomImage->; "select-tl-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTL; "x"; $x-(10/2); "y"; $y-(10/2))
			
			$CanvasCurrentSelectTM:=DOM Find XML element by ID:C1010($DomImage->; "select-tm-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTM; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2))
			
			$CanvasCurrentSelectTR:=DOM Find XML element by ID:C1010($DomImage->; "select-tr-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectTR; "x"; $x-(10/2)+$width; "y"; $y-(10/2))
			
			$CanvasCurrentSelectML:=DOM Find XML element by ID:C1010($DomImage->; "select-ml-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectML; "x"; $x-(10/2); "y"; $y-(10/2)+($height/2))
			
			$CanvasCurrentSelectMR:=DOM Find XML element by ID:C1010($DomImage->; "select-mr-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectMR; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+($height/2))
			
			$CanvasCurrentSelectBL:=DOM Find XML element by ID:C1010($DomImage->; "select-bl-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBL; "x"; $x-(10/2); "y"; $y-(10/2)+$height)
			
			$CanvasCurrentSelectBM:=DOM Find XML element by ID:C1010($DomImage->; "select-bm-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBM; "x"; $x-(10/2)+($width/2); "y"; $y-(10/2)+$height)
			
			$CanvasCurrentSelectBR:=DOM Find XML element by ID:C1010($DomImage->; "select-br-"+$objectId)
			DOM SET XML ATTRIBUTE:C866($CanvasCurrentSelectBR; "x"; $x-(10/2)+$width; "y"; $y-(10/2)+$height)
			
		End for 
		
		LINK_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; True:C214)
		GROUP_UPDATE($DomData->; $DomImage->; $Image; $scrollH; $scrollV; $Zoom->; True:C214)
		
		$Image->:=Editor_Get_image($DomImage->)
		
	End if 
	
End if 