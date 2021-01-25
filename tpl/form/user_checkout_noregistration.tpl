[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

[{block name="user_checkout_noregistration"}]
    <form class="max-600" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" novalidate>
        [{block name="user_checkout_noregistration_form"}]
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="option" value="1">
            [{if !$oxcmp_user->oxuser__oxpassword->value}]
                <input type="hidden" name="fnc" value="createuser">
            [{else}]
                <input type="hidden" name="fnc" value="changeuser">
                <input type="hidden" name="lgn_cook" value="0">
            [{/if}]
            <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
            <input type="hidden" name="blshowshipaddress" value="1">

            [{block name="user_checkout_noregistration_next_step_top"}]
            [{/block}]

            <h3>[{oxmultilang ident="NOTREGISTERED_ACCOUNTINFO"}]</h3>
            [{include file="form/fieldset/user_noaccount.tpl"}]

            <h3>[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
            [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blOrderRemark=true}]

            <h3>[{oxmultilang ident="SHIPPING_ADDRESS"}]</h3>

            <div class="mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="blshowshipaddress" id="showShipAddress"[{if !$oView->showShipAddress()}] checked[{/if}] value="0">
                    <label for="showShipAddress" class="form-check-label">
                         [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                    </label>
                </div>
            </div>
            [{oxscript include="js/changeaddress.min.js" priority=10}]

            <div id="shippingAddress"[{if !$oView->showShipAddress()}] style="display: none;"[{/if}]>
                [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
            </div>

            [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]


            [{*oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"*}]

            [{block name="user_checkout_noregistration_next_step_bottom"}]
                [{*}]
                <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-outline-primary float-left prevStep submitButton largeButton" id="userBackStepBottom">[{oxmultilang ident="PREVIOUS_STEP"}]</a>
                [{*}]
                <button id="userNextStepBottom" class="btn btn-primary btn-lg btn-block" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]</button>

            [{/block}]
        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
