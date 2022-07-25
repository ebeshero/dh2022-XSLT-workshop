<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
   <!-- ebb: This will plot an SVG that reads the Spanish letter file and outputs a value for each 
   part of speech and its percentage representation among all the words in the letter. 
   -->
    
    <xsl:variable name="wordCount" as="xs:integer" select="//w => count()"/>
    
    <xsl:variable name="countTypes" as="xs:integer">
        <xsl:value-of select="//w/@pos ! normalize-space() => distinct-values() => count()"/>
    </xsl:variable>
    
   <xsl:variable name="wordTypes" as="xs:string+" select="//w/@pos ! normalize-space() => distinct-values()"/>
    
    
    <xsl:template match="/">
        <svg >
            
        <xsl:comment><!--ebb: A comment "scratchpad" for surveying variable values. -->
            Wordcount: <xsl:value-of select="$wordCount"/> 
            Types of words: <xsl:value-of select="$countTypes"/>
            Word types: <xsl:value-of select="string-join($wordTypes, ', ')"/>
        </xsl:comment> 
            
        </svg>
        
      </xsl:template>
   
</xsl:stylesheet>