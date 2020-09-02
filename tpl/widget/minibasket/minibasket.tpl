[{if $oxcmp_basket->getProductsCount() gte 5}]
    [{assign var="blScrollable" value=true}]
[{/if}]

[{block name="widget_minibasket"}]
    [{if $oxcmp_basket->getProductsCount()}]
        [{oxhasrights ident="TOBASKET"}]
            [{assign var="currency" value=$oView->getActCurrency()}]

            [{if $_prefix == 'modal'}]
                <div class="modal fade basketFlyout" id="basketModal" tabindex="-1" role="dialog" aria-labelledby="basketModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            [{block name="widget_minibasket_modal_header"}]
                            <div class="modal-header">
                                <h4 class="modal-title" id="basketModalLabel">[{$oxcmp_basket->getItemsCount()}] [{oxmultilang ident="ITEMS_IN_BASKET"}]</h4>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">[{oxmultilang ident="CLOSE"}]</span>
                                </button>
                            </div>
                            [{/block}]
                            [{block name="widget_minibasket_modal_content"}]
                            <div class="modal-body">
                                [{if $oxcmp_basket->getProductsCount()}]
                                    [{oxhasrights ident="TOBASKET"}]
                                        <div id="[{$_prefix}]basketFlyout" class="basketFlyout">
                                            <div class="">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>[{oxmultilang ident="PRODUCT"}]</th>
                                                            <th class="text-right">[{oxmultilang ident="DD_MINIBASKET_MODAL_TABLE_PRICE"}]</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                                                            [{block name="widget_minibasket_product"}]
                                                                [{assign var="minibasketItemTitle" value=$_product->getTitle()}]
                                                                <tr>
                                                                    <td>
                                                                        <a href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
                                                                            <span class="item">
                                                                                [{if $_product->getAmount() > 1}]
                                                                                    [{$_product->getAmount()}] &times;
                                                                                [{/if}]
                                                                                [{$minibasketItemTitle|strip_tags}]
                                                                            </span>
                                                                        </a>
                                                                    </td>
                                                                    <td class="text-right">
                                                                        <strong class="price">[{oxprice price=$_product->getPrice() currency=$currency}] *</strong>
                                                                    </td>
                                                                </tr>
                                                            [{/block}]
                                                        [{/foreach}]
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            [{block name="widget_minibasket_total"}]
                                                                <td><strong>[{oxmultilang ident="TOTAL"}]</strong></td>
                                                                <td class="text-right">
                                                                    <strong class="price">
                                                                        [{if $oxcmp_basket->isPriceViewModeNetto()}]
                                                                            [{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]
                                                                        [{else}]
                                                                            [{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}] *
                                                                        [{/if}]
                                                                    </strong>
                                                                </td>
                                                            [{/block}]
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            [{include file="widget/minibasket/countdown.tpl"}]
                                        </div>
                                    [{/oxhasrights}]
                                [{/if}]
                            </div>
                            [{/block}]
                            [{block name="widget_minibasket_modal_footer"}]
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">[{oxmultilang ident="DD_MINIBASKET_CONTINUE_SHOPPING"}]</button>
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="[{oxmultilang ident="DISPLAY_BASKET"}]">
                                    <i class="moga-bag"></i>
                                </a>
                            </div>
                            [{/block}]
                        </div>
                    </div>
                </div>
                [{oxscript add="var basketModal = new bootstrap.Modal(document.getElementById('basketModal')); basketModal.show()"}]
            [{else}]
                [{block name="dd_layout_page_header_icon_menu_minibasket_title"}]
                    <li class="title">
                        <strong>[{$oxcmp_basket->getItemsCount()}] [{oxmultilang ident="ITEMS_IN_BASKET"}]</strong>
                    </li>
                [{/block}]

                    [{block name="dd_layout_page_header_icon_menu_minibasket_table"}]

                        [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                            [{block name="widget_minibasket_product"}]
                                [{assign var="minibasketItemTitle" value=$_product->getTitle()}]
                                <li class="my-1">
                                    <a class="minibasket-link" href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
                                        <span>
                                            <img class="minibasket-img lazyload img-fluid" data-src="[{$_product->getIconUrl()}]" alt="[{$minibasketItemTitle|strip_tags}]">
                                        </span>
                                        <span>
                                            [{$_product->getAmount()}] x [{$minibasketItemTitle|strip_tags}]<br>
                                            [{oxprice price=$_product->getPrice() currency=$currency}]
                                        </span>
                                    </a>
                                </li>
                            [{/block}]
                        [{/foreach}]
                        <li class="row minibasket-total-row">
                            <div class="col-8 minibasket-total-col">
                                <strong>[{oxmultilang ident="TOTAL"}]</strong>
                            </div>
                            <div class="col-4 minibasket-total-col text-right">
                                <strong>
                                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                                        [{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]
                                    [{else}]
                                        [{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]
                                    [{/if}]
                                </strong>
                            </div>
                        </li>

                            [{block name="widget_minibasket_total"}][{/block}]
                    [{/block}]

                [{include file="widget/minibasket/countdown.tpl"}]

                [{block name="dd_layout_page_header_icon_menu_minibasket_functions"}]
                    <li class="functions clear text-right">
                        [{if $oxcmp_user}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]" class="btn btn-primary">[{oxmultilang ident="CHECKOUT"}]</a>
                        [{else}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-primary">[{oxmultilang ident="CHECKOUT"}]</a>
                        [{/if}]
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="btn btn-outline-primary">[{oxmultilang ident="DISPLAY_BASKET"}]</a>
                    </li>
                [{/block}]
            [{/if}]
        [{/oxhasrights}]
    [{else}]
        [{block name="dd_layout_page_header_icon_menu_minibasket_alert_empty"}]
            <div class="alert alert-info">[{oxmultilang ident="BASKET_EMPTY"}]</div>
        [{/block}]
    [{/if}]
[{/block}]
