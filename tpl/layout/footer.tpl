[{block name="footer_main"}]
    [{assign var="blShowFullFooter" value=$oView->showSearch()}]

    [{$oView->setShowNewsletter($oViewConf->getViewThemeParam('blFooterShowNewsletterForm'))}]

    [{if $oxcmp_user}]
    [{assign var="force_sid" value=$oView->getSidForWidget()}]
    [{/if}]
    [{assign var="footerWidth" value=$oViewConf->getViewThemeParam('sFooterWidth')}]
    [{if $footerWidth == 'container'}]
        <div class="container-xxl">
    [{/if}]
            <footer class="footer text-center text-md-left small py-5">
                <div class="container[{if $footerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                    <div class="row mb-4">
                        <div class="col-12 col-lg-8">
                            <div class="row">
                                [{block name="dd_footer_servicelist"}]
                                <section class="col-12 [{if $blShowFullFooter}]col-md-6 col-lg-3[{else}]col-lg-6[{/if}] mb-3">
                                    <div class="h4 text-uppercase">[{oxmultilang ident="SERVICES"}]</div>
                                    <div class="footer-content">
                                        [{block name="dd_footer_servicelist_inner"}]
                                        [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1 force_sid=$force_sid}]
                                        [{/block}]
                                    </div>
                                </section>
                                [{/block}]
                                [{block name="dd_footer_information"}]
                                <section
                                        class="col-12 [{if $blShowFullFooter}]col-md-6 col-lg-3[{else}]col-lg-6[{/if}] mb-3 footer-information">
                                    <div class="h4 text-uppercase">[{oxmultilang ident="INFORMATION"}]</div>
                                    <div class="footer-content">
                                        [{block name="dd_footer_information_inner"}]
                                        [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1 force_sid=$force_sid}]
                                        [{/block}]
                                    </div>
                                </section>
                                [{/block}]
                                [{if $blShowFullFooter}]
                                [{block name="dd_footer_manufacturerlist"}]
                                <section class="col-12 col-md-6 col-lg-3 mb-3">
                                    <div class="h4 text-uppercase">[{oxmultilang ident="OUR_BRANDS"}]</div>
                                    <div class="footer-content">
                                        [{block name="dd_footer_manufacturerlist_inner"}]
                                        [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]
                                        [{/block}]
                                    </div>
                                </section>
                                [{/block}]
                                [{block name="dd_footer_categorytree"}]
                                <section class="col-12 col-md-6 col-lg-3 mb-3">
                                    <div class="h4 text-uppercase">[{oxmultilang ident="CATEGORIES"}]</div>
                                    <div class="footer-content">
                                        [{block name="dd_footer_categorytree_inner"}]
                                        [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
                                        [{/block}]
                                    </div>
                                </section>
                                [{/block}]
                                [{/if}]
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            [{if $oView->showNewsletter()}]
                            <section class="mb-3 footer-newsletter">
                                <div class="h4 text-uppercase">[{oxmultilang ident="NEWSLETTER"}]</div>
                                <div class="footer-content">
                                    [{block name="dd_footer_newsletter"}]
                                    <p class="small">[{oxmultilang ident="FOOTER_NEWSLETTER_INFO"}]</p>
                                    [{include file="widget/footer/newsletter.tpl"}]
                                    [{/block}]
                                </div>
                            </section>
                            [{/if}]

                            [{block name="footer_social"}][{/block}]
                        </div>
                    </div>

                    [{* <<START>> Social Links *}]
                    [{block name="dd_footer_social_links"}]
                        [{if $oViewConf->getViewThemeParam('sFacebookUrl') || $oViewConf->getViewThemeParam('sGooglePlusUrl') || $oViewConf->getViewThemeParam('sTwitterUrl') || $oViewConf->getViewThemeParam('sYouTubeUrl') || $oViewConf->getViewThemeParam('sBlogUrl')}]
                            <div class="social-links">
                                [{block name="dd_footer_social_links_inner"}]
                                <nav class="nav justify-content-center">
                                    [{block name="dd_footer_social_links_list"}]
                                    [{if $oViewConf->getViewThemeParam('sFacebookUrl')}]
                                        <a target="_blank" class="nav-link"
                                           rel="noopener"
                                           href="[{$oViewConf->getViewThemeParam('sFacebookUrl')}]">
                                            <span>Facebook</span>
                                        </a>
                                    [{/if}]
                                    [{if $oViewConf->getViewThemeParam('sInstagramUrl')}]
                                        <a target="_blank" class="nav-link"
                                           rel="noopener"
                                           href="[{$oViewConf->getViewThemeParam('sInstagramUrl')}]">
                                            <span>Instagram</span>
                                        </a>
                                    [{/if}]
                                    [{if $oViewConf->getViewThemeParam('sTwitterUrl')}]
                                        <a target="_blank" class="nav-link"
                                           rel="noopener"
                                           href="[{$oViewConf->getViewThemeParam('sTwitterUrl')}]">
                                            <span>Twitter</span>
                                        </a>
                                    [{/if}]
                                    [{if $oViewConf->getViewThemeParam('sYouTubeUrl')}]
                                        <a target="_blank" class="nav-link"
                                           rel="noopener"
                                           href="[{$oViewConf->getViewThemeParam('sYouTubeUrl')}]">
                                            <span>YouTube</span>
                                        </a>
                                    [{/if}]
                                    [{if $oViewConf->getViewThemeParam('sBlogUrl')}]
                                        <a target="_blank" class="nav-link"
                                           rel="noopener"
                                           href="[{$oViewConf->getViewThemeParam('sBlogUrl')}]">
                                            <span>Blog</span>
                                        </a>
                                    [{/if}]
                                    [{/block}]
                                </nav>
                                [{/block}]
                            </div>
                        [{/if}]
                    [{/block}]
                    [{* <<ENDE>> Social Links *}]
                </div>

                [{if $oView->isPriceCalculated()}]
                [{block name="layout_page_vatinclude"}]
                [{block name="footer_deliveryinfo"}]
                [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                <div class="container[{if $footerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                    <div class="text-right">
                        [{if $oView->isVatIncluded()}]
                        <span class="vat-info-text">* [{oxmultilang ident="PLUS_SHIPPING"}]<a
                                href="[{$oCont->getLink()}]">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                        [{else}]
                        <span class="vat-info-text">* [{oxmultilang ident="PLUS"}]<a
                                href="[{$oCont->getLink()}]">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                        [{/if}]
                    </div>
                </div>

                [{/oxifcontent}]
                [{/block}]
                [{/block}]
                [{/if}]
            </footer>
    [{if $footerWidth == 'container'}]
        </div>
    [{/if}]
[{/block}]

    [{if $oView->isRootCatChanged()}]
        <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow" style="display: none;">
            [{include file="form/privatesales/basketexcl.tpl"}]
        </div>
    [{/if}]
