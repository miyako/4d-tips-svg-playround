//%attributes = {"invisible":true}
C_POINTER:C301(${1})

C_REAL:C285($cxTo; $cyTo; $cxFrom; $cyFrom; $widthTo; $heightTo; $widthFrom; $heightFrom)

$cxTo:=$1->
$cyTo:=$2->
$cxFrom:=$3->
$cyFrom:=$4->
$widthTo:=$5->
$heightTo:=$6->
$widthFrom:=$7->
$heightFrom:=$8->

If ($cxTo<$cxFrom)  //target is to the left
	
	If ($cxFrom-$widthFrom)<($cxTo+$widthTo)  //link vertically
		If ($cyFrom<$cyTo)
			
			$2->:=$cyTo-$heightTo
			$4->:=$cyFrom+$heightFrom
			
		Else 
			
			$2->:=$cyTo+$heightTo
			$4->:=$cyFrom-$heightFrom
			
		End if 
	Else 
		
		$1->:=$cxTo+$widthTo  //to:right
		$3->:=$cxFrom-$widthFrom  //from:left
		
	End if 
	
Else   //target is to the right
	
	If ($cxFrom+$widthFrom)>($cxTo-$widthTo)  //link vertically
		If ($cyFrom<$cyTo)
			
			$2->:=$cyTo-$heightTo
			$4->:=$cyFrom+$heightFrom
			
		Else 
			
			$2->:=$cyTo+$heightTo
			$4->:=$cyFrom-$heightFrom
			
		End if 
	Else 
		$1->:=$cxTo-$widthTo  //to:left
		$3->:=$cxFrom+$widthFrom  //from:right
	End if 
	
End if 