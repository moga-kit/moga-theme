
[{if $place == "bottom"}]
    <div class="row">
        <div class="col">
            [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
        </div>
    </div>
[{else}]
    <div class="d-flex mb-5">
        [{include file="widget/locator/attributes.tpl"}]
        <div class="ml-auto">
            [{if $listDisplayType}]
                [{include file="widget/locator/listdisplaytype.tpl"}]
            [{/if}]

            [{if $sort}]
                [{include file="widget/locator/sort.tpl"}]
            [{/if}]
        </div>
        [{if $itemsPerPage}]
            [{include file="widget/locator/itemsperpage.tpl"}]
        [{/if}]
    </div>
[{/if}]

