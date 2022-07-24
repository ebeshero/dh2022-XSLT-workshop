<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" version="5"/>
    <xsl:template match="/">
        <xsl:apply-templates select="tei:TEI"/>
    </xsl:template>    
    <xsl:template match="tei:teiHeader"> </xsl:template>
    <xsl:template match="tei:text">
        <html>
            <head/>
            <xsl:element name="body">
                <xsl:attribute name="style">
                    <xsl:value-of select="tei:body/@style" />
                    ;padding:50px
                </xsl:attribute>
                <xsl:apply-templates select="tei:body"/>
            </xsl:element>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div">
        <xsl:for-each select="tei:p">
            <p>
                <xsl:apply-templates select="node()"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:choice">
        <xsl:apply-templates select="tei:orig"/>
        <xsl:apply-templates select="tei:sic"/>
    </xsl:template>
    <xsl:template match="tei:subst">
        <s>
            <xsl:apply-templates select="tei:del"/>
        </s>
        <b>
            <xsl:apply-templates select="tei:add"/>
        </b>
    </xsl:template>
    <xsl:template match="tei:add">
        <xsl:choose>
            <xsl:when test="@place = 'right'">
                <span style="font-weight:bold;vertical-align: super;">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span style="font-weight:bold;">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:closer">
        <div style="text-indent:3em">
            <xsl:apply-templates select="tei:salute"/>
        </div>
        <div style="text-align:right">
            <xsl:apply-templates select="tei:signed"/>
        </div>
    </xsl:template>
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
   <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <!-- kn ebb ms: This template is necessary for proper space-handling of Japanese text output. 
    For elaboration, process the Japanese letter file with and without this template, look at the 
    output view as code, and search for spaces. Japanese literation should not include spacing between words. -->

</xsl:stylesheet>