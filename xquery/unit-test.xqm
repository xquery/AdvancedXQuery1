xquery version "1.0";

module namespace test = "http://www.webcomposite.com/test";

declare namespace saxon="http://saxon.sf.net/";


(: ---------------------------------------------------------------------------- :)
                                                                    (: XML Tests:)
(: ---------------------------------------------------------------------------- :)

declare function test:assertXMLEqual($a as item()*, $b as item()*) as xs:boolean {
    fn:deep-equal($a,$b)
};

declare function test:assertXMLNotEqual($a as item()*, $b as item()*) as xs:boolean {
    fn:not(fn:deep-equal($a,$b))
};

(: ---------------------------------------------------------------------------- :)
                                                                 (: String Tests:)
(: ---------------------------------------------------------------------------- :)

declare function test:assertStringEqual($a as xs:string, $b as xs:string) as xs:boolean {  
 fn:not(fn:boolean(fn:compare($a, $b)))
};

declare function test:assertStringNotEqual($a as xs:string, $b as xs:string) as xs:boolean {  
 fn:boolean(fn:compare($a, $b))
};

declare function test:assertStringContain($a as xs:string, $b as xs:string) as xs:boolean {
    fn:contains($a, $b)
};

declare function test:assertStringNotContain($a as xs:string, $b as xs:string) as xs:boolean {
    fn:not(fn:contains($a, $b))
};

(: ---------------------------------------------------------------------------- :)
                                                                (: Integer Tests:)
(: ---------------------------------------------------------------------------- :)

declare function test:assertIntegerEqual($a as xs:integer, $b as xs:integer) as xs:boolean {  
  fn:boolean($a=$b) 
};

declare function test:assertIsInteger($a as xs:integer) as xs:boolean {  
 fn:true() (: NOTE THIS IS A PROBLEM:)
};


(: ---------------------------------------------------------------------------- :)
                                                                  (: XPATH Tests:)
(: ---------------------------------------------------------------------------- :)

declare function test:evalXPATH($xpathstring, $xml){
    $xml/saxon:evaluate($xpathstring)
};

declare function test:assertXpathExist($xml as item(), $xpathstring as xs:string) as xs:boolean {
    fn:exists(test:evalXPATH($xpathstring,$xml))
};

declare function test:assertXpathNotExist($xml as item(), $xpathstring as xs:string) as xs:boolean {
    fn:not(fn:exists(test:evalXPATH($xpathstring,$xml)))
};


(: ---------------------------------------------------------------------------- :)

