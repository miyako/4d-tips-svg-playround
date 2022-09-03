//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$Snapshots:=OBJECT Get pointer:C1124(Object named:K67:5; "Snapshots")

$size:=Size of array:C274($Snapshots->)

If ($size>$HistoryIndex->)
	
	HISTORY_RESTORE($HistoryIndex->+1)
	
End if 