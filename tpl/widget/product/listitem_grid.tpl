[{block name="widget_product_listitem_grid"}]
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
    [{if $blDisableToCart || $product->isNotBuyable() || ($aVariantSelections&&$aVariantSelections.selections) || $product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <div class="card">
        [{block name="widget_product_listitem_grid_gridpicture"}]
            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                <picture class="card-picture">
                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($product->getMasterZoomPictureUrl(1), '160', '160', 'webp', true)}]" media="(max-width: 375px)">

                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($product->getMasterZoomPictureUrl(1), '300', '300', 'webp', true)}]">
                    <source srcset="[{$oViewConf->getDynamicImage($product->getMasterZoomPictureUrl(1), '300', '300', 'jpg', true)}]">
                    <img loading="lazy" width="300" height="300" src="[{$oViewConf->getDynamicImage($product->getMasterZoomPictureUrl(1), '160', '160', 'jpg', true)}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="product-img">
                </picture>
            [{else}]
                <img loading="lazy" width="300" height="300" src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="product-img">
            [{/if}]
        [{/block}]

        <div class="card-body">
            [{block name="widget_product_listitem_infogrid_titlebox"}]
                <div class="card-title">
                    [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
                </div>
            [{/block}]

            <div class="price[{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}] sale[{/if}]">
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
                                <span class="text-nowrap">
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
            <a href="[{$_productLink}]" class="stretched-link"></a>
            [{block name="widget_product_listitem_grid_tobasket"}][{/block}]
        </div>
    </div>
[{/block}]
