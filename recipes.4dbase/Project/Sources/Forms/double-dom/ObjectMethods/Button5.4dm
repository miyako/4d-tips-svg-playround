$DOM:=OBJECT Get pointer:C1124(Object named:K67:5; "DOM")

//"class" is not accesible by SVG SET ATTRIBUTE
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d1"); "class"; "digits-bright")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d2"); "class"; "digits-dark")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d3"); "class"; "digits-bright")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d4"); "class"; "digits-bright")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d5"); "class"; "digits-bright")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d6"); "class"; "digits-dark")
DOM SET XML ATTRIBUTE:C866(DOM Find XML element by ID:C1010($DOM->; "d7"); "class"; "digits-bright")

$Image:=OBJECT Get pointer:C1124(Object named:K67:5; "Image")
SVG EXPORT TO PICTURE:C1017($DOM->; $Image->; Copy XML data source:K45:17)