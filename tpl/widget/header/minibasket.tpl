<div class="btn-group" role="group">
    <button type="button" class="btn btn-minibasket" data-bs-toggle="modal" data-bs-target="#basketModal">
        [{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
            <i class="moga-bag" aria-hidden="true"></i>
            [{if $oxcmp_basket->getItemsCount() > 0}]<span class="count">[{ $oxcmp_basket->getItemsCount() }]</span>[{/if}]
        [{/block}]
    </button>
</div>
