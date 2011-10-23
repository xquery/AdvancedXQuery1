xquery version "1.0";

declare variable $s:='xquery version "1.0";
declare variable $s:="";fn:substring($s,1,44),$s,fn:substring($s,45)';

fn:substring($s, 1,44),
$s,
fn:substring($s,45)