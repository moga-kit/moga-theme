<div class="refineParams row[{if $place == "bottom"}] bottomParams[{/if}]">
    [{if $locator}]
        <div class="col pagination-options">
            [{if $place == "bottom"}]
                [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
            [{else}]
                [{include file="widget/locator/attributes.tpl"}]
            [{/if}]
        </div>
    [{/if}]

    [{if $listDisplayType || $sort || $itemsPerPage}]
        [{if $place != "bottom"}]
        <div class="col text-right options">
            <div class="btn-group" role="group">
            [{if $listDisplayType}]
            [{include file="widget/locator/listdisplaytype.tpl"}]
            [{/if}]

            [{if $sort}]
            [{include file="widget/locator/sort.tpl"}]
            [{/if}]

            [{if $itemsPerPage}]
            [{include file="widget/locator/itemsperpage.tpl"}]
            [{/if}]
            </div>
        </div>
        [{/if}]
    [{/if}]
</div>
