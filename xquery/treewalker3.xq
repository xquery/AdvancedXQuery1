xquery version "1.0";

declare function local:attrHandler ($attr) {
	$attr
 };

declare function local:textHandler ($text) {
	concat('textHandler:',$text)
 };

declare function local:treewalker ($tree,$attrFunc,$textFunc) {

  let $children := $tree/*
  return
      if(empty($children)) then ()
      else 
        for $c in $children
            return   
                ( element {name($c)}{
                            saxon:call($attrFunc,$c/@*),
                            saxon:call($textFunc,$c/text()),
                        local:treewalker($c,$attrFunc,$textFunc)
                })
 };

<test>
    {local:treewalker(<html info="test"><body><a/><b><c info="test1">test</c></b><p>teststs</p></body></html>,
                      saxon:function("local:attrHandler", 1),
                      saxon:function("local:textHandler", 1))}
</test>