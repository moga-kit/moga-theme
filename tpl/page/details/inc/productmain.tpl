[{*oxscript include="js/details.min.js" priority=10*}]

[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{assign var="oManufacturer" value=$oView->getManufacturer()}]
[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]

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
        <div class="hidden">
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
        </div>
[{/oxhasrights}]

<div class="details-top container-fluid">
    <div class="row row-cols-md-2">
        <div class="col-12 col-md-6 col-lg-8 col-xl-9">
            [{* article picture with zoom *}]
            [{block name="details_productmain_zoom"}]
                <div class="row g-1">
                    [{assign var="colClass" value='col-6'}]

                    [{assign var="imageCount" value=$oView->getIcons()|@count}]
                    [{if $imageCount == 1}]
                        [{assign var="colClass" value='col-12'}]
                    [{/if}]
                    [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                        [{if $smarty.foreach.sMorePics.iteration > 2}]
                            [{assign var="colClass" value='col-6 col-md-3'}]
                        [{/if}]
                        <div data-target="#details-slider" data-slide-to="[{$iPicNr-1}]" class="[{$colClass}] d-none d-md-block details-thumb">
                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                            <picture>
                                <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, 375, 'webp')}]" media="(max-width: 375px)">
                                <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, 375, 'jpg')}]" media="(max-width: 375px)">

                                <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, 750, 'webp')}]" media="(max-width: 767px)">
                                <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, 750, 'jpg')}]" media="(max-width: 767px)">


                                [{if $imageCount == 1}]
                                    <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 660, 660, 'webp')}]" media="(max-width: 991px)">
                                    <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 660, 660, 'jpg')}]" media="(max-width: 991px)">

                                    <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 770, 770, 'webp')}]" media="(max-width: 1199px)">
                                    <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 770, 770, 'jpg')}]" media="(max-width: 1199px)">

                                    <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1200, 1200, 'webp')}]">
                                    <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1200, 1200, 'jpg')}]">
                                [{else}]
                                    [{if $smarty.foreach.sMorePics.iteration > 2}]
                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 114, 114, 'webp')}]" media="(max-width: 991px)">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 114, 114, 'jpg')}]" media="(max-width: 991px)">

                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 190, 190, 'webp')}]" media="(max-width: 1199px)">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 190, 190, 'jpg')}]" media="(max-width: 1199px)">

                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 300, 300, 'webp')}]">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 300, 300, 'jpg')}]">
                                    [{else}]
                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 230, 230, 'webp')}]" media="(max-width: 991px)">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 230, 230, 'jpg')}]" media="(max-width: 991px)">

                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 440, 440, 'webp')}]" media="(max-width: 1199px)">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 440, 440, 'jpg')}]" media="(max-width: 1199px)">

                                        <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 600, 600, 'webp')}]">
                                        <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 600, 600, 'jpg')}]">
                                    [{/if}]
                                [{/if}]
                                <img class="details-thumb-img lazyload" data-src="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, 375, 'jpg')}]" alt="morepic-[{$smarty.foreach.sMorePics.iteration}]">
                            </picture>
                            [{else}]
                                <img class="details-thumb-img lazyload" data-src="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" alt="morepic-[{$smarty.foreach.sMorePics.iteration}]">
                            [{/if}]
                        </div>
                    [{/foreach}]
                </div>
                <div id="details-slider" class="carousel slide" data-ride="carousel" data-interval="false">
                    <div class="carousel-inner">
                        [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
                            [{assign var="sPictureName" value=$oPictureProduct->getPictureFieldValue("oxpic", $iPicNr)}]
                            [{assign var="aPictureInfo" value=$oConfig->getMasterPicturePath("product/`$iPicNr`/`$sPictureName`")|@getimagesize}]
                            <div class="carousel-item[{if $smarty.foreach.sMorePics.first}] active[{/if}]">
                                <div class="embed-responsive embed-responsive-1by1">
                                    <div class="embed-responsive-item">
                                        [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                        <picture>
                                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'webp')}]" media="(max-width: 375px)">
                                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'jpg')}]" media="(max-width: 375px)">

                                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'webp')}]" media="(max-width: 767px)">
                                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 750, '', 'jpg')}]" media="(max-width: 767px)">

                                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'webp')}]" media="(max-width: 991px)">
                                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 970, '', 'jpg')}]" media="(max-width: 991px)">

                                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'webp')}]" media="(max-width: 1199px)">
                                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1170, '', 'jpg')}]" media="(max-width: 1199px)">

                                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'webp')}]">
                                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 1600, '', 'jpg')}]">

                                            <img data-src="[{$oViewConf->getDynamicImage($oPictureProduct->getMasterZoomPictureUrl($iPicNr), 375, '', 'webp')}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]" class="lazyload w-100 img-fluid">
                                        </picture>
                                        [{else}]
                                            <img data-src="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" alt="[{$oPictureProduct->oxarticles__oxtitle->value|strip_tags}] [{$oPictureProduct->oxarticles__oxvarselect->value|strip_tags}]" class="img-fluid lazyload">
                                        [{/if}]
                                    </div>
                                </div>
                            </div>
                        [{/foreach}]
                    </div>
                    [{if $imageCount > 1}]
                    <a class="carousel-control-prev" href="#details-slider" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#details-slider" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    [{/if}]
                    <div class="carousel-close" id="carousel-close">
                        <i class="moga-times"></i>
                    </div>
                </div>
            [{/block}]
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
        </div>

        <div class="col-12 col-md-6 col-lg-4 col-xl-3">
            [{if $oManufacturer}]
            <div class="brandLogo">
                [{block name="details_productmain_manufacturersicon"}]
                <a href="[{$oManufacturer->getLink()}]" title="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                    [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
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
                        [{oxscript include="js/jquery-ui.js" priority=4 *}]
                        [{oxscript include="js/details.min.js" priority=11 }]
                        [{*oxscript include="js/widgets/oxajax.min.js" priority=10 *}]
                        [{*oxscript include="js/widgets/oxarticlevariant.min.js" priority=10 *}]
                        [{*oxscript add="$( '#variants' ).oxArticleVariant();"*}]

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
                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                            [{/foreach}]
                        </div>
                    [{/if}]
                [{/if}]
            [{/block}]

            <div class="price-wrapper">
                [{block name="details_productmain_tprice"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{if $oDetailsProduct->getTPrice()}]
                            <del class="price-old">[{oxprice price=$oDetailsProduct->getTPrice() currency=$currency}]</del>
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]

                [{block name="details_productmain_watchlist"}][{/block}]

                [{block name="details_productmain_price"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{block name="details_productmain_price_value"}]
                            [{if $oDetailsProduct->getFPrice()}]
                                <label id="productPrice" class="price-label">
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
                                </label>
                            [{/if}]
                            [{if $oDetailsProduct->loadAmountPriceInfo()}]
                                [{include file="page/details/inc/priceinfo.tpl"}]
                            [{/if}]
                        [{/block}]
                    [{/oxhasrights}]
                [{/block}]
            </div>

            <div class="tobasket">
                [{* pers params *}]
                [{block name="details_productmain_persparams"}]
                    [{if $oView->isPersParam()}]
                        <div class="form-group">
                            <label for="persistentParam" class="control-label">[{oxmultilang ident="LABEL"}]</label>
                            <input type="text" id="persistentParam" name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text}]" size="35" class="form-control">
                        </div>
                    [{/if}]
                [{/block}]

                [{block name="details_productmain_tobasket"}]
                    <div class="tobasket-function my-5">
                        [{oxhasrights ident="TOBASKET"}]
                            [{if !$oDetailsProduct->isNotBuyable()}]
                                <input id="amountToBasket" type="hidden" name="am" value="1">
                                <button id="toBasket" type="submit" [{if !$blCanBuy}]disabled="disabled"[{/if}] class="btn btn-primary btn-block btn-lg submitButton">[{oxmultilang ident="TO_CART"}]</button>
                            [{/if}]
                        [{/oxhasrights}]
                    </div>
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

                [{oxhasrights ident="TOBASKET"}]
                    [{if $oDetailsProduct->isBuyable()}]
                        [{block name="details_productmain_deliverytime"}]
                            [{include file="page/details/inc/deliverytime.tpl"}]
                        [{/block}]
                    [{/if}]
                [{/oxhasrights}]

                [{block name="details_productmain_social"}]
                [{/block}]
            </div>
        </div>


        <div class="col-12 col-sm-4 col-md-3 col-lg-2 details-col-right">


            [{block name="details_productmain_productlinksselector"}]
                [{block name="details_productmain_productlinks"}]
                    <ul class="list-unstyled details-action-links">

                        [{if $oViewConf->getShowCompareList()}]
                            <li>
                                [{oxid_include_dynamic file="page/details/inc/compare_links.tpl" testid="" type="compare" aid=$oDetailsProduct->oxarticles__oxid->value anid=$oDetailsProduct->oxarticles__oxnid->value in_list=$oDetailsProduct->isOnComparisonList() page=$oView->getActPage() text_to_id="COMPARE" text_from_id="REMOVE_FROM_COMPARE_LIST"}]
                            </li>
                        [{/if}]


                        [{if $oViewConf->getShowSuggest()}]
                            <li>
                                <a id="suggest" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=suggest" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="RECOMMEND"}]</a>
                            </li>
                        [{/if}]


                        [{if $oViewConf->getShowListmania()}]
                            <li>
                                [{if $oxcmp_user}]
                                    <a id="recommList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=recommadd" params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">[{oxmultilang ident="ADD_TO_LISTMANIA_LIST"}]</a>
                                [{else}]
                                    <a id="loginToRecommlist" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="ADD_TO_LISTMANIA_LIST"}]</a>
                                [{/if}]
                            </li>
                        [{/if}]

                        <li>
                            [{if $oxcmp_user}]
                                <a id="linkToNoticeList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">[{oxmultilang ident="ADD_TO_WISH_LIST"}]</a>
                            [{else}]
                                <a id="loginToNotice" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="ADD_TO_WISH_LIST"}]</a>
                            [{/if}]
                        </li>

                        [{if $oViewConf->getShowWishlist()}]
                            <li>
                                [{if $oxcmp_user}]
                                    <a id="linkToWishList" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken()}]">[{oxmultilang ident="ADD_TO_GIFT_REGISTRY"}]</a>
                                [{else}]
                                    <a id="loginToWish" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="ADD_TO_GIFT_REGISTRY"}]</a>
                                [{/if}]
                            </li>
                        [{/if}]

                        <li>
                            [{mailto extra='id="questionMail"' address=$oDetailsProduct->oxarticles__oxquestionemail->value|default:$oxcmp_shop->oxshops__oxinfoemail->value subject='QUESTIONS_ABOUT_THIS_PRODUCT'|oxmultilangassign|cat:" "|cat:$oDetailsProduct->oxarticles__oxartnum->value text='QUESTIONS_ABOUT_THIS_PRODUCT'|oxmultilangassign}]
                        </li>
                    </ul>
                [{/block}]
            [{/block}]
        </div>
    </div>
</div>

[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]
