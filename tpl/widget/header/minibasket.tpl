<div class="dropdown">
    <button type="button" aria-label="Minibasket"  class="btn btn-minibasket dropdown-toggle" aria-expanded="false" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]">
        [{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
            <i class="moga-bag" aria-hidden="true"></i>
            [{if $oxcmp_basket->getItemsCount() > 0}]<span class="count">[{ $oxcmp_basket->getItemsCount() }]</span>[{/if}]
        [{/block}]
    </button>
    <ul class="dropdown-menu dropdown-menu-right minibasket-menu">
        [{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
            [{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
        [{/block}]
    </ul>
</div>
