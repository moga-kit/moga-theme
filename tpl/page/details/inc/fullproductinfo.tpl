<div id="detailsMain" class="mt-4">
    [{include file="page/details/inc/productmain.tpl"}]
</div>

<div id="detailsRelated" class="details-related">
    <div class="details-related-info[{if !$oView->getSimilarProducts() && !$oView->getCrossSelling() && !$oView->getAccessoires()}] details-related-info-full[{/if}]">
        [{include file="page/details/inc/tabs.tpl"}]

        [{if $oView->isReviewActive()}]
            <div class="reviews my-5 container">
                [{include file="widget/reviews/reviews.tpl"}]
            </div>
        [{/if}]
    </div>

    [{include file="page/details/inc/related_products_tabs.tpl"}]
</div>
