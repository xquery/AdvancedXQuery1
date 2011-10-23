xquery version "1.0";

declare function local:treewalker ($html) {

  let $children := $html/*
  return
      if(empty($children)) then ()
      else 
        for $c in $children
            return   
                ( element {name($c)}{
                    $c/@*,
                    $c/text(),
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

