<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" indent="yes"></xsl:output>
    
    <xsl:variable name="letters" select="collection('../xml/?select=*.xml')"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title></title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            </head>
            <body>
                <h1>Correspondence Metadata</h1>
                <table border="1">
                    <tr>
                        <th>Sender</th>
                        <th>Receiver</th>
                        <th>Place</th>
                        <th>Date</th>
                    </tr>

                    <!--    <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                         </tr>
                         -->
 
                </table>
            </body>
        </html>
    </xsl:template>
    
 
    
</xsl:stylesheet>