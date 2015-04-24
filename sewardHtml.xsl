<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
        
      
    
    <xsl:output indent="yes" encoding="utf-8" method="html"/>
        

    <xsl:template match="/">
     <script type="text/javascript" src="http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/jqueryui.js" ></script>
     <script type="text/javascript" src="http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/jquery.mousewheel.min.js" ></script>
     <script type="text/javascript" src="http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/jquery.iviewer.js" ></script>
     <script type="text/javascript"> 
         jQuery.noConflict();
         jQuery(document).ready(function(){
         var iv1 = jQuery("#viewer").iviewer({
         src: "http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/18310102FMS_WHS1_p1.jpg",
         update_on_resize: true,
         zoom_animation: true,
         mousewheel: true,
         onMouseMove: function(ev, coords) { },
         onStartDrag: function(ev, coords) { return true; }, //this image will be dragged
         onDrag: function(ev, coords) { }
         });
         
         jQuery("#in").click(function(){ iv1.iviewer('zoom_by', 1); });
         jQuery("#out").click(function(){ iv1.iviewer('zoom_by', -1); });
         jQuery("#fit").click(function(){ iv1.iviewer('fit'); });
         jQuery("#orig").click(function(){ iv1.iviewer('set_zoom', 100); });
         jQuery("#update").click(function(){ iv1.iviewer('update_container_info'); });
         jQuery("#page1").click(function()
            {
            iv1.iviewer('loadImage', "http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/18310102FMS_WHS1_p1.jpg");
            return false;
            });
         jQuery("#page2").click(function()
            {
            iv1.iviewer('loadImage', "http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/18310102FMS_WHS1_p2.jpg");
            return false;
            });
         jQuery("#page3").click(function()
            {
            iv1.iviewer('loadImage', "http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/18310102FMS_WHS1_p3.jpg");
            return false;
            });
         jQuery("#page4").click(function()
            {
            iv1.iviewer('loadImage', "http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/test/18310102FMS_WHS1_p4.jpg");
            return false;
            });
         
         var iv2 = jQuery("#viewer2").iviewer(
         {
         src: "test_image2.jpg"
         });
         });
     </script>
     
        <link rel="stylesheet" href="http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/iviewer/jquery.iviewer.css"/>
        <div class="sewardViewer">
        
            
            <div id="viewer" class="viewer"></div>
        
        
        </div>
     <script type="text/javascript" src="http://rcldrupaldev.lib.rochester.edu:89/sites/all/modules/xsl_formatter/xsl/scripts/sewardTools.js"/>
        <div class="sewardToolbox">
            <h4>Reading Tools</h4>
            <label id="headerToggle">Show Header</label><br />
            <label id="noteToggle">Hide Notes</label><br />
            <label id="letterExpand">Expand Letter</label>
            
        </div>
        
            <div class="hiddenHeader">
                <xsl:apply-templates select="//tei:teiHeader"/>
            </div>
           
                    <xsl:apply-templates select="//tei:text/tei:body/tei:div"/>
               
                
    </xsl:template>

    <xsl:template match="tei:text/tei:body/tei:div/tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
       
    </xsl:template>
        <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:lb">
           
                <xsl:apply-templates/>
            <br />
        </xsl:template>
        <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:note">
            <span class="note">note</span>
                <div class="hiddenDiv">
                   <xsl:apply-templates/>
                </div>
        </xsl:template>
        <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:hi | @strikethrough">
            <span class="strikethrough">
                <xsl:apply-templates/>
            </span>
        </xsl:template>
    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:pb[@n=1]" >
        <a href="#" id="page1">Page 1
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:pb[@n=2]" >
        <a href="#" id="page2">Page 2
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:pb[@n=3]" >
        <a href="#" id="page3">Page 3
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:pb[@n=4]" >
        <a href="#" id="page4">Page 4
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    <xsl:template match="//tei:titleStmt/tei:title">
        <h2 class="title"><strong>
        <xsl:apply-templates/>
        </strong></h2>
    </xsl:template>
    <xsl:template match="//tei:titleStmt/tei:respStmt/tei:persName">
        <h4 class="transcriber"><strong>Transcriber:</strong><xsl:value-of select="@ref"/>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="//tei:publicationStmt/tei:distributor">
        <h4 class="distributor"><strong>Distributor:</strong>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution">
        <h4 class="institution"><strong>Institution:</strong>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository">
        <h4 class="repository"><strong>Repository:</strong> 
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="//tei:sourceDesc/tei:msDesc/tei:history/tei:origin/tei:date">
        <h4 class="date"><strong>Date:</strong> <xsl:value-of select="@when"/>
            <xsl:apply-templates/>
        </h4>
    </xsl:template>
    <xsl:template match="//tei:encodingDesc">
        <div class="encodingDesc">
            <xsl:apply-templates/>
        </div>
       
    </xsl:template>
    
    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:persName">
       
        <xsl:apply-templates/>
        <span class="note">note</span>
        <div class="hiddenDiv">
            <xsl:variable name="person" select="tei:text/tei:body/tei:div/tei:p/tei:persName | @xml:id"/>
            <strong>Name:</strong><xsl:text>&#160;</xsl:text><xsl:value-of select = "document('http://seward.lib.rochester.edu/tei/persons.xml')//tei:text/tei:body/tei:div/tei:listPerson/tei:person[@xml:id = $person]/tei:persName/tei:forename[@type = 'first']"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select = "document('http://seward.lib.rochester.edu/tei/persons.xml')//tei:text/tei:body/tei:div/tei:listPerson/tei:person[@xml:id = $person]/tei:persName/tei:surname[@type = 'last' or 'maiden']"></xsl:value-of>
            <xsl:text>&#xa;</xsl:text>
            <strong>Birth:</strong><xsl:text>&#160;</xsl:text><xsl:value-of select = "document('http://seward.lib.rochester.edu/tei/persons.xml')//tei:text/tei:body/tei:div/tei:listPerson/tei:person[@xml:id = $person]/tei:birth"></xsl:value-of>
            <xsl:text>&#xa;</xsl:text>
            <strong>Death:</strong><xsl:text>&#160;</xsl:text><xsl:value-of select = "document('http://seward.lib.rochester.edu/tei/persons.xml')//tei:text/tei:body/tei:div/tei:listPerson/tei:person[@xml:id = $person]/tei:death"></xsl:value-of>
        </div>
    </xsl:template>
    
    
    <!--<xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:hi | @underline">
        <span class="underline">
            <xsl:apply-templates/>
        </span>
    </xsl:template>-->
    
        
    
    </xsl:stylesheet>
