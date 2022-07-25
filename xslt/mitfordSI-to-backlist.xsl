<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">

    
    <xsl:variable name="si" as="document-node()" select="document('https://digitalmitford.org/si.xml')"/>
    <xsl:variable name="siRefs" as="xs:string+" select="//*/@ref ! normalize-space() ! substring-after(., '#') => distinct-values()"/>
    
    <xsl:template name="backListConstructor" as="element()+">
        <xsl:for-each select="$si//*[@sortKey][descendant::*[@xml:id = $siRefs]]">
            <xsl:element name="{name()}">
                <xsl:attribute name="sortKey"><xsl:value-of select="@sortKey"/>
                </xsl:attribute>
                    <xsl:for-each select="current()//*[@xml:id=$siRefs]">
                        <xsl:copy-of select="current()"/>
                    </xsl:for-each>
            </xsl:element>
            
        </xsl:for-each>
    </xsl:template>
    
  <xsl:template match="TEI">
      <back>
         <xsl:call-template name="backListConstructor"/>
      </back>
  </xsl:template>
    
    
    
</xsl:stylesheet>