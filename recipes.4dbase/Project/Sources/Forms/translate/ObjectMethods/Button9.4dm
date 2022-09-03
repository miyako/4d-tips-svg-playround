C_REAL:C285($tx; $ty)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "translate:x"; $tx)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "translate:y"; $ty)

$ty:=$ty+10

C_REAL:C285($width; $height)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "width"; $width)
SVG GET ATTRIBUTE:C1056(*; "Image"; "svg"; "height"; $height)

SVG SET ATTRIBUTE:C1055(*; "Image"; "svg"; "viewBox"; \
String:C10($tx; "&xml")+" "+String:C10($ty; "&xml")+" "+\
" "+String:C10($width; "&xml")+" "+String:C10($height; "&xml"); \
"translate:x"; $tx; "translate:y"; $ty)