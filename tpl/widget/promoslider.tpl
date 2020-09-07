[{block name="dd_widget_promoslider"}]
    [{oxstyle include="css/promoslider.min.css"}]

    [{assign var="oBanners" value=$oView->getBanners()}]
    [{assign var="currency" value=$oView->getActCurrency()}]

    [{if $oBanners|@count}]
        [{assign var="promosliderWidth" value=$oViewConf->getViewThemeParam('sPromosliderWidth')}]
        [{if $promosliderWidth == 'container'}]
            <div class="container-xxl">
        [{/if}]
                <div class="promoslider">
                    [{if $promosliderWidth == 'w100cContainer'}]
                    <div class="container-xxl">
                    [{/if}]
                        <div id="promoCarousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                                    <li data-target="#promoCarousel" data-slide-to="[{$smarty.foreach.promoslider.iteration-1}]"[{if $smarty.foreach.promoslider.first}] class="active"[{/if}]></li>
                                [{/foreach}]
                            </ol>
                            <div class="carousel-inner">
                                [{block name="dd_widget_promoslider_list"}]
                                    [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                                        [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                        [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                                        [{if $sBannerPictureUrl}]
                                            <div class="carousel-item[{if $smarty.foreach.promoslider.first}] active[{/if}]">
                                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                                [{if $sBannerLink}]
                                                    <a class="d-block" href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                                [{/if}]
                                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                    <picture>
                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 200, 'webp')}]" media="(max-width: 375px)">

                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 750, 300, 'webp')}]" media="(max-width: 767px)">
                                                        <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 750, 300, 'jpg')}]" media="(max-width: 767px)">

                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 970, 370, 'webp')}]" media="(max-width: 991px)">
                                                        <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 970, 370, 'jpg')}]" media="(max-width: 991px)">

                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1170, 400, 'webp')}]" media="(max-width: 1199px)">
                                                        <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1170, 400, 'jpg')}]" media="(max-width: 1199px)">

                                                        [{if $promosliderWidth == 'w100c100'}]
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'webp')}]" media="(max-width: 1399px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'jpg')}]" media="(max-width: 1399px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1600, 500, 'webp')}]" media="(max-width: 1599px)">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1600, 500, 'jpg')}]" media="(max-width: 1599px)">

                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1800, 600, 'webp')}]">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1800, 600, 'jpg')}]">
                                                        [{else}]
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'webp')}]">
                                                            <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 1400, 450, 'jpg')}]">
                                                        [{/if}]
                                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($sBannerPictureUrl, 375, 120, 'jpg')}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="promoslider-img">
                                                    </picture>
                                                [{else}]
                                                    <img loading="lazy" src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="promoslider-img">
                                                [{/if}]

                                                [{if $sBannerLink}]
                                                    </a>
                                                [{/if}]
                                                [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
                                                [{if $sBannerLink}]
                                                <a href="[{$sBannerLink}]" class="d-block" title="[{$oBanner->oxactions__oxtitle->value}]">
                                                    [{/if}]
                                                    <div class="carousel-caption d-none d-md-block">

                                                        <h5 class="title">[{$oArticle->oxarticles__oxtitle->value}]</h5>
                                                        [{if $oArticle->oxarticles__oxshortdesc->value|trim}]
                                                                <p class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</p>
                                                        [{/if}]

                                                    </div>
                                                [{if $sBannerLink}]
                                                </a>
                                                [{/if}]
                                                [{/if}]
                                            </div>
                                        [{/if}]
                                    [{/foreach}]
                                [{/block}]
                            </div>
                            <a class="carousel-control-prev" href="#promoCarousel"  data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#promoCarousel"  data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    [{if $promosliderWidth == 'w100cContainer'}]
                    </div>
                    [{/if}]
                </div>
        [{if $promosliderWidth == 'container'}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
