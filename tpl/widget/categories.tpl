[{if $oxcmp_categories}]
<div class="container-fluid">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-2">
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
                <div class="col">
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
[{/if}]
