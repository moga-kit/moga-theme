[{oxscript include="js/listremovebutton.min.js" priority=10}]

[{block name="widget_product_listitem_line"}]
    [{assign var="product"         value=$oView->getProduct()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex"          value=$oView->getIndex()}]
    [{assign var="showMainLink"    value=$oView->getShowMainLink()}]

    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->getVariants()||($oViewConf->showSelectListsInList()&&$product->getSelections(1))}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket.[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        [{$oViewConf->getNavFormParams()}]
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
        [{if $recommid}]
            <input type="hidden" name="recommid" value="[{$recommid}]">
        [{/if}]
        [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                [{else}]
                    <input type="hidden" name="fnc" value="tobasket">
                [{/if}]
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{$altproduct}]">
                [{else}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
                <input id="am_[{$testid}]" type="hidden" name="am" value="1">
            [{/oxhasrights}]
        [{else}]
            <input type="hidden" name="cl" value="details">
            <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
        [{/if}]

        <div class="card mb-1">
            <div class="row g-0">
                <div class="col-3 col-lg-1">
                    [{block name="widget_product_listitem_line_picturebox"}]
                        <a class="d-block text-center py-2" href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                            <picture>
                                <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($product->getThumbnailUrl(), 80, 80, 'webp', true)}]">
                                <img loading="lazy" src="[{$oViewConf->getDynamicImage($product->getThumbnailUrl(), 80, 80, '', true)}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="card-img">
                            </picture>
                            [{else}]
                                <img loading="lazy" src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="card-img">
                            [{/if}]
                        </a>
                    [{/block}]
                </div>
                <div class="col-9 col-lg-11">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-md-8 order-md-1 col-lg-5">
                                [{block name="widget_product_listitem_line_titlebox"}]
                                    <a class="h5 card-title" href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</a>
                                [{/block}]

                                [{block name="widget_product_listitem_line_description"}]
                                <div class="card-text">
                                    [{if $recommid}]
                                    [{$product->text}]
                                    [{else}]
                                    [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                                    [{$product->oxarticles__oxshortdesc->rawValue}]
                                    [{/oxhasrights}]
                                    [{/if}]
                                </div>
                                [{/block}]
                            </div>
                            <div class="d-none d-lg-block order-lg-3 col-lg-5">
                                [{block name="widget_product_listitem_line_attributes"}]
                                <div class="attributes">
                                    [{assign var="oAttributes" value=$product->getAttributes()}]
                                    [{if $oAttributes|@count}]
                                    <ul class="list-unstyled attributes small">
                                        [{foreach from=$oAttributes item="oAttr" name="attribute"}]
                                        <li>
                                            <strong>[{$oAttr->oxattribute__oxtitle->value}][{oxmultilang ident="COLON"}]</strong>
                                            <span>[{$oAttr->oxattribute__oxvalue->value}]</span>
                                        </li>
                                        [{/foreach}]
                                    </ul>
                                    [{/if}]
                                </div>
                                [{/block}]
                            </div>
                            <div class="d-none d-md-block col-md-4 order-md-2 col-lg-2 order-lg-4">
                                <div class="functions text-end">
                                    [{block name="widget_product_listitem_line_price"}]
                                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                                        [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                                        [{assign var="tprice"     value=$product->getTPrice()}]
                                        [{assign var="price"      value=$product->getPrice()}]

                                        <div class="price h5[{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}] sale[{/if}]">
                                            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                            <span class="oldPrice text-muted">
                                                <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                            </span>
                                            [{/if}]

                                            [{block name="widget_product_listitem_line_price_value"}]
                                            <span id="productPrice_[{$testid}]" class="text-nowrap[{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}] text-danger[{/if}]">
                                                [{if $product->isRangePrice()}]
                                                    [{oxmultilang ident="PRICE_FROM"}]
                                                    [{if !$product->isParentNotBuyable()}]
                                                        [{$product->getFMinPrice()}]
                                                    [{else}]
                                                        [{$product->getFVarMinPrice()}]
                                                    [{/if}]
                                                [{else}]
                                                    [{if !$product->isParentNotBuyable()}]
                                                        [{$product->getFPrice()}]
                                                    [{else}]
                                                        [{$product->getFVarMinPrice()}]
                                                    [{/if}]
                                                [{/if}]
                                                [{$currency->sign}]
                                                [{if $oView->isVatIncluded()}]
                                                    [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                                                [{/if}]
                                            </span>
                                            [{/block}]

                                            [{if $oUnitPrice}]
                                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">[{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]</span>
                                            [{elseif $product->oxarticles__oxweight->value }]
                                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
                                                    <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                                    <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                                                </span>
                                            [{/if}]
                                        </div>
                                        [{/oxhasrights}]
                                    [{/block}]

                                    [{if $product->loadAmountPriceInfo()}]
                                    <div class="mb-3">
                                        [{include file="page/details/inc/priceinfo.tpl" oDetailsProduct=$product}]
                                    </div>
                                    [{/if}]

                                    [{block name="widget_product_listitem_line_selections"}]
                                    [{if $aVariantSelections && $aVariantSelections.selections }]
                                    <div id="variantselector_[{$iIndex}]" class="selectorsBox variant-dropdown">
                                        [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList blHideLabel=true}]
                                        [{/foreach}]
                                    </div>
                                    [{elseif $oViewConf->showSelectListsInList()}]
                                    [{assign var="oSelections" value=$product->getSelections(1)}]
                                    [{if $oSelections}]
                                    <div id="selectlistsselector_[{$iIndex}]" class="selectorsBox">
                                        [{foreach from=$oSelections item=oList name=selections}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop" blHideLabel=true}]
                                        [{/foreach}]
                                    </div>
                                    [{/if}]
                                    [{/if}]
                                    [{/block}]

                                    [{block name="widget_product_listitem_line_tobasket"}]
                                    [{if $blShowToBasket}]
                                    [{oxhasrights ident="TOBASKET"}]
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <input id="amountToBasket_[{$testid}]" type="text" name="am" value="1" size="3" autocomplete="off" class="form-control amount">
                                            <button id="toBasket_[{$testid}]" type="submit" aria-label="[{oxmultilang ident="TO_CART"}]" class="btn btn-primary" data-container="body">
                                                <i class="moga-bag"></i>
                                            </button>
                                            [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                                            <button data-triggerForm="remove_[{$removeFunction}][{$testid}]" type="submit" class="btn btn-light removeButton listRemoveButton">
                                                <i class="moga-times"></i>
                                            </button>
                                            [{/if}]
                                        </div>
                                    </div>
                                    [{/oxhasrights}]
                                    [{else}]
                                    <a class="btn btn-primary" href="[{$_productLink}]">[{oxmultilang ident="MORE_INFO"}]</a>

                                    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                                    <button triggerForm="remove_[{$removeFunction}][{$testid}]" type="submit" class="btn btn-danger btn-block removeButton">
                                        <i class="moga-times"></i> [{oxmultilang ident="REMOVE"}]
                                    </button>
                                    [{/if}]
                                    [{/if}]
                                    [{/block}]
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="remove_[{$removeFunction}][{$testid}]">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="fnc" value="[{$removeFunction}]">
            <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
            <input type="hidden" name="am" value="0">
            <input type="hidden" name="itmid" value="[{$product->getItemKey()}]">
            [{if $recommid}]
                <input type="hidden" name="recommid" value="[{$recommid}]">
            [{/if}]
        </form>
    [{/if}]
[{/block}]
