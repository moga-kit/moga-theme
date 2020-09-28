[{block name="widget_promotiles"}]
    [{assign var="oBanners" value=$oView->getBanners()}]

    [{if $oBanners|@count}]
        [{assign var="promoTilesWidth" value=$oViewConf->getViewThemeParam('sPromoTilesWidth')}]
        [{assign var="promoTilesGrid" value=$oViewConf->getViewThemeParam('sPromoTilesGrid')}]
        [{assign var="promoTilesBg" value=$oViewConf->getViewThemeParam('sPromoTilesBg')}]
        [{assign var="promoTilesSpacing" value=$oViewConf->getViewThemeParam('sPromoTilesSpacing')}]
        [{assign var="promoTilesRowPadding" value=$oViewConf->getViewThemeParam('sPromoTilesRowPadding')}]
        [{if $promoTilesWidth == 'container'}]
            <div class="container-xxl">
        [{/if}]
                <div class="promo-tiles[{if $promoTilesRowPadding}] py-3 py-lg-5[{/if}] bg-[{$promoTilesBg}]">
                    [{if $promoTilesWidth == 'w100cContainer'}]
                    <div class="container-xxl px-0">
                    [{/if}]
                        <div class="px-[{$promoTilesSpacing}]">
                            <div class="row g-[{$promoTilesSpacing}]">
                                [{block name="dd_widget_promoslider_list"}]
                                    [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                                        [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                        [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]

                                        [{if $sBannerPictureUrl}]
                                            [{if $promoTilesGrid == '100_33'}]
                                                [{if $smarty.foreach.promoslider.first}]
                                                    [{assign var="gridClass" value="12"}]
                                                [{else}]
                                                    [{assign var="gridClass" value="4"}]
                                                [{/if}]
                                            [{/if}]
                                            [{if $promoTilesGrid == '50'}]
                                                [{assign var="gridClass" value="6"}]
                                            [{/if}]
                                            [{if $promoTilesGrid == '33'}]
                                                [{assign var="gridClass" value="4"}]
                                            [{/if}]
                                            [{if $promoTilesGrid == '25'}]
                                                [{assign var="gridClass" value="3"}]
                                            [{/if}]
                                            <div class="col-lg-[{$gridClass}]">
                                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]

                                                [{if $sBannerLink}]
                                                    <a href="[{$sBannerLink}]" class="card bg-dark text-white">
                                                [{else}]
                                                    <div class="card bg-dark text-white">
                                                [{/if}]

                                                    [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                        <picture>
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 200, 'webp')}]" media="(max-width: 375px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 350, 300, 'webp')}]" media="(max-width: 767px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 350, 300, 'jpg')}]" media="(max-width: 767px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 500, 370, 'webp')}]" media="(max-width: 991px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 500, 370, 'jpg')}]" media="(max-width: 991px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 600, 400, 'webp')}]" media="(max-width: 1199px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 600, 400, 'jpg')}]" media="(max-width: 1199px)">

                                                            [{if $promoTilesWidth == 'w100c100'}]
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 700, 450, 'webp')}]" media="(max-width: 1399px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 700, 450, 'jpg')}]" media="(max-width: 1399px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 800, 500, 'webp')}]" media="(max-width: 1599px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 800, 500, 'jpg')}]" media="(max-width: 1599px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1000, 600, 'webp')}]">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1000, 600, 'jpg')}]">
                                                            [{else}]
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 700, 450, 'webp')}]">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 700, 450, 'jpg')}]">
                                                            [{/if}]
                                                            <img loading="lazy" src="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 200, 'jpg')}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="card-img">
                                                        </picture>
                                                    [{else}]
                                                        <img loading="lazy" src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="card-img">
                                                    [{/if}]

                                                    [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
                                                        <div class="card-img-overlay">
                                                            <h5 class="card-title h2">[{$oArticle->oxarticles__oxtitle->value}]</h5>
                                                            [{if $oArticle->oxarticles__oxshortdesc->value|trim}]
                                                            <p class="card-text">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</p>
                                                            [{/if}]
                                                        </div>
                                                    [{/if}]

                                                [{if $sBannerLink}]
                                                    </a>
                                                [{else}]
                                                    </div>
                                                [{/if}]
                                            </div>
                                        [{/if}]
                                    [{/foreach}]
                                [{/block}]
                            </div>
                        </div>
                    [{if $promoTilesWidth == 'w100cContainer'}]
                    </div>
                    [{/if}]
                </div>
        [{if $promoTilesWidth == 'container'}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
