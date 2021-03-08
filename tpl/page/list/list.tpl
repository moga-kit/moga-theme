[{assign var="actCategory" value=$oView->getActiveCategory()}]
[{assign var="showPopBreadcrump" value=$oViewConf->getViewThemeParam('sShowPopBreadcrump')}]
[{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
[{assign var="sCategoryDescPosition" value=$oViewConf->getViewThemeParam('sCategoryDescPosition')}]

[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{oxmultilang ident="BRAND"}]
                [{elseif $listType=='vendor'}]
                    [{oxmultilang ident="VENDOR"}]
                [{/if}]
            </h3>
            <div class="featured icon">
                <img loading="lazy" src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{block name="page_list_listhead"}]
    [{if $listType=='manufacturer'}]
        <div class="bg-light position-relative manufacturer-header">
            <div class="container-xxl">
                <div class="d-flex justify-content-between py-3 py-md-5">
                    <div class="d-flex align-items-center">
                        <h1[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}] class="text-white"[{/if}]>
                        [{$actCategory->getTitle()}]
                    </h1>
                    [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
                    <p id="catDescLocator" class="categoryDescription">
                        [{$actCategory->oxcategories__oxdesc->rawValue}]
                    </p>
                    [{/if}]
                    </div>
                    [{if $actCategory->getIconUrl()}]
                        <img src="[{$actCategory->getIconUrl()}]">
                    [{/if}]
                </div>
            </div>

            [{if $showPopBreadcrump}]
            <div class="breadcrumb-wrapper">
                <div class="container-xxl pt-3">
                    [{include file="widget/breadcrumb.tpl"}]
                </div>
            </div>
            [{/if}]
        </div>
    [{else}]
        [{if $headerImageWidth == 'container'}]
            <div class="container-xxl">
        [{/if}]

        <div class="position-relative[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}] bg-dark pop-img[{else}] no-img[{/if}]">
            [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
                [{assign var="headerImageWidth" value=$oViewConf->getViewThemeParam('sHeaderImageWidth')}]
                [{assign var="headerImageheight" value=$oViewConf->getViewThemeParam('sHeaderImageHeight')}]
                [{assign var="height" value=1}]

                [{if $headerImageheight == 'small'}]
                    [{assign var="height" value=0.5}]
                [{/if}]

                [{assign var='height375' value=$height*220}]
                [{assign var='height750' value=$height*350}]
                [{assign var='height970' value=$height*400}]
                [{assign var='height1170' value=$height*400}]
                [{assign var='height1400' value=$height*450}]
                [{assign var='height1600' value=$height*500}]
                [{assign var='height1800' value=$height*600}]

                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                    <picture class="d-block">
                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 375, $height375, 'webp', false)}]" media="(max-width: 375px)">

                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 750, $height750, 'webp', false)}]" media="(max-width: 767px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 750, $height750, 'jpg', false)}]" media="(max-width: 767px)">

                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 970, $height970, 'webp', false)}]" media="(max-width: 991px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 970, $height970, 'jpg', false)}]" media="(max-width: 991px)">

                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1170, $height1170, 'webp', false)}]" media="(max-width: 1199px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1170, $height1170, 'jpg', false)}]" media="(max-width: 1199px)">

                        [{if $headerImageWidth == 'w100c100'}]
                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1400, $height1400, 'webp', false)}]" media="(max-width: 1399px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1400, $height1400, 'jpg', false)}]" media="(max-width: 1399px)">

                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1600, $height1600, 'webp', false)}]" media="(max-width: 1599px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1600, $height1600, 'jpg', false)}]" media="(max-width: 1599px)">

                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1800, $height1800, 'webp', false)}]" media="(min-width: 1600px)">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1800, $height1800, 'jpg', false)}]" media="(min-width: 1600px)">
                        [{else}]
                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1400, $height1400, 'webp', false)}]">
                        <source srcset="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 1400, $height1400, 'jpg', false)}]">
                        [{/if}]
                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($actCategory->getThumbUrl(), 375, $height375, 'jpg', false)}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="w-100 img-fluid">
                    </picture>
                [{else}]
                    <img loading="lazy" src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="w-100 img-fluid">
                [{/if}]
            [{/if}]

            <div class="pop-header">
                [{assign var='rsslinks' value=$oView->getRssLinks()}]
                <h1[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}] class="text-white"[{/if}]>
                [{$actCategory->getTitle()}]
                [{if $rsslinks.activeCategory}]
                <a class="rss" id="rssActiveCategory" aria-label="[{$rsslinks.activeCategory.title}]" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                    <i class="moga-rss"></i>
                </a>
                [{/if}]
                </h1>
                [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
                <p id="catDescLocator" class="categoryDescription[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}] text-white[{/if}]">
                    [{$actCategory->oxcategories__oxdesc->rawValue}]
                </p>
                [{/if}]

                [{if $showPopBreadcrump}]
                <div class="breadcrumb-wrapper">
                    <div class="container-xxl pt-3">
                        [{include file="widget/breadcrumb.tpl"}]
                    </div>
                </div>
                [{/if}]
            </div>
        </div>

        [{if $headerImageWidth == 'container'}]
        </div>
        [{/if}]
    [{/if}]

    [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1 && $sCategoryDescPosition == 'top'}]
        [{block name="page_list_long_desc"}]
        <div id="catLongDescLocator" class="container-[{if $headerImageWidth == 'container'}]fluid[{else}]xxl[{/if}] categoryDescription">
            [{oxeval var=$actCategory->oxcategories__oxlongdesc}]
        </div>
        [{/block}]
    [{/if}]

    [{if $oView->hasVisibleSubCats()}]
        <div class="container-[{if $headerImageWidth == 'container'}]fluid[{else}]xxl[{/if}]">
            [{assign var="iSubCategoriesCount" value=0}]
            <div class="my-3">
                <div class="row g-2">
                    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                        [{if $category->getContentCats()}]
                            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                <div class="col-12 col-sm-4 col-md-3 col-xl-2">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                        </div>
                                    </div>
                                </div>
                            [{/foreach}]
                        [{/if}]

                        [{if $category->getIsVisible()}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <div class="
                            [{if $listType=='manufacturer'}]
                                col-12 col-sm-4 col-md-3 col-lg-2 manufacturer-item
                            [{else}]
                                col-12 col-sm-4 col-md-3
                            [{/if}]">
                                <a href="[{$category->getLink()}]" class="card [{if $listType=='manufacturer'}]bg-light[{else}]bg-dark text-white[{/if}]">

                                    [{if $iconUrl}]
                                        [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                            <img loading="lazy" src="[{$oViewConf->getDynamicImage($category->getIconUrl(), 400, 200, 'webp', false)}]" alt="[{$category->oxcategories__oxtitle->value}]" class="card-img">
                                        [{else}]
                                            <img loading="lazy" src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" class="card-img">
                                        [{/if}]
                                    [{else}]
                                        [{oxmultilang ident="DD_LIST_SHOW_MORE" suffix="ELLIPSIS"}]
                                    [{/if}]


                                    <div class="card-img-overlay">
                                        <div class="h5 card-title">[{$category->oxcategories__oxtitle->value}]</div>
                                        [{*if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                        [{if $category->getHasVisibleSubCats()}]
                                        <ul class="list-unstyled">
                                            [{foreach from=$category->getSubCats() item=subcategory}]
                                            [{if $subcategory->getIsVisible()}]
                                            [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                            <li>
                                                <a href="[{$ocont->getLink()}]"><strong>[{$ocont->oxcontents__oxtitle->value}]</strong></a>
                                            </li>
                                            [{/foreach}]

                                            <li>
                                                <a href="[{$subcategory->getLink()}]">[{$subcategory->oxcategories__oxtitle->value}]</a>
                                                [{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0)}]&nbsp;([{$subcategory->getNrOfArticles()}])[{/if}]
                                            </li>
                                            [{/if}]
                                            [{/foreach}]
                                        </ul>
                                        [{/if*}]
                                    </div>
                                </a>
                            </div>
                        [{/if}]
                    [{/foreach}]
                </div>
            </div>
        </div>
    [{/if}]

    [{/block}]


    [{block name="page_list_listbody"}]
        [{if $oView->getArticleList()}]

            [{assign var="categoryWidth" value=$oViewConf->getViewThemeParam('sCategoryWidth')}]
            [{if $categoryWidth == 'container'}]
                <div class="container-xxl">
            [{/if}]
                    <div class="article-list pb-5">
                        <div class="container[{if $categoryWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                            [{if $oView->getArticleList()|count}]
                                <div class="d-flex py-3">
                                    <button type="button" class="btn btn-outline-primary btn-icon" data-bs-toggle="modal" data-bs-target="#filter">
                                        <i class="moga-sliders"></i>
                                    </button>

                                    <div class="sidebar-display ms-auto">
                                        [{block name="page_list_upperlocator"}]
                                        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=false listDisplayType=true sort=true}]
                                        [{/block}]
                                    </div>
                                </div>
                            [{/if}]
                            <div class="row">
                                [{if $oView->getArticleList()|count}]
                                    [{* List types: grid|line *}]
                                    [{block name="page_list_productlist"}]
                                        [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
                                    [{/block}]
                                    [{block name="page_list_bottomlocator"}]
                                        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
                                    [{/block}]
                                [{/if}]
                            </div>
                        </div>
                    </div>

            [{if $categoryWidth == 'container'}]
                </div>
            [{/if}]
        [{/if}]
    [{/block}]

    [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1 && $sCategoryDescPosition == 'bottom'}]
        [{block name="page_list_long_desc"}]
            <div id="catLongDescLocator" class="container-[{if $headerImageWidth == 'container'}]fluid[{else}]xxl[{/if}] categoryDescription">
                [{oxeval var=$actCategory->oxcategories__oxlongdesc}]
            </div>
        [{/block}]
    [{/if}]

    <div class="modal fade modal-sidebar-left" id="filter">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    [{if $oView->getArticleList()|count}]
                    [{block name="page_list_upperlocator"}]
                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=false sort=false}]
                    [{/block}]
                    [{/if}]

                    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() deepLevel=0 noscript=1 nocookie=1}]
                </div>
            </div>
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]
