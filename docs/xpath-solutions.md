# About XPath
XPath is a syntax used in XSLT, XQuery, and other programming languages to navigate and calculate information in XML documents. Learning XPath makes programming from XML much easier. 

# XPath navigation
- Navigate `child::` and `descendant::` axes
- Try the `preceding` and `preceding-sibling` axes. (There are "following" equivalents to both of these.) 
- Apply predicates as boolean filters, using `[. . .]`
- Look at XPath functions: 
    - `normalize-space()`
    - `count()`
    - `distinct-values()`
    - Different styles of writing these expressions: nesting (XPath 2) vs. **simple-map**: `!` and arrow operator: `=>` (XPath 3)
        - `//*/normalize-space()` (XPath 2) vs. `//* ! normalize-space()` (XPath 3) mean the same thing.
        - `text()` node vs. `//string()` and a "deep" discussion of what `normalize-space()`


# Workshop XPath expressions 

- What XPath would find the paragraphs in the file?
    - `//p` or `descendant::p` 
- What XPath would find only the paragraphs inside the body?
    - `//body//p` or `descendant::body/descendant::p` 
- What XPath identifies the \<salute\> elements inside the \<closer\>?   
     - `//closer/salute` or `descendant::closer/child::salute` 
- What XPath would find the name of the sender?
     - `//correspAction[@type='sent']/persName`

## For letters with names encoded
- What XPath will find all the person names encoded in the letter?
     - `//div[@type='letter']//persName`
- How many of these are there?
     - `//div[@type='letter']//persName => count()` or `count(//div[@type='letter']//persName)`
- What XPath will find the values of the @ref attribute in the \<persName> elements?
     - `//persName/@ref`
- Which function will find the distinct attributte values? 
    - `//persName/@ref => distinct-values()`

## For letters with parts of speech encoded (The following questions only apply to the Spanish example):
Write XPath expressions to isolate different parts of speech, working carefully with predicate expressions. 
- What XPath will find all the nouns (pos='N')?
     - `//w[@pos='N']`

- How many of these are there? 
     - `//w[@pos='N'] => count()` or `count(//w[@pos='N'])`

- What XPath will find all the nouns which are directly preceded by a determiner (pos='D')?
This one is very challenging and the order of the predicate expressions matters!
Our solution is 
      - `//w[@pos="N" and preceding-sibling::w[1][@pos='D']]`

Try looking at `//w[@pos="N" and preceding-sibling::w[@pos='D'][1]]`. 
Try This expression returns *too many results*. 
Try Can you see why? 