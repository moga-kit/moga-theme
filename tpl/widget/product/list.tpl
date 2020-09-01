[{if !$type}]
    [{assign var="type" value="grid"}]
[{/if}]

<div class="boxwrapper" id="boxwrapper_[{$listId}]">
    [{if $head}]
        [{if $header == "light"}]
            <div class="page-header">
                <span class="h3">[{$head}]</span>

                [{if $subhead}]
                    <small class="subhead">[{$subhead}]</small>
                [{/if}]
            </div>
        [{else}]
            <div class="page-header">
                <h2 class="h2">
                    [{$head}]
                    [{if $rsslink}]
                        <a class="rss" id="[{$rssId}]" aria-label="RSS" href="[{$rsslink.link}]" target="_blank">
                            <i class="moga-rss"></i>
                        </a>
                    [{/if}]
                </h2>

                [{if $subhead}]
                    <small class="subhead">[{$subhead}]</small>
                [{/if}]
            </div>
        [{/if}]
    [{/if}]

    [{if $products && !empty($products)}]
        [{assign var="categoryWidth" value=$oViewConf->getViewThemeParam('sCategoryWidth')}]
        [{if $categoryWidth != 'w100c100'}]
            [{assign var="colClass" value='row-cols-2 row-cols-md-3 row-cols-lg-3 row-cols-xxl-4'}]
        [{else}]
            [{assign var="colClass" value='row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xxl-5'}]
        [{/if}]

        <div class="list-container" id="[{$listId}]">
            <div class="row[{if $type != 'line'}] [{$colClass}][{/if}] [{$type}]-view justify-content-center">
            [{foreach from=$products item="_product" name="productlist"}]
                [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

                [{if $type != 'line'}]
                <div class="col my-2 my-md-3 my-lg-4 my-xl-5">
                [{/if}]

                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]

                [{if $type != 'line'}]
                </div>
                [{/if}]

            [{/foreach}]
            </div>
        </div>
    [{/if}]
</div>
