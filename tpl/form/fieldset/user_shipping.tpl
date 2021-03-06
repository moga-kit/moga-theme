[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{if !$deladr}]
    [{assign var="oConfig" value=$oView->getConfig()}]
    [{assign var="deladr"  value=$oConfig->getRequestParameter('deladr')}]
[{/if}]

[{if $oxcmp_user}]
    [{assign var="aUserAddresses" value=$oxcmp_user->getUserAddresses()}]

    [{if $aUserAddresses|@count > 0}]
        <input type="hidden" name="changeClass" value="[{$onChangeClass|default:'account_user'}]">
        [{*oxscript include="js/widgets/oxusershipingaddressselect.min.js" priority=10}]
        [{oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
        [{oxscript add="$( '.dd-add-delivery-address' ).click( function() {  $('.dd-available-addresses .dd-action').remove(); $( this ).find( 'label.btn' ).button('toggle'); } );"}]
        [{oxscript add="$( 'input[name=\"oxaddressid\"]' ).oxUserShipingAddressSelect();"}]
        [{oxscript add="$( window ).load( function() { if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.dd-available-addresses .panel .card-body' ) ); } } );"}]
        [{oxscript add="$( '.dd-edit-shipping-address' ).click(function(){ $( '#shippingAddressForm' ).show(); $( 'html, body' ).animate( { scrollTop: $( '#shippingAddressForm' ).offset().top - 80 }, 600 ); } );"*}]

        [{block name="form_user_shipping_address_select"}]
            [{foreach from=$aUserAddresses item=address name="shippingAdresses"}]
                <div class="list-group-item" data-bs-toggle="buttons">
                    <div class="d-flex">
                        <div class="select-address">
                            <label class="btn btn-outline-primary setToThisShippingAddress[{if $address->isSelected()}] active[{/if}]">
                                <input type="radio" class="btn-check" name="oxaddressid" value="[{$address->oxaddress__oxid->value}]" autocomplete="off" [{if $address->isSelected()}]checked[{/if}]>

                                [{if $address->isSelected()}]
                                <span class="invisible"><i class="moga-check"></i> [{oxmultilang ident="USER_SHIPPING_SELECTED"}]</span>
                                [{else}]
                                <span class="invisible">[{oxmultilang ident="DD_USER_SHIPPING_SELECT_ADDRESS"}]</span>
                                [{/if}]
                            </label>
                        </div>
                        <div class="address-info">
                            [{block name="form_user_shipping_address_actions"}]
                            [{if $address->isSelected()}]
                                [{block name="form_user_shipping_address_edit_action"}]
                                <button class="btn btn-outline-dark btn-sm float-end dd-action dd-edit-shipping-address edit-button">
                                    <i class="moga-pencil"></i>
                                </button>
                                [{/block}]
                                [{block name="form_user_shipping_address_delete_action"}]
                                <button class="btn btn-outline-dark btn-sm float-end dd-action dd-delete-shipping-address edit-button"
                                        data-bs-toggle="modal"
                                        data-bs-target="#delete_shipping_address_[{$smarty.foreach.shippingAdresses.iteration}]"
                                        type="button">
                                    <i class="moga-trash"></i>
                                </button>
                                [{/block}]
                            [{/if}]
                            [{/block}]
                            [{include file="widget/address/shipping_address.tpl" delivadr=$address}]
                        </div>
                    </div>
                </div>
            [{/foreach}]

            <div class="list-group-item" data-bs-toggle="buttons">
                <div class="d-flex">
                    <div class="select-address">
                        <div class="dd-add-delivery-address">
                            <label class="btn btn-outline-primary">
                                <input type="radio" class="btn-check" name="oxaddressid" value="-1" autocomplete="off">
                            </label>
                        </div>
                    </div>
                    <div class="address-info">
                        [{oxmultilang ident="DD_USER_SHIPPING_ADD_DELIVERY_ADDRESS"}]
                    </div>
                </div>
            </div>
        [{/block}]
    [{/if}]
[{/if}]

<div id="shippingAddressForm"[{if $delivadr}] style="display: none;"[{/if}]>
    <div class="row gx-2">
        <div class="col-md-6 mb-3">
            <div class="form-floating">
                [{include file="form/fieldset/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal id="deladr_oxaddress__oxsal"}]
                <label class="[{if $oView->isFieldRequired(oxaddress__oxsal)}] req[{/if}]" for="deladr_oxaddress__oxsal">[{oxmultilang ident="TITLE"}]</label>
            </div>
        </div>
    </div>
    <div class="row gx-2">
        <div class="col-md-6 mb-3[{if $aErrors.oxaddress__oxfname}] oxInValid[{/if}]">
            <div class="form-floating">
                <input class="form-control" type="text" maxlength="255" placeholder="[{oxmultilang ident="FIRST_NAME"}]" id="deladr[oxaddress__oxfname]" name="deladr[oxaddress__oxfname]" value="[{if isset( $deladr.oxaddress__oxfname )}][{$deladr.oxaddress__oxfname}][{else}][{$delivadr->oxaddress__oxfname->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfname)}] required[{/if}]>
                <label for="deladr[oxaddress__oxfname]" class="[{if $oView->isFieldRequired(oxaddress__oxfname)}] req[{/if}]">[{oxmultilang ident="FIRST_NAME"}]</label>
            </div>
            [{if $oView->isFieldRequired(oxaddress__oxfname)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfname}]
            [{/if}]
        </div>
        <div class="col-md-6 mb-3[{if $aErrors.oxaddress__oxlname}] oxInValid[{/if}]">
            <div class="form-floating">
                <input class="form-control" type="text" maxlength="255" placeholder="[{oxmultilang ident="LAST_NAME"}]" id="deladr[oxaddress__oxlname]" name="deladr[oxaddress__oxlname]" value="[{if isset( $deladr.oxaddress__oxlname )}][{$deladr.oxaddress__oxlname}][{else}][{$delivadr->oxaddress__oxlname->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxlname)}] required[{/if}]>
                <label for="deladr[oxaddress__oxlname]" class="[{if $oView->isFieldRequired(oxaddress__oxlname)}] req[{/if}]">[{oxmultilang ident="LAST_NAME"}]</label>
            </div>
            [{if $oView->isFieldRequired(oxaddress__oxlname)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxlname}]
            [{/if}]
        </div>
    </div>
    <div class="mb-3 form-floating[{if $aErrors.oxaddress__oxcompany}] oxInValid[{/if}]">
        <input class="form-control" type="text" maxlength="255" placeholder="[{oxmultilang ident="COMPANY"}]" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany )}][{$deladr.oxaddress__oxcompany}][{else}][{$delivadr->oxaddress__oxcompany->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxcompany)}] required[{/if}]>
        <label class="[{if $oView->isFieldRequired(oxaddress__oxcompany)}] req[{/if}]">[{oxmultilang ident="COMPANY"}]</label>
        [{if $oView->isFieldRequired(oxaddress__oxcompany)}]
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcompany}]
        [{/if}]
    </div>
    <div class="mb-3 form-floating[{if $aErrors.oxaddress__oxaddinfo}] oxInValid[{/if}]">
        [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_SHIPPING_ADDITIONALINFO2_TOOLTIP"|oxmultilangassign}]
        <input class="form-control" type="text" maxlength="255" placeholder="[{oxmultilang ident="ADDITIONAL_INFO"}]" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo )}][{$deladr.oxaddress__oxaddinfo}][{else}][{$delivadr->oxaddress__oxaddinfo->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxaddinfo)}] required[{/if}]>
        <label class="[{if $oView->isFieldRequired(oxaddress__oxaddinfo)}] req[{/if}][{if $_address_addinfo_tooltip}] tooltip[{/if}]">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
        [{if $oView->isFieldRequired(oxaddress__oxaddinfo)}]
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxaddinfo}]
        [{/if}]
    </div>
    <div class="mb-3[{if $aErrors.oxaddress__oxstreet}] oxInValid[{/if}]">
        <div class="row gx-2">
            <div class="col-8">
                <div class="form-floating">
                    <input class="form-control" type="text" data-fieldsize="pair-xsmall" placeholder="[{oxmultilang ident="STREET"}]" maxlength="255" id="deladr[oxaddress__oxstreet]" name="deladr[oxaddress__oxstreet]" value="[{if isset( $deladr.oxaddress__oxstreet )}][{$deladr.oxaddress__oxstreet}][{else}][{$delivadr->oxaddress__oxstreet->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxstreet)}] required[{/if}]>
                    <label for="deladr[oxuser__oxstreet]" class="[{if $oView->isFieldRequired(oxaddress__oxstreet)}] req[{/if}]">[{oxmultilang ident="STREET"}]</label>
                </div>
            </div>
            <div class="col-4">
                <div class="form-floating">
                    <input class="form-control" type="text" placeholder="[{oxmultilang ident="STREETNO"}]" data-fieldsize="xsmall" maxlength="16" id="deladr[oxaddress__oxstreetnr]" name="deladr[oxaddress__oxstreetnr]" value="[{if isset( $deladr.oxaddress__oxstreetnr )}][{$deladr.oxaddress__oxstreetnr}][{else}][{$delivadr->oxaddress__oxstreetnr->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxstreetnr)}] required[{/if}]>
                    <label for="deladr[oxaddress__oxstreetnr]" class="[{if $oView->isFieldRequired(oxaddress__oxstreetnr)}] req[{/if}]">[{oxmultilang ident="STREETNO"}]</label>
                </div>
            </div>
            [{if $oView->isFieldRequired(oxaddress__oxstreet) || $oView->isFieldRequired(oxaddress__oxstreetnr)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxstreet}]
            [{/if}]
        </div>
    </div>

    <div class="mb-3[{if $aErrors.oxaddress__oxzip || $aErrors.oxaddress__oxcity}] oxInValid[{/if}]">
        <div class="row gx-2">
            <div class="col-5">
                <div class="form-floating">
                    <input class="form-control" type="text" placeholder="[{oxmultilang ident="POSTAL_CODE"}]" data-fieldsize="small" maxlength="50" id="deladr[oxaddress__oxzip]" name="deladr[oxaddress__oxzip]" value="[{if isset( $deladr.oxaddress__oxzip )}][{$deladr.oxaddress__oxzip}][{else}][{$delivadr->oxaddress__oxzip->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxzip)}] required[{/if}]>
                    <label for="deladr[oxuser__oxzip]" class="[{if $oView->isFieldRequired(oxaddress__oxzip)}] req[{/if}]">[{oxmultilang ident="POSTAL_CODE"}]</label>
                </div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxzip}]
            </div>
            <div class="col-7">
                <div class="form-floating">
                    <input class="form-control" type="text" data-fieldsize="pair-small" placeholder="[{oxmultilang ident="CITY"}]" maxlength="255" id="deladr[oxaddress__oxcity]" name="deladr[oxaddress__oxcity]" value="[{if isset( $deladr.oxaddress__oxcity )}][{$deladr.oxaddress__oxcity}][{else}][{$delivadr->oxaddress__oxcity->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxcity)}] required[{/if}]>
                    <label for="deladr[oxuser__oxcity]" class="[{if $oView->isFieldRequired(oxaddress__oxcity)}] req[{/if}]">[{oxmultilang ident="CITY"}]</label>
                </div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcity}]
            </div>
        </div>
    </div>
    [{block name="form_user_shipping_country"}]
        <div class="mb-3 form-floating[{if $aErrors.oxaddress__oxcountryid}] oxInValid[{/if}]">
            <select class="form-select" id="delCountrySelect" name="deladr[oxaddress__oxcountryid]"[{if $oView->isFieldRequired(oxaddress__oxcountryid)}] required[{/if}]>
                [{if $oViewConf->getCountryList()|@count > 1}]
                <option value="">-</option>
                [{/if}]
                [{assign var="blCountrySelected" value=false}]
                [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                    [{assign var="sCountrySelect" value=""}]
                    [{if !$blCountrySelected}]
                        [{if (isset($deladr.oxaddress__oxcountryid) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value) ||
                             (!isset($deladr.oxaddress__oxcountryid) && ($delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or
                              $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or
                              $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value))}]
                            [{assign var="blCountrySelected" value=true}]
                            [{assign var="sCountrySelect" value="selected"}]
                        [{/if}]
                    [{/if}]
                    <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                [{/foreach}]
            </select>
            <label class="form-label[{if $oView->isFieldRequired(oxaddress__oxcountryid)}] req[{/if}]" for="delCountrySelect">[{oxmultilang ident="COUNTRY"}]</label>

            [{if $oView->isFieldRequired(oxaddress__oxcountryid)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxcountryid}]
            [{/if}]
        </div>
    [{/block}]
    <div class="row gx-2">
        <div class="col-md-6 mb-3[{if $aErrors.oxaddress__oxfon}] oxInValid[{/if}]">
            <div class="form-floating">
                <input class="form-control[{if $oView->isFieldRequired(oxaddress__oxfon)}] js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{oxmultilang ident="PHONE"}]" type="text" maxlength="128" id="deladr[oxaddress__oxfon]" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon )}][{$deladr.oxaddress__oxfon}][{else}][{$delivadr->oxaddress__oxfon->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfon)}] required[{/if}]>
                <label for="deladr[oxaddress__oxfon]" class="form-label[{if $oView->isFieldRequired(oxaddress__oxfon)}] req[{/if}]">[{oxmultilang ident="PHONE"}]</label>
            </div>
            [{if $oView->isFieldRequired(oxaddress__oxfon)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfon}]
            [{/if}]
        </div>
        <div class="col-md-6 mb-3[{if $aErrors.oxaddress__oxfax}] oxInValid[{/if}]">
            <div class="form-floating">
                <input class="form-control[{if $oView->isFieldRequired(oxaddress__oxfax)}] js-oxValidate js-oxValidate_notEmpty[{/if}]" placeholder="[{oxmultilang ident="FAX"}]" type="text" maxlength="128" id="deladr[oxaddress__oxfax]" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax )}][{$deladr.oxaddress__oxfax}][{else}][{$delivadr->oxaddress__oxfax->value}][{/if}]"[{if $oView->isFieldRequired(oxaddress__oxfax)}] required[{/if}]>
                <label for="deladr[oxaddress__oxfax]" class="form-label[{if $oView->isFieldRequired(oxaddress__oxfax)}] req[{/if}]">[{oxmultilang ident="FAX"}]</label>
            </div>
            [{if $oView->isFieldRequired(oxaddress__oxfax)}]
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxaddress__oxfax}]
            [{/if}]
        </div>
    </div>
</div>
[{if !$noFormSubmit}]
    <div class="my-3">
        <div class="col-12 col-lg-9 ms-lg-auto">
             <p class="req-waring">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
            <button id="accUserSaveBottom" type="submit" class="submitButton" name="save">[{oxmultilang ident="SAVE"}]</button>
        </div>
    </div>
[{/if}]
