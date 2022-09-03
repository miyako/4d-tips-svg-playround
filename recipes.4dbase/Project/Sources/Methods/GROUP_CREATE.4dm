//%attributes = {"invisible":true}
C_REAL:C285($1; $2; $3; $4; $5; $6)
C_TEXT:C284($7; $8)
C_REAL:C285($9; $10)
C_TEXT:C284($11)
C_REAL:C285($12; $13)
C_TEXT:C284($14)
C_REAL:C285($15)
C_TEXT:C284($16; $17; $18; $19; $20; $21; $22; $23)
C_REAL:C285($24; $25)
C_BOOLEAN:C305($26)
C_REAL:C285($27; $28)
C_POINTER:C301($29)

$x1:=$1
$y1:=$2
$x2:=$3
$y2:=$4

$offset1:=$5
$offset2:=$6
$stopColor1:=$7
$stopColor2:=$8
$stopOpacity1:=$9
$stopOpacity2:=$10

$strokeColor:=$11
$strokeOpacity:=$12
$strokeWidth:=$13
$strokeDashArray:=$14

$fontSize:=$15
$fontFamily:=$16

$fontStyle:=$17
$fontWeight:=$18
$textDecoration:=$19
$textAlign:=$20
$textValue:=$21
$textColor:=$22
$displayAlign:=$23

$tx:=$24
$ty:=$25

$wordWrap:=$26

$marginX:=$27
$marginY:=$28

ARRAY TEXT:C222($SelectedObjects; 0)
//%W-518.1
COPY ARRAY:C226($29->; $SelectedObjects)
//%W+518.1
$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")
$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")

//remove object from current group
ARRAY TEXT:C222($groups; 0)
$domGroups:=DOM Find XML element by ID:C1010($DomData->; "groups")
$group:=DOM Find XML element:C864($domGroups; "groups/group"; $groups)

C_LONGINT:C283($i)
C_TEXT:C284($objectId)

ARRAY TEXT:C222($objects; 0)

For ($i; 1; Size of array:C274($groups))
	
	$group:=$groups{$i}
	
	CLEAR VARIABLE:C89($objects)
	$object:=DOM Find XML element:C864($group; "group/object"; $objects)
	
	For ($j; 1; Size of array:C274($objects))
		$object:=$objects{$j}
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "object-id"; $objectId)
		If (-1#Find in array:C230($SelectedObjects; $objectId))
			DOM REMOVE XML ELEMENT:C869($object)
		End if 
	End for 
	
	//remove empty group
	If (0=DOM Count XML elements:C726($group; "object"))
		
		DOM GET XML ATTRIBUTE BY NAME:C728($group; "id"; $groupId)
		
		GROUP_Delete($groupId; True:C214)
		
	End if 
	
End for 

$groupId:="group-"+String:C10(DOM Count XML elements:C726($domGroups; "group")+1)

C_REAL:C285($x; $y; $width; $height)
C_REAL:C285($l; $t; $r; $b)

For ($i; 1; Size of array:C274($SelectedObjects))
	$object:=$SelectedObjects{$i}
	$object:=DOM Find XML element by ID:C1010($DomData->; $object)
	
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "width"; $width)
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "height"; $height)
	
	If ($i=1)
		$l:=$x
		$t:=$y
		$r:=$x+$width
		$b:=$y+$height
	Else 
		
		If ($x<$l)
			$l:=$x
		End if 
		
		If ($y<$t)
			$t:=$y
		End if 
		
		If ($x+$width)>$r
			$r:=($x+$width)
		End if 
		
		If ($y+$height)>$b
			$b:=($y+$height)
		End if 
		
	End if 
	
End for 

$x:=$l
$width:=$r-$l

If ($width<0)
	$x:=$x+$width
	$width:=-$width
End if 

$y:=$t
$height:=$b-$t

If ($height<0)
	$y:=$y+$height
	$height:=-$height
End if 

C_REAL:C285($lineWidth; $lineHeight)

OBJECT_COMPUTE_SIZE($textValue; $fontFamily; $fontSize; $fontStyle; $fontWeight; "start"; $textDecoration; ->$lineWidth; ->$lineHeight)

//"x";$x;"y";$y;"width";$width;"height";$height;\

$group:=DOM Create XML element:C865($domGroups; "group"; "id"; $groupId; \
"x1"; $x1; \
"y1"; $y1; \
"x2"; $x2; \
"y2"; $y2; \
"offset1"; $offset1; \
"offset2"; $offset2; \
"stopColor1"; $stopColor1; \
"stopColor2"; $stopColor2; \
"stopOpacity1"; $stopOpacity1; \
"stopOpacity2"; $stopOpacity2; \
"strokeColor"; $strokeColor; \
"strokeOpacity"; $strokeOpacity; \
"strokeWidth"; $strokeWidth; \
"strokeDashArray"; $strokeDashArray; \
"fontSize"; $fontSize; \
"fontFamily"; $fontFamily; \
"fontStyle"; $fontStyle; \
"fontWeight"; $fontWeight; \
"textDecoration"; $textDecoration; \
"textAlign"; $textAlign; \
"textValue"; $textValue; \
"textColor"; $textColor; \
"displayAlign"; $displayAlign; \
"tx"; $tx; \
"ty"; $ty; "lineWidth"; $lineWidth; "lineHeight"; $lineHeight; \
"wordWrap"; $wordWrap; \
"marginX"; $marginX; \
"marginY"; $marginY)

For ($i; 1; Size of array:C274($SelectedObjects))
	$objectId:=$SelectedObjects{$i}
	$object:=DOM Create XML element:C865($group; "object"; "object-id"; $objectId)
End for 

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

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")

$Image->:=Editor_Get_image($DomImage->)

HISTORY_APPEND
