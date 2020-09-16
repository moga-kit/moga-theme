
[{if $place == "bottom"}]
    <div class="row">
        <div class="col">
            [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
        </div>
    </div>
[{else}]
    [{include file="widget/locator/attributes.tpl"}]
    [{if $listDisplayType}]
        [{include file="widget/locator/listdisplaytype.tpl"}]
    [{/if}]

    [{if $sort}]
        [{include file="widget/locator/sort.tpl"}]
    [{/if}]

    [{if $itemsPerPage}]
        [{include file="widget/locator/itemsperpage.tpl"}]
    [{/if}]
[{/if}]

