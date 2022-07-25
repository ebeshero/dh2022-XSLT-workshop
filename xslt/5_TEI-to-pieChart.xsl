<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" indent="yes"></xsl:output>
    
    
    <xsl:variable name="spanishLetter" as="document-node()" select="doc('../xml/es_PS4000-TEIP5.xml')"/>
    
    <xsl:variable name="wordCount" as="xs:integer" select="//w => count()"/>
    
    <xsl:variable name="countTypes" as="xs:integer">
        <xsl:value-of select="//w/@pos ! normalize-space() => distinct-values() => count()"/>
    </xsl:variable>
    
   <xsl:variable name="wordTypes" as="xs:string+" select="//w/@pos ! normalize-space() => distinct-values()"/>
    
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Proportions of Word Types in the Spanish Letter</title>
                
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">
                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(drawChart);
                    
                    function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                    ['Word type', 'Percentage'],
                    
                    <xsl:for-each select="$wordTypes">
                        <xsl:sort select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
                        
                        <xsl:variable name="currentCount" as="xs:integer">
                            <xsl:value-of select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
                        </xsl:variable>
                        
                        <xsl:variable name="percentage" as="xs:double">
                            <xsl:value-of select="$currentCount div $wordCount * 100"/>
                        </xsl:variable>
                        <xsl:text>['</xsl:text><xsl:value-of select="current()"/><xsl:text>',</xsl:text><xsl:value-of select="$percentage ! round(., 2)"/><xsl:text>],</xsl:text>
                    </xsl:for-each>
                    
                    
                    ]);
                    
                    var options = {
                    title: 'Proportions of Word Types in the Spanish Letter', <!-- MS: add the title -->
                    
                    
                    };
                    
                    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                    chart.draw(data, options);
                    }
                </script>
            </head>
            <body>
                <!-- MS: define the display area -->
                <div id="piechart" style="width: 900px; height: 500px;"></div>
            </body>
        </html>
    </xsl:template>
   
</xsl:stylesheet>