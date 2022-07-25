<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- ebb: Let's plot a side-by-side bar plot featuring a count of the number of distinct references to persons in each letter that contains them. 
        We need to fimd out our maximum values to help design the plot.
        We also need to know that by default, SVG plots 0,0 at the top left of a viewable screen.
        
        We typically do some work in setting up an XSLT to SVG to shift the coordinate space to move 0,0 down, and 
        plot *up* from zero by using negative Y values. 
        We'll multiply all Y values by a $ySpacer variable that we set as a negative number. That lets us work
        with the count() and other numerical calculations we perform with XPath and just plot them in negative coordinate space. 
    -->  
    
    <!--We modify the XML collection variable here in order to select only the files that have encoded persName elements. -->
    <xsl:variable name="personLetters" as="document-node()+" select="collection('../xml/?select=*.xml')[descendant::persName]"/> 
    
    <!-- Create xSpacer and ySpacer variables just for scaling the plot. We typically want values in the hundreds or thousands. -->
    <xsl:variable name="xSpacer" as="xs:integer" select="500"/>
    <xsl:variable name="ySpacer" as="xs:integer" select="-5"/>
    
    <xsl:variable name="maxPersonCount">
       <xsl:variable name="allCounts" as="xs:integer+"> 
           <xsl:for-each select="$personLetters">
            <xsl:value-of select="count(descendant::persName)"/>
        </xsl:for-each>
       </xsl:variable>
        <xsl:value-of select="$allCounts => max()"/>
    </xsl:variable>
    
    
    
    <xsl:template match="/">
        <svg viewBox="0 0 {count($personLetters) * $xSpacer}  {$maxPersonCount * 8}">
          <!-- With these values in @viewBox, we create a canvas that stretches from 0 0 to the max X and Y coordinates. 
          NOTE: if we double the max X and max Y values here, we'll proportionally **reduce** the overall scale of the plot. 
          -->
        <g transform="translate(10, {$maxPersonCount * 6})"> 
         <!-- <g> just groups elements inside together. 
             transform="translate()" cpmverts 0,0 (the top left of the screen) 
         down to the bottom of the viewable canvas.) The multipliers are sort of ballpark estimates 
         until we get the shapes to appear on teh screen.  -->
              
              
         <!--X axis:  a horizontal "x axis" line marks the newly translated 0,0 point out to the max X value. 
         We're using an Attribute Value Template to use XPath to calculate the attribute value. 
         -->
              
              <line x1="0" y1="0" x2="{count($personLetters) * $xSpacer}" y2="0" stroke="black" stroke-width="4"/>
        
            <!-- Y axis: This time X does not vary and y stretches upward from zero to its negative max value. -->
            
            <line x1="0" y1="0" x2="0" y2="{$ySpacer * $maxPersonCount}" stroke="black" stroke-width="4"/>
        
        <g>
            <!--ebb: Inside this <g>, we'll plot labels and bars going up the Y axis, using xsl:for-each. 
            I like to mkae rectangles using the line element and setting a stroke-width to make it thick.
            -->
            
         
            
            
        </g>
        
            
         </g>
          
          
      </svg>
    </xsl:template>
    
</xsl:stylesheet>