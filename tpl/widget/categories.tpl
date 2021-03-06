[{if $oxcmp_categories}]
    [{assign var="categoriesTilesWidth" value=$oViewConf->getViewThemeParam('showCategoryTilesWidth')}]
    [{assign var="categoriesTilesGrid" value=$oViewConf->getViewThemeParam('showCategoryTilesGrid')}]
    [{assign var="categoriesTilesBg" value=$oViewConf->getViewThemeParam('showCategoryTilesBg')}]
    [{assign var="categoriesTilesSpacing" value=$oViewConf->getViewThemeParam('showCategoryTilesSpacing')}]
    [{assign var="categoriesTilesRowPadding" value=$oViewConf->getViewThemeParam('showCategoryTilesRowPadding')}]

    [{if $categoriesTilesWidth == 'container'}]
    <div class="container-xxl">
    [{/if}]
        <div class="categories-tiles[{if $categoriesTilesRowPadding}] py-3 py-lg-5[{/if}] bg-[{$categoriesTilesBg}]">
            <h2 class="text-center mb-4[{if $categoriesTilesBg == "dark" || $categoriesTilesBg == "primary"}] text-white[{/if}]">[{oxmultilang ident="CATEGORIES"}]</h2>
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

                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 320, 200, 'webp')}]" media="(max-width: 767px)">
                                                    <source srcset="[{$oViewConf->getDynamicImage($image, 320, 200, 'jpg')}]" media="(max-width: 767px)">

                                                    <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($image, 320, 200, 'webp')}]" media="(min-width: 992px)">
                                                    <source srcset="[{$oViewConf->getDynamicImage($image, 320, 200, 'jpg')}]" media="(min-width: 992px)">

                                                    <img loading="lazy" src="[{$oViewConf->getDynamicImage($image, 375, 220, 'jpg')}]" alt="[{$_cat->oxcategories__oxtitle->value}]" class="card-img">
                                                </picture>
                                            [{else}]
                                                <img loading="lazy" src="[{$image}]" alt="[{$_cat->oxcategories__oxtitle->value}]" class="card-img">
                                            [{/if}]
                                        [{else}]
                                            <div class="bg-primary">

                                            </div>
                                        [{/if}]
                                        <div class="card-img-overlay">
                                            <h3 class="card-title">
                                                [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ( $_cat->getNrOfArticles() > 0 )}] ([{$_cat->getNrOfArticles()}])[{/if}]
                                            </h3>
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
