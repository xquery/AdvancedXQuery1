xquery version "1.0";

declare namespace saxon="http://saxon.sf.net/";

declare variable $stdin := document{.};

declare function local:add($a as xs:integer, $b as xs:integer) as  xs:integer  {
	xs:integer($a+$b)
};

document {
	<result>{
				(: to throw a static error change 1 to 1.1 :)
				local:add(1,2)
				}
	</result>
}