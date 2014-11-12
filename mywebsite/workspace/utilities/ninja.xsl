<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
Name: HTML Manipulation
Version: 1.0
Author: Allen Chang <allen@chaoticpattern.com>
URL: http://symphony21.com/downloads/xslt/file/20035/

Description:
This is the starter utility (dubbed "The Ninja Technique") in which all awesome HTML manipulation works off.
Be sure to check out http://chaoticpattern.com/article/manipulating-html-in-xml/ for more info.

Usage:
1. Invoke the HTML output using: <xsl:apply-templates select="path/to/your/body/*" mode="html"/>.
2. Write your own overriding matching templates to manipulate the HTML.
-->

<xsl:template match="*" mode="html">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" mode="html"/>
	</xsl:element>
</xsl:template>

<xsl:template match="@*" mode="html">
	<xsl:attribute name="{name()}">
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="h1 | h2 | h3 | h4" mode="html" priority="1">
	<xsl:param name="level" select="1" />
	
	<xsl:element name="h{substring-after(name(), 'h') + $level}">
		<xsl:apply-templates select="* | @* | text()" mode="html" />
	</xsl:element>
</xsl:template>

</xsl:stylesheet>