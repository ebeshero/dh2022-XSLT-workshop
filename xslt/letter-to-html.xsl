<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" indent="no"></xsl:output>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//titleStmt/title" /></title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            </head>
            <body>
                <section id="letter">
                    <xsl:apply-templates select="//text/body"/>
                </section>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="div">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="p | opener | closer">
        <p>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="persName">
        <em>
            <xsl:apply-templates />
        </em>
    </xsl:template>
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="note" />
    <xsl:template match="choice | orig | reg" />
    
</xsl:stylesheet>