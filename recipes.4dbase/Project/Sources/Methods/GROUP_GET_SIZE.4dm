//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_POINTER:C301($2; $3; $4; $5)
C_BOOLEAN:C305($6; $notVolatile)
C_TEXT:C284($7)

$group:=$1

If (Count parameters:C259>6)
	$notVolatile:=$6
	$domData:=$7
End if 

C_LONGINT:C283($i)
C_TEXT:C284($objectId)

ARRAY TEXT:C222($objects; 0)
$object:=DOM Find XML element:C864($group; "group/object"; $objects)

C_REAL:C285($x; $y; $width; $height)
C_REAL:C285($l; $t; $r; $b)

For ($i; 1; Size of array:C274($objects))
	$object:=$objects{$i}
	DOM GET XML ATTRIBUTE BY NAME:C728($object; "object-id"; $objectId)
	If ($notVolatile)
		$object:=DOM Find XML element by ID:C1010($domData; $objectId)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "x"; $x)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "y"; $y)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "width"; $width)
		DOM GET XML ATTRIBUTE BY NAME:C728($object; "height"; $height)
	Else 
		SVG GET ATTRIBUTE:C1056(*; "Image"; $objectId; "editor:x"; $x)
		SVG GET ATTRIBUTE:C1056(*; "Image"; $objectId; "editor:y"; $y)
		SVG GET ATTRIBUTE:C1056(*; "Image"; $objectId; "editor:width"; $width)
		SVG GET ATTRIBUTE:C1056(*; "Image"; $objectId; "editor:height"; $height)
	End if 
	
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

$2->:=$x
$3->:=$y
$4->:=$width
$5->:=$height