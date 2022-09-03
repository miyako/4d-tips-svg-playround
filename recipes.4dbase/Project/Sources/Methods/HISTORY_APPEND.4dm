//%attributes = {"invisible":true}
$HistoryIndex:=OBJECT Get pointer:C1124(Object named:K67:5; "HistoryIndex")
$Snapshots:=OBJECT Get pointer:C1124(Object named:K67:5; "Snapshots")

//%W-518.5
ARRAY TEXT:C222($Snapshots->; $HistoryIndex->)
//%W+518.5

$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")

C_TEXT:C284($containerData)
DOM EXPORT TO VAR:C863($DomData->; $containerData)
APPEND TO ARRAY:C911($Snapshots->; $containerData)

$size:=Size of array:C274($Snapshots->)
$HistoryIndex->:=$size

HISTORY_UPDATE_SELECTS($DomData->)

LISTBOX SELECT ROW:C912(*; "History"; $HistoryIndex->; lk replace selection:K53:1)

CALL SUBFORM CONTAINER:C1086(-On Data Change:K2:15)