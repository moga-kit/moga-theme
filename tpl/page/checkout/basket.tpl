[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{capture append="oxidBlock_content"}]
    <div class="container-xxl py-5">
        <h1 class="h2">[{oxmultilang ident="CART"}]</h1>
        [{block name="checkout_basket_main"}]
            [{assign var="currency" value=$oView->getActCurrency()}]

            [{if $oView->isLowOrderPrice()}]
                [{block name="checkout_basket_loworderprice_top"}]
                    <div class="alert alert-info">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                [{/block}]
            [{/if}]

            [{if !$oxcmp_basket->getProductsCount()}]
                [{block name="checkout_basket_emptyshippingcart"}]
                    <div class="alert alert-danger" id="empty-basket-warning">
                        <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="btn btn-outline-primary"><i class="moga-left"></i> [{oxmultilang ident="DD_BASKET_BACK_TO_SHOP"}]</a>
                        [{oxmultilang ident="BASKET_EMPTY"}]
                    </div>
                [{/block}]
            [{else}]
                [{block name="checkout_basket_next_step_top"}]
                [{/block}]


                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]

                [{*block name="checkout_basket_next_step_bottom"}]
                    <div class="row">
                                <div class="col-12 col-md-6">
                        [{block name="checkout_basket_loworderprice_bottom"}][{/block}]

                        [{block name="checkout_basket_backtoshop_bottom"}]
                            [{if $oView->showBackToShop()}]
                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="float-left">
                                    <div class="backtoshop">
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="basket">
                                        <input type="hidden" name="fnc" value="backtoshop">
                                        <button type="submit" class="btn btn-outline-primary submitButton largeButton float-left">
                                            <i class="moga-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                                        </button>
                                    </div>
                                </form>
                            [{else}]
                                <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-outline-primary submitButton largeButton float-left">
                                    <i class="moga-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                                </a>
                            [{/if}]
                        [{/block}]
                                </div>
                                <div class="col-12 col-md-6 text-right">
                            [{if !$oView->isLowOrderPrice()}]
                                [{block name="basket_btn_next_bottom"}]
                                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="float-right">
                                            [{$oViewConf->getHiddenSid()}]
                                            <input type="hidden" name="cl" value="user">
                                        <button type="submit" class="btn btn-primary submitButton largeButton nextStep pull-right">
                                            [{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="moga-right"></i>
                                        </button>
                                    </form>
                                [{/block}]
                            [{/if}]
                                </div>
                            </div>
                [{/block*}]
            [{/if}]
            [{if $oView->isWrapping()}]
               [{include file="page/checkout/inc/wrapping.tpl"}]
            [{/if}]
        [{/block}]
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]
