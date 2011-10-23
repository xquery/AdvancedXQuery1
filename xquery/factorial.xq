xquery version "1.0";

declare function local:factorial($n as xs:integer) as xs:integer {
if ($n < 0) then (0)	
else if ($n = 0) then (1)
else ($n * local:factorial($n - 1))
};

document
	{
		<result>
			{local:factorial(4)}
		</result>
	}