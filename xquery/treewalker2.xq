xquery version "1.0";

declare function local:attrHandler ($attr) {
    $attr
 };

declare function local:textHandler ($text) {
    $text
 };

declare function local:treewalker ($tree) {

  let $children := $tree/*
  return
      if(empty($children)) then ()
      else 
        for $c in $children
            return   
                ( element {name($c)}{
                        local:attrHandler($c/@*),
                        local:textHandler($c/text()),
                        local:treewalker($c)
                })
 };

<test>
    {local:treewalker(<html info="test">
						<body>
							<a/>
							<b>
								<c info="test1">test</c>
							</b>
							<p>teststs</p>
						</body>
					 </html>)}
</test>