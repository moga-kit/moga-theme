[{assign var="blFirstTab" value=true}]

[{block name="details_relatedproducts_accessoires"}]
    [{if $oView->getAccessoires()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" id="accessoires-tab" href="#accessoires" data-bs-toggle="tab" role="tab" aria-controls="nav-accesoires" aria-selected="false">[{oxmultilang ident="ACCESSORIES"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="accessoires" class="container-xxl tab-pane[{if $blFirstTab}] active[{/if}]" role="tabpanel" aria-labelledby="home-tab">
                [{include file="widget/product/list.tpl" type="grid" listId="accessories" products=$oView->getAccessoires() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_ACCESSORIES_SUBHEADER"|oxmultilangassign}]
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_also_bought"}]
    [{if $oView->getAlsoBoughtTheseProducts()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#also" id="also-tab" data-bs-toggle="tab" role="tab" aria-controls="nav-also" aria-selected="true">[{oxmultilang ident="CUSTOMERS_ALSO_BOUGHT"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="also" class="container-xxl tab-pane[{if $blFirstTab}] active[{/if}]" role="tabpanel" aria-labelledby="also-tab">
                [{include file="widget/product/list.tpl" type="grid" listId="also" subhead="PAGE_DETAILS_CUSTOMERS_ALSO_BOUGHT_SUBHEADER"|oxmultilangassign products=$oView->getAlsoBoughtTheseProducts()}]
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_similarproducts"}]
    [{if $oView->getSimilarProducts()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#similars" id="similars-tab" data-bs-toggle="tab" role="tab" aria-controls="nav-similars" aria-selected="false">[{oxmultilang ident="SIMILAR_PRODUCTS"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="similars" class="container-xxl tab-pane[{if $blFirstTab}] active[{/if}]" role="tabpanel" aria-labelledby="similars-tab">
                [{include file="widget/product/list.tpl" type="grid" listId="similars" products=$oView->getSimilarProducts() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_SIMILAR_SUBHEADER"|oxmultilangassign}]
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_crossselling"}]
    [{if $oView->getCrossSelling()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#cross" id="cross-tab" data-bs-toggle="tab" role="tab" aria-controls="nav-cross" aria-selected="false">[{oxmultilang ident="HAVE_YOU_SEEN"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
        <div id="cross" class="container-xxl tab-pane[{if $blFirstTab}] active[{/if}]" role="tabpanel" aria-labelledby="cross-tab">
            [{include file="widget/product/list.tpl" type="grid" listId="cross" products=$oView->getCrossSelling() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_CROSSSELING_SUBHEADER"|oxmultilangassign}]
        </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{if $reltabs}]
<div class="related-tabs">
    <ul class="nav nav-tabs" role="tablist">
        [{foreach from=$reltabs item="reltab" name="reltabs"}]
            <li class="nav-item" role="presentation">[{$reltab}]</li>
        [{/foreach}]
    </ul>
    <div class="tab-content py-5">
        [{foreach from=$reltabsContent item="reltabContent" name="reltabsContent"}]
        [{$reltabContent}]
        [{/foreach}]
    </div>
</div>
[{/if}]
