<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"    
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">

<!-- 2022-07-14 ebb: This is an identity transformation stylesheet.
    Where there is no template rule to match, the default behavior 
    is set to output a shallow copy of each node, that is the node 
    and its children. The only template rules we write are 
    for what we wish to change.
    
    Here we are matching <app> and <rdg> elements and processing only their 
    children (not replacing the tags). This is basically to remove tags 
    from the source document. 
    
    -->
    
 <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="app">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="rdg">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>