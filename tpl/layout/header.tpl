[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
    [{assign var="headerWidth" value=$oViewConf->getViewThemeParam('sHeaderWidth')}]
    [{assign var="headerSticky" value=$oViewConf->getViewThemeParam('sHeaderSticky')}]
    [{assign var="showSearch" value=$oViewConf->getViewThemeParam('sHeaderShowSearch')}]
    [{assign var="navStyle" value=$oViewConf->getViewThemeParam('sHeaderMenu')}]
    [{if $headerWidth == 'container'}]
<div class="container-xxl[{if $headerSticky}] sticky-top[{/if}]">
    [{/if}]
    <header class="header[{if $headerSticky && $headerWidth != 'container'}] sticky-top[{/if}]">
        <div class="header-box position-relative">
            <div class="container[{if $headerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}] px-2 header-container">
                [{block name="dd_widget_header_categorylist_navbar_header"}]
                    <button class="btn btn-toggle d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="moga-bars"></i>
                    </button>
                [{/block}]
                [{block name="layout_header_logo"}]
                    [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                    [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                    [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                    <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxname->value}]" class="logo-link d-flex order-lg-1">
                        [{if $slogoImg}]
                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                            <picture>
                                <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oViewConf->getImageUrl($slogoImg), 200, '', 'webp')}]">
                                <img src="[{$oViewConf->getDynamicImage($oViewConf->getImageUrl($slogoImg), 200, '', 'png')}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="logo-img">
                            </picture>
                            [{else}]
                                <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxname->value}]" width="[{$sLogoWidth}]" height="[{$sLogoHeight}]" class="logo-img">
                            [{/if}]
                        [{else}]
                        <svg version="1.1" class="logo-img default" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 113.4 113.4" style="enable-background:new 0 0 113.4 113.4;" xml:space="preserve">
                            <style type="text/css">
                                .st0{fill:#E1251B;}
                                .st1{fill:#FFFFFF;}
                            </style>
                            <rect class="st0" width="113.4" height="113.4"></rect>
                            <g>
                                <path class="st1" d="M58.4,17.8c7.1,0,14,6.7,14,14.3c0,13.1-5.3,19.3-10.3,19.3c-3.9,0-6.1-2.5-6.1-6.7v-0.8c0,0,4.8-5.2,4.8-14.4
                                c0-2.1-0.8-3.4-2.5-3.4C50.9,26,44,48,44,69.3c0,13,3.9,17.1,9.8,17.1c11.5,0,19.7-17.9,20.5-26.6c0,0,1.4-0.1,2.2-0.1
                                c1.7,0,4.3,1.3,4.3,7.8c0,4.9-5.5,28.1-24.6,28.1c-14.3,0-23.9-12.4-23.9-30.8C32.4,47.4,40.7,17.8,58.4,17.8z"></path>
                            </g>
                        </svg>
                        [{/if}]
                    </a>
                [{/block}]

                [{block name="layout_header_bottom"}]
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" style="" _parent=$oView->getClassName() nocookie=1}]
                [{/block}]

                [{block name="layout_header_top"}]
                    <div class="menu-dropdowns btn-group ms-lg-auto">
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
                        [{if $showSearch && $oView->showSearch()}]
                        <button class="btn search-toggler collapsed" data-bs-toggle="collapse" data-bs-target="#searchCollapse" aria-label="[{oxmultilang ident="SEARCH"}]" aria-expanded="false" aria-controls="searchCollapse">
                            <i class="moga-search"></i>
                        </button>
                        [{/if}]
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
                [{if $showSearch}]
                [{include file="widget/header/search.tpl"}]
                [{/if}]
            </div>
        </div>
    </header>
    [{if $headerWidth == 'container'}]
</div>
    [{/if}]
[{/block}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
