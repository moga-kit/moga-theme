[{oxscript include="js/changeaddress.min.js" priority=10}]

[{block name="user"}]
    <form class="max-600" action="[{$oViewConf->getSelfActionLink()}]" name="order" method="post" novalidate>
        [{block name="user_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div class="addressCollumns">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="changeuser_testvalues">
                <input type="hidden" name="cl" value="account_user">
                <input type="hidden" name="CustomError" value='user'>
                <input type="hidden" name="blshowshipaddress" value="1">

                [{* Rechnungsadresse *}]
                <div class="card mb-3">
                    <div class="card-header bg-light">
                        [{block name="user_billing_address_head"}]
                            <button id="userChangeAddress" class="btn btn-outline-primary btn-sm float-end edit-button" name="changeBillAddress" type="button">
                                <i class="moga-pencil"></i>
                            </button>
                            <h4>[{oxmultilang ident="BILLING_ADDRESS"}]</h4>
                        [{/block}]
                    </div>
                    <div class="card-body">
                        [{block name="user_billing_address"}]
                            [{block name="user_billing_address_text"}]
                                <div id="addressText">
                                    [{include file="widget/address/billing_address.tpl"}]
                                </div>
                            [{/block}]
                            [{block name="user_billing_address_form"}]
                                <div style="display: none;" id="addressForm">
                                    [{include file="form/fieldset/user_email.tpl"}]
                                    [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true}]
                                </div>
                            [{/block}]
                        [{/block}]
                    </div>
                </div>

                [{*oxscript add="$('#userChangeAddress').click( function() { $('#addressForm, #addressText').toggle();return false;});"*}]

                [{* Lieferadresse *}]
                [{block name="user_shipping_address"}]
                    <div class="card">
                        <div class="card-header bg-light">
                            [{block name="user_shipping_address_head"}]
                            <h4>[{oxmultilang ident="SHIPPING_ADDRESSES"}]</h4>
                            [{/block}]
                        </div>
                        <div class="card-body">
                            <div class="checkbox">
                                [{block name="user_shipping_address_choice"}]
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="blshowshipaddress" id="showShipAddress"[{if !$oView->showShipAddress()}] checked[{/if}] value="0">
                                        <label class="form-check-label" for="showShipAddress">
                                            [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                                        </label>
                                    </div>
                                [{/block}]
                            </div>
                        </div>
                        [{block name="user_shipping_address_form"}]
                            <div class="list-group list-group-flush" id="shippingAddress"[{if !$oView->showShipAddress()}] style="display: none;"[{/if}]>
                                [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                            </div>
                        [{/block}]
                    </div>
                [{/block}]
            </div>
            <div class="mb-3 form-floating">
                <div class="col-lg-12">
                    <button id="accUserSaveTop" class="btn btn-primary" name="userform" type="submit">[{oxmultilang ident="SAVE"}]</button>
                </div>
            </div>
        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
