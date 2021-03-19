[{*oxscript include="js/details.min.js" priority=10*}]

[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{assign var="oManufacturer" value=$oView->getManufacturer()}]
[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]
[{assign var="imageStyle" value=$oViewConf->getViewThemeParam('sImageStyle')}]

[{if $aVariantSelections && $aVariantSelections.rawselections}]
    [{assign var="_sSelectionHashCollection" value=""}]
    [{foreach from=$aVariantSelections.rawselections item=oSelectionList key=iKey}]
        [{assign var="_sSelectionHash" value=""}]
        [{foreach from=$oSelectionList item=oListItem key=iPos}]
            [{assign var="_sSelectionHash" value=$_sSelectionHash|cat:$iPos|cat:":"|cat:$oListItem.hash|cat:"|"}]
        [{/foreach}]
        [{if $_sSelectionHash}]
            [{if $_sSelectionHashCollection}][{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:","}][{/if}]
            [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:"'`$_sSelectionHash`'"}]
        [{/if}]
    [{/foreach}]
    [{*oxscript add="oxVariantSelections  = [`$_sSelectionHashCollection`];"*}]

    <form class="js-oxWidgetReload" action="[{$oView->getWidgetLink()}]" method="get">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oView->getClassName()}]">
        <input type="hidden" name="oxwparent" value="[{$oViewConf->getTopActiveClassName()}]">
        <input type="hidden" name="listtype" value="[{$oView->getListType()}]">
        <input type="hidden" name="nocookie" value="1">
        <input type="hidden" name="cnid" value="[{$oView->getCategoryId()}]">
        <input type="hidden" name="anid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
        <input type="hidden" name="actcontrol" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oConfig->getRequestParameter('preview')}]
            <input type="hidden" name="preview" value="[{$oConfig->getRequestParameter('preview')}]">
        [{/if}]
    </form>
[{/if}]

[{oxhasrights ident="TOBASKET"}]
    <form class="js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
            <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="panid" value="">
            [{if !$oDetailsProduct->isNotBuyable()}]
                <input type="hidden" name="fnc" value="tobasket">
            [{/if}]
[{/oxhasrights}]

<div class="details-top container-fluid">
    <div class="row row-cols-md-2">
        <div class="col-12 col-md-6 col-lg-8 col-xl-9">
            [{* article picture with zoom *}]
            [{block name="details_productmain_zoom"}]
            [{assign var="imageCount" value=$oView->getIcons()|@count}]

            [{if $imageStyle == "grid"}]
                <div class="row g-1">
                    [{assign var="colClass" value='col-6'}]
                    [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                        [{if $smarty.foreach.sMorePics.iteration > 2}]
                            [{assign var="colClass" value='col-6 col-md-3'}]
                        [{/if}]
                        <div data-bs-target="#details-slider" data-bs-slide-to="[{$iPicNr-1}]" class="[{$colClass}] d-none d-md-block details-thumb">

                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                <picture>
                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, 375, 'webp', true)}]" media="(max-width: 375px)">

                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, 750, 'webp', true)}]" media="(max-width: 767px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, 750, '', true)}]" media="(max-width: 767px)">

                                    [{if $smarty.foreach.sMorePics.iteration > 2}]
                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 114, 114, 'webp', true)}]" media="(max-width: 991px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 114, 114, '', true)}]" media="(max-width: 991px)">

                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 190, 190, 'webp', true)}]" media="(max-width: 1199px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 190, 190, '', true)}]" media="(max-width: 1199px)">

                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 300, 300, 'webp', true)}]" media="(min-width: 1200px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 300, 300, '', true)}]" media="(min-width: 1200px)">
                                    [{else}]
                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 230, 230, 'webp', true)}]" media="(max-width: 991px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 230, 230, '', true)}]" media="(max-width: 991px)">

                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 440, 440, 'webp', true)}]" media="(max-width: 1199px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 440, 440, '', true)}]" media="(max-width: 1199px)">

                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 600, 600, 'webp', true)}]" media="(min-width: 1200px)">
                                    <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 600, 600, '', true)}]" media="(min-width: 1200px)">
                                    [{/if}]
                                    <img class="details-thumb-img" loading="lazy" src="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, 375, '', true)}]" alt="morepic-[{$smarty.foreach.sMorePics.iteration}]">
                                </picture>
                            [{else}]
                                <img class="details-thumb-img" loading="lazy" src="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" alt="morepic-[{$smarty.foreach.sMorePics.iteration}]">
                            [{/if}]
                        </div>
                    [{/foreach}]
                </div>
                <div id="details-slider" class="carousel slide carousel-desktop-zoom" data-ride="carousel" data-interval="false">
                    <div class="carousel-inner">
                        <ol class="carousel-indicators">
                            [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                                <li data-bs-target="#details-slider" data-bs-slide-to="[{$iPicNr-1}]"[{if $smarty.foreach.sMorePics.first}] class="active"[{/if}]></li>
                            [{/foreach}]
                        </ol>

                        [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                            [{assign var="sPictureName" value=$oPictureProduct->getPictureFieldValue("oxpic", $iPicNr)}]
                            [{assign var="aPictureInfo" value=$oConfig->getMasterPicturePath("product/`$iPicNr`/`$sPictureName`")|@getimagesize}]
                            <div class="carousel-item[{if $smarty.foreach.sMorePics.first}] active[{/if}]">
                                <div class="ratio ratio-1x1">
                                    [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                        <picture>
                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'webp')}]" media="(max-width: 375px)">

                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'webp')}]" media="(max-width: 767px)">
                                            <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'jpg')}]" media="(max-width: 767px)">

                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'webp')}]" media="(max-width: 991px)">
                                            <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'jpg')}]" media="(max-width: 991px)">

                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'webp')}]" media="(max-width: 1199px)">
                                            <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'jpg')}]" media="(max-width: 1199px)">

                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'webp')}]" media="(min-width: 1200px)">
                                            <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'jpg')}]" media="(min-width: 1200px)">

                                            <img loading="lazy" src="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'jpg')}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
                                        </picture>
                                    [{else}]
                                        <img loading="lazy" src="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
                                    [{/if}]
                                </div>
                            </div>
                        [{/foreach}]
                    </div>
                    [{if $imageCount > 1}]
                        <a class="carousel-control-prev" href="#details-slider" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden-focusable">[{oxmultilang ident="PREVIOUS"}]</span>
                        </a>
                        <a class="carousel-control-next" href="#details-slider" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden-focusable">[{oxmultilang ident="NEXT"}]</span>
                        </a>
                    [{/if}]
                    <div class="carousel-close" id="carousel-close">
                        <i class="moga-times"></i>
                    </div>
                </div>
                <script>
                    var elements = document.getElementsByClassName("details-thumb-img");
                    for (var i = 0; i < elements.length; i++) {
                        elements[i].addEventListener('click', function () {
                            var slider = document.getElementById('details-slider')
                            slider.classList.add('fullsize');
                        })
                    }

                    document.getElementById('carousel-close').addEventListener('click', function () {
                        var slider = document.getElementById('details-slider')
                        slider.classList.remove('fullsize');
                    });
                </script>
            [{else}]
                <div id="details-slider" class="carousel slide slide-only" data-ride="carousel" data-interval="false">
                    <div class="carousel-inner">
                        [{if $imageCount > 1}]
                        <ol class="carousel-indicators">
                            [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                            <li data-bs-target="#details-slider" data-bs-slide-to="[{$iPicNr-1}]"[{if $smarty.foreach.sMorePics.first}] class="active"[{/if}]></li>
                            [{/foreach}]
                        </ol>
                        [{/if}]
                        [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                            [{assign var="sPictureName" value=$oPictureProduct->getPictureFieldValue("oxpic", $iPicNr)}]
                            [{assign var="aPictureInfo" value=$oConfig->getMasterPicturePath("product/`$iPicNr`/`$sPictureName`")|@getimagesize}]
                            <div class="carousel-item[{if $smarty.foreach.sMorePics.first}] active[{/if}]">
                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                    <picture>
                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'webp')}]" media="(max-width: 375px)">

                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'webp')}]" media="(max-width: 767px)">
                                        <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'jpg')}]" media="(max-width: 767px)">

                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'webp')}]" media="(max-width: 991px)">
                                        <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'jpg')}]" media="(max-width: 991px)">

                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'webp')}]" media="(max-width: 1199px)">
                                        <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'jpg')}]" media="(max-width: 1199px)">

                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'webp')}]" media="(min-width: 1200px)">
                                        <source srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'jpg')}]" media="(min-width: 1200px)">

                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'jpg')}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
                                    </picture>
                                [{else}]
                                    <img loading="lazy" src="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]">
                                [{/if}]
                            </div>
                        [{/foreach}]
                    </div>
                    [{if $imageCount > 1}]
                        <a class="carousel-control-prev" href="#details-slider" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true">
                                <span class="moga-left"></span>
                            </span>
                            <span class="visually-hidden-focusable">[{oxmultilang ident="PREVIOUS"}]</span>
                        </a>
                        <a class="carousel-control-next" href="#details-slider" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true">
                                <span class="moga-right"></span>
                            </span>
                            <span class="visually-hidden-focusable">[{oxmultilang ident="NEXT"}]</span>
                        </a>
                    [{/if}]
                </div>
            [{/if}]

            [{/block}]

        </div>

        <div class="col-12 col-md-6 col-lg-4 col-xl-3">
            <div class="sticky-md-top">
                [{if $oManufacturer}]
                <div class="brandLogo d-none d-md-block">
                    [{block name="details_productmain_manufacturersicon"}]
                    <a href="[{$oManufacturer->getLink()}]" title="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                        [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                            <picture>
                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                    <source srcset="[{$oViewConf->getDynamicImage($oManufacturer->getIconUrl(), 100, '', '')}]" media="(min-width: 768px)">
                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oManufacturer->getIconUrl(), 100, '', 'webp')}]" media="(min-width: 768px)">
                                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                                [{else}]
                                    <source srcset="[{$oManufacturer->getIconUrl()}]" media="(min-width: 768px)">
                                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                                [{/if}]
                            </picture>
                        [{/if}]
                    </a>
                    [{/block}]
                </div>
                [{/if}]

                [{block name="details_productmain_title"}]
                    <h1 class="details-title">
                        [{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]
                    </h1>
                [{/block}]

                [{* article number *}]
                [{block name="details_productmain_artnumber"}]
                    <span class="small text-muted">[{oxmultilang ident="ARTNUM" suffix="COLON"}] [{$oDetailsProduct->oxarticles__oxartnum->value}]</span>
                [{/block}]

                [{* ratings *}]
                [{if $oView->ratingIsActive()}]
                    [{block name="details_productmain_ratings"}]
                        [{include file="widget/reviews/rating.tpl" itemid="anid=`$oDetailsProduct->oxarticles__oxnid->value`" sRateUrl=$oDetailsProduct->getLink()}]
                    [{/block}]
                [{/if}]

                [{* short description *}]
                [{block name="details_productmain_shortdesc"}]
                    [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                        [{if $oDetailsProduct->oxarticles__oxshortdesc->rawValue}]
                            <p class="details-shortdesc" id="productShortdesc">[{$oDetailsProduct->oxarticles__oxshortdesc->rawValue}]</p>
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]

                [{* article main info block *}]
                <div class="details-information">

                    [{* additional info *}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{assign var="oUnitPrice" value=$oDetailsProduct->getUnitPrice()}]
                        [{block name="details_productmain_priceperunit"}]
                            [{if $oUnitPrice}]
                                <div class="details-additional-information">
                                    <span id="productPriceUnit">[{oxprice price=$oUnitPrice currency=$currency}]/[{$oDetailsProduct->getUnitName()}]</span>
                                </div>
                            [{/if}]
                        [{/block}]
                    [{/oxhasrights}]

                    [{if $oDetailsProduct->oxarticles__oxweight->value}]
                        <div class="weight">
                            [{block name="details_productmain_weight"}]
                                [{oxmultilang ident="WEIGHT" suffix="COLON"}] [{$oDetailsProduct->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]
                            [{/block}]
                        </div>
                    [{/if}]

                    [{block name="details_productmain_vpe"}]
                        [{if $oDetailsProduct->oxarticles__oxvpe->value > 1}]
                            <span class="vpe small">[{oxmultilang ident="DETAILS_VPE_MESSAGE_1"}] [{$oDetailsProduct->oxarticles__oxvpe->value}] [{oxmultilang ident="DETAILS_VPE_MESSAGE_2"}]</span>
                        [{/if}]
                    [{/block}]

                    [{assign var="blCanBuy" value=true}]
                    [{* variants | md variants *}]
                    [{block name="details_productmain_variantselections"}]
                        [{if $aVariantSelections && $aVariantSelections.selections}]
                            [{*oxscript include="js/jquery.min.js" priority=4 }]
                            [{oxscript include="js/jquery-ui.js" priority=4 }]
                            [{*oxscript include="js/widgets/oxajax.min.js" priority=10 *}]
                            [{*oxscript include="js/widgets/oxarticlevariant.min.js" priority=10 *}]
                            [{*oxscript add="$( '#variants' ).oxArticleVariant();"*}]
                            [{oxscript include="js/variants.min.js" priority=11}]

                            [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
                            [{if !$blHasActiveSelections}]
                                [{if !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
                                    [{assign var="blCanBuy" value=true}]
                                [{/if}]
                            [{/if}]
                            <div id="variants" class="variant-dropdown">
                                [{assign var="blHasActiveSelections" value=false}]
                                [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
                                    [{if $oList->getActiveSelection()}]
                                        [{assign var="blHasActiveSelections" value=true}]
                                    [{/if}]
                                    [{include file="widget/product/buttons.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
                                [{/foreach}]
                            </div>
                        [{/if}]
                    [{/block}]
                </div>

                [{* selection lists *}]
                [{block name="details_productmain_selectlists"}]
                    [{if $oViewConf->showSelectLists()}]
                        [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
                        [{if $oSelections}]
                            <div class="variant-dropdown" id="productSelections">
                                [{foreach from=$oSelections item=oList name=selections}]
                                    [{include file="widget/product/selectbox.tpl" blSubmitOnChange=false oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                                [{/foreach}]
                            </div>
                        [{/if}]
                    [{/if}]
                [{/block}]

                <div class="price-wrapper h4 mb-3">
                    [{block name="details_productmain_tprice"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{if $oDetailsProduct->getTPrice()}]
                                <del class="small text-muted price-old">[{oxprice price=$oDetailsProduct->getTPrice() currency=$currency}]</del>
                            [{/if}]
                        [{/oxhasrights}]
                    [{/block}]

                    [{block name="details_productmain_watchlist"}][{/block}]

                    [{block name="details_productmain_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{block name="details_productmain_price_value"}]
                                [{if $oDetailsProduct->getFPrice()}]
                                    <div id="productPrice" class="price-label">
                                        [{assign var="sFrom" value=""}]
                                        [{assign var="oPrice" value=$oDetailsProduct->getPrice()}]
                                        [{if $oDetailsProduct->isParentNotBuyable()}]
                                            [{assign var="oPrice" value=$oDetailsProduct->getVarMinPrice()}]
                                            [{if $oDetailsProduct->isRangePrice()}]
                                                [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                                            [{/if}]
                                        [{/if}]
                                        <span[{if $oDetailsProduct->getTPrice()}] class="text-danger"[{/if}]>
                                            <span class="price-from">[{$sFrom}]</span>
                                            <span class="price">[{oxprice price=$oPrice currency=$currency}]</span>
                                            [{if $oView->isVatIncluded()}]
                                                <span class="price-markup">*</span>
                                            [{/if}]
                                        </span>
                                    </div>
                                [{/if}]
                            [{/block}]
                        [{/oxhasrights}]
                    [{/block}]
                </div>

                [{if $oDetailsProduct->loadAmountPriceInfo()}]
                [{include file="page/details/inc/priceinfo.tpl"}]
                [{/if}]

                <div class="tobasket">
                    [{* pers params *}]
                    [{block name="details_productmain_persparams"}]
                        [{if $oView->isPersParam()}]
                            <div class="mb-3">
                                <label for="persistentParam" class="form-label">[{oxmultilang ident="LABEL"}]</label>
                                <input type="text" id="persistentParam" name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text}]" size="35" class="form-control">
                            </div>
                        [{/if}]
                    [{/block}]

                    [{block name="details_productmain_stockstatus"}]
                    <small class="stockFlag">
                        [{if $oDetailsProduct->getStockStatus() == -1}]
                        <span class="text-danger">●</span>
                        [{if $oDetailsProduct->oxarticles__oxnostocktext->value}]
                        [{$oDetailsProduct->oxarticles__oxnostocktext->value}]
                        [{elseif $oViewConf->getStockOffDefaultMessage()}]
                        [{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]
                        [{/if}]
                        [{if $oDetailsProduct->getDeliveryDate()}]
                        [{oxmultilang ident="AVAILABLE_ON"}] [{$oDetailsProduct->getDeliveryDate()}]
                        [{/if}]
                        [{elseif $oDetailsProduct->getStockStatus() == 1}]
                        <span class="text-warning">●</span> [{oxmultilang ident="LOW_STOCK"}]
                        [{elseif $oDetailsProduct->getStockStatus() == 0}]
                        <span class="text-success">●</span>
                        [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
                        [{$oDetailsProduct->oxarticles__oxstocktext->value}]
                        [{elseif $oViewConf->getStockOnDefaultMessage()}]
                        [{oxmultilang ident="READY_FOR_SHIPPING"}]
                        [{/if}]
                        [{/if}]
                    </small>
                    [{/block}]

                    [{block name="details_productmain_deliverytime"}]
                        [{oxhasrights ident="TOBASKET"}]
                        [{if $oDetailsProduct->isBuyable()}]
                        [{include file="page/details/inc/deliverytime.tpl"}]
                        [{/if}]
                        [{/oxhasrights}]
                    [{/block}]

                    [{block name="details_productmain_tobasket"}]
                        [{oxhasrights ident="TOBASKET"}]
                        [{if !$oDetailsProduct->isNotBuyable()}]
                            <div class="tobasket-function my-3 my-lg-5 d-grid">
                                <input id="amountToBasket" type="hidden" name="am" value="1">
                                <button id="toBasket" type="submit"[{if !$blCanBuy}] disabled[{/if}] class="btn btn-primary btn-lg">[{oxmultilang ident="TO_CART"}]</button>
                            </div>
                        [{/if}]
                        [{/oxhasrights}]
                    [{/block}]

                    [{block name="details_productmain_productlinksselector"}]
                    [{block name="details_productmain_productlinks"}]
                    <div class="row g-1 product-links">

                        [{if $oViewConf->getShowCompareList()}]
                        <div class="col-md-6">
                            [{oxid_include_dynamic file="page/details/inc/compare_links.tpl" testid="" type="compare" aid=$oDetailsProduct->oxarticles__oxid->value anid=$oDetailsProduct->oxarticles__oxnid->value in_list=$oDetailsProduct->isOnComparisonList() page=$oView->getActPage() text_to_id="COMPARE" text_from_id="REMOVE_FROM_COMPARE_LIST"}]
                        </div>
                        [{/if}]

                        [{if $oViewConf->getShowSuggest()}]
                        <div class="col-md-6">
                            <a class="btn btn-sm btn-light w-100" id="suggest" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=suggest" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="RECOMMEND"}]</a>
                        </div>
                        [{/if}]

                        <div class="col-md-6">
                            [{if $oxcmp_user}]
                            <a class="btn btn-sm btn-light w-100" id="linkToNoticeList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">[{oxmultilang ident="ADD_TO_WISH_LIST"}]</a>
                            [{else}]
                            <a class="btn btn-sm btn-light w-100" id="loginToNotice" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="ADD_TO_WISH_LIST"}]</a>
                            [{/if}]
                        </div>

                        [{if $oViewConf->getShowWishlist()}]
                            <div class="col-md-6">
                                [{if $oxcmp_user}]
                                <a class="btn btn-sm btn-light w-100" id="linkToWishList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">[{oxmultilang ident="ADD_TO_GIFT_REGISTRY"}]</a>
                                [{else}]
                                <a class="btn btn-sm btn-light w-100" id="loginToWish" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="ADD_TO_GIFT_REGISTRY"}]</a>
                                [{/if}]
                            </div>
                        [{/if}]

                        <div class="col-md-6">
                            [{mailto extra='id="questionMail" class="btn btn-sm btn-light w-100"' address=$oDetailsProduct->oxarticles__oxquestionemail->value|default:$oxcmp_shop->oxshops__oxinfoemail->value subject='QUESTIONS_ABOUT_THIS_PRODUCT'|oxmultilangassign|cat:" "|cat:$oDetailsProduct->oxarticles__oxartnum->value text='QUESTIONS_ABOUT_THIS_PRODUCT'|oxmultilangassign}]
                        </div>
                    </div>
                    [{/block}]
                    [{/block}]

                    [{block name="details_productmain_social"}][{/block}]
                </div>
            </div>
        </div>
    </div>
</div>
[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]
