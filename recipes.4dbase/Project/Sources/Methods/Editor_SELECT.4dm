//%attributes = {"invisible":true}
C_TEXT:C284($1; $2)
C_REAL:C285($3; $4; $5; $6; $7; $8; $9)

$dom:=$1
$objectId:=$2

$tx:=$3
$ty:=$4
$sx:=$5
$sy:=$6
$width:=$7
$height:=$8
$r:=$9

$selectId:="select-"+$objectId

$transform:="translate("+String:C10($tx; "&xml")+","+String:C10($ty; "&xml")+")"

$g:=DOM Create XML element:C865($dom; "g"; "id"; $selectId; \
"transform"; $transform; \
"editor:object-id"; "")

$selectId:="select-rect-"+$objectId

$x:=(-$width/2)*$sx
$y:=(-$height/2)*$sy

$width:=$width*$sx
$height:=$height*$sy

//crispEdges
//geometricPrecision
//optimizeSpeed

$mode:="geometricPrecision"

$selectRect:=DOM Create XML element:C865($g; "rect"; \
"id"; $selectId; \
"x"; $x; \
"y"; $y; \
"width"; $width; \
"height"; $height; \
"fill"; "#666666"; \
"fill-opacity"; 0.2; \
"stroke"; "#EEEEEE"; \
"stroke-opacity"; 0.7; \
"stroke-width"; 1; \
"editor:object-id"; ""; \
"shape-rendering"; $mode)

Editor_SELECT_DISPLAY_HANDLES("text"; $g; $objectId; $x; $y; $width; $height; $r; $mode)