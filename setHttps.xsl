<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ds="urn:jboss:domain:datasources:4.0"
                xmlns:server="urn:jboss:domain:4.0"
                xmlns:undertow="urn:jboss:domain:undertow:3.0">

    <xsl:output method="xml" indent="yes"/>

   
    <xsl:template match="//undertow:subsystem/undertow:server/undertow:http-listener">
        <xsl:copy>
             <xsl:apply-templates select="node()|@*"/>
             <xsl:attribute name="proxy-address-forwarding">true</xsl:attribute>
             <xsl:attribute name="redirect-socket">proxy-https</xsl:attribute>
        </xsl:copy>
    </xsl:template>

     <xsl:template match="//server:socket-binding-group">
        <xsl:copy>
             <xsl:apply-templates select="node()|@*"/>
             <server:socket-binding name="proxy-https" port="443"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>