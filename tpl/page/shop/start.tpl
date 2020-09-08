[{capture append="oxidBlock_content"}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
    [{assign var='rsslinks' value=$oView->getRssLinks()}]
    [{*oxscript include="js/start.min.js"*}]

    [{block name="start_promoslider"}]
        [{if $oView->getBanners() && !empty($oView->getBanners())}]
            [{include file="widget/promoslider.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="start_welcome_text"}]
        [{oxifcontent ident="oxstartwelcome" object="oCont"}]
            <div class="welcome-teaser">[{$oCont->oxcontents__oxcontent->value}]</div>
        [{/oxifcontent}]
    [{/block}]


    [{block name="start_bargain_articles"}]
        [{assign var="oBargainArticles" value=$oView->getBargainArticleList()}]
        [{assign var="bargainWidth" value=$oViewConf->getViewThemeParam('sBargainWidth')}]
        [{assign var="showBargain" value=$oViewConf->getViewThemeParam('sShowBargain')}]
        [{if $showBargain}]
            [{if $oBargainArticles && $oBargainArticles->count()}]
                [{if $bargainWidth == 'container'}]
                    <div class="container-xxl">
                [{/if}]
                        <section class="products products-bargain">
                            <div class="container[{if $bargainWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                                [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="START_BARGAIN_HEADER"|oxmultilangassign subhead="START_BARGAIN_SUBHEADER"|oxmultilangassign listId="bargainItems" products=$oBargainArticles rsslink=$rsslinks.bargainArticles rssId="rssBargainProducts" showMainLink=true iProductsPerLine=4}]
                            </div>
                        </section>
                [{if $bargainWidth == 'container'}]
                    </div>
                [{/if}]
            [{/if}]
        [{/if}]
    [{/block}]

    [{block name="start_manufacturer_slider"}]
        [{if $oViewConf->getViewThemeParam('bl_showManufacturer')}]
            [{include file="widget/manufacturer.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="start_newest_articles"}]
        [{assign var="oNewestArticles" value=$oView->getNewestArticles()}]
        [{assign var="newestWidth" value=$oViewConf->getViewThemeParam('sNewestWidth')}]
        [{assign var="showNewest" value=$oViewConf->getViewThemeParam('sShowNewest')}]
        [{if $showNewest}]
            [{if $oNewestArticles && $oNewestArticles->count()}]
                [{if $newestWidth == 'container'}]
                    <div class="container-xxl">
                [{/if}]
                        <section class="products products-newest">
                            <div class="container[{if $newestWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                                [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head="START_NEWEST_HEADER"|oxmultilangassign subhead="START_NEWEST_SUBHEADER"|oxmultilangassign listId="newItems" products=$oNewestArticles rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true iProductsPerLine=4}]
                            </div>
                        </section>
                [{if $newestWidth == 'container'}]
                    </div>
                [{/if}]
            [{/if}]
        [{/if}]
    [{/block}]

    [{block name="start_top_articles"}]
        [{assign var="oTopArticles" value=$oView->getTop5ArticleList()}]
        [{assign var="topWidth" value=$oViewConf->getViewThemeParam('sTopWidth')}]
        [{assign var="showTop" value=$oViewConf->getViewThemeParam('sShowTop')}]
        [{if $showTop}]
            [{if $oTopArticles && $oTopArticles->count()}]
                [{if $topWidth == 'container'}]
                    <div class="container-xxl">
                [{/if}]
                        <section class="products products-top">
                            <div class="container[{if $topWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                                [{include file="widget/product/list.tpl" type="grid" head="START_TOP_PRODUCTS_HEADER"|oxmultilangassign subhead="START_TOP_PRODUCTS_SUBHEADER"|oxmultilangassign:$oTopArticles->count() listId="topBox" products=$oTopArticles rsslink=$rsslinks.topArticles rssId="rssTopProducts" showMainLink=true iProductsPerLine=2}]
                            </div>
                        </section>
                [{if $topWidth == 'container'}]
                    </div>
                [{/if}]
            [{/if}]
        [{/if}]
    [{/block}]
[{/capture}]
[{include file="layout/page.tpl"}]
