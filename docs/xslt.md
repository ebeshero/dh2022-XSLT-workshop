# XSLT 
XSLT is a full-fledged programming language, written in declarative, rather than imperative form. 
Most computer programming languages are written in an imperative form, instructing the computer what to do in a clearly defined sequence of steps.
XSLT takes a different approach! It is declarative, which means that you declare what you want to happen but allow your computer processor to evaluate how to accomplish that. 

"XSLT" stands for eXtensible Stylesheet Transformation Language, and it has a heritage in publisher technologies. 

## How to organize the oXygen XML Editor to write XSLT 
Two ways
* XSLT Transformation Scenario

* XSLT Debugger View (without output stack tracing) 

* Choosing the Saxon parser (Saxon PE)


## How to prepare oXygen XML Editor to write XSLT over TEI

* Setting the `@xpath-default-namespace` 

* Another way of doing it (using the `tei:` namespace prefix on element nodes

* Setting the output namespace


## Template rules

* Default template processing (in the absence of explicit template rules)

* "Push" processing (process most everything, and you don't have to have template rules
* "Pull" processing using the `@select` attribute

## Processing methods

* xsl:apply-templates 
* xsl:value-of (vs. type-aware xsl:sequence) 
* xsl:for-each 



