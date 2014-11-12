<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/format-date.xsl"/>
<xsl:import href="../utilities/ninja.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<h1><xsl:value-of select="data/current-news/entry/title"/></h1>
	<p>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="data/current-news/entry/date"/>
			<xsl:with-param name="format" select="'%d;%ds; %m+;, %y+;'"/>
		</xsl:call-template>
	</p>
	<p><xsl:value-of select="data/current-news/entry/author/item"/></p>

	<xsl:apply-templates select="data/current-news/entry/text/*" mode="html"/>

	<ul>
		<xsl:for-each select="data/news-images/entry">
			<li>
				<img src="{//data/params/root}/image/1/500/0{image/@path}/{image/filename}" alt=""/>
				<br/>
				<xsl:value-of select="caption"/>
				<br/>
				<xsl:value-of select="credits"/>
				<hr/>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

</xsl:stylesheet>
