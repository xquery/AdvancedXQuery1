xquery version "1.0";

declare function local:filter($func, $seq as item()*) 
as item()* {
for $i in $seq
return
if(saxon:call($func, $i)) then
$i
else
()
};

declare function local:doSomething ($a) as xs:boolean {
	if ($a = 1) then fn:true()
	else if ($a = 5) then fn:true()
	else fn:false()
};

<test>
    {
let $a := (1,4,5,1,2,2,1,8)
let $b := (0,0,0,0,0,0,0,0)
return
local:filter( saxon:function("local:doSomething", 1),
			$a)
	}
</test>