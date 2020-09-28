[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
    [{assign var="headerWidth" value=$oViewConf->getViewThemeParam('sHeaderWidth')}]
    [{if $headerWidth == 'container'}]
<div class="container-xxl">
    [{/if}]
    <header class="header">
        <div class="header-box">
            <div class="container[{if $headerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}] px-2 header-container">
                [{block name="dd_widget_header_categorylist_navbar_header"}]
                    <button class="btn btn-toggle d-lg-none collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="moga-bars"></i>
                    </button>
                [{/block}]
                [{block name="layout_header_logo"}]
                    [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                    [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                    [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                    <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="logo-link px-2 d-flex order-lg-1">
                        [{if $slogoImg}]
                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                            <picture>
                                <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oViewConf->getImageUrl($slogoImg), 200, '', 'webp')}]">
                                <img  src="[{$oViewConf->getDynamicImage($oViewConf->getImageUrl($slogoImg), 200, '', 'png')}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="logo-img">
                            </picture>
                            [{else}]
                                <img  src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="logo-img">
                            [{/if}]
                        [{else}]
                            <svg version="1.1" class="logo-img" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 31.7 8.2" style="enable-background:new 0 0 31.7 8.2;" xml:space="preserve">
<path d="M5.3,5.9C5.1,5.9,5,5.8,4.9,5.7S4.7,5.4,4.7,5.2V2.9c0,0,0-0.1,0-0.1c0-0.4-0.2-0.8-0.5-1.1C3.8,1.4,3.4,1.2,2.9,1.2h0
C2.4,1.2,2,1.4,1.7,1.7C1.4,2,1.2,2.4,1.2,2.8c0,0,0,0.1,0,0.1v2.3c0,0.2-0.1,0.4-0.2,0.5S0.8,5.9,0.6,5.9S0.3,5.8,0.2,5.7
S0,5.4,0,5.2V2.9c0-0.8,0.3-1.5,0.9-2C1.4,0.3,2.1,0,2.9,0H3c0.8,0,1.5,0.3,2,0.9C5.1,1,5.2,1.1,5.3,1.2C5.4,1.1,5.4,1,5.5,0.9
C6.1,0.3,6.8,0,7.6,0h0.1c0.8,0,1.5,0.3,2,0.9c0.6,0.6,0.8,1.2,0.9,2v2.3c0,0.2-0.1,0.4-0.2,0.5S10.1,5.9,10,5.9S9.7,5.8,9.5,5.7
S9.4,5.4,9.4,5.2V2.9c0,0,0-0.1,0-0.1c0-0.4-0.2-0.8-0.5-1.1C8.5,1.4,8.1,1.2,7.6,1.2h0c-0.5,0-0.9,0.2-1.2,0.5
C6.1,2,5.9,2.4,5.9,2.8c0,0,0,0.1,0,0.1v2.3c0,0.2-0.1,0.4-0.2,0.5S5.4,5.9,5.3,5.9L5.3,5.9z"/>
                            <path d="M16.7,0.9c0.6,0.6,0.9,1.3,0.9,2.1S17.3,4.4,16.7,5s-1.3,0.9-2.1,0.9S13.2,5.6,12.6,5s-0.9-1.3-0.9-2.1s0.3-1.5,0.9-2.1
S13.9,0,14.7,0S16.2,0.3,16.7,0.9z M14.7,1.2c-0.5,0-0.9,0.2-1.2,0.5s-0.5,0.7-0.5,1.2s0.2,0.9,0.5,1.2s0.8,0.5,1.2,0.5
s0.9-0.2,1.2-0.5s0.5-0.8,0.5-1.2S16.2,2,15.9,1.7S15.1,1.2,14.7,1.2z"/>
                            <path d="M23.4,5.3c-0.5,0.4-1.1,0.6-1.7,0.6c-0.8,0-1.5-0.3-2.1-0.9s-0.9-1.3-0.9-2.1s0.3-1.5,0.9-2.1S20.9,0,21.7,0
s1.5,0.3,2.1,0.9s0.9,1.3,0.9,2.1h0v2.3c0,0,0,0.1,0,0.1c0,0.8-0.3,1.4-0.9,2c-0.6,0.6-1.3,0.9-2.1,0.9h0c-0.2,0-0.3-0.1-0.4-0.2
s-0.2-0.3-0.2-0.4s0.1-0.3,0.2-0.4S21.5,7,21.7,7c0,0,0.1,0,0.1,0c0.5,0,0.8-0.2,1.2-0.5C23.3,6.2,23.4,5.8,23.4,5.3z M21.7,1.2
c-0.5,0-0.9,0.2-1.2,0.5S20,2.4,20,2.9s0.2,0.9,0.5,1.2s0.8,0.5,1.2,0.5s0.9-0.2,1.2-0.5s0.5-0.8,0.5-1.2S23.3,2,22.9,1.7
S22.2,1.2,21.7,1.2z"/>
                            <path d="M31.7,5.3c0,0.2-0.1,0.4-0.2,0.5s-0.3,0.1-0.4,0.1s-0.3,0-0.4-0.1s-0.2-0.2-0.2-0.4c-0.5,0.4-1.1,0.6-1.7,0.6
c-0.8,0-1.5-0.3-2.1-0.9s-0.9-1.3-0.9-2.1s0.3-1.5,0.9-2.1S27.9,0,28.7,0s1.5,0.3,2.1,0.9c0.6,0.6,0.8,1.2,0.9,2V5.3z M30,1.7
c-0.3-0.3-0.8-0.5-1.2-0.5s-0.9,0.2-1.2,0.5S27,2.4,27,2.9s0.2,0.9,0.5,1.2s0.7,0.5,1.2,0.5s0.9-0.2,1.2-0.5c0.3-0.3,0.5-0.6,0.5-1
V2.9c0,0,0-0.1,0-0.1C30.5,2.4,30.3,2,30,1.7z"/>
</svg>
                        [{/if}]
                    </a>
                [{/block}]

                [{block name="layout_header_top"}]
                    <div class="menu-dropdowns btn-group ml-lg-auto">
                        <div class="d-none d-md-inline-flex">
                            [{block name="dd_layout_page_header_icon_menu_languages"}]
                                [{* Language Dropdown*}]
                                [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                            [{/block}]
                            [{block name="dd_layout_page_header_icon_menu_currencies"}]
                                [{* Currency Dropdown*}]
                                [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                            [{/block}]
                        </div>
                        <button class="btn search-toggler collapsed" data-toggle="collapse" data-target="#searchCollapse" aria-label="[{oxmultilang ident="SEARCH"}]"  aria-expanded="false" aria-controls="searchCollapse">
                            <i class="moga-search"></i>
                        </button>
                        [{block name="dd_layout_page_header_icon_menu_account"}]
                            [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                                [{assign var="blAnon" value=0}]
                                [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                            [{else}]
                                [{assign var="blAnon" value=1}]
                            [{/if}]
                            [{* Account Dropdown *}]
                            [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                        [{/block}]

                        [{block name="dd_layout_page_header_icon_menu_minibasket"}]
                            [{* Minibasket Dropdown *}]
                            [{if $oxcmp_basket->getProductsCount()}]
                                [{assign var="blAnon" value=0}]
                                [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                            [{else}]
                                [{assign var="blAnon" value=1}]
                            [{/if}]
                            [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
                        [{/block}]
                    </div>
                [{/block}]
                [{include file="widget/header/search.tpl"}]
            </div>
        </div>
        [{block name="layout_header_bottom"}]
            [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
        [{/block}]
    </header>
    [{if $headerWidth == 'container'}]
</div>
    [{/if}]
[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
