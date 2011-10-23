xquery version "1.0";

module namespace util="http://www.webcomposite.com/util";

declare namespace saxon="http://saxon.sf.net/";

declare namespace random="http://exslt.org/random";

declare function util:random($seed) as  xs:double  {
   random:random-sequence(1,$seed)
};
