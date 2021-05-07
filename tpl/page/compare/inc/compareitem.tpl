<div class="item compare-item">
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]

    <div class="row picture">
        <div class="col-12">
            <a href="[{$_productLink}]" [{if $oView->noIndex()}]rel="nofollow"[{/if}]>
                <img src="[{if $size=='big'}][{$product->getPictureUrl(1)}][{elseif $size=='thinest'}][{$product->getIconUrl()}][{else}][{$product->getThumbnailUrl()}][{/if}]" alt="[{$product->oxarticles__oxtitle->value|strip_tags}] [{$product->oxarticles__oxvarselect->value|default:''}]" class="img-fluid">
            </a>
        </div>
    </div>

    <strong class="title">
        <a class="fn" href="[{$_productLink}]" [{if $oView->noIndex()}]rel="nofollow"[{/if}]>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</a>
    </strong>

    <span class="identifier">
        [{if $product->oxarticles__oxweight->value}]
            <div>
                <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
            </div>
        [{/if}]
        <small class="text-muted" title="sku">[{oxmultilang ident="PRODUCT_NO" suffix="COLON"}]</small>
        <small class="value text-muted">[{$product->oxarticles__oxartnum->value}]</small>
    </span>

    [{if $size=='thin' || $size=='thinest'}]
        <span class="flag [{if $product->getStockStatus() == -1}]red[{elseif $product->getStockStatus() == 1}]orange[{elseif $product->getStockStatus() == 0}]green[{/if}]">&nbsp;</span>
    [{/if}]

    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket.[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        <div class="variants">
            [{oxhasrights ident="TOBASKET"}]
                [{if $blShowToBasket}]
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
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
                    [{if $recommid}]
                        <input type="hidden" name="recommid" value="[{$recommid}]">
                    [{/if}]
                    <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
                [{/if}]
            [{/oxhasrights}]
        </div>

        <div class="tobasket add-to-basket">
            <div class="tobasketFunction">
                <div class="price h5[{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}] sale[{/if}]">
                    [{block name="widget_product_listitem_grid_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                            [{assign var="tprice"     value=$product->getTPrice()}]
                            [{assign var="price"      value=$product->getPrice()}]

                            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                <span class="oldPrice text-muted">
                                    <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                </span>
                            [{/if}]

                            [{block name="widget_product_listitem_grid_price_value"}]
                                [{if $product->getFPrice()}]
                                    <span class="text-nowrap[{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}] text-danger[{/if}]">
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
                                [{/if}]
                            [{/block}]

                            [{if $oUnitPrice}]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]
                                </span>
                            [{elseif $product->oxarticles__oxweight->value }]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                    <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                                </span>
                            [{/if}]
                        [{/oxhasrights}]
                    [{/block}]
                </div>

                [{if $blShowToBasket}]
                    [{oxhasrights ident="TOBASKET"}]
                        <div class="input-group">
                            <input type="hidden" name="am">
                            <button type="submit" class="btn btn-primary" title="[{oxmultilang ident="TO_CART"}]">
                                <i class="moga-bag"></i>
                            </button>
                        </div>
                    [{/oxhasrights}]
                [{else}]
                    <span >
                        <a id="variantMoreInfo_[{$testid}]" class="btn btn-primary w-100" href="[{$_productLink}]" onclick="oxid.mdVariants.getMdVariantUrl('mdVariant_[{$testid}]'); return false;">[{oxmultilang ident="MORE_INFO"}]</a>
                    </span>
                [{/if}]
            </div>

            [{* additional info *}]
            <div class="additionalInfo">
                [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                [{if $oUnitPrice}]
                    <span id="productPriceUnit">[{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]</span>
                [{/if}]

                [{*if $product->getStockStatus() == -1}]
                    <span class="stockFlag notOnStock">
                        [{if $product->oxarticles__oxnostocktext->value}]
                            [{$product->oxarticles__oxnostocktext->value}]
                        [{elseif $oViewConf->getStockOffDefaultMessage()}]
                            <span class="text-danger">[{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]</span>
                        [{/if}]
                        [{if $product->getDeliveryDate()}]
                            <span class="text-info">[{oxmultilang ident="AVAILABLE_ON"}] [{$product->getDeliveryDate()}]</span>
                        [{/if}]
                    </span>
                [{elseif $product->getStockStatus() == 1}]
                    <span class="stockFlag lowStock">
                        <span class="text-warning">[{oxmultilang ident="LOW_STOCK"}]</span>
                    </span>
                [{elseif $product->getStockStatus() == 0}]
                    <span class="stockFlag">
                        [{if $product->oxarticles__oxstocktext->value}]
                            [{$product->oxarticles__oxstocktext->value}]
                        [{elseif $oViewConf->getStockOnDefaultMessage()}]
                            <span class="text-success">[{oxmultilang ident="READY_FOR_SHIPPING"}]</span>
                        [{/if}]
                    </span>
                [{/if*}]
            </div>

        </div>

    </form>

    <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            <input type="hidden" name="fnc" value="tocomparelist">
            <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
            <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            <input type="hidden" name="pgNr" value="0">
            <input type="hidden" name="am" value="1">
            <input type="hidden" name="removecompare" value="1">
        [{oxhasrights ident="TOBASKET"}]
            <button class="btn btn-outline-dark btn-sm" id="remove_cmp_[{$product->oxarticles__oxid->value}]" type="submit" title="[{oxmultilang ident="REMOVE"}]" name="send">
                <i class="moga-trash"></i> [{oxmultilang ident="REMOVE"}]
            </button>
        [{/oxhasrights}]
    </form>
</div>
