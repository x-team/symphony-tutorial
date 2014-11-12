<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
  omit-xml-declaration="yes"
  encoding="UTF-8"
  indent="yes" />

<xsl:template match="/">
  <ul>
    <xsl:for-each select="data/list-news/entry">
      <li>
        <a href="{/data/params/root}/news/{title/@handle}"><xsl:value-of select="title"/></a>
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>