C_REAL:C285($tx; $ty)
SVG GET ATTRIBUTE:C1056(*; "Image"; "container"; "translate:x"; $tx)
SVG GET ATTRIBUTE:C1056(*; "Image"; "container"; "translate:y"; $ty)

$ty:=$ty+10

$translate:=String:C10($tx; "&xml")+","+String:C10($ty; "&xml")
$transform:="translate("+$translate+")"

SVG SET ATTRIBUTE:C1055(*; "Image"; "container"; "transform"; $transform; \
"translate:x"; $tx; "translate:y"; $ty)