[{capture append="oxidBlock_content"}]

<div class="container-xxl py-5">
    <div class="row justify-content-center">
        <div class="col-md-12 col-lg-10 col-xl-9">
            <div class="row">
                <div class="col-lg-8">
                    <div class="card done done-1">
                        <h4 class="card-header card-title disabled">
                            [{oxmultilang ident="MY_ACCOUNT"}]
                        </h4>
                    </div>
                    <div class="card mt-n2 done done-2">
                        <h4 class="card-header card-title disabled">
                            Adressen
                        </h4>
                    </div>
                    <div class="card mt-n2 active">
                        <h4 class="card-header card-title">
                            Versand & Zahlung
                        </h4>
                        <div class="card-body">
                            [{block name="checkout_payment_main"}]
                                [{assign var="currency" value=$oView->getActCurrency()}]
                                [{block name="change_shipping"}]
                                    [{if $oView->getAllSets()}]
                                        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
                                        <form action="[{$oViewConf->getSslSelfLink()}]" name="shipping" id="shipping" method="post">
                                            [{$oViewConf->getHiddenSid()}]
                                            [{$oViewConf->getNavFormParams()}]
                                            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                                            <input type="hidden" name="fnc" value="changeshipping">


                                            <h3 class="h4">[{if $oView->getAllSetsCnt() > 1}][{oxmultilang ident="SELECT_SHIPPING_METHOD"}][{else}][{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}][{/if}]</h3>

                                            [{block name="act_shipping"}]
                                                <div class="mb-3">
                                                    <select class="form-select" name="sShipSet" onchange="this.form.submit();">
                                                        [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
                                                            <option value="[{$sShipID}]" [{if $oShippingSet->blSelected}]SELECTED[{/if}]>[{$oShippingSet->oxdeliveryset__oxtitle->value}]</option>
                                                        [{/foreach}]
                                                    </select>
                                                </div>
                                                <noscript>
                                                    <div class="mb-3">
                                                        <button type="submit" class="btn btn-success">[{oxmultilang ident="UPDATE_SHIPPING_CARRIER"}]</button>
                                                    </div>
                                                </noscript>
                                            [{/block}]

                                            [{assign var="oDeliveryCostPrice" value=$oxcmp_basket->getDeliveryCost()}]
                                            [{if $oDeliveryCostPrice && $oDeliveryCostPrice->getPrice() > 0}]
                                                <div id="shipSetCost">
                                                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                                                        [{oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getNettoPrice() currency=$currency}]
                                                        ([{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oDeliveryCostPrice->getVatValue() currency=$currency}])
                                                    [{else}]
                                                        [{oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getBruttoPrice() currency=$currency}]
                                                    [{/if}]
                                                </div>
                                            [{/if}]
                                        </form>
                                    [{/if}]
                                [{/block}]

                                [{block name="checkout_payment_errors"}]
                                    [{assign var="iPayError" value=$oView->getPaymentError()}]

                                    [{if $iPayError == 1}]
                                        <div class="alert alert-danger">[{oxmultilang ident="ERROR_MESSAGE_COMPLETE_FIELDS_CORRECTLY"}]</div>
                                    [{elseif $iPayError == 2}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
                                    [{elseif $iPayError == 4}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_UNAVAILABLE_SHIPPING_METHOD"}]</div>
                                    [{elseif $iPayError == 5}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
                                    [{elseif $iPayError >= 6}]
                                        <!--Add custom error message here-->
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
                                    [{elseif $iPayError == -1}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT_ERROR"}] "[{$oView->getPaymentErrorText()}]").</div>
                                    [{elseif $iPayError == -2}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_NO_SHIPPING_METHOD_FOUND"}]</div>
                                    [{elseif $iPayError == -3}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_SELECT_ANOTHER_PAYMENT"}]</div>
                                    [{elseif $iPayError == -4}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_BANK_CODE_INVALID"}]</div>
                                    [{elseif $iPayError == -5}]
                                        <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_ACCOUNT_NUMBER_INVALID"}]</div>
                                    [{/if}]
                                [{/block}]

                                [{block name="change_payment"}]
                                    [{oxscript include="js/payment.min.js" priority=10}]
                                    <form action="[{$oViewConf->getSslSelfLink()}]" class="payment" id="payment" name="order" method="post" novalidate>
                                        [{$oViewConf->getHiddenSid()}]
                                        [{$oViewConf->getNavFormParams()}]
                                        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                                        <input type="hidden" name="fnc" value="validatepayment">

                                        [{if $oView->getPaymentList()}]
                                            <h3 class="h4">[{oxmultilang ident="PAYMENT_METHOD"}]</h3>

                                            [{assign var="inptcounter" value="-1"}]
                                            [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                                                [{assign var="inptcounter" value="`$inptcounter+1`"}]
                                                [{block name="select_payment"}]
                                                    [{if $sPaymentID == "oxidcashondel"}]
                                                        [{include file="page/checkout/inc/payment_oxidcashondel.tpl"}]
                                                    [{elseif $sPaymentID == "oxidcreditcard"}]
                                                        [{include file="page/checkout/inc/payment_oxidcreditcard.tpl"}]
                                                    [{elseif $sPaymentID == "oxiddebitnote"}]
                                                        [{include file="page/checkout/inc/payment_oxiddebitnote.tpl"}]
                                                    [{else}]
                                                        [{include file="page/checkout/inc/payment_other.tpl"}]
                                                    [{/if}]
                                                [{/block}]
                                            [{/foreach}]


                                            [{block name="checkout_payment_nextstep"}]
                                                [{if $oView->isLowOrderPrice()}]
                                                    <div class="alert alert-info">
                                                        [{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]
                                                    </div>
                                                [{else}]

                                                    [{*}]<a href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]" class="btn btn-outline-primary float-left prevStep submitButton largeButton" id="paymentBackStepBottom"><i class="moga-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>[{*}]

                                                    <button type="submit" name="userform" class="btn btn-primary btn-lg btn-block mt-3">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]</button>

                                                [{/if}]
                                            [{/block}]

                                        [{elseif $oView->getEmptyPayment()}]
                                            [{block name="checkout_payment_nopaymentsfound"}]
                                                <div class="lineBlock"></div>
                                                <h3 id="paymentHeader" class="blockHead">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
                                                [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
                                                    [{$oCont->oxcontents__oxcontent->value}]
                                                [{/oxifcontent}]
                                                <input type="hidden" name="paymentid" value="oxempty">
                                                <div class="lineBox">
                                                    <div class="card bg-light cart-buttons">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12 col-md-6">
                                                                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-outline-primary"><i class="moga-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                                                </div>
                                                                <div class="col-12 col-md-6 text-end">
                                                                    <button type="submit" name="userform" class="btn btn-primary" id="paymentNextStepBottom">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="moga-right"></i></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            [{/block}]
                                        [{/if}]
                                    </form>
                                [{/block}]
                            [{/block}]
                        </div>
                    </div>

                    <div class="card mt-n2">
                        <h4 class="card-header card-title disabled">
                            Überprüfen
                        </h4>
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

[{include file="layout/page.tpl"}]
