[{assign var="blFirstTab" value=true}]


[{block name="details_relatedproducts_accessoires"}]
    [{if $oView->getAccessoires()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#accessoires" data-bs-toggle="tab">[{oxmultilang ident="ACCESSORIES"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="accessoires" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="widget/product/list.tpl" type="grid" listId="accessories" products=$oView->getAccessoires() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_ACCESSORIES_SUBHEADER"|oxmultilangassign}]
                </div>
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_also_bought"}]
    [{if $oView->getAlsoBoughtTheseProducts()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#also" data-bs-toggle="tab">[{oxmultilang ident="CUSTOMERS_ALSO_BOUGHT"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="also" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="widget/product/list.tpl" type="grid" listId="alsoBought" subhead="PAGE_DETAILS_CUSTOMERS_ALSO_BOUGHT_SUBHEADER"|oxmultilangassign products=$oView->getAlsoBoughtTheseProducts()}]
                </div>
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_similarproducts"}]
    [{if $oView->getSimilarProducts()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#similars" data-bs-toggle="tab">[{oxmultilang ident="SIMILAR_PRODUCTS"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
            <div id="similars" class="tab-pane[{if $blFirstTab}] active[{/if}]">
                <div class="container-xxl">
                    [{include file="widget/product/list.tpl" type="grid" listId="similar"  products=$oView->getSimilarProducts() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_SIMILAR_SUBHEADER"|oxmultilangassign}]
                </div>
            </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{block name="details_relatedproducts_crossselling"}]
    [{if $oView->getCrossSelling()}]
        [{capture append="reltabs"}]
            <a class="nav-link[{if $blFirstTab}] active[{/if}]" href="#cross" data-bs-toggle="tab">[{oxmultilang ident="HAVE_YOU_SEEN"}]</a>
        [{/capture}]
        [{capture append="reltabsContent"}]
        <div id="cross" class="tab-pane[{if $blFirstTab}] active[{/if}]">
            <div class="container-xxl">
                [{include file="widget/product/list.tpl" type="grid" listId="crossproducts" products=$oView->getCrossSelling() subhead="WIDGET_PRODUCT_RELATED_PRODUCTS_CROSSSELING_SUBHEADER"|oxmultilangassign}]
            </div>
        </div>
        [{/capture}]
    [{assign var="blFirstTab" value=false}]
    [{/if}]
[{/block}]

[{if $reltabs}]
<div class="related-tabs">
    <ul class="nav nav-tabs">
        [{foreach from=$reltabs item="reltab" name="reltabs"}]
            <li class="nav-item">[{$reltab}]</li>
        [{/foreach}]
    </ul>
    <div class="tab-content py-5">
        [{foreach from=$reltabsContent item="reltabContent" name="reltabsContent"}]
        [{$reltabContent}]
        [{/foreach}]
    </div>
</div>
[{/if}]