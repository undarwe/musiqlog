<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xspf="http://xspf.org/ns/0/"
    exclude-result-prefixes=" xspf "
    version="1.0">

<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

<xsl:template match="xspf:playlist">
    <table class="b-player">
    <tr>
        <th>
            <xsl:apply-templates select="xspf:location"/>
        </th>
        <td>
            <xsl:apply-templates select="xspf:title"/>
            <xsl:apply-templates select="xspf:trackList"/>
        </td>
    </tr>
    </table>
</xsl:template>

<xsl:template match="xspf:location">
    <embed src="http://webjay.org/flash/xspf_player" width="300" height="40" wmode="transparent" flashVars="playlist_url={.}&amp;rounded_corner=1&amp;skin_color_1=-145,-89,-4,5&amp;skin_color_2=-141,20,0,0" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer"/>
</xsl:template>

<xsl:template match="xspf:title">
    <h3><xsl:value-of select="."/></h3>
</xsl:template>

<xsl:template match="xspf:trackList">
    <ul>
        <xsl:apply-templates select="xspf:track"/>
    </ul>
</xsl:template>

<xsl:template match="xspf:track">
    <li>
        <span><xsl:value-of select="xspf:trackNum"/>.</span>
        <xsl:text> </xsl:text>
        <xsl:value-of select="xspf:title"/>
    </li>
</xsl:template>

</xsl:stylesheet>

