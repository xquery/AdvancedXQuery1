xquery version "1.0";

(: Module Imports :)
import module namespace util = "http://www.webcomposite.com/util"
                        at 'util.xqm';

document {
	<example>{
				util:random(78991347)
				}
	</example>
}