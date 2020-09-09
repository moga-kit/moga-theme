[{* basket contents *}]
[{*oxscript include="js/widgets/oxbasketchecks.min.js" priority=10*}]
[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10*}]
[{*oxscript add="$('#checkAll, #basketRemoveAll').oxBasketChecks();"*}]
[{*oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]
[{assign var="currency" value=$oView->getActCurrency()}]

<div class="row">
    <div class="col-lg-8">
        <form name="basket[{$basketindex}]" id="basket_form" action="[{$oViewConf->getSelfActionLink()}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="basket">
            <input type="hidden" name="fnc" value="changebasket">
            <input type="hidden" name="CustomError" value="basket">

            <div class="basket" id="basketcontents_list">
                [{include file="page/checkout/inc/basketcontents_list.tpl"}]
            </div>
        </form>
    </div>
    <div class="col-lg-4">
        <div class="sticky-md-top">
            [{block name="checkout_basketcontents_summary"}]
                <div class="card mb-2">
                    <div class="card-body">
                        <div class="list-group mb-2 list-group-flush">
                            [{block name="checkout_basketcontents_summary_table_inner"}]
                            [{if !$oxcmp_basket->getDiscounts()}]
                            [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                                <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    [{oxmultilang ident="TOTAL_NET"}]
                                    <span>[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</span>
                                </div>
                            [{/block}]

                            [{block name="checkout_basketcontents_nodiscountproductvats"}]
                            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                                <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" args=$key}]
                                    <span>[{oxprice price=$VATitem currency=$currency}]</span>
                                </div>
                            [{/foreach}]
                            [{/block}]

                            [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="TOTAL_GROSS"}]
                                <span>[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</span>
                            </div>
                            [{/block}]
                            [{else}]
                            [{if $oxcmp_basket->isPriceViewModeNetto()}]
                            [{block name="checkout_basketcontents_discounttotalnet"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="TOTAL_NET"}]
                                <span>[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</span>
                            </div>
                            [{/block}]
                            [{else}]
                            [{block name="checkout_basketcontents_discounttotalgross"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="TOTAL_GROSS"}]
                                <span>[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</span>
                            </div>
                            [{/block}]
                            [{/if}]

                            [{block name="checkout_basketcontents_discounts"}]
                            [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">

                                <b>[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DISCOUNT"}][{/if}]&nbsp;</b>
                                [{$oDiscount->sDiscount}]

                                <span>
                                    [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                                </span>
                            </div>
                            [{/foreach}]
                            [{/block}]

                            [{if !$oxcmp_basket->isPriceViewModeNetto()}]
                            [{block name="checkout_basketcontents_totalnet"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="TOTAL_NET"}]
                                <span>[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</span>
                            </div>
                            [{/block}]
                            [{/if}]

                            [{block name="checkout_basketcontents_productvats"}]
                            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" args=$key}]
                                <span>[{oxprice price=$VATitem currency=$currency}]</span>
                            </div>
                            [{/foreach}]
                            [{/block}]

                            [{if $oxcmp_basket->isPriceViewModeNetto()}]
                            [{block name="checkout_basketcontents_totalgross"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="TOTAL_GROSS"}]
                                <span>[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</span>
                            </div>
                            [{/block}]
                            [{/if}]
                            [{/if}]
                            [{/block}]

                            [{block name="checkout_basketcontents_voucherdiscount"}]
                            [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue()}]
                            [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <span>
                                    [{oxmultilang ident="COUPON"}]&nbsp;([{$sVoucher->sVoucherNr}])
                                    [{if $editable}]
                                    <a href="[{$oViewConf->getSelfLink()}]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{$sVoucher->sVoucherId}]&amp;CustomError=basket&amp;stoken=[{$oViewConf->getSessionChallengeToken()}]" class="removeFn" title="[{oxmultilang ident="REMOVE"}]"><i class="moga-trash"></i> </a>
                                    [{/if}]
                                </span>
                                <span>[{oxprice price=$sVoucher->dVoucherdiscount*-1 currency=$currency}]</span>
                            </div>
                            [{/foreach}]
                            [{/if}]
                            [{/block}]

                            [{block name="checkout_basketcontents_delcosts"}]
                            [{assign var="deliveryCost" value=$oxcmp_basket->getDeliveryCost()}]
                            [{if $deliveryCost && ($oxcmp_basket->getBasketUser() || $oViewConf->isFunctionalityEnabled('blCalculateDelCostIfNotLoggedIn') ) }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="SHIPPING_NET"}]
                                <span>[{oxprice price=$deliveryCost->getNettoPrice() currency=$currency }]</span>
                            </div>
                            [{if $deliveryCost->getVatValue()}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    [{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]
                                [{else}]
                                    [{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" args=$deliveryCost->getVat()}]
                                [{/if}]
                                <span>[{oxprice price=$deliveryCost->getVatValue() currency=$currency}]</span>
                            </div>
                            [{/if}]
                            [{else}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="SHIPPING_COST" }]
                                <span>[{oxprice price=$deliveryCost->getBruttoPrice() currency=$currency}]</span>
                            </div>
                            [{/if}]
                            [{/if}]
                            [{/block}]

                            [{block name="checkout_basketcontents_paymentcosts"}]
                            [{assign var="paymentCost" value=$oxcmp_basket->getPaymentCost()}]
                            [{if $paymentCost && $paymentCost->getPrice() }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD"}]
                                <span>[{oxprice price=$paymentCost->getNettoPrice() currency=$currency }]</span>
                            </div>
                            [{if $paymentCost->getVatValue()}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                [{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" }]
                                [{else}]
                                [{ oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" args=$paymentCost->getVat() }]
                                [{/if}]
                                <span>[{oxprice price=$paymentCost->getVatValue() currency=$currency }]</span>
                            </div>
                            [{/if}]
                            [{else}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" }]
                                <span>[{oxprice price=$paymentCost->getBruttoPrice() currency=$currency }]</span>
                            </div>
                            [{/if}]
                            [{/if}]
                            [{/block}]

                            [{block name="checkout_basketcontents_wrappingcosts"}]
                            [{if $oViewConf->getShowGiftWrapping() }]

                            [{assign var="wrappingCost" value=$oxcmp_basket->getWrappingCost()}]
                            [{if $wrappingCost && $wrappingCost->getPrice() > 0 }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" }]
                                <span>[{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]</span>
                            </div>
                            [{if $oxcmp_basket->getWrappCostVat() }]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="PLUS_VAT" }]
                                <span>[{oxprice price=$wrappingCost->getVatValue() currency=$currency}]</span>
                            </div>
                            [{/if}]
                            [{else}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="GIFT_WRAPPING" }]
                                <span>[{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency }]</span>
                            </div>
                            [{/if}]
                            [{/if}]

                            [{assign var="giftCardCost" value=$oxcmp_basket->getGiftCardCost()}]
                            [{if $giftCardCost && $giftCardCost->getPrice() > 0 }]
                            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" }]
                                <span>[{oxprice price=$giftCardCost->getNettoPrice() currency=$currency }]</span>
                            </div>
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                [{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" }]
                                [{else}]
                                [{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" args=$giftCardCost->getVat() }]
                                [{/if}]
                                <span>[{oxprice price=$giftCardCost->getVatValue() currency=$currency}]</span>
                            </div>
                            [{else}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{ oxmultilang ident="GREETING_CARD" }]
                                <span>[{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]</span>
                            </div>
                            [{/if}]
                            [{/if}]
                            [{/if}]
                            [{/block}]

                            [{block name="checkout_basketcontents_grandtotal"}]
                            <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                [{oxmultilang ident="GRAND_TOTAL"}]
                                <span>[{oxprice price=$oxcmp_basket->getPrice() currency=$currency}]</span>
                            </div>
                            [{/block}]

                            [{if $oxcmp_basket->hasSkipedDiscount()}]
                                <div class="list-group-item d-flex justify-content-between align-items-center px-0">
                                <span class="note">**</span> [{oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES"}]</span>
                            </div>
                            [{/if}]
                        </div>

                        [{if !$oView->isLowOrderPrice()}]
                            [{block name="basket_btn_next_bottom"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">
                                    [{oxmultilang ident="NEXT"}]
                                </button>
                            </form>
                            [{/block}]
                        [{/if}]
                    </div>
                </div>
            [{/block}]

            [{if $oViewConf->getShowVouchers() && $oViewConf->getActiveClassName() == 'basket'}]
                [{block name="checkout_basket_vouchers"}]
                    <div class="card">
                        <div class="card-body">
                            <a class="d-flex justify-content-between collapsed card-collapse" data-toggle="collapse" href="#voucherCollapse" aria-expanded="false" aria-controls="voucherCollapse">
                                [{oxmultilang ident="ENTER_COUPON_NUMBER"}]
                            </a>

                            <div class="collapse" id="voucherCollapse">
                                <div class="mt-3">
                                    <form name="voucher" action="[{$oViewConf->getSelfActionLink()}]" method="post" novalidate>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="basket">
                                        <input type="hidden" name="fnc" value="addVoucher">
                                        <input type="hidden" name="CustomError" value="basket">

                                        <div class="mb-3">
                                            <label class="sr-only" for="input_voucherNr">[{oxmultilang ident="ENTER_COUPON_NUMBER"}]</label>
                                            <div class="input-group">
                                                <input type="text" name="voucherNr" size="30" class="form-control" id="input_voucherNr" required>
                                                <button type="submit" class="btn btn-primary" title="[{oxmultilang ident="REDEEM_COUPON"}]"><i class="moga-right"></i> </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    [{foreach from=$Errors.basket item=oEr key=key}]
                        [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                            <div class="alert alert-danger mt-2">
                                [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]
                                <strong>[{oxmultilang ident="REASON"}]</strong>
                                [{$oEr->getOxMessage()}]
                            </div>
                        [{/if}]
                    [{/foreach}]
                [{/block}]
            [{/if}]
        </div>
    </div>
</div>

