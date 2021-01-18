[{oxscript include="js/movetonoticelist.min.js" priority=10}]

[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{capture append="oxidBlock_content"}]
    <div class="container-xxl py-5">
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

        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-9">
                <div class="row">
                    <div class="col-lg-8">
                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]
                    </div>
                    <div class="col-lg-4">
                        [{include file="page/checkout/inc/summary_sidebar.tpl" btn=true}]
                    </div>
                </div>
            </div>
        </div>
            [{/if}]
            [{if $oView->isWrapping()}]
               [{include file="page/checkout/inc/wrapping.tpl"}]
            [{/if}]
        [{/block}]
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]
