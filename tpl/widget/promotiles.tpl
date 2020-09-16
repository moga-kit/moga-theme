[{block name="dd_widget_promoslider"}]
    [{assign var="oBanners" value=$oView->getBanners()}]

    [{if $oBanners|@count}]
        [{assign var="promosliderWidth" value=$oViewConf->getViewThemeParam('sPromosliderWidth')}]
        [{if $promosliderWidth == 'container'}]
            <div class="container-xxl">
        [{/if}]
                    [{if $promosliderWidth == 'w100cContainer'}]
                    <div class="container-xxl">
                    [{/if}]
                        <div id="promoTiles">
                            <div class="row g-2 mb-2">
                                [{block name="dd_widget_promoslider_list"}]
                                    [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                                        [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                        [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]

                                        [{if $sBannerPictureUrl}]
                                            <div class="col-md-6">
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

                                                            [{if $promosliderWidth == 'w100c100'}]
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
                                                            <h5 class="card-title">[{$oArticle->oxarticles__oxtitle->value}]</h5>
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
                    [{if $promosliderWidth == 'w100cContainer'}]
                    </div>
                    [{/if}]
        [{if $promosliderWidth == 'container'}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
