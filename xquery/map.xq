xquery version "1.0";

declare function local:map($func, $seqA as item()*) as item()* {
	for $a at $i in $seqA
		return
			saxon:call($func, $a)
};

declare function local:doSomething ($a) {
	$a * 2
};

<test>
    {
let $a := (1,2,3,4,5,6,7,8)
let $b := local:map( saxon:function("local:doSomething", 1),
			$a)
return 
	$b
	}
</test>