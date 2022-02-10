[{*[{oxscript add="$('a.js-external').attr('target', '_blank');"}]*}]
[{capture append="oxidBlock_content"}]
    [{assign var="search_title" value="SEARCH"|oxmultilangassign}]
    [{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml()}]
    [{assign var="template_title" value="$search_title - $searchparamforhtml"}]
    [{assign var="search_head" value="HITS_FOR"|oxmultilangassign}]
    [{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]
    [{assign var="showPopBreadcrump" value=$oViewConf->getViewThemeParam('sShowPopBreadcrump')}]

    <div class="bg-light position-relative">
        [{block name="search_header"}]
            <div class="container-xxl">
                [{if $showPopBreadcrump}]
                    <div class="breadcrumb-wrapper">
                        <div class="container-xxl pt-3">
                            [{include file="widget/breadcrumb.tpl"}]
                        </div>
                    </div>
                [{/if}]

                <div class="pop-header">
                    <h1 class="list-heading">[{$search_head}]</h1>
                </div>
            </div>
        [{/block}]
        [{block name="search_results"}]
            <div class="container-xxl">
                [{if $oView->getArticleCount()}]
                    <div class="d-flex py-3">
                        <div class="sidebar-display ms-auto">
                        [{block name="search_top_listlocator"}]
                            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() listDisplayType=true itemsPerPage=true sort=true}]
                        [{/block}]
                        </div>
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
            </div>
        [{/block}]
    </div>
[{/capture}]
[{assign var="template_title" value="SEARCH"|oxmultilangassign}]

[{include file="layout/page.tpl" title=$template_title location="SEARCH"|oxmultilangassign}]
