<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <!-- Constants 
        {-->
  <xsl:variable name="stringEmpty" select="''" />
  <!-- Digits-->
  <xsl:variable name="Zero" select="0" />
  <xsl:variable name="One" select="1" />
  <xsl:variable name="Two" select="2" />
  <xsl:variable name="Three" select="3" />
  <xsl:variable name="Four" select="4" />
  <xsl:variable name="Five" select="5" />
  <xsl:variable name="Six" select="6" />
  <xsl:variable name="Eight" select="8" />
  <xsl:variable name="Ten" select="10" />
  <xsl:variable name="Fifteen" select="15" />
  <xsl:variable name="OneHundred" select="1000" />
  <!-- Character constants -->
  <xsl:variable name="PointCharacter" select="'.'" />
  <xsl:variable name="VerticalLineCharacter" select="'|'" />
  <xsl:variable name="SpaceCharacter" select="' '" />
  <xsl:variable name="NewLineCharacter" select="'&#10;'" />
  <xsl:variable name="HyphenCharacter" select="'-'" />
  <!-- Colors -->
  <xsl:variable name="Black" select="'black'" />
  <!-- Text-decoration values -->
  <xsl:variable name="None" select="'none'" />
  <xsl:variable name="Underline" select="underline" />
  <!-- Font constants -->
  <xsl:variable name="Normal" select="'normal'" />
  <xsl:variable name="Bold" select="'bold'" />
  <xsl:variable name="Italic" select="'italic'" />
  <!-- Border width styles -->
  <xsl:variable name="BorderWidthStyleNone" select="'none'" />
  <xsl:variable name="BorderWidthStyleSolid" select="'solid'" />
  <!-- Attributes names-->
  <xsl:variable name="AttributeNameWidth" select="'width'" />
  <xsl:variable name="AtributeNameMinWidth" select="'min-width'" />
  <xsl:variable name="AttributeNameMaxWidth" select="'max-width'" />
  <xsl:variable name="AttributeNameColumnWidth" select="'column-width'" />
  <xsl:variable name="AttributeNameMarginTop" select="'top'" />
  <xsl:variable name="AttributeNamePaddingTop" select="'padding-top'" />
  <xsl:variable name="AttributeNameBorderWidth" select="'border-width'" />
  <xsl:variable name="AttributeNameBorder" select="'border'" />
  <xsl:variable name="AttributeNameInlineProgressionDimensionMaximum" select="'inline-progression-dimension.maximum'" />
  <xsl:variable name="AttributeNameTextAlign" select="'text-align'" />
  <!-- Edges names -->
  <xsl:variable name="EdgeBefore" select="'before'" />
  <xsl:variable name="EdgeEnd" select="'end'" />
  <xsl:variable name="EdgeAfter" select="'after'" />
  <xsl:variable name="EdgeStart" select="'start'" />
  <!-- Microsoft Receipt OPOS Aligns -->
  <xsl:variable name="MicrosoftReceiptOPOSAlignLTTilda" select="'&lt;~'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignGTTilda" select="'&gt;~'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignLT" select="'&lt;'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignGT" select="'&gt;'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignUpTilda" select="'^~'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignUp" select="'^'" />
  <!-- XSL-FO 1.1 Aligns -->
  <!-- * Vertical -->
  <xsl:variable name="XSLFO1_1VerticalAlignStart" select="'start'" />
  <xsl:variable name="XSLFO1_1VerticalAlignEnd" select="'end'" />
  <!-- * Horizonatal-->
  <xsl:variable name="XSLFO1_1HorizontalAlignLeft" select="'left'" />
  <xsl:variable name="XSLFO1_1HorizontalAlignCenter" select="'center'" />
  <xsl:variable name="XSLFO1_1HorizontalAlignRight" select="'right'" />

  <!-- Units Abbreviations -->
  <xsl:variable name="Inch" select="'in'" />
  <xsl:variable name="Pixels" select="'px'" />
  <xsl:variable name="Points" select="'pt'" />
  <xsl:variable name="Millimeters" select="'mm'" />
  <!-- Colors-->
  <xsl:variable name="ColorYellow" select="'yellow'" />
  <!--  } -->
  <!-- Global settings 
        {-->
  <xsl:variable name="DimmensionsUnitsAbbreviation" select="$Inch" />
  <xsl:variable name="TableBorderDimmensionsUnitsAbbreviation" select="$Millimeters" />
  <xsl:variable name="CellBorderDimmensionsUnitsAbbreviation" select="$Millimeters" />
  <xsl:variable name="FontUnitsAbbreviation" select="$Points" />
  <xsl:variable name="PageNumberTemplate" select="'\p of \t'" />
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  <xsl:variable name="continuePageContent" select="'Continued on next page...'" />
  <xsl:variable name="totalPage" select="1"/>
  <!--  } -->
  <!-- Elements names {-->
  <xsl:variable name="DocumentElementName" select="'DOCUMENT'" />
  <xsl:variable name="SubElementName" select="'SUB'" />
  <!-- }-->
  <!-- SUBs names
  {-->
  <xsl:variable name="SUBDrawContent" select="'DrawContent'" />
  <!-- } -->
  <xsl:template match="XML">
    <html>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <head>
        <style>
          <xsl:variable name="fontName" select="''" />
          html {
          max-width:11.69in; max-height:11.69in; margin-top:0.197in; margin-right:0.319in; margin-bottom:0.319in; margin-left:0.197in; background:white;
          <xsl:value-of select="'font-family:'"/>
          <xsl:copy-of select="//XML/FONT[@name=$fontName]/NAME/text()"/>
          <xsl:value-of select="'; '"/>

          <xsl:value-of select="'font-size:'"/>
          <xsl:copy-of select="//XML/FONT[@name=$fontName]/SIZE/text()"/>
          <xsl:copy-of select="$FontUnitsAbbreviation"/>
          <xsl:value-of select="'; '"/>

          <xsl:value-of select="'font-weight:'"/>
          <xsl:choose>
            <xsl:when test="translate(//XML/FONT[@name=$fontName]/BOLD/text(), $smallcase, $uppercase)='TRUE'">
              <xsl:copy-of select="$Bold"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy-of select="$Normal"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:value-of select="'; '"/>

          <xsl:value-of select="'font-style:'"/>
          <xsl:choose>
            <xsl:when test="translate(//XML/FONT[@name=$fontName]/ITALIC/text(), $smallcase, $uppercase)='TRUE'">
              <xsl:copy-of select="$Italic" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:copy-of select="$Normal"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:value-of select="'; '"/>
          }

          table.noBorder { border: none; border-collapse: collapse; }

          td.all { border: 1px solid black; }
          td.borderTop { border-top: 1px solid black; }
          td.borderBottom { border-bottom: 1px solid black; }
          td.borderLeft { border-left: 1px solid black; }
          td.borderRight { border-right: 1px solid black; }
          td.borderLeftTop { border-left: 1px solid black; border-top: 1px solid black; }
          td.borderLeftBottom { border-left: 1px solid black; border-bottom: 1px solid black; }
          td.borderRightTop { border-right: 1px solid black; border-top: 1px solid black; }
          td.borderRightBottom { border-right: 1px solid black; border-bottom: 1px solid black; }
          td.borderLeftRight { border-left: 1px solid black; border-right: 1px solid black;}
          td.borderLeftRightTop { border-left: 1px solid black; border-right: 1px solid black; border-top: 1px solid black; }
          td.borderLeftRightBottom { border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; }
          td.borderLeftTopBottom { border-left: 1px solid black; border-bottom: 1px solid black; border-top: 1px solid black; }
          td.borderRightTopBottom { border-right: 1px solid black; border-bottom: 1px solid black; border-top: 1px solid black; }
          td.borderTopBottom { border-top: 1px solid black; border-bottom: 1px solid black; }
        </style>
      </head>

      <!--<fo:layout-master-set>
        <fo:simple-page-master master-name="AnyPage"
          page-width="8.27in"
          page-height="11.69in"
          margin-top="0.197in"
          margin-bottom="0.319in"
          margin-left="0.197in"
          margin-right="0.319in" background="white">
          <fo:region-body margin-top="3.0in"
                          margin-right="0in"
                          margin-bottom="4.0in"
                          margin-left="0in"
                          border="solid 1px red" />
          <fo:region-before extent="3.3in" />
          <fo:region-after extent="5in" />
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="AnyPage">
        <fo:static-content flow-name="xsl-region-before">
          <div padding-before="0in" padding-end="0.319in" padding-after="0in" padding-start="0.197in">
            <fo:retrieve-marker retrieve-class-name="DrawHeader"
                                retrieve-boundary="page"
                                retrieve-position="first-including-carryover"/>
          </div>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <div padding-before="0.394in" padding-end="0.319in" padding-after="0in" padding-start="0.197in">
            <fo:retrieve-marker retrieve-class-name="DrawFooter"
                                retrieve-boundary="page-sequence"
                                retrieve-position="last-ending-within-page" />
          </div>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <div style="padding-before:0.394in; padding-end:0in; padding-after:0in; padding-start:0in">
            <xsl:call-template name="CreateMainTable"></xsl:call-template>
          </div>
          <div id="lastPageEmptyBlock" />
        </fo:flow>
      </fo:page-sequence>-->
      <body>
        <div style="padding-top:0.394in; padding-right:0in; padding-bottom:0in; padding-left:0in">
          <xsl:call-template name="CreateMainTable"></xsl:call-template>
        </div>
        <div id="lastPageEmptyBlock" />
      </body>
    </html>
  </xsl:template>

  <xsl:template name="CreateMainTable">
    <table style="table-layout:fixed; text-align:center; inline-progression-dimension.maximum:auto;">
      <!--<fo:table-column text-align="center" column-width="7.48in"/>-->
      <tr>
        <td>
          <xsl:apply-templates select="SUB[@name='DrawHeader']" />
        </td>
      </tr>
      <tr>
        <td>
          <div>
            <xsl:choose>
              <xsl:when test="count(DOCUMENT/TABLE) = 1">
                <xsl:apply-templates select="//DOCUMENT/TABLE[1]" mode="MainTable" />
              </xsl:when>
              <xsl:when test="count(DOCUMENT/TABLE) = 2">
                <xsl:apply-templates select="//DOCUMENT/TABLE[1]" mode="MainTable" />
               <xsl:apply-templates select="//DOCUMENT/TABLE[2]" mode="TABLE" />
              </xsl:when>
              <xsl:when test="count(DOCUMENT/CALL[@name = 'DrawContent']) = 1">
                <xsl:apply-templates select="//SUB[@name = 'DrawContent'][1]/TABLE[1]" mode="MainTable" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:apply-templates select="//DOCUMENT/CALL" />
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <div>
            <!--<fo:marker marker-class-name="DrawFooter">-->
            <xsl:apply-templates select="SUB[@name='DrawLastFooter']" />
            <!--</fo:marker>-->
          </div>
        </td>
      </tr>
      <tr>

        <td style="padding-top:0.787in; padding-right:0in; padding-bottom:0in; padding-left:0in" >
          <xsl:apply-templates select="SUB[@name='DrawFooter']" />
        </td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="TABLE" mode="MainTable">
    <table>
      <!-- height="210mm" -->
      <xsl:apply-templates select="." mode="Content" />
    </table>
  </xsl:template>

  <xsl:template match="TABLE">
    <div style="padding-bottom:2mm">
      <table>
        <xsl:apply-templates select="." mode="Content" />
      </table>
    </div>
  </xsl:template>

  <xsl:template match="TABLE" mode="Content">

    <xsl:variable name="tableWidth">
      <xsl:call-template name="SumFloats">
        <xsl:with-param name="list" select="COLUMNHEADER/WIDTH/text()" />
        <xsl:with-param name="accumulator" select="$One" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="fontName" select="FONT/text()" />
    <xsl:variable name="top" select="TOP/text()" />
    <xsl:variable name="borderWidth" select="BORDER/text()" />

    <xsl:attribute name="style">
      <xsl:value-of select="'table-layout:fixed; clear:both; '" />

      <xsl:if test="$tableWidth != stringEmpty">
        <xsl:call-template name="CreateWidthAttribute">
          <xsl:with-param name="attributeName" select="$AttributeNameInlineProgressionDimensionMaximum" />
          <xsl:with-param name="attributeValue" select="format-number($tableWidth, '##0.000')" />
          <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$fontName != $stringEmpty">
        <xsl:value-of select="'font-family:'"/>
        <xsl:copy-of select="//XML/FONT[@name=$fontName]/NAME/text()"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-size:'"/>
        <xsl:copy-of select="//XML/FONT[@name=$fontName]/SIZE/text()"/>
        <xsl:copy-of select="$FontUnitsAbbreviation"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-weight:'"/>
        <xsl:choose>
          <xsl:when test="translate(//XML/FONT[@name=$fontName]/BOLD/text(), $smallcase, $uppercase)='TRUE'">
            <xsl:copy-of select="$Bold"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-style:'"/>
        <xsl:choose>
          <xsl:when test="translate(//XML/FONT[@name=$fontName]/ITALIC/text(), $smallcase, $uppercase)='TRUE'">
            <xsl:copy-of select="$Italic" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>
      </xsl:if>

      <xsl:if test="$top != $stringEmpty">
        <xsl:call-template name="CreateWidthAttribute">
          <xsl:with-param name="attributeName" select="$AttributeNameMarginTop" />
          <xsl:with-param name="attributeValue" select="TOP/text()" />
          <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
        </xsl:call-template>
      </xsl:if>
      <xsl:apply-templates select="COLUMNHEADER" />
    </xsl:attribute>

    <xsl:call-template name="CreateClassForBorder">
      <xsl:with-param name="borderType" select="$borderWidth" />
    </xsl:call-template>

    <tr>
      <xsl:choose>
        <xsl:when test="//XML/FONT[@name=$fontName]/UNDERLINE/text() = 'TRUE'">
          <xsl:apply-templates select="COLUMNHEADER" mode="TextDecorationIsUnderline" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="COLUMNHEADER" mode="TextDecorationIsNone" />
        </xsl:otherwise>
      </xsl:choose>
    </tr>
    <xsl:variable name="index" select ="0" />
    <xsl:choose>
      <xsl:when test="count(ROW) > $Zero">
        <xsl:choose>
          <xsl:when test="//XML/FONT[@name=$fontName]/UNDERLINE/text() = 'TRUE'">
            <xsl:apply-templates select="ROW" mode="TextDecorationIsUnderline" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="ROW" mode="TextDecorationIsNone" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <tr>
          <xsl:apply-templates select="COLUMNHEADER" mode="EmptyCell" />
        </tr>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:variable name="longUnderscore" select="'X____________________________________'" />
  <xsl:variable name="longUnderscoreColumnWith" select="3.75" />

  <xsl:template match="COLUMNHEADER">
    <!--<fo:table-column>-->
    <xsl:variable name="columnWidth">
      <xsl:call-template name="CalculateColumnWidth" />
    </xsl:variable>
    <xsl:if test="$columnWidth != $stringEmpty">
      <xsl:call-template name="CreateColumnWithAttribute">
        <xsl:with-param name="columnWidth" select="$columnWidth" />
      </xsl:call-template>
    </xsl:if>
    <!--</fo:table-column>-->
  </xsl:template>

  <xsl:template name="CalculateColumnWidth">
    <xsl:choose>
      <xsl:when test="not(count(TEXT[contains(text(), $longUnderscore)]) = $Zero)" >
        <xsl:value-of select="$longUnderscoreColumnWith"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="WIDTH/text()" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="CreateColumnWithAttribute">
    <xsl:param name="columnWidth" />
    <xsl:call-template name="CreateWidthAttribute">
      <xsl:with-param name="attributeName" select="$AttributeNameColumnWidth" />
      <xsl:with-param name="attributeValue" select="$columnWidth" />
      <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="COLUMNHEADER" mode="TextDecorationIsNone">
    <td>
      <xsl:attribute name="style">
        <xsl:value-of select="'padding-top:0.1mm; padding-right:0.2mm; padding-bottom:0.1mm; padding-left:0.2mm; min-height=10px; '"/>
        <xsl:variable name="width">
          <xsl:call-template name="CalculateColumnWidth" />
        </xsl:variable>
        <xsl:if test="$width != $stringEmpty">
          <xsl:call-template name="CreateWidthAttribute">
            <xsl:with-param name="attributeName" select="$AttributeNameWidth" />
            <xsl:with-param name="attributeValue" select="$width" />
            <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
          </xsl:call-template>
        </xsl:if>

        <xsl:variable name="headerShade" select="parent::node()/HEADERSHADE/text()" />
        <xsl:if test="$headerShade != $stringEmpty">
          <xsl:value-of select="'background-color:'"/>
          <xsl:value-of select="$headerShade"/>
          <xsl:value-of select="'; '"/>
        </xsl:if>
        <xsl:variable name="textAlign" select="ALIGNMENT/text()" />
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttribute">
            <xsl:with-param name="MicrosoftReceiptOPOSAlign" select="$textAlign" />
          </xsl:call-template>
        </xsl:if>
      </xsl:attribute>

      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'header'" />
      </xsl:call-template>

      <xsl:apply-templates select="TEXT" mode="TextDecorationIsNone" />
    </td>
  </xsl:template>

  <xsl:template name="CreateBorderWidthAttribute">
    <xsl:param name="borderWidth" select="$Zero" />
    <xsl:attribute name="border">
      <xsl:value-of select="'solid'"/>
      <xsl:value-of select="$Zero" />
      <xsl:value-of select="$PointCharacter" />
      <xsl:value-of select="$borderWidth" />
      <xsl:value-of select="$borderWidth"/>
      <xsl:value-of select="$CellBorderDimmensionsUnitsAbbreviation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="TEXT" mode="TextDecorationIsNone">
    <div style="text-decoration:none">
      <xsl:copy-of select="text()" />
    </div>
  </xsl:template>

  <xsl:template match="COLUMNHEADER" mode="TextDecorationIsUnderline">
    <td>
      <xsl:attribute name="style">
        <xsl:value-of select="'padding-top:0.1mm; padding-right:0.2mm; padding-bottom:0.1mm; padding-left:0.2mm'"/>
        <xsl:variable name="width">
          <xsl:call-template name="CalculateColumnWidth" />
        </xsl:variable>
        <xsl:if test="$width != $stringEmpty">
          <xsl:call-template name="CreateWidthAttribute">
            <xsl:with-param name="attributeName" select="$AttributeNameWidth" />
            <xsl:with-param name="attributeValue" select="$width" />
            <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
          </xsl:call-template>
        </xsl:if>
        <xsl:variable name="headerShadeYellow" select="65535" />
        <xsl:if test="parent::node()/HEADERSHADE/text() = $headerShadeYellow">
          <xsl:value-of select="'background-color:'"/>
          <xsl:value-of select="$ColorYellow"/>
          <xsl:value-of select="'; '"/>
        </xsl:if>
        <xsl:variable name="textAlign" select="ALIGNMENT/text()" />
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttribute">
            <xsl:with-param name="MicrosoftReceiptOPOSAlign" select="$textAlign" />
          </xsl:call-template>
        </xsl:if>
      </xsl:attribute>

      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'header'" />
      </xsl:call-template>

      <xsl:apply-templates select="TEXT" mode="TextDecorationIsUnderline" />
    </td>
  </xsl:template>

  <xsl:template match="TEXT" mode="TextDecorationIsUnderline">
    <div style="text-decoration:underline">
      <xsl:copy-of select="text()"/>
    </div>
  </xsl:template>

  <xsl:template match="COLUMNHEADER" mode="EmptyCell">
    <td style="text-align:right">
      <div>
        <span></span>
      </div>
    </td>
  </xsl:template>

  <xsl:template match="ROW" mode="TextDecorationIsNone">
    <tr>

      <xsl:call-template name="CopyROWCELLS">
        <xsl:with-param name="text" select="text()" />
        <xsl:with-param name="separator" select="$VerticalLineCharacter" />
        <xsl:with-param name="textDecoration" select="$None" />
      </xsl:call-template>
    </tr>
  </xsl:template>

  <xsl:template match="ROW" mode="TextDecorationIsUnderline">
    <tr>
      <xsl:call-template name="CopyROWCELLS">
        <xsl:with-param name="text" select="text()" />
        <xsl:with-param name="separator" select="$VerticalLineCharacter" />
        <xsl:with-param name="textDecoration" select="$Underline" />
      </xsl:call-template>
    </tr>
  </xsl:template>

  <xsl:template match="text/text()" name="CopyROWCELLS">
    <xsl:param name="text" select="."/>
    <xsl:param name="separator" />
    <xsl:param name="textDecoration" />
    <xsl:param name="columnNumber" select="$One" />

    <xsl:variable name="spaceNormalizedText" select="$text" />
    <xsl:choose>
      <xsl:when test="not(count(parent::node()/parent::node()[name() = $DocumentElementName]) = $One or count(parent::node()/parent::node()[name() = $SubElementName and @name = $SUBDrawContent]) = $One)">
        <xsl:call-template name="RenderAnySUBTableRows">
          <xsl:with-param name="text" select="$spaceNormalizedText" />
          <xsl:with-param name="columnNumber" select="$columnNumber" />
          <xsl:with-param name="separator" select="$separator" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="RenderSUBPrintTransactionDetailsTableRows">
          <xsl:with-param name="text" select="$spaceNormalizedText" />
          <xsl:with-param name="columnNumber" select="$columnNumber" />
          <xsl:with-param name="separator" select="$separator" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="RenderAnySUBTableRows">
    <xsl:param name="text" select="." />
    <xsl:param name="separator" select="$VerticalLineCharacter" />
    <xsl:param name="textDecoration" />
    <xsl:param name="columnNumber" select="$One" />

    <xsl:choose>
      <xsl:when test="not(contains($text, $separator))">
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="$text" />
          <xsl:with-param name="textDecoration" select="$None" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="columnNumber" select="$columnNumber"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="substring-before($text, $separator)" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="columnNumber" select="$columnNumber"/>
        </xsl:call-template>
        <xsl:call-template name="CopyROWCELLS">
          <xsl:with-param name="text" select="substring-after($text, $separator)" />
          <xsl:with-param name="separator" select="$separator" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
          <xsl:with-param name="columnNumber" select="$columnNumber + 1" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="RenderSUBPrintTransactionDetailsTableRows">
    <xsl:param name="text" select="." />
    <xsl:param name="separator" select="$VerticalLineCharacter" />
    <xsl:param name="textDecoration" />
    <xsl:param name="columnNumber" select="$One" />

    <xsl:variable name="cellSymbolsCount">
      <xsl:choose>
        <xsl:when test="$columnNumber = $One">
          <xsl:value-of select="$Eight" />
        </xsl:when>
        <xsl:when test="$columnNumber = $Two">
          <xsl:value-of select="$Fifteen"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Three">
          <xsl:value-of select="$OneHundred"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Four">
          <xsl:value-of select="$Eight"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Five">
          <xsl:value-of select="$Eight"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Six">
          <xsl:value-of select="$Eight"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Ten"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="isSeparatorExists" select="contains($text, $separator)" />

    <xsl:variable name="cellText">
      <xsl:choose>
        <xsl:when test="$isSeparatorExists">
          <xsl:value-of select="substring-before($text, $separator)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$text"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="cuttedCellText"
                  select="substring($cellText, $One, $cellSymbolsCount)" />

    <xsl:variable name="cellContent">
      <xsl:call-template name="TextWrapper">
        <xsl:with-param name="text" select="$cuttedCellText" />
        <xsl:with-param name="inlineBlockLength" select="$cellSymbolsCount" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="not($isSeparatorExists)">
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="$cellContent" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="$cellContent" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
        </xsl:call-template>
        <xsl:call-template name="RenderSUBPrintTransactionDetailsTableRows">
          <xsl:with-param name="text" select="substring-after($text, $separator)" />
          <xsl:with-param name="separator" select="$separator" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
          <xsl:with-param name="columnNumber" select="$columnNumber + $One" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>

  <xsl:template name="CreateCELL">
    <xsl:param name="cellText" select="." />
    <xsl:param name="textDecoration" select="$None" />
    <xsl:param name="textAlign" />
    <xsl:param name="columnNumber" select="0"/>
    <td>
      <xsl:attribute name="style">
        <!--<xsl:value-of select="'padding-top:0.1mm; padding-right:0.2mm; padding-bottom:0.1mm; padding-left:0.2mm; '"/>-->
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttribute">
            <xsl:with-param name="MicrosoftReceiptOPOSAlign" select="$textAlign" />
          </xsl:call-template>
        </xsl:if>
      </xsl:attribute>

      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'row'" />
        <xsl:with-param name="columnNumber" select="$columnNumber" />
      </xsl:call-template>

      <div>
        <span style="text-decoration:{$textDecoration}">
          <xsl:choose>
            <xsl:when test="$cellText = $PageNumberTemplate">
              <!--<xsl:variable name="lastPageEmptyBlockName" select="'lastPageEmptyBlock'" />
              <span /> of <span ref-id="{$lastPageEmptyBlockName}" />-->
              <div id="countPage"></div>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="ChangeTextCRLFToBlocks">
                <xsl:with-param name="text" select="$cellText" />
                <xsl:with-param name="isUnderline" select="$textDecoration = $Underline" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </div>
    </td>
  </xsl:template>

  <xsl:template name="CreateBorderPositionAttribure">
    <xsl:param name="positionName" />
    <xsl:param name="width" />

    <xsl:variable name="fixedWidth" select="'5'"/>
    <xsl:variable name="borderKeyword" select="'border'" />
    <xsl:variable name="colorKeyword" select="'color'" />
    <xsl:variable name="styleKeyword" select="'style'" />
    <xsl:variable name="widthKeyword" select="'width'" />

    <xsl:attribute name="{concat($borderKeyword, $HyphenCharacter, $positionName, $HyphenCharacter, $colorKeyword)}">
      <xsl:value-of select="$Black" />
    </xsl:attribute>
    <xsl:attribute name="{concat($borderKeyword, $HyphenCharacter, $positionName, $HyphenCharacter, $styleKeyword)}">
      <xsl:value-of select="$BorderWidthStyleSolid" />
    </xsl:attribute>
    <xsl:attribute name="{concat($borderKeyword, $HyphenCharacter, $positionName, $HyphenCharacter, $widthKeyword)}">
      <xsl:value-of select="$Zero"/>
      <xsl:value-of select="$PointCharacter" />
      <xsl:value-of select="$fixedWidth"/>
      <xsl:value-of select="$Millimeters"/>
    </xsl:attribute>

  </xsl:template>

  <xsl:template match="text()" name="CreateWidthAttribute">
    <xsl:param name="attributeName" select="$AttributeNameWidth" />
    <xsl:param name="attributeValue" select="$Zero" />
    <xsl:param name="unitsAbbreviation" select="$Inch" />
    <xsl:variable name="width" select="normalize-space($attributeValue)" />
    <xsl:if test="$width != $stringEmpty">
      <xsl:value-of select="$attributeName"/>
      <xsl:value-of select ="':'"/>
      <xsl:if test="substring($width, $One, $One) = $PointCharacter">
        <xsl:copy-of select="$Zero"/>
      </xsl:if>
      <xsl:copy-of select="$width" />
      <xsl:copy-of select="$unitsAbbreviation" />
      <xsl:value-of select ="'; '"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()" name="CreateClassForBorder">
    <xsl:param name="borderType" select="tbNone" />
    <xsl:if test="$borderType != $stringEmpty and $borderType != 'tbNone'">
      <xsl:attribute name="class">
        <xsl:copy-of select="'noBorder'"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()" name="CreateClassForBorderForTD">
    <xsl:param name="borderType" select="tbNone" />
    <xsl:param name="rowType" select="Row"/>
    <xsl:param name="columnNumber" select="0"/>
    <xsl:if test="$borderType = 'tbAll'">
      <xsl:if test="$rowType = 'header'">
        <xsl:attribute name="class">
          <xsl:copy-of select="'all'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$rowType = 'header' and ($borderType = 'tbTop' or $borderType = 'tbTopBottom') ">
      <xsl:attribute name="class">
        <xsl:copy-of select="'borderTop'"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$rowType = 'row' and ($borderType = 'tbBottom' or $borderType = 'tbTopBottom') and position() = count(parent::node()/ROW)">
      <xsl:attribute name="class">
        <xsl:copy-of select="'borderBottom'"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="$borderType = 'tbBox'">
      <xsl:if test="$rowType = 'header' and position() = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() = count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() != 1 and position() != count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and position() = count(parent::node()/ROW) and $columnNumber = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and position() = count(parent::node()/ROW) and $columnNumber = count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and position() != count(parent::node()/ROW) and $columnNumber = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeft'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and position() != count(parent::node()/ROW) and $columnNumber = count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRight'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and position() = count(parent::node()/ROW) and $columnNumber != 1 and $columnNumber != count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderBottom'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$borderType = 'tbColumns'">
      <xsl:if test ="$rowType = 'header' and position() != 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeft'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test ="$rowType = 'row' and $columnNumber != 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeft'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$borderType = 'tbColTopBottom'">
      <xsl:if test="$rowType = 'header' and position() = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRightTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() != 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1 and position() = count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1 and position() = count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1 and position() != count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRight'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1 and position() != count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRight'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$borderType = 'tbBoxRows'">
      <xsl:if test="$rowType = 'header' and position() = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftTopBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() = count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightTopBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() != 1 and position() != count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderTopBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1 and $columnNumber != count(parent::node()/COLUMNHEADER)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderBottom'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
    <xsl:if test="$borderType = 'tbBoxColumns'">
      <xsl:if test="$rowType = 'header' and position() = 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRightTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'header' and position() != 1">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightTop'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1 and position() = count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1 and position() = count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRightBottom'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber = 1 and position() != count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderLeftRight'"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$rowType = 'row' and $columnNumber != 1 and position() != count(parent::node()/ROW)">
        <xsl:attribute name="class">
          <xsl:copy-of select="'borderRight'"/>
        </xsl:attribute>
      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateTextAlignAttribute">
    <xsl:param name="MicrosoftReceiptOPOSAlign" />
    <xsl:variable name="textAlign">
      <xsl:call-template name="ConvertMicrosoftReceiptAlignToXSLFO1_1Align">
        <xsl:with-param name="MicrosoftReceiptOPOSAlign" select="$MicrosoftReceiptOPOSAlign" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$textAlign != $stringEmpty">
      <xsl:value-of select="$AttributeNameTextAlign"/>
      <xsl:value-of select ="':'"/>
      <xsl:copy-of select="$textAlign" />
      <xsl:value-of select ="'; '"/>
    </xsl:if>
  </xsl:template>

  <xsl:template name="ConvertMicrosoftReceiptAlignToXSLFO1_1Align">
    <xsl:param name="MicrosoftReceiptOPOSAlign" />
    <xsl:choose>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignLTTilda">
        <!-- TO-DO: generate Tilda equivalent through space -->
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignLeft" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignLT">
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignLeft" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignGTTilda">
        <!-- TO-DO generate Tilda equivalent through space -->
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignRight" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignGT">
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignRight" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignUpTilda">
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignCenter" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignUp">
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignCenter" />
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="SumFloats">
    <xsl:param name="list"/>
    <xsl:param name="accumulator" select="0"/>

    <xsl:choose>
      <xsl:when test="$list">
        <xsl:variable name="head" select="$list[1]"/>

        <xsl:call-template name="SumFloats">
          <xsl:with-param name="list" select="$list[position() > 1]"/>
          <xsl:with-param name="accumulator" select="$accumulator + $head"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$accumulator"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="SUB">
    <div>
      <xsl:apply-templates select="*[local-name()='MARGIN' or local-name()='TABLE' or local-name()='BARCODE']" />
    </div>
  </xsl:template>

  <xsl:template match="MARGIN">
    <xsl:apply-templates select="*" />
  </xsl:template>

  <xsl:template match="MARGIN/TOP">
    <xsl:attribute name="margin-top">
      <xsl:copy-of select="text()" />
      <xsl:copy-of select="$DimmensionsUnitsAbbreviation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="MARGIN/BOTTOM">
    <xsl:attribute name="margin-bottom">
      <xsl:copy-of select="text()" />
      <xsl:copy-of select="$DimmensionsUnitsAbbreviation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="MARGIN/LEFT">
    <xsl:attribute name="margin-left">
      <xsl:copy-of select="text()" />
      <xsl:copy-of select="$DimmensionsUnitsAbbreviation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="MARGIN/RIGHT">
    <xsl:attribute name="margin-right">
      <xsl:copy-of select="text()" />
      <xsl:copy-of select="$DimmensionsUnitsAbbreviation" />
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="BARCODE">
    <div>
      <xsl:attribute name="style">
        <xsl:value-of select="'text-align:center; '"/>
        <xsl:call-template name="CreateElementTopAttribute" />
        <xsl:call-template name="CreateElementLeftAttribute" />
        <xsl:call-template name="CreateElementWidthAttribute" />
        <xsl:call-template name="CreateElementHeightAttribute" />
      </xsl:attribute>

      <span style="font-family:Free 3 of 9 Extended; font-size:50pt; float:left; ">
        <xsl:text>*</xsl:text>
        <xsl:copy-of select="TEXT/text()"></xsl:copy-of>
        <xsl:text>*</xsl:text>
      </span>
      <xsl:if test="PRINTCAPTION/text() = 'TRUE' or PRINTCAPTION/text() = 'true'">
        <span style="text-align:center; float:left; ">
          <xsl:text>*</xsl:text>
          <xsl:copy-of select="TEXT/text()" />
          <xsl:text>*</xsl:text>
        </span>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="CreateElementTopAttribute">
    <xsl:variable name="AttributesNamesTop" select="'margin-top'" />
    <xsl:variable name="top" select="TOP/text()" />
    <xsl:if test="$top &gt; $Zero">
      <xsl:call-template name="CreateDimensionAttribute">
        <xsl:with-param name="dimensionAttributeName" select="$AttributesNamesTop" />
        <xsl:with-param name="dimensionAttributeValue" select="$top" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateElementLeftAttribute">
    <xsl:variable name="AttributesNamesLeft" select="'margin-left'" />
    <xsl:variable name="left" select="LEFT/text()" />
    <xsl:if test="$left &gt; $Zero">
      <xsl:call-template name="CreateDimensionAttribute">
        <xsl:with-param name="dimensionAttributeName" select="$AttributesNamesLeft" />
        <xsl:with-param name="dimensionAttributeValue" select="$left" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateElementWidthAttribute">
    <xsl:variable name="AttributesNamesWidth" select="'width'" />
    <xsl:variable name="width" select="LEFT/text()" />
    <xsl:if test="$width &gt; $Zero">
      <xsl:call-template name="CreateDimensionAttribute">
        <xsl:with-param name="dimensionAttributeName" select="$AttributesNamesWidth" />
        <xsl:with-param name="dimensionAttributeValue" select="$width" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateElementHeightAttribute">
    <xsl:variable name="AttributesNamesHeight" select="'height'" />
    <xsl:variable name="height" select="HEIGHT/text()" />
    <xsl:if test="$height &gt; $Zero">
      <xsl:call-template name="CreateDimensionAttribute">
        <xsl:with-param name="dimensionAttributeName" select="$AttributesNamesHeight" />
        <xsl:with-param name="dimensionAttributeValue" select="$height" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateDimensionAttribute">
    <xsl:param name="dimensionAttributeName" />
    <xsl:param name="dimensionAttributeValue" />

    <xsl:value-of select="$dimensionAttributeName"/>
    <xsl:value-of select="': '"/>
    <xsl:value-of select="$Zero" />
    <xsl:value-of select="$dimensionAttributeValue"/>
    <xsl:value-of select="$DimmensionsUnitsAbbreviation" />
    <xsl:value-of select="'; '"/>
  </xsl:template>

  <xsl:template name="TextWrapper">
    <xsl:param name="text" />
    <xsl:param name="inlineBlockLength" />
    <xsl:choose>
      <xsl:when test="string-length($text) &lt;= $inlineBlockLength">
        <xsl:value-of select="$text" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring($text, $One, $inlineBlockLength)" />
        <xsl:value-of select="NewLineCharacter"/>
        <xsl:variable name="nextPosition" select="$inlineBlockLength + $One" />
        <xsl:call-template name="TextWrapper">
          <xsl:with-param name="text" select="substring($text, $nextPosition)" />
          <xsl:with-param name="inlineBlockLength" select="$inlineBlockLength" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="ChangeTextCRLFToBlocks">
    <xsl:param name="text" />
    <xsl:param name="isUnderline" />
    <xsl:choose>
      <xsl:when test="not(contains($text, $NewLineCharacter))">
        <div>
          <xsl:choose>
            <xsl:when test="$isUnderline">
              <span style="text-decoration:underline">
                <xsl:value-of select="$text"/>
              </span>
            </xsl:when>
            <xsl:otherwise>
              <span style="text-decoration:none">
                <xsl:value-of select="$text"/>
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div>
          <xsl:choose>
            <xsl:when test="$isUnderline">
              <span style="text-decoration:underline">
                <xsl:value-of select="substring-before($text, $NewLineCharacter)" />
              </span>
            </xsl:when>
            <xsl:otherwise>
              <span style="text-decoration:none">
                <xsl:value-of select="substring-before($text, $NewLineCharacter)" />
              </span>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        <xsl:call-template name="ChangeTextCRLFToBlocks">
          <xsl:with-param name="text" select="substring-after($text, $NewLineCharacter)" />
          <xsl:with-param name="isUnderline" select="$isUnderline" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="CALL">
    <xsl:variable name="subName" select="./text()" />
    <xsl:apply-templates select="//SUB[@name=$subName]" />
  </xsl:template>

  <xsl:template match="PICTURE" />

  <!-- xsl:template match="@* | node()"></xsl:template -->

</xsl:stylesheet>