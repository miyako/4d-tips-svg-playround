$x1:=0
$y1:=0
$x2:=0
$y2:=1

$offset1:=0
$offset2:=1
$stopColor1:="#F8E0E6"
$stopColor2:="#F6CEEC"
$stopOpacity1:=0.25
$stopOpacity2:=0.5

$strokeColor:="#FA58AC"
$strokeOpacity:=1
$strokeWidth:=1
$strokeDashArray:="4,4"

$fontSize:=14
$fontFamily:="'System Font Medium','Segoe UI','sans-serif'"

$fontStyle:="normal"
$fontWeight:="normal"
$textDecoration:="none"
$textAlign:="start"
$textValue:="Group"
$textColor:="#FE2E64"
$displayAlign:="before"

$tx:=10
$ty:=10

$marginX:=25
$marginY:=25

$wordWrap:=True:C214

ARRAY TEXT:C222($SelectedObjects; 0)
Editor_GET_SELECTED_OBJECTS("Editor"; ->$SelectedObjects)

Editor_GROUP_CREATE("Editor"; \
$x1; \
$y1; \
$x2; \
$y2; \
$offset1; \
$offset2; \
$stopColor1; \
$stopColor2; \
$stopOpacity1; \
$stopOpacity2; \
$strokeColor; \
$strokeOpacity; \
$strokeWidth; \
$strokeDashArray; \
$fontSize; \
$fontFamily; \
$fontStyle; \
$fontWeight; \
$textDecoration; \
$textAlign; \
$textValue; \
$textColor; \
$displayAlign; \
$tx; \
$ty; \
$wordWrap; \
$marginX; \
$marginY; \
->$SelectedObjects)