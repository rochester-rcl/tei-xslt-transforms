<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/*">
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/tei/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
        <TEI xmlns="http://www.tei-c.org/ns/1.0"
            xmlns:html="http://www.w3.org/1999/xhtml"
            xmlns:tei="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>List of places in May Bragdon Diaries</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>May Bragdon Diaries Project</p>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl>
                            <title>May Bragdon</title>
                            <author>May Bragdon Diaries</author>
                            <date></date>
                            <orgName>University of Rochester Department of Rare Books and Special Collections</orgName>
                            <address>
                               <addrLine>Rush Rhees Library</addrLine>
                               <addrLine>University of Rochester</addrLine>
                               <addrLine>Rochester, NY 14627-0055</addrLine>
                            </address>
                        </bibl>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <div>
                        <listPlace>
                            <xsl:apply-templates/>
                        </listPlace>
                    </div>
                </body>
            </text>
        </TEI>
        
    </xsl:template>
    
    <!-- title -->    
    <xsl:template match="root/row">
        
        <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="place">
            <xsl:attribute name="xml:id"><xsl:value-of select="XML_ID"/></xsl:attribute>
            <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="placeName">
                <xsl:element name="name" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:value-of select="normalize-space(PLACE)"/>
                </xsl:element>
                
                <xsl:if test="normalize-space(STREET) != ''">
                    <xsl:element name="placeName" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">street</xsl:attribute>
                        <xsl:value-of select="normalize-space(STREET)"/>
                    </xsl:element>
                </xsl:if>
                
                <xsl:if test="normalize-space(CITY) != ''">
                    <xsl:element name="settlement" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">city</xsl:attribute>
                        <xsl:value-of select="normalize-space(CITY)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="normalize-space(REGION) != ''">
                    <xsl:element name="region" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">state</xsl:attribute>
                        <xsl:value-of select="normalize-space(REGION)"/>
                    </xsl:element>
                </xsl:if>
                
                <xsl:if test="normalize-space(GIS) != ''">
                    <xsl:element name="geo" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:value-of select="normalize-space(GIS)"/>
                    </xsl:element>
                </xsl:if>
            
                <xsl:for-each select="AKA">
                    <xsl:if test="normalize-space(current()) != ''">
                        <xsl:element name="name" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:attribute name="type">alternate</xsl:attribute>
                            <xsl:value-of select="normalize-space(current())"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:for-each>
            
           
            
                <xsl:if test="normalize-space(NOTES) != ''">
                    <xsl:element name="note" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:value-of select="normalize-space(NOTES)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    
    
    
    <!-- Don't ouput everything only selected nodes -->
    <xsl:template match="text()"/>
</xsl:stylesheet>