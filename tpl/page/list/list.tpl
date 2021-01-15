[{assign var="actCategory" value=$oView->getActiveCategory()}]

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
                <h1 class="text-center list-heading[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}] text-white[{/if}]">
                    [{$actCategory->getTitle()}]
                    [{if $rsslinks.activeCategory}]
                    <a class="rss" id="rssActiveCategory" aria-label="[{$rsslinks.activeCategory.title}]" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                        <i class="moga-rss"></i>
                    </a>
                    [{/if}]
                </h1>
                [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
                <p class="list-short-desc">[{$actCategory->oxcategories__oxdesc->rawValue}]</p>
                [{/if}]

                [{assign var="showPopBreadcrump" value=$oViewConf->getViewThemeParam('sShowPopBreadcrump')}]
                [{if $showPopBreadcrump}]
                    [{include file="widget/breadcrumb.tpl"}]
                [{/if}]
            </div>
        </div>
    [{if $headerImageWidth == 'container'}]
    </div>
    [{/if}]
        <div class="container-[{if $headerImageWidth == 'container'}]fluid[{else}]xxl[{/if}]">

            [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]

            [{if $oView->hasVisibleSubCats()}]
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
                                <a href="[{$category->getLink()}]" class="card bg-light text-dark">

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
                                        <div class="card-title">[{$category->oxcategories__oxtitle->value}]</div>
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
            [{/if}]
        </div>
    [{/block}]


    [{block name="page_list_listbody"}]
        [{if $oView->getArticleList()}]

            [{assign var="categoryWidth" value=$oViewConf->getViewThemeParam('sCategoryWidth')}]
            [{if $categoryWidth == 'container'}]
                <div class="container-xxl">
            [{/if}]
                    <div class="article-list py-5">
                        <div class="container[{if $categoryWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
                            [{if $oView->getArticleList()|count}]
                                [{block name="page_list_upperlocator"}]
                                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true sort=true}]
                                [{/block}]

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

            [{if $categoryWidth == 'container'}]
                </div>
            [{/if}]
        [{/if}]
    [{/block}]

    [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1}]
    <p class="list-long-desc">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</p>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]
