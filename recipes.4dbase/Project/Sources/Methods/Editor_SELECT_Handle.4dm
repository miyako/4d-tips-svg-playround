//%attributes = {"invisible":true}
C_TEXT:C284($1; $id)
C_TEXT:C284($0; $clickObject)

$id:=$1

$HandleId:=OBJECT Get pointer:C1124(Object named:K67:5; "HandleId")

ARRAY LONGINT:C221($pos; 0)
ARRAY LONGINT:C221($len; 0)

Case of 
	: (Match regex:C1019("select-.{2}-(object-\\d+)"; $id; 1; $pos; $len))
		
		$HandleId->:=$id
		$clickObject:=Substring:C12($id; $pos{1}; $len{1})
		
	: (Match regex:C1019("select-rect-(object-\\d+)"; $id; 1; $pos; $len))
		
		$HandleId->:=""
		$clickObject:=Substring:C12($id; $pos{1}; $len{1})
		
	Else 
		
		$HandleId->:=""
		$clickObject:=""
		
End case 

$0:=$clickObject