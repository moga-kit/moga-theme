[{if $oxcmp_basket->getProductsCount() gte 5}]
    [{assign var="blScrollable" value=true}]
[{/if}]

[{block name="widget_minibasket"}]

        [{oxhasrights ident="TOBASKET"}]
            [{assign var="currency" value=$oView->getActCurrency()}]


            <div class="modal fade basketFlyout" id="basketModal" tabindex="-1" role="dialog" aria-labelledby="basketModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        [{block name="widget_minibasket_modal_header"}]
                        <div class="modal-header">
                            <h4 class="modal-title" id="basketModalLabel">[{$oxcmp_basket->getItemsCount()}] [{oxmultilang ident="ITEMS_IN_BASKET"}]</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal">
                                <span aria-hidden="true"></span>
                                <span class="visually-hidden-focusable">[{oxmultilang ident="CLOSE"}]</span>
                            </button>
                        </div>
                        [{/block}]
                        [{if $oxcmp_basket->getProductsCount()}]
                            [{block name="widget_minibasket_modal_content"}]
                                <div class="modal-body">
                                    [{if $oxcmp_basket->getProductsCount()}]
                                        [{oxhasrights ident="TOBASKET"}]

                                        [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                                            [{block name="widget_minibasket_product"}][{/block}]
                                        [{/foreach}]

                                        [{block name="widget_minibasket_total"}]

                                        [{/block}]

                                        [{block name="minibasket_top_functions"}]
                                        [{if $oxcmp_user}]
                                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=payment"}]" class="btn btn-primary btn-lg w-100 mb-2">[{oxmultilang ident="CHECKOUT"}]</a>
                                        [{else}]
                                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-primary btn-lg w-100 mb-2">[{oxmultilang ident="CHECKOUT"}]</a>
                                        [{/if}]
                                        [{/block}]
                                        [{block name="dd_layout_page_header_icon_menu_minibasket_table"}]
                                        <div class="minibasket-items">
                                            [{foreach from=$oxcmp_basket->getContents() name=miniBasketList item=_product}]
                                            [{block name="widget_minibasket_product"}]
                                            [{assign var="minibasketItemTitle" value=$_product->getTitle()}]
                                            <div class="my-1">
                                                <a class="minibasket-link" href="[{$_product->getLink()}]" title="[{$minibasketItemTitle|strip_tags}]">
                                                <span>
                                                     [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                        <picture>
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($_product->getIconUrl(), 40, 40, 'webp', true)}]">
                                                            <img loading="lazy" class="minibasket-img" src="[{$oViewConf->getDynamicImage($_product->getIconUrl(), 40, 40, '', true)}]" alt="[{$minibasketItemTitle|strip_tags}]" width="40" height="40">
                                                        </picture>
                                                     [{else}]
                                                        <img loading="lazy" class="minibasket-img img-fluid" src="[{$_product->getIconUrl()}]" alt="[{$minibasketItemTitle|strip_tags}]" width="40" height="40">
                                                     [{/if}]
                                                </span>
                                                    <span>
                                                    [{$_product->getAmount()}] x [{$minibasketItemTitle|strip_tags}]<br>
                                                    [{oxprice price=$_product->getPrice() currency=$currency}]
                                                </span>
                                                </a>
                                            </div>
                                            [{/block}]
                                            [{/foreach}]
                                        </div>
                                        <div class="row minibasket-total-row my-3">
                                            <div class="col-8 minibasket-total-col h5">
                                                [{oxmultilang ident="TOTAL"}]
                                            </div>
                                            <div class="col-4 minibasket-total-col text-end  h5">
                                                [{if $oxcmp_basket->isPriceViewModeNetto()}]
                                                [{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]
                                                [{else}]
                                                [{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]
                                                [{/if}]
                                            </div>
                                        </div>

                                        [{block name="widget_minibasket_total"}][{/block}]
                                        [{/block}]

                                        [{include file="widget/minibasket/countdown.tpl"}]

                                        [{block name="dd_layout_page_header_icon_menu_minibasket_functions"}]
                                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="btn btn-outline-primary w-100">[{oxmultilang ident="DISPLAY_BASKET"}]</a>
                                        [{/block}]

                                        [{/oxhasrights}]
                                    [{/if}]
                                </div>
                            [{/block}]
                        [{else}]
                            [{block name="dd_layout_page_header_icon_menu_minibasket_alert_empty"}]
                                <div class="p-3 text-center">
                                    <div class="emoji h1"> 🤷‍♂️</div>
                                    [{oxmultilang ident="BASKET_EMPTY"}]
                                </div>
                            [{/block}]
                        [{/if}]
                        [{block name="widget_minibasket_modal_footer"}]
                        [{/block}]
                    </div>
                </div>
            </div>
            [{if $_prefix == 'modal'}]
                [{oxscript add="var basketModal = new bootstrap.Modal(document.getElementById('basketModal')); basketModal.show()"}]
            [{/if}]
        [{/oxhasrights}]

[{/block}]
