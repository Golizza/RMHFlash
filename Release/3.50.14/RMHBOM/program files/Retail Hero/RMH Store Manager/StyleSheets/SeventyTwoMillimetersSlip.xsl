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
  <xsl:variable name="Eight" select="8" />
  <xsl:variable name="Ten" select="10" />
  <xsl:variable name="Eleven" select="11" />
  <xsl:variable name="Thirteen" select="13" />
  <xsl:variable name="Fourteen" select="14" />
  <xsl:variable name="Fiftheen" select="15" />
  <xsl:variable name="Twenty" select="20" />
  <xsl:variable name="Thirty" select="30" />
  <xsl:variable name="Fourty" select="40" />
  <!-- Character constants -->
  <xsl:variable name="PointCharacter" select="'.'" />
  <xsl:variable name="VerticalLineCharacter" select="'|'" />
  <xsl:variable name="SpaceCharacter" select="' '" />
  <xsl:variable name="NewLineCharacter" select="'&#xA;'" />
  <xsl:variable name="EmptyCharacter" select="'&#160;'" />
  <xsl:variable name="ZeroWidthSpace" select="'&#8203;'" />
  <!-- Colors -->
  <xsl:variable name="Black" select="'Black'" />
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
  <!-- Microsoft Receipt OPOS Aligns -->
  <xsl:variable name="MicrosoftReceiptOPOSAlignLTTilda" select="'&lt;~'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignGTTilda" select="'&gt;~'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignLT" select="'&lt;'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignGT" select="'&gt;'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignCenter" select="'^'" />
  <xsl:variable name="MicrosoftReceiptOPOSAlignCenterMiddle" select="'^~'" />
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
  <!--  } -->
  <!-- Global settings 
  {-->
  <xsl:variable name="DimmensionsUnitsAbbreviation" select="$Inch" />
  <xsl:variable name="TableBorderDimmensionsUnitsAbbreviation" select="$Pixels" />
  <xsl:variable name="FontUnitsAbbreviation" select="$Points" />
  <xsl:variable name="PageNumberTemplate" select="'\p of \t'" />
  <!--  } -->

  <!-- SUBs names
  {-->
  <xsl:variable name="SUBPrintTransactionDetails" select="'PrintTransactionDetails'" />
  <!-- } -->

  <xsl:template match="XML">
    <html>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <style>
        <xsl:variable name="fontName" select="'Small'" />
        html {
        page-width:72mm; page-height:200mm; margin-top:5.0mm; margin-right:1mm; margin-left:1mm; margin-bottom:1mm; background:white;  position: relative;

        <xsl:value-of select="'font-family:'"/>
        <xsl:copy-of select="//XML/FONT[@name=$fontName]/NAME/text()"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-size:'"/>
        <xsl:copy-of select="//XML/FONT[@name=$fontName]/SIZE/text()"/>
        <xsl:copy-of select="$FontUnitsAbbreviation"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-weight:'"/>
        <xsl:choose>
          <xsl:when test="//XML/FONT[@name=$fontName]/BOLD/text()='TRUE'">
            <xsl:copy-of select="$Bold"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-style:'"/>
        <xsl:choose>
          <xsl:when test="//XML/FONT[@name=$fontName]/ITALIC/text()='TRUE'">
            <xsl:copy-of select="$Italic" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>
        }
        .outer {
        width: 100%;
        text-align: center;
        }

        .inner {
        display: inline-block;
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
      <div class="outer">
        <div class="inner">
          <xsl:apply-templates select="DOCUMENT/CALL" />
        </div>
      </div>
    </html>
  </xsl:template>

  <xsl:template match="TABLE">
    <table>
      <!-- width="58.6mm" -->
      <xsl:apply-templates select="." mode="Content" />
    </table>
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
        <xsl:call-template name="CreateWidthAttributeText">
          <xsl:with-param name="attributeName" select="$AttributeNameInlineProgressionDimensionMaximum" />
          <xsl:with-param name="attributeValue" select="format-number($tableWidth, '##0.000')" />
          <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$fontName != $stringEmpty">
        <xsl:value-of select="'font-family:'"/>
        <xsl:value-of select="$fontName"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-size:'"/>
        <xsl:copy-of select="//XML/FONT[@name=$fontName]/SIZE/text()"/>
        <xsl:copy-of select="$FontUnitsAbbreviation"/>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-weight:'"/>
        <xsl:choose>
          <xsl:when test="//XML/FONT[@name=$fontName]/BOLD/text()='TRUE'">
            <xsl:copy-of select="$Bold"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>

        <xsl:value-of select="'font-style:'"/>
        <xsl:choose>
          <xsl:when test="//XML/FONT[@name=$fontName]/ITALIC/text()='TRUE'">
            <xsl:copy-of select="$Italic" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$Normal"/>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="'; '"/>

      </xsl:if>

      <xsl:if test="$top != $stringEmpty">

        <xsl:call-template name="CreateWidthAttributeText">
          <xsl:with-param name="attributeName" select="$AttributeNameMarginTop" />
          <xsl:with-param name="attributeValue" select="TOP/text()" />
          <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
        </xsl:call-template>
      </xsl:if>

      <xsl:if test="$borderWidth != $stringEmpty and $borderWidth != $Zero">
        <xsl:value-of select="'border:'"/>
        <xsl:call-template name="CreateBorderAttribute">
          <xsl:with-param name="borderWidth" select="$borderWidth" />
          <xsl:with-param name="borderWidthStyle" select="$BorderWidthStyleSolid" />
          <xsl:with-param name="borderColor" select="$Black" />
        </xsl:call-template>
        <xsl:value-of select="'; '"/>
      </xsl:if>

      <xsl:apply-templates select="COLUMNHEADERText" />
    </xsl:attribute>

    <xsl:call-template name="CreateClassForBorder">
      <xsl:with-param name="borderType" select="$borderWidth" />
    </xsl:call-template>

    <thead>
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
    </thead>
    <tbody>
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
    </tbody>
  </xsl:template>

  <xsl:template match="COLUMNHEADER">
    <!--<fo:table-column>-->
    <xsl:variable name="columnWidth" select="WIDTH/text()" />
    <xsl:if test="$columnWidth != $stringEmpty">
      <xsl:call-template name="CreateColumnWithAttribute">
        <xsl:with-param name="columnWidth" select="$columnWidth" />
      </xsl:call-template>
    </xsl:if>
    <!--</fo:table-column>-->
  </xsl:template>

  <xsl:template match="COLUMNHEADERText">
    <xsl:variable name="columnWidth" select="WIDTH/text()" />
    <xsl:if test="$columnWidth != $stringEmpty">
      <xsl:call-template name="CreateColumnWithAttributeText">
        <xsl:with-param name="columnWidth" select="$columnWidth" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateColumnWithAttributeText">
    <xsl:param name="columnWidth" />
    <xsl:call-template name="CreateWidthAttributeText">
      <xsl:with-param name="attributeName" select="$AttributeNameColumnWidth" />
      <xsl:with-param name="attributeValue" select="$columnWidth" />
      <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
    </xsl:call-template>
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
        <xsl:variable name="width" select="WIDTH/text()" />
        <xsl:if test="$width != $stringEmpty">
          <xsl:call-template name="CreateWidthAttributeText">
            <xsl:with-param name="attributeName" select="$AttributeNameWidth" />
            <xsl:with-param name="attributeValue" select="$width" />
            <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
          </xsl:call-template>
        </xsl:if>
        <xsl:variable name="textAlign" select="ALIGNMENT/text()" />
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttributeText">
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

  <xsl:template match="TEXT" mode="TextDecorationIsNone">
    <div style="text-decoration:none; ">
      <xsl:copy-of select="text()" />
    </div>
  </xsl:template>

  <xsl:template match="COLUMNHEADER" mode="TextDecorationIsUnderline">
    <td>
      <xsl:attribute name="style">
        <xsl:variable name="width" select="WIDTH/text()" />
        <xsl:if test="$width != $stringEmpty">
          <xsl:call-template name="CreateWidthAttributeText">
            <xsl:with-param name="attributeName" select="$AttributeNameWidth" />
            <xsl:with-param name="attributeValue" select="$width" />
            <xsl:with-param name="unitsAbbreviation" select="$DimmensionsUnitsAbbreviation" />
          </xsl:call-template>
        </xsl:if>
        <xsl:variable name="textAlign" select="ALIGNMENT/text()" />
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttributeText">
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

  <xsl:template match="PARAGRAPH">
    <xsl:apply-templates select="TEXT" />
  </xsl:template>

  <xsl:template match="TEXT">
    <div>
      <xsl:call-template name="ChangeTextCRLFToBlocks">
        <xsl:with-param name="text" select="text()" />
      </xsl:call-template>
    </div>
  </xsl:template>

  <xsl:template match="TEXT" mode="TextDecorationIsUnderline">
    <div style="text-decoration:underline; ">
      <xsl:copy-of select="text()"/>
    </div>
  </xsl:template>

  <xsl:template match="COLUMNHEADER" mode="EmptyCell">
    <!--<td style="padding:0px; text-align:right">
      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'header'" />
      </xsl:call-template>
    </td>-->
  </xsl:template>

  <xsl:template match="ROW" mode="TextDecorationIsNone">
    <tr>
      <xsl:choose>
        <xsl:when test="count(COLUMNDATA) = $Zero">
          <xsl:call-template name="CopyROWCELLS">
            <xsl:with-param name="text" select="text()" />
            <xsl:with-param name="separator" select="$VerticalLineCharacter" />
            <xsl:with-param name="textDecoration" select="$None" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="COLUMNDATA" mode="TextDecorationIsNone" />
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>

  <xsl:template match="ROW" mode="TextDecorationIsUnderline">
    <tr>
      <xsl:choose>
        <xsl:when test="count(COLUMNDATA) = $Zero">
          <xsl:call-template name="CopyROWCELLS">
            <xsl:with-param name="text" select="text()" />
            <xsl:with-param name="separator" select="$VerticalLineCharacter" />
            <xsl:with-param name="textDecoration" select="$Underline" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="COLUMNDATA" mode="TextDecorationIsUnderline" />
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>

  <xsl:template match="text/text()" name="CopyROWCELLS">
    <xsl:param name="text" select="."/>
    <xsl:param name="separator" />
    <xsl:param name="textDecoration" />
    <xsl:param name="columnNumber" select="$One" />

    <xsl:variable name="spaceNormalizedText" select="$text" />

    <xsl:choose>
      <xsl:when test="not(parent::node()/parent::node()/@name = $SUBPrintTransactionDetails)">
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

  <xsl:template match="COLUMNDATA" mode="TextDecorationIsNone">
    <td>
      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'row'" />
      </xsl:call-template>

      <xsl:apply-templates select="TEXT" mode="TextDecorationIsNone" />
    </td>
  </xsl:template>

  <xsl:template match="COLUMNDATA" mode="TextDecorationIsUnderline">
    <td>
      <xsl:variable name="borderWidth" select="parent::node()/BORDER/text()" />
      <xsl:call-template name="CreateClassForBorderForTD">
        <xsl:with-param name="borderType" select="$borderWidth" />
        <xsl:with-param name="rowType" select="'row'" />
      </xsl:call-template>

      <xsl:apply-templates select="TEXT" mode="TextDecorationIsUnderline" />
    </td>
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
          <xsl:with-param name="columnNumber" select="$columnNumber" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="substring-before($text, $separator)" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="columnNumber" select="$columnNumber" />
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
          <xsl:value-of select="$Twenty"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Two">
          <xsl:value-of select="$Thirty"/>
        </xsl:when>
        <xsl:when test="$columnNumber = $Three">
          <xsl:value-of select="$Ten"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$Ten"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="isUseCutting" select="not($columnNumber = $Two)"/>

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

    <xsl:variable name="cuttedCellText">
      <xsl:choose>
        <xsl:when test="$isUseCutting">
          <xsl:value-of select="substring($cellText, $One, $cellSymbolsCount)" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$cellText" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

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
          <xsl:with-param name="columnNumber" select="$columnNumber" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="CreateCELL">
          <xsl:with-param name="cellText" select="$cellContent" />
          <xsl:with-param name="textAlign" select="parent::TABLE/COLUMNHEADER[$columnNumber]/ALIGNMENT/text()" />
          <xsl:with-param name="textDecoration" select="$textDecoration" />
          <xsl:with-param name="columnNumber" select="$columnNumber" />
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
        <xsl:if test="$textAlign != $stringEmpty">
          <xsl:call-template name="CreateTextAlignAttributeText">
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

      <div style="wrap-option:wrap">
        <span style="text-decoration:{$textDecoration}">
          <xsl:choose>
            <xsl:when test="$cellText = $PageNumberTemplate">
              <xsl:variable name="lastPageEmptyBlockName" select="'lastPageEmptyBlock'" />
              <span /> of <span ref-id="{$lastPageEmptyBlockName}" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="textLength" select="14" />
              <xsl:call-template name="ChangeTextCRLFToBlocks">
                <xsl:with-param name="text" select="$cellText" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </span>
      </div>
	  
	  <xsl:apply-templates select="TEXT" mode="TextDecorationIsNone" />
    </td>
  </xsl:template>

  <xsl:template name="CreateWidthAttribute">
    <xsl:param name="attributeName" select="$AttributeNameWidth" />
    <xsl:param name="attributeValue" select="$Zero" />
    <xsl:param name="unitsAbbreviation" select="$Inch" />
    <xsl:variable name="width" select="normalize-space($attributeValue)" />
    <xsl:if test="$width != $stringEmpty">
      <xsl:attribute name="{$attributeName}">
        <xsl:if test="substring($width, $One, $One) = $PointCharacter">
          <xsl:copy-of select="$Zero"/>
        </xsl:if>
        <xsl:copy-of select="$width" />
        <xsl:copy-of select="$unitsAbbreviation" />
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateWidthAttributeText">
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

  <xsl:template name="CreateBorderAttribute">
    <xsl:param name="borderWidthStyle" select="$BorderWidthStyleNone" />
    <xsl:param name="borderWidth" select="$Zero" />
    <xsl:param name="borderColor" select="$Black" />
    <xsl:copy-of select="$borderWidthStyle" />
    <xsl:copy-of select="$SpaceCharacter" />
    <xsl:copy-of select="$Zero" />
    <xsl:copy-of select="$PointCharacter"/>
    <xsl:copy-of select="$borderWidth" />
    <xsl:copy-of select="$TableBorderDimmensionsUnitsAbbreviation" />
    <xsl:copy-of select="$SpaceCharacter"/>
    <xsl:copy-of select="$borderColor" />
  </xsl:template>

  <xsl:template name="CreateTextAlignAttribute">
    <xsl:param name="MicrosoftReceiptOPOSAlign" />
    <xsl:variable name="textAlign">
      <xsl:call-template name="ConvertMicrosoftReceiptAlignToXSLFO1_1Align">
        <xsl:with-param name="MicrosoftReceiptOPOSAlign" select="$MicrosoftReceiptOPOSAlign" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$textAlign != $stringEmpty">
      <xsl:attribute name="{$AttributeNameTextAlign}">
        <xsl:copy-of select="$textAlign" />
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="CreateTextAlignAttributeText">
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
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignCenter">
        <xsl:copy-of select="$XSLFO1_1HorizontalAlignCenter" />
      </xsl:when>
      <xsl:when test="$MicrosoftReceiptOPOSAlign = $MicrosoftReceiptOPOSAlignCenterMiddle">
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
      <xsl:apply-templates select="./*" />
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
    <div style="text-align:center; width:2.75in;clear:both;">
      <span style="font-family:Free 3 of 9 Extended; font-size:50pt; ">
        <xsl:text>*</xsl:text>
        <xsl:copy-of select="TEXT/text()"></xsl:copy-of>
        <xsl:text>*</xsl:text>
      </span>
    </div>
    <xsl:if test="PRINTCAPTION/text() = 'TRUE' or PRINTCAPTION/text() = 'true'">
      <div style="text-align:center; width:2.75in;clear:both;">
        <span>
          <xsl:text>*</xsl:text>
          <xsl:copy-of select="TEXT/text()" />
          <xsl:text>*</xsl:text>
        </span>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="CALL">
    <xsl:variable name="subName" select="./text()" />
    <xsl:apply-templates select="//XML/SUB[@name=$subName]" />
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

  <xsl:template name="FileterCellText">
    <xsl:param name="text" />
    <xsl:param name="textToFilter" select="'=='" />
    <xsl:if test="not(contains($text, $textToFilter))">
      <xsl:value-of select="$text" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="ChangeTextCRLFToBlocks">
    <xsl:param name="text" />
    <xsl:choose>
      <xsl:when test="not(contains($text, $NewLineCharacter))">
        <div>
          <xsl:value-of select="$text"/>
        </div>
      </xsl:when>
      <xsl:when test="not(string-length($text) = $Zero)">
        <div>
          <xsl:value-of select="substring-before($text, $NewLineCharacter)" />
        </div>
        <xsl:call-template name="ChangeTextCRLFToBlocks">
          <xsl:with-param name="text" select="substring-after($text, $NewLineCharacter)" />
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="NEWPAGE">
    <div style="padding-top:10mm">
    </div>
  </xsl:template>

  <xsl:template match="PICTURE" />

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

  <!-- xsl:template match="@* | node()"></xsl:template -->

</xsl:stylesheet>