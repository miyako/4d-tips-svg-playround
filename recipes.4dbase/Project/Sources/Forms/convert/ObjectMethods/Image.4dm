$event:=Form event code:C388

Case of 
	: ($event=On Load:K2:1)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"seal.svg"
		READ PICTURE FILE:C678($path; Self:C308->)
		ARRAY TEXT:C222($codecs; 0)
		PICTURE CODEC LIST:C992($codecs)
		$count:=Size of array:C274($codecs)
		$rows:=8
		C_POINTER:C301($NIL)
		For ($i; 1; ($count\$rows)+($count%$rows))
			For ($j; 1; $rows)
				If (((($i-1)*$rows)+$j)<=$count)
					OBJECT DUPLICATE:C1111(*; "Codec"; ""; $NIL; "Codec1"; 105*($i-1); 35*($j-1))
				End if 
			End for 
		End for 
End case 