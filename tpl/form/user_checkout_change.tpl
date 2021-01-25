[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]

[{capture assign="sValidationJS"}]
    [{strip}]
    $('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
        {
            filter: function()
            {
                if( $( '#shippingAddress' ).css( 'display' ) == 'block' )
                {
                    return $(this).is(':visible, .selectpicker');
                }
                else
                {
                    return $(this).is(':visible, #addressForm .selectpicker');
                }
            }
        }
    );
    [{/strip}]
[{/capture}]

[{oxscript add=$sValidationJS*}]

[{oxscript include="js/changeaddress.min.js" priority=10}]

[{block name="user_checkout_change"}]
    <form class="max-600" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" novalidate>
        [{block name="user_checkout_change_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
            <input type="hidden" name="fnc" value="changeuser">
            <input type="hidden" name="lgn_cook" value="0">
            <input type="hidden" name="blshowshipaddress" value="1">

            [{block name="user_checkout_change_next_step_top"}]

            [{/block}]


            [{block name="user_checkout_billing"}]
                [{block name="user_checkout_billing_head"}]
                    <h3 class="h4">
                        [{oxmultilang ident="BILLING_ADDRESS"}]
                        <button id="userChangeAddress" class="btn btn-sm btn-outline-primary float-end edit-button" name="changeBillAddress" type="submit" title="[{oxmultilang ident="CHANGE"}]">
                            <i class="moga-pencil"></i>
                        </button>
                    </h3>
                [{/block}]
            [{/block}]

            [{block name="user_checkout_billing_form"}]
                <div[{if !$aErrors|@count }] style="display: none;"[{/if}] id="addressForm">
                    [{if not $oxcmp_user->oxuser__oxpassword->value}]
                        [{include file="form/fieldset/user_email.tpl"}]
                    [{/if}]
                    [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                </div>
            [{/block}]

            [{block name="user_checkout_billing_feedback"}]
                [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
            [{/block}]


            [{block name="user_checkout_shipping"}]
                [{block name="user_checkout_shipping_head"}]
                    <h3 class="h4">
                        [{oxmultilang ident="SHIPPING_ADDRESS"}]
                        [{if $oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}]
                            <button id="userChangeShippingAddress" class="btn btn-sm btn-outline-primary float-end edit-button" name="changeShippingAddress" type="submit" [{if !$oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}] style="display: none;" [{/if}] title="[{oxmultilang ident="CHANGE"}]">
                                <i class="moga-pencil"></i>
                            </button>
                        [{/if}]
                    </h3>
                [{/block}]
            [{/block}]

            [{block name="user_checkout_shipping_change"}]
                <div class="mb-3 form-floating">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                        <label for="showShipAddress" class="form-check-label">
                            [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                        </label>
                    </div>
                </div>
            [{/block}]
            [{block name="user_checkout_shipping_form"}]
                <div id="shippingAddress"[{if !$oView->showShipAddress()}] style="display: none;"[{/if}]>
                    [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user'}]
                </div>
            [{/block}]
            [{block name="user_checkout_shipping_feedback"}]
                [{*include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true*}]
                [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
            [{/block}]


            [{block name="user_checkout_change_next_step_bottom"}]
                <button id="userNextStepBottom" class="btn btn-primary btn-block btn-lg" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}]</button>
            [{/block}]
        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
