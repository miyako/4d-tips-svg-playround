//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2)
C_BOOLEAN:C305($0)

$dom:=$1
$objectId:=$2

$DomImage:=OBJECT Get pointer:C1124(Object named:K67:5; "DomImage")
$DomData:=OBJECT Get pointer:C1124(Object named:K67:5; "DomData")

C_REAL:C285($x; $y; $width; $height; $tx; $ty; $sx; $sy; $r; $cx; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:x"; $x)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:y"; $y)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:width"; $width)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:height"; $height)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:tx"; $tx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:ty"; $ty)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sx"; $sx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:sy"; $sy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cx"; $cx)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:cy"; $cy)
DOM GET XML ATTRIBUTE BY NAME:C728($dom; "editor:r"; $r)

Editor_SELECT($DomImage->; $objectId; $tx; $ty; $sx; $sy; $width; $height; $r)

Editor_SELECT_APPEND($DomData->; $objectId)

$0:=True:C214