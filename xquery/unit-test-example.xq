xquery version "1.0" encoding "UTF-8";

(: Module Imports :)
import module namespace test = "http://www.webcomposite.com/test"
                        at "unit-test.xqm";


(: -------------------------------------------------------------------------- :)
document {
<testsuite title="some example Unit Tests" desc="">

<test>
    <name>run successful assertXMLEqual unit test</name>
    <result>
    	{test:assertXMLEqual(<test/>,<test/>)}
    </result>
    <expected>true</expected>
</test>

<test>
    <name>run failed assertXMLEqual unit test</name>
    <result>
    	{test:assertXMLEqual(<test/>,<test><b/></test>)}
    </result>
    <expected>false</expected>
</test>

</testsuite>
}
(: -------------------------------------------------------------------------- :)
