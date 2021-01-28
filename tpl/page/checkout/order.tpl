[{capture append="oxidBlock_content"}]

    [{block name="checkout_order_errors"}]
        [{if $oView->isConfirmAGBActive() && $oView->isConfirmAGBError() == 1}]
            [{include file="message/error.tpl" statusMessage="READ_AND_CONFIRM_TERMS"|oxmultilangassign}]
        [{/if}]
        [{assign var="iError" value=$oView->getAddressError()}]
        [{if $iError == 1}]
           [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign}]
        [{/if}]
    [{/block}]
    <div class="container-xxl py-5">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-9">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card done done-1">
                            <h4 class="card-header card-title">
                                [{oxmultilang ident="MY_ACCOUNT"}]
                            </h4>
                        </div>
                        <div class="card mt-n2 done done-2">
                            <h4 class="card-header card-title">
                                Adressen
                            </h4>
                        </div>
                        <div class="card mt-n2 done done-3">
                            <h4 class="card-header card-title">
                                Versand & Zahlung
                            </h4>
                        </div>
                        <div class="card mt-n2 active mb-3">
                            <h4 class="card-header card-title">
                                Überprüfen
                            </h4>
                        </div>
                        <div class="px-3">
                            [{block name="checkout_order_main"}]

                                [{block name="checkout_order_details"}]
                                    [{if !$oxcmp_basket->getProductsCount() }]
                                        [{block name="checkout_order_emptyshippingcart"}]
                                            <div class="alert alert-danger">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                                        [{/block}]
                                    [{else}]
                                        [{assign var="currency" value=$oView->getActCurrency()}]

                                        [{block name="checkout_order_next_step_top"}]
                                            [{if $oView->isLowOrderPrice()}]
                                                [{block name="checkout_order_loworderprice_top"}]
                                                    <div class="alert alert-info">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                                                [{/block}]
                                            [{else}]
                                                [{if $oView->showOrderButtonOnTop()}]
                                                    <a href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]" class="btn btn-outline-primary prevStep submitButton largeButton">[{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                                [{/if}]
                                            [{/if}]
                                        [{/block}]

                                        [{block name="checkout_order_vouchers"}]
                                            [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                                                [{oxmultilang ident="USED_COUPONS"}]
                                                [{foreach from=$Errors.basket item=oEr key=key}]
                                                    [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                                        <div class="alert alert-danger">
                                                            [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED1"}] [{$oEr->getValue('voucherNr')}] [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED2"}]<br>
                                                            [{oxmultilang ident="REASON"}]
                                                            [{$oEr->getOxMessage()}]
                                                        </div>
                                                    [{/if}]
                                                [{/foreach}]
                                                <div class="alert alert-info">
                                                    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                                                        [{$sVoucher->sVoucherNr}]<br>
                                                    [{/foreach}]
                                                </div>
                                            [{/if}]
                                        [{/block}]

                                        [{block name="checkout_order_address"}]
                                            <div id="orderAddress">
                                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                                    [{$oViewConf->getHiddenSid()}]
                                                    <input type="hidden" name="cl" value="user">
                                                    <input type="hidden" name="fnc" value="">

                                                    <div class="card mb-3">
                                                        <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                            [{oxmultilang ident="BILLING_ADDRESS"}]
                                                        </button>
                                                        <div class="card-body">
                                                            [{include file="widget/address/billing_address.tpl"}]
                                                        </div>
                                                    </div>
                                                </form>
                                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                                    [{$oViewConf->getHiddenSid()}]
                                                    <input type="hidden" name="cl" value="user">
                                                    <input type="hidden" name="fnc" value="">

                                                    <div class="card mb-3">
                                                        <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                            [{oxmultilang ident="SHIPPING_ADDRESS"}]
                                                        </button>
                                                        <div class="card-body">
                                                            [{assign var="oDelAdress" value=$oView->getDelAddress()}]
                                                            [{if $oDelAdress}]
                                                                [{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
                                                            [{else}]
                                                                [{include file="widget/address/billing_address.tpl"}]
                                                            [{/if}]
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        [{/block}]

                                        [{block name="shippingAndPayment"}]
                                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderShipping">
                                                [{$oViewConf->getHiddenSid()}]
                                                <input type="hidden" name="cl" value="payment">
                                                <input type="hidden" name="fnc" value="">

                                                <div class="card mb-3">
                                                    <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                        [{oxmultilang ident="SHIPPING_CARRIER"}]
                                                    </button>
                                                    <div class="card-body">
                                                        [{assign var="oShipSet" value=$oView->getShipSet()}]
                                                        [{$oShipSet->oxdeliveryset__oxtitle->value}]
                                                    </div>
                                                </div>
                                            </form>
                                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderPayment">
                                                [{$oViewConf->getHiddenSid()}]
                                                <input type="hidden" name="cl" value="payment">
                                                <input type="hidden" name="fnc" value="">

                                                <div class="card mb-3">
                                                    <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                        [{oxmultilang ident="PAYMENT_METHOD"}]
                                                    </button>
                                                    <div class="card-body">
                                                        [{assign var="payment" value=$oView->getPayment()}]
                                                        [{$payment->oxpayments__oxdesc->value}]
                                                    </div>
                                                </div>
                                            </form>
                                        [{/block}]

                                        [{block name="checkout_order_remark"}]
                                            [{if $oView->getOrderRemark()}]
                                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                                    [{$oViewConf->getHiddenSid()}]
                                                    <input type="hidden" name="cl" value="user">
                                                    <input type="hidden" name="fnc" value="">

                                                    <div class="card mb-3">
                                                        <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                            [{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]
                                                        </button>
                                                        <div class="card-body">
                                                            [{$oView->getOrderRemark()|@nl2br}]
                                                        </div>
                                                    </div>
                                                </form>
                                            [{/if}]
                                        [{/block}]

                                        <div id="orderEditCart">
                                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                                [{$oViewConf->getHiddenSid()}]
                                                <input type="hidden" name="cl" value="basket">
                                                <input type="hidden" name="fnc" value="">

                                                <div class="card mb-3">
                                                    <button type="submit" class="card-header card-title card-header-edit" title="[{oxmultilang ident="EDIT"}]">
                                                        [{oxmultilang ident="CART"}]
                                                    </button>
                                                    <div class="list-group list-group-flush">
                                                        [{block name="order_basket"}]
                                                            [{include file="page/checkout/inc/basketcontents.tpl" editable=false}]
                                                        [{/block}]
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        [{if !$oView->isLowOrderPrice()}]
                                        <div id="orderAgbTop">
                                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbTop">
                                                [{$oViewConf->getHiddenSid()}]
                                                [{$oViewConf->getNavFormParams()}]
                                                <input type="hidden" name="cl" value="order">
                                                <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                                <input type="hidden" name="challenge" value="[{$challenge}]">
                                                <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                                                [{include file="page/checkout/inc/agb.tpl"}]
                                            </form>
                                        </div>
                                        [{/if}]
                                    [{/if}]

                                    [{block name="checkout_order_next_step_bottom"}]
                                        [{if $oView->isLowOrderPrice()}]
                                            [{block name="checkout_order_loworderprice_bottom"}]
                                                <div class="alert alert-info">
                                                    <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                                                </div>
                                            [{/block}]
                                        [{else}]
                                            [{block name="checkout_order_btn_confirm_bottom"}]
                                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbBottom">
                                                    [{$oViewConf->getHiddenSid()}]
                                                    [{$oViewConf->getNavFormParams()}]
                                                    <input type="hidden" name="cl" value="order">
                                                    <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                                    <input type="hidden" name="challenge" value="[{$challenge}]">
                                                    <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                                                    [{if $oView->isActive('PsLogin') || !$oView->isConfirmAGBActive()}]
                                                        <input type="hidden" name="ord_agb" value="1">
                                                    [{else}]
                                                        <input type="hidden" name="ord_agb" value="0">
                                                    [{/if}]
                                                    <input type="hidden" name="oxdownloadableproductsagreement" value="0">
                                                    <input type="hidden" name="oxserviceproductsagreement" value="0">



                                                    [{block name="checkout_order_btn_submit_bottom"}]
                                                    <button type="submit" class="btn btn-lg btn-primary w-100">
                                                        [{oxmultilang ident="SUBMIT_ORDER"}]
                                                    </button>
                                                    [{/block}]
                                                </form>
                                            [{/block}]
                                        [{/if}]
                                    [{/block}]
                                [{/block}]
                            [{/block}]
                        </div>
                    </div>
                    <div class="col-lg-4">
                        [{include file="page/checkout/inc/summary_sidebar.tpl"}]
                    </div>
                </div>
            </div>
        </div>
    </div>

[{/capture}]

[{assign var="template_title" value="REVIEW_YOUR_ORDER"|oxmultilangassign}]
[{include file="layout/page.tpl" title=$template_title location=$template_title}]
