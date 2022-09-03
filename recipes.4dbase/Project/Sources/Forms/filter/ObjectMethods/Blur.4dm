If (Form event code:C388=On Clicked:K2:4)
	
	//get base64 data from image file
	C_TEXT:C284($data)
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"SVG"+Folder separator:K24:12+"summit-logo.png"
	READ PICTURE FILE:C678($path; $PNG)
	PICTURE TO BLOB:C692($PNG; $imageData; ".png")
	PICTURE PROPERTIES:C457($PNG; $width; $height)
	BASE64 ENCODE:C895($imageData; $data)
	
	//create SVG document
	$svg:=DOM Create XML Ref:C861("svg"; "http://www.w3.org/2000/svg"; \
		"xmlns:xlink"; "http://www.w3.org/1999/xlink")
	DOM SET XML ATTRIBUTE:C866($svg; \
		"width"; $width; "height"; $height)
	$defs:=DOM Create XML element:C865($svg; "defs"; "id"; "defs")
	
	//add filter definition
	$stdDeviation:=8
	$filter:=DOM Create XML element:C865($defs; "filter"; "id"; "filter-blur")
	$feGaussianBlur:=DOM Create XML element:C865($filter; \
		"feGaussianBlur"; "stdDeviation"; $stdDeviation)
	
	//add local URI
	$clipImage:=DOM Create XML element:C865($defs; "image"; \
		"id"; "clip-image"; "width"; $width; "height"; $height; \
		"xlink:href"; "data:image/png;base64,"+$data)
	
	//add clip
	$clipX:=125
	$clipY:=125
	$clipWidth:=200
	$clipHeight:=250
	$clipPath:=DOM Create XML element:C865($defs; "clipPath"; "id"; "clip-path-ellipse")
	$ellipse:=DOM Create XML element:C865($clipPath; "ellipse"; \
		"cx"; $clipX+($clipWidth/2); \
		"cy"; $clipY+($clipHeight/2); \
		"rx"; $clipWidth/2; \
		"ry"; $clipHeight/2; \
		"shape-rendering"; "geometricPrecision")
	
	//original image
	$use:=DOM Create XML element:C865($svg; "use"; \
		"xlink:href"; "#clip-image"; \
		"x"; 0; "y"; 0; "width"; $width; "height"; $height)
	
	//filter the image, then crop
	$g:=DOM Create XML element:C865($svg; "g"; "clip-path"; "url(#clip-path-ellipse)")
	$use:=DOM Create XML element:C865($g; "use"; \
		"xlink:href"; "#clip-image"; \
		"filter"; "url(#filter-blur)"; \
		"x"; 0; "y"; 0; "width"; $width; "height"; $height)
	
	$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
	SVG EXPORT TO PICTURE:C1017($svg; $Image->; Own XML data source:K45:18)
	
End if 