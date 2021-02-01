[{*[{oxscript add="$('a.js-external').attr('target', '_blank');"}]*}]
[{capture append="oxidBlock_content"}]
    [{assign var="search_title" value="SEARCH"|oxmultilangassign}]
    [{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml()}]
    [{assign var="template_title" value="$search_title - $searchparamforhtml"}]
    [{assign var="search_head" value="HITS_FOR"|oxmultilangassign}]
    [{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]


    [{if $blSuggestionTemplate}]
        [{* SEARCHSUGGESTIONS *}]
        <div id="searchSuggestions" class="extendedsearch suggestions-wrapper container-xl">
            [{*include file="suggestions.tpl" oCategories=$oView->getCategoryList()*}]
            [{assign var="oConfig" value=$oViewConf->getConfig()}]
            [{assign var="iShowMaxProductSuggestions" value=$oConfig->getConfigParam('iShowMaxProductSuggestions')}]
            [{assign var="iShowMaxCategorySuggestions" value=$oConfig->getConfigParam('iShowMaxCategorySuggestions')}]
            [{assign var="iShowMaxContentSuggestions" value=$oConfig->getConfigParam('iShowMaxContentSuggestions')}]
            <div class="left">
                <div class="categories">
                    [{if $oView->getCategoryList()|@count}]
                        <ul class="list-group mb-3">
                            <li class="list-group-item bg-light" aria-disabled="true">[{oxmultilang ident="CATEGORIES"}]</li>
                            [{foreach from=$oView->getCategoryList() name=searchcats item=category}]
                                [{*include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="searchList" products=$oView->getArticleList() showMainLink=true*}]
                                <a class="list-group-item list-group-item-action" href="[{$category->getLink()}]">
                                    [{$category->getTitle()}]
                                </a>
                            [{/foreach}]


                            [{if $smarty.foreach.searchcats.total > $iShowMaxCategorySuggestions}]
                                <a href="#" class="list-group-item list-group-item-action strong">[{oxmultilang ident="CNC_EXTENDEDSEARCH_SHOW_ALL"}] ([{$smarty.foreach.searchcats.total}])</a>
                            [{/if}]
                        </ul>
                    [{/if}]
                </div>

                <div class="content">
                    [{if $oView->getContentList()|@count}]
                        <ul class="list-group mb-3">
                            <li class="list-group-item bg-light" aria-disabled="true">[{oxmultilang ident="CNC_EXTENDEDSEARCH_CONTENT"}]</li>
                            [{foreach from=$oView->getContentList() name=searchcontents item=content}]
                                <a href="[{$content->getLink()}]" class="list-group-item list-group-item-action">
                                     [{$content->getTitle()}]
                                </a>
                            [{/foreach}]

                            [{if $smarty.foreach.searchcontents.total > $iShowMaxContentSuggestions}]
                                <a href="#" class="list-group-item list-group-item-action strong">[{oxmultilang ident="CNC_EXTENDEDSEARCH_SHOW_ALL"}] ([{$smarty.foreach.searchcontents.total}])</a>
                            [{/if}]
                        </ul>
                    [{/if}]
                </div>
            </div>
            <div class="middle">
                <div class="articles">
                    <ul class="list-group">
                        <li class="list-group-item bg-light" aria-disabled="true">[{oxmultilang ident="PRODUCTS"}]</li>

                        [{if !$oView->getArticleCount()}]
                            <li class="list-group-item">[{oxmultilang ident="NO_ITEMS_FOUND"}]</li>
                        [{/if}]

                        [{if $oView->getArticleList()}]

                            [{foreach from=$oView->getArticleList() name=search item=product}]
                                [{*include file="widget/product/list.tpl" type='line' listId="searchList" products=$oView->getArticleList() showMainLink=true*}]
                                [{if $smarty.foreach.search.index < $iShowMaxProductSuggestions}]
                                    <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="list-group-item list-group-item-action list-group-item-product d-flex">
                                        [{assign var="oPCategory" value=$product->getCategory()}]
                                        <span class="picture">
                                            [{block name="widget_product_listitem_line_picturebox"}]
                                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                    <picture>
                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($product->getThumbnailUrl(), 80, 80, 'webp', true)}]">
                                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($product->getThumbnailUrl(), 80, 80, '', true)}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="img-fluid">
                                                    </picture>
                                                [{else}]
                                                    <img loading="lazy" src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-fluid">
                                                [{/if}]
                                            [{/block}]
                                        </span>
                                        <span class="content">
                                            <span class="cat">[{$oPCategory->oxcategories__oxtitle->value}]</span>
                                            [{block name="widget_product_listitem_line_titlebox"}]
                                            <span class="title text-truncate">
                                                [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
                                            </span>
                                            [{/block}]
                                            <span class="functions">
                                                [{block name="widget_product_listitem_line_price"}]
                                                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                                                        [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                                                        [{assign var="tprice"     value=$product->getTPrice()}]
                                                        [{assign var="price"      value=$product->getPrice()}]

                                                        [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                                            <span class="oldPrice text-muted">
                                                                <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                                            </span>
                                                        [{/if}]

                                                        [{block name="widget_product_listitem_line_price_value"}]
                                                            <span id="productPrice_[{$testid}]" class="price text-nowrap">
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
                                                            <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
                                                                [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]
                                                            </span>
                                                        [{elseif $product->oxarticles__oxweight->value }]
                                                            <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
                                                                <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                                                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                                                            </span>
                                                        [{/if}]
                                                    [{/oxhasrights}]
                                                [{/block}]
                                            </span>
                                        </span>
                                    </a>
                                [{/if}]
                            [{/foreach}]

                            [{if $smarty.foreach.search.total > $iShowMaxProductSuggestions}]
                                <a href="#" class="list-group-item list-group-item-action strong d-flex justify-content-between align-items-center">[{oxmultilang ident="CNC_EXTENDEDSEARCH_SHOW_ALL_PRODUCTS"}]
                                    <span class="badge bg-primary rounded-pill">[{$smarty.foreach.search.total}]</span>
                                </a>
                            [{/if}]
                        [{/if}]
                    </ul>
                </div>
            </div>
        </div>
        [{* ./ SEARCHSUGGESTIONS *}]
    [{else}]
        [{* SEARCHRESULT PAGE *}]
        <div class="page-header">
            [{block name="search_header"}]
            <h1 class="float-left">[{$search_head}]</h1>

            <div class="clearfix"></div>
            [{/block}]
        </div>

        [{block name="search_results"}]

            [{* CATEGORY SEARCH RESULTS *}]
            <div class="contentsearchresults">
                <h3>CATEGORYSEARCHRESULTS</h3>
                <ul>
                    <li>TODO</li>
                    <li>TODO</li>
                    <li>TODO</li>
                </ul>
            </div>
            [{* ./ CATEGORY SEARCH RESULTS *}]

            [{* CONTENT SEARCH RESULTS *}]
                <div class="contentsearchresults">
                    <h3>CONTENTSEARCHRESULTS</h3>
                    <ul>
                        <li>TODO</li>
                        <li>TODO</li>
                        <li>TODO</li>
                    </ul>
                </div>
            [{* ./ CONTENT SEARCH RESULTS *}]

            [{* ARTICLE SEARCH RESULTS *}]
            [{if $oView->getArticleCount()}]
                <div class="listRefine clear bottomRound">
                    [{block name="search_top_listlocator"}]
                        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() listDisplayType=true itemsPerPage=true sort=true}]
                    [{/block}]
                </div>
            [{else}]
                <p class="alert alert-info">[{oxmultilang ident="NO_ITEMS_FOUND"}]</p>
            [{/if}]

            [{if $oView->getArticleList()}]
                [{foreach from=$oView->getArticleList() name=search item=product}]
                    [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="searchList" products=$oView->getArticleList() showMainLink=true}]
                [{/foreach}]
            [{/if}]

            [{if $oView->getArticleCount()}]
                [{block name="search_bottom_listlocator"}]
                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
                [{/block}]
            [{/if}]

            [{* ./ ARTICLE SEARCH RESULTS *}]
        [{/block}]

        [{insert name="oxid_tracker" title=$template_title}]
    [{/if}]

[{/capture}]
[{assign var="template_title" value="SEARCH"|oxmultilangassign}]

[{include file="layout/page.tpl" title=$template_title location="SEARCH"|oxmultilangassign}]
