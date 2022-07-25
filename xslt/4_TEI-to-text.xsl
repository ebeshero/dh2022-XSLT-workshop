<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="text" indent="yes"/>
    
    
    <xsl:variable name="spanishLetter" as="document-node()" select="doc('../xml/es_PS4000-TEIP5.xml')"/>
    
    <xsl:variable name="wordCount" as="xs:integer" select="//w => count()"/>
    
    <xsl:variable name="countTypes" as="xs:integer">
        <xsl:value-of select="//w/@pos ! normalize-space() => distinct-values() => count()"/>
    </xsl:variable>
    
   <xsl:variable name="wordTypes" as="xs:string+" select="//w/@pos ! normalize-space() => distinct-values()"/>
    
    
    
    <xsl:template match="/">
       
        
        <xsl:text>wordType</xsl:text><xsl:text>,</xsl:text><xsl:text>percentLabel</xsl:text>
        <xsl:text>&#x000D;</xsl:text>
                
        <!-- For each word type, return a percentage based on its count divided by the total word count * 100.-->
        <xsl:for-each select="$wordTypes">
            <xsl:sort select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
            
            <xsl:variable name="currentCount" as="xs:integer">
                <xsl:value-of select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
            </xsl:variable>
            
            <xsl:variable name="percentage" as="xs:double">
                <xsl:value-of select="$currentCount div $wordCount * 100"/>
            </xsl:variable>
            
            <xsl:value-of select="current()"/><xsl:text>,</xsl:text><xsl:value-of select="$percentage ! round(., 2)"/>
            <xsl:text>&#x000D;</xsl:text>
        </xsl:for-each>
                
      </xsl:template>
   
</xsl:stylesheet>