//%attributes = {"invisible":true}
C_LONGINT:C283($frameId)

SVG GET ATTRIBUTE:C1056(*; "Image"; "loading"; "animation:frame-id"; $frameId)

If ($frameId=12)
	$frameId:=1
Else 
	$frameId:=$frameId+1
End if 

SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "animation:frame-id"; $frameId)

If (Caps lock down:C547)
	
	C_REAL:C285($opacity)
	For ($i; 1; 11)
		$opacity:=Choose:C955($i-1; 0.0833; 0.166; 0.25; 0.3333; 0.4166; 0.5; 0.5833; 0.6666; 0.75; 0.8333; 0.9166)
		SVG SET ATTRIBUTE:C1055(*; "Image"; "line"+String:C10($frameId); "opacity"; $opacity)
		If ($frameId=12)
			$frameId:=1
		Else 
			$frameId:=$frameId+1
		End if 
	End for 
	
Else 
	
	Case of 
		: ($frameId=1)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(0,160,160)")
		: ($frameId=2)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(30,160,160)")
		: ($frameId=3)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(60,160,160)")
		: ($frameId=4)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(90,160,160)")
		: ($frameId=5)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(120,160,160)")
		: ($frameId=6)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(150,160,160)")
		: ($frameId=7)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(180,160,160)")
		: ($frameId=8)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(210,160,160)")
		: ($frameId=9)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(240,160,160)")
		: ($frameId=10)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(270,160,160)")
		: ($frameId=11)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(300,160,160)")
		: ($frameId=12)
			SVG SET ATTRIBUTE:C1055(*; "Image"; "loading"; "transform"; "rotate(330,160,160)")
	End case 
End if 

$Count:=OBJECT Get pointer:C1124(Object named:K67:5; "Count")
$Start:=OBJECT Get pointer:C1124(Object named:K67:5; "Start")
$Rate:=OBJECT Get pointer:C1124(Object named:K67:5; "Rate")

$Count->:=$Count->+1
$Rate->:=String:C10($Count->/(Milliseconds:C459-$Start->)*1000; "##0.## redraws / sec")