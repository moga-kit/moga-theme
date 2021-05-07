[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    [{strip}]
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" id="Viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">
        <link rel="dns-prefetch" href="[{$oViewConf->getBaseDir()}]">
        <link rel="preconnect" href="[{$oViewConf->getBaseDir()}]">
        <link rel="preload" href="[{$oViewConf->getResourceUrl('fonts/icons.woff2')}]" as="font" crossorigin type="font/woff2">
        <link rel="preload" href="[{$oViewConf->getResourceUrl('fonts/barlow-condensed-latin-600-normal.woff2')}]" as="font" crossorigin type="font/woff2">
        <link rel="preload" href="[{$oViewConf->getResourceUrl('css/styles.min.css')}]" as="style">
        <link rel="preload" href="[{$oViewConf->getResourceUrl('js/scripts.min.js')}]" as="script">

        [{assign var=sPageTitle value=$oView->getPageTitle()}]
        <title>[{block name="head_title"}][{$sPageTitle}][{/block}]</title>

        [{block name="head_meta_robots"}]
            [{if $oView->noIndex() == 1}]
                <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
            [{elseif $oView->noIndex() == 2}]
                <meta name="ROBOTS" content="NOINDEX, FOLLOW">
            [{/if}]
        [{/block}]

        [{block name="head_meta_description"}]
            [{if $oView->getMetaDescription()}]
                <meta name="description" content="[{$oView->getMetaDescription()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_keywords"}]
            [{if $oView->getMetaKeywords()}]
                <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
            [{/if}]
        [{/block}]
        [{assign var="actCategory" value=$oView->getActiveCategory()}]
        [{block name="head_meta_open_graph"}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="og:title" content="[{$sPageTitle}]">
            <meta property="og:description" content="[{$oView->getMetaDescription()}]">

            [{if $oViewConf->getActiveClassName() == 'details'}]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{elseif $oViewConf->getActiveClassName() == 'manufacturerlist' && $actCategory->getIconUrl()}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$actCategory->getIconUrl()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                [{assign var="aOGImage"    value=$oViewConf->getViewThemeParam('aOGImage')}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl($aOGImage)}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/block}]

        [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
        [{block name="head_link_canonical"}]
            [{if $canonical_url}]
                <link rel="canonical" href="[{$canonical_url}]">
            [{/if}]
        [{/block}]

        [{block name="head_link_hreflang"}]
            [{if $oView->isLanguageLoaded()}]
                [{assign var="oConfig" value=$oViewConf->getConfig()}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    [{if $_lng->id == $oConfig->getConfigParam('sDefaultLang')}]
                        <link rel="alternate" hreflang="x-default" href="[{$_lng->link}]">
                    [{/if}]
                    <link rel="alternate" hreflang="[{$_lng->abbr}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]">
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
        [{if $oPageNavigation}]
            [{if $oPageNavigation->previousPage}]
                <link rel="prev" href="[{$oPageNavigation->previousPage}]">
            [{/if}]
            [{if $oPageNavigation->nextPage}]
                <link rel="next" href="[{$oPageNavigation->nextPage}]">
            [{/if}]
        [{/if}]

        [{block name="head_link_favicon"}]
            [{assign var="aAppleTouchIcon" value=$oViewConf->getViewThemeParam('aAppleTouchIcon')}]
            [{if $aAppleTouchIcon}]
                 <link rel="apple-touch-icon-precomposed" href="[{$oViewConf->getImageUrl("favicons/`$aAppleTouchIcon`")}]" />
                 <link rel="apple-touch-icon-precomposed" sizes="72x72" href="[{$oViewConf->getImageUrl("favicons/`$aAppleTouchIcon`")}]" />
                 <link rel="apple-touch-icon-precomposed" sizes="144x144" href="[{$oViewConf->getImageUrl("favicons/`$aAppleTouchIcon`")}]" />
            [{/if}]

            <!-- Shortcut Icons -->
            [{assign var="sFaviconFile"    value=$oViewConf->getViewThemeParam('sFaviconFile')}]
            [{assign var="sFavicon16File"  value=$oViewConf->getViewThemeParam('sFavicon16File')}]
            [{assign var="sFavicon32File"  value=$oViewConf->getViewThemeParam('sFavicon32File')}]

            [{if $sFaviconFile}]
                <link rel="shortcut icon" href="[{$oViewConf->getImageUrl("favicons/`$sFaviconFile`")}]?rand=1" type="image/x-icon" />
            [{/if}]
            [{if $sFavicon16File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon16File`")}]" sizes="16x16" />
            [{/if}]
            [{if $sFavicon32File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon32File`")}]" sizes="32x32" />
            [{/if}]
            <link rel="icon" href="data:image/svg+xml,
                <svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22>
                  <text y=%22.9em%22 font-size=%2290%22>
                    🛒
                  </text>
                </svg>"
            >

        [{/block}]

        [{block name="base_style"}]
            [{if $oxcmp_user && $oxcmp_user->oxuser__oxrights->value == "malladmin" && $smarty.cookies.scsspreview}]
                [{oxstyle include="css/preview.css?"|cat:$smarty.now}]
            [{else}]
                <link rel="stylesheet" href="[{$oViewConf->getImageUrl('../src/css/styles.min.css')}]">
            [{/if}]
        [{/block}]

        [{block name="base_fonts"}]
        [{/block}]

        [{assign var='rsslinks' value=$oView->getRssLinks()}]
        [{block name="head_link_rss"}]
            [{if $rsslinks}]
                [{foreach from=$rsslinks item='rssentry'}]
                    <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{block name="head_css"}]
            [{foreach from=$oxidBlock_head item="_block"}]
                [{$_block}]
            [{/foreach}]
        [{/block}]
    [{/strip}]
[{/capture}]

[{assign var="blIsCheckout"     value=$oView->getIsOrderStep()}]
<!DOCTYPE html>
<html lang="[{$oView->getActiveLangAbbr()}]" [{block name="head_html_namespace"}][{/block}]>
    <head>
        [{foreach from=$oxidBlock_pageHead item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{oxstyle}]
    </head>

    <body class="cl-[{$oView->getClassName()}][{if $smarty.get.plain == '1'}] popup[{/if}][{if $blIsCheckout}] is-checkout[{/if}][{if $oxcmp_user && $oxcmp_user->oxuser__oxpassword->value}] is-logged-in[{/if}]">

    [{* Theme SVG icons block *}]
    [{block name="theme_svg_icons"}][{/block}]

    [{foreach from=$oxidBlock_pageBody item="_block"}]
        [{$_block}]
    [{/foreach}]
    [{*if $oViewConf->getTopActiveClassName() == 'details' && $oView->showZoomPics()}]
        [{include file="page/details/inc/photoswipe.tpl"}]
    [{/if*}]

    [{block name="base_js"}]
        [{*include file="i18n/js_vars.tpl"*}]
        <script src="[{$oViewConf->getResourceUrl('js/scripts.min.js')}]"></script>

    [{/block}]
    [{if $oViewConf->isTplBlocksDebugMode()}]
        [{oxscript include="js/widgets/oxblockdebug.min.js"}]
        [{oxscript add="$( 'body' ).oxBlockDebug();"}]
    [{/if}]

    [{oxscript|replace:'type="text/javascript"':''}]

    [{if !$oView->isDemoShop()}]
        [{oxid_include_dynamic file="widget/dynscript.tpl"}]
    [{/if}]

    [{foreach from=$oxidBlock_pageScript item="_block"}]
        [{$_block}]
    [{/foreach}]
    </body>
</html>
