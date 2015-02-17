<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">


    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="/*">
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/tei/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
        <TEI xmlns="http://www.tei-c.org/ns/1.0" xmlns:html="http://www.w3.org/1999/xhtml"
            xmlns:tei="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>List of person in May Bragdon Diaries</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>May Bragdon Diaries Project</p>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl>
                            <title>May Bragdon</title>
                            <author>May Bragdon Diaries</author>
                            <date/>
                            <orgName>University of Rochester Department of Rare Books and Special
                                Collections</orgName>
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
                        <listPerson>
                            <xsl:apply-templates/>
                        </listPerson>
                    </div>
                </body>
            </text>
        </TEI>

    </xsl:template>

    <!-- title -->
    <xsl:template match="root/row">

        <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="person">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="XML_ID"/>
            </xsl:attribute>
            <xsl:element namespace="http://www.tei-c.org/ns/1.0" name="persName">

                <xsl:if test="normalize-space(FORENAME) != ''">
                    <xsl:element name="forename" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">first</xsl:attribute>
                        <xsl:value-of select="normalize-space(FORENAME)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="normalize-space(MIDDLE) != ''">
                    <xsl:element name="forename" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">middle</xsl:attribute>
                        <xsl:value-of select="normalize-space(MIDDLE)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="normalize-space(SURNAME) != ''">
                    <xsl:element name="surname" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">last</xsl:attribute>
                        <xsl:value-of select="normalize-space(SURNAME)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:if test="normalize-space(MAIDEN_NAME) != ''">
                    <xsl:element name="surname" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="type">maiden</xsl:attribute>
                        <xsl:value-of select="normalize-space(MAIDEN_NAME)"/>
                    </xsl:element>
                </xsl:if>
                <xsl:for-each select="AKA">
                    <xsl:if test="normalize-space(current()) != ''">
                        <xsl:element name="addName" namespace="http://www.tei-c.org/ns/1.0">
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
            <xsl:if test="normalize-space(DOB) != ''">
                <xsl:element name="birth" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="normalize-space(DOB)"/>
                    </xsl:attribute>
                    <xsl:if test="normalize-space(DOB-CONFIDENCE) != ''">
                        <xsl:attribute name="precision">
                            <xsl:value-of select="normalize-space(DOB-CONFIDENCE)"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="normalize-space(DOB-CONFIDENCE) = 'unknown'">c. </xsl:if><xsl:value-of select="normalize-space(DOB)"/>
                </xsl:element>
            </xsl:if>
            <xsl:if test="normalize-space(DOD) != ''">
                <xsl:element name="death" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="when">
                        <xsl:value-of select="normalize-space(DOD)"/>
                    </xsl:attribute>
                    <xsl:if test="normalize-space(DOD-CONFIDENCE) != ''">
                        <xsl:attribute name="precision">
                            <xsl:value-of select="normalize-space(DOD-CONFIDENCE)"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="normalize-space(DOD-CONFIDENCE) = 'unknown'">c. </xsl:if><xsl:value-of select="normalize-space(DOD)"/>
                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>



    <!-- Don't ouput everything only selected nodes -->
    <xsl:template match="text()"/>
</xsl:stylesheet>
