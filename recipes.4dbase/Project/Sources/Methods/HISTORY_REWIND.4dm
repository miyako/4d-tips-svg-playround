//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")

If (1<$HistoryIndex->)
	
	HISTORY_RESTORE($HistoryIndex->-1)
	
End if 