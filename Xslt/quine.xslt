<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <xsl:variable name="itself">
      <stylesheet version="1.0">
        <output method="xml"/>
        <template match="/">
          <variable name="itself"/>
          <apply-templates xmlns:exslt="http://exslt.org/common" select="exslt:node-set($itself)/*" exslt:dummy="">
            <with-param name="itself" select="$itself"></with-param>
          </apply-templates>
        </template>
        <template match="*">
          <param name="itself"/>
          <element namespace="http://www.w3.org/1999/XSL/Transform" name="">
            <apply-templates select="* | @* | text()">
              <with-param name="itself" select="$itself"/>
            </apply-templates>
            <if test="name() = 'variable' and @name = 'itself'">
              <copy-of select="$itself"/>
            </if>
          </element>
        </template>
        <template match="element[@namespace = 'http://www.w3.org/1999/XSL/Transform']/@name">
          <attribute name="name">xsl:{local-name()}</attribute>
        </template>
        <template match="text() | @*">
          <copy-of select="."/>
        </template>
      </stylesheet>
    </xsl:variable>
    <xsl:apply-templates xmlns:exslt="http://exslt.org/common" select="exslt:node-set($itself)/*" exslt:dummy="">
      <xsl:with-param name="itself" select="$itself"/>
    </xsl:apply-templates>
  </xsl:template>
  <xsl:template match="*">
    <xsl:param name="itself"/>
    <xsl:element namespace="http://www.w3.org/1999/XSL/Transform" name="xsl:{local-name()}">
      <xsl:apply-templates select="* | @* | text()">
        <xsl:with-param name="itself" select="$itself"/>
      </xsl:apply-templates>
      <xsl:if test="name() = 'variable' and @name = 'itself'">
        <xsl:copy-of select="$itself"/>
      </xsl:if>
    </xsl:element>
  </xsl:template>
  <xsl:template match="element[@namespace = 'http://www.w3.org/1999/XSL/Transform']/@name">
    <xsl:attribute name="name">xsl:{local-name()}</xsl:attribute>
  </xsl:template>
  <xsl:template match="text() | @*">
    <xsl:copy-of select="."/>
  </xsl:template>
</xsl:stylesheet>
