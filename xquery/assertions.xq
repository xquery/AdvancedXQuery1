xquery version "1.0";

declare namespace test="http://www.webcomposite.com/test";

(: set to 1 to enable debugging :)
declare variable $NDEBUG:=1;

declare function test:assert($booleanexp as item(), $why as xs:string)  {
	if(fn:not($booleanexp) and fn:boolean($NDEBUG)) then 
		fn:error(QName("http://www.webcomposite.com/err", "assertion"),$why)
	else
		()
};

document
	{
		<results>
			<assert>{test:assert(2 eq 2,'testing equality')}</assert>
		</results>
	}