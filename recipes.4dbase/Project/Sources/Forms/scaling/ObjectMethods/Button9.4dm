C_REAL:C285($sx; $sy)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "scale:x"; $sx)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "scale:y"; $sy)

$sx:=Choose:C955($sx=0; 2; $sx*2)
$sy:=Choose:C955($sy=0; 2; $sy*2)

C_REAL:C285($width; $height)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "width"; $width)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "height"; $height)

$width:=$width*(1/$sx)
$height:=$height*(1/$sy)

SVG SET ATTRIBUTE:C1055(*; "Image"; "svg"; "viewBox"; \
"0 0 "+\
String:C10($width; "&xml")+" "+\
String:C10($height; "&xml"); \
"scale:x"; $sx; "scale:y"; $sy)