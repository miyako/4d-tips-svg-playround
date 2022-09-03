C_REAL:C285($sx; $sy)
SVG GET ATTRIBUTE:C1056(*; "Image"; "container"; "scale:x"; $sx)
SVG GET ATTRIBUTE:C1056(*; "Image"; "container"; "scale:y"; $sy)

$sx:=Choose:C955($sx=0; 0.5; $sx*0.5)
$sy:=Choose:C955($sy=0; 0.5; $sy*0.5)

$scale:=String:C10($sx; "&xml")+","+String:C10($sy; "&xml")
$transform:="scale("+$scale+")"

SVG SET ATTRIBUTE:C1055(*; "Image"; "container"; "transform"; $transform; \
"scale:x"; $sx; "scale:y"; $sy)