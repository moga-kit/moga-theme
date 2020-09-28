[{if $oxcmp_categories}]
    [{assign var="categoriesTilesWidth" value=$oViewConf->getViewThemeParam('sCategoryTilesWidth')}]
    [{assign var="categoriesTilesGrid" value=$oViewConf->getViewThemeParam('sCategoryTilesGrid')}]
    [{assign var="categoriesTilesBg" value=$oViewConf->getViewThemeParam('sCategoryTilesBg')}]
    [{assign var="categoriesTilesSpacing" value=$oViewConf->getViewThemeParam('sCategoryTilesSpacing')}]
    [{assign var="categoriesTilesRowPadding" value=$oViewConf->getViewThemeParam('sCategoryTilesRowPadding')}]

    [{if $categoriesTilesWidth == 'container'}]
    <div class="container-xxl">
    [{/if}]
        <div class="categories-tiles[{if $categoriesTilesRowPadding}] py-3 py-lg-5[{/if}] bg-[{$categoriesTilesBg}]">

            <h2 class="text-center mb-4">[{oxmultilang ident="CATEGORIES"}]</h2>
            [{if $categoriesTilesWidth == 'w100cContainer'}]
            <div class="container-xxl p-0">
            [{/if}]
                <div class="px-[{$categoriesTilesSpacing}]">
                    <div class="row g-[{$categoriesTilesSpacing}]">

                        [{assign var="categories" value=$oxcmp_categories}]
                        [{foreach from=$categories item=_cat}]
                            [{assign var="image" value=false}]
                            [{if $_cat->getIconUrl()}]
                                [{assign var="image" value=$_cat->getIconUrl()}]
                            [{/if}]
                            [{if $_cat->getThumbUrl()}]
                                [{assign var="image" value=$_cat->getThumbUrl()}]
                            [{/if}]
                            [{if $_cat->getIsVisible()}]
                                [{if $categoriesTilesGrid == '50'}]
                                    [{assign var="gridClass" value="6"}]
                                [{/if}]
                                [{if $categoriesTilesGrid == '33'}]
                                    [{assign var="gridClass" value="4"}]
                                [{/if}]
                                [{if $categoriesTilesGrid == '25'}]
                                    [{assign var="gridClass" value="3"}]
                                [{/if}]
                                <div class="col-lg-[{$gridClass}]">
                                    <a class="card bg-dark text-white" href="[{$_cat->getLink()}]"[{if !$image}] style="height: 100%"[{/if}] >
                                        [{if $image}]
                                            [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                <picture>
                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 375, 220, 'webp')}]" media="(max-width: 375px)">

                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 750, 350, 'webp')}]" media="(max-width: 767px)">
                                                    <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($image, 750, 350, 'jpg')}]" media="(max-width: 767px)">

                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 970, 400, 'webp')}]" media="(max-width: 991px)">
                                                    <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($image, 970, 400, 'jpg')}]" media="(max-width: 991px)">

                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 1170, 400, 'webp')}]" media="(max-width: 1199px)">
                                                    <source type="image/jpg" srcset="[{$oViewConf->getDynamicImage($image, 1170, 400, 'jpg')}]" media="(max-width: 1199px)">

                                                    <img loading="lazy" src="[{$oViewConf->getDynamicImage($image, 375, 270, 'jpg')}]" alt="[{$_cat->oxcategories__oxtitle->value}]" class="card-img">
                                                </picture>
                                            [{else}]
                                                <img loading="lazy" src="[{$image}]" alt="[{$_cat->oxcategories__oxtitle->value}]" class="card-img">
                                            [{/if}]
                                        [{else}]
                                            <div class="bg-primary">

                                            </div>
                                        [{/if}]
                                        <div class="card-img-overlay">
                                            <h5 class="card-title">
                                                [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ( $_cat->getNrOfArticles() > 0 )}] ([{$_cat->getNrOfArticles()}])[{/if}]
                                            </h5>
                                        </div>
                                    </a>
                                </div>
                            [{/if}]
                        [{/foreach}]

                    </div>
                </div>
            [{if $categoriesTilesWidth == 'w100cContainer'}]
            </div>
            [{/if}]
        </div>
    [{if $categoriesTilesWidth == 'container'}]
    </div>
    [{/if}]


[{/if}]
