xquery version "1.0";

declare function local:topo-sort($unsorted, $sorted )  {
    if (empty($unsorted)) then $sorted
    else
        let $allnodes := $unsorted [ every $id in depends/@id satisfies $id = $sorted/@id]
        return 
          if ($allnodes) then 
			local:topo-sort( $unsorted except $allnodes, ($sorted, $allnodes ))
          else () 
};

document {
	<construction>{
				local:topo-sort( //task,())
				}
	</construction>
}