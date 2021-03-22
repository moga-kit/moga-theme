<div class="btn-group" role="group">
    <button type="button" class="btn btn-minibasket" data-bs-toggle="modal" data-bs-target="#basketModal">
        [{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
            <i class="moga-bag" aria-hidden="true">
                [{if $oxcmp_basket->getItemsCount() > 0}]<span class="badge">[{ $oxcmp_basket->getItemsCount() }]</span>[{/if}]
            </i>
        [{/block}]
    </button>
</div>
