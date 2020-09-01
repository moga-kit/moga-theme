[{if $oxcmp_basket->getProductsCount() && $_newitem}]
    [{oxhasrights ident="TOBASKET"}]
        <div class="alert alert-success" id="newItemMsg">
            [{block name="dd_widget_minibasket_new_item_msg"}]
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="btn btn-outline-primary btn-sm pull-right" style="margin-right:15px;">
                    <i class="moga-bag"></i> [{oxmultilang ident="DISPLAY_BASKET"}]
                </a>

                [{oxmultilang ident="NEW_BASKET_ITEM_MSG"}]
            [{/block}]
        </div>
    [{/oxhasrights}]
[{/if}]
