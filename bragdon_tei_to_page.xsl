<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:mods="http://www.loc.gov/mods/v3"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/*">
        <mods xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.loc.gov/mods/v3" xmlns:mods="http://www.loc.gov/mods/v3" version="3.5" xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
            <xsl:apply-templates/>
            <name type="personal">
                <namePart>Bragdon, May, 1865-1947</namePart>
                <role>
                    <roleTerm type="text" authority="marcrelator">Creator</roleTerm>
                </role>
            </name>
            <typeOfResource>text</typeOfResource>
            <typeOfResource>still image</typeOfResource>
            <typeOfResource>mixed material</typeOfResource>
            <language>
                <languageTerm type="code" authority="iso639-2b">eng</languageTerm>
                <languageTerm type="text">English</languageTerm>
            </language>
            
            <genre authority="gmgpc">Diaries</genre>
            <relatedItem displayLabel="Collection" type="host">
                <titleInfo>
                    <title>Bragdon Family Papers</title>
                </titleInfo>
            </relatedItem>
            <location>
                <physicalLocation>University of Rochester, Rare Books, Special Collections &amp; Preservation Department</physicalLocation>
            </location>
            <accessCondition>This image may be protected by the U.S. Copyright Law (Title 17, U.S.C.). It is displayed here only for the purposes of research. The written permission of the copyright owners may be required for distribution or reproduction beyond that allowed by fair use. All responsibility for obtaining permissions, and for any use rests exclusively with the user. Also see: http://www.library.rochester.edu/copyright
            </accessCondition>
            <recordInfo>
                <recordContentSource>University of Rochester, River Campus Libraries</recordContentSource>
                <languageOfCataloging>
                    <languageTerm type="code" authority="iso639-2b">eng</languageTerm>
                </languageOfCataloging>
            </recordInfo>
        </mods>   
    </xsl:template>

    <!-- title -->    
    <xsl:template match="teiHeader/fileDesc/titleStmt">
        <titleInfo xmlns="http://www.loc.gov/mods/v3">
            <xsl:element name="title" namespace="http://www.loc.gov/mods/v3"><xsl:value-of select="title"/></xsl:element>
        </titleInfo>
    </xsl:template>
    
  
    
    <!-- Date when diary was created -->
    <xsl:template match="text/body/head/date">
        <xsl:element namespace="http://www.loc.gov/mods/v3" name="originInfo">
            <xsl:element name="dateCreated" namespace="http://www.loc.gov/mods/v3">
                <xsl:attribute name="encoding">w3cdtf</xsl:attribute>
                <xsl:value-of select="@when"/></xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- physical description -->
    <xsl:template match="text/body/head/pb">
        <physicalDescription xmlns="http://www.loc.gov/mods/v3"> 
            <form authority="marcform">electronic</form> 
            <internetMediaType>image/tiff</internetMediaType> 
            <internetMediaType>text/xml</internetMediaType>
            <xsl:element name="extent">p. <xsl:value-of select="@n"/></xsl:element>
            
            <digitalOrigin>reformatted digital</digitalOrigin> 
        </physicalDescription>
    </xsl:template>
    
    <xsl:template match="sourceDesc">
        <relatedItem displayLabel="Volume" type="host" xmlns="http://www.loc.gov/mods/v3">
            <titleInfo>
                <xsl:element name="title" namespace="http://www.loc.gov/mods/v3"><xsl:value-of select="bibl/title"/></xsl:element>
            </titleInfo>
            
            <identifier type="local">
                <xsl:value-of select="msDesc/msIdentifier/idno"/>
            </identifier>
        </relatedItem>
    </xsl:template>
    
    <!-- Don't ouput everything only selected nodes -->
    <xsl:template match="text()"/>
</xsl:stylesheet>