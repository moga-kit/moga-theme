[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]

[{if isset( $invadr.oxuser__oxbirthdate.month )}]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.day )}]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":""}]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.year )}]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxsal )}]
    [{assign var="oxuser__oxsal" value=$invadr.oxuser__oxsal}]
[{else}]
    [{assign var="oxuser__oxsal" value=$oxcmp_user->oxuser__oxsal->value}]
[{/if}]
<div class="row gx-2">
    <div class="col-6 mb-3">
        <div class="form-floating">
            [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxuser__oxsal class="form-control" id="invadr_oxuser__oxfname"}]
            <label class="[{if $oView->isFieldRequired(oxuser__oxsal)}] req[{/if}]" for="invadr_oxuser__oxfname">[{oxmultilang ident="TITLE"}]</label>
        </div>
    </div>
</div>
<div class="row gx-2">
    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxfname}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxfname]" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{else}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfname)}] required[{/if}]>
            <label for="invadr[oxuser__oxfname]" class="[{if $oView->isFieldRequired(oxuser__oxfname)}] req[{/if}]">[{oxmultilang ident="FIRST_NAME"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
    </div>

    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxlname}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxlname]" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname )}][{$invadr.oxuser__oxlname}][{else}][{$oxcmp_user->oxuser__oxlname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxlname)}] required[{/if}]>
            <label for="invadr[oxuser__oxlname]" class="[{if $oView->isFieldRequired(oxuser__oxlname)}] req[{/if}]">[{oxmultilang ident="LAST_NAME"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
    </div>
</div>

<div class="mb-3 form-floating[{if $aErrors.oxuser__oxaddinfo}] text-danger[{/if}]">
    [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign}]
    <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxaddinfo]" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo )}][{$invadr.oxuser__oxaddinfo}][{else}][{$oxcmp_user->oxuser__oxaddinfo->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] required[{/if}]>
    <label for="invadr[oxuser__oxaddinfo]"[{if $_address_addinfo_tooltip}] title="[{$_address_addinfo_tooltip}]"[{/if}] class="[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] req[{/if}]">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxaddinfo}]
</div>

<div class="mb-3[{if $aErrors.oxuser__oxstreet}] text-danger[{/if}]">
    <div class="row gx-2">
        <div class="col-8">
            <div class="form-floating">
                <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxstreet]" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{else}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreet)}] required[{/if}]>
                <label for="invadr[oxuser__oxstreet]" class="[{if $oView->isFieldRequired(oxuser__oxstreet)}] req[{/if}]">[{oxmultilang ident="STREET"}]</label>
            </div>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input class="form-control" placeholder=" " type="text" maxlength="16" id="invadr[oxuser__oxstreetnr]" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr )}][{$invadr.oxuser__oxstreetnr}][{else}][{$oxcmp_user->oxuser__oxstreetnr->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreetnr)}] required[{/if}]>
                <label for="invadr[oxuser__oxstreetnr]" class="[{if $oView->isFieldRequired(oxuser__oxstreetnr)}] req[{/if}]">[{oxmultilang ident="STREETNO"}]</label>
            </div>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreetnr}]
        </div>
    </div>
</div>

<div class="mb-3[{if $aErrors.oxuser__oxzip}] text-danger[{/if}]">
    <div class="row gx-2">
        <div class="col-5">
            <div class="form-floating">
                <input class="form-control" placeholder=" " type="text" maxlength="16" id="invadr[oxuser__oxzip]" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip )}][{$invadr.oxuser__oxzip}][{else}][{$oxcmp_user->oxuser__oxzip->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxzip)}] required[{/if}]>
                <label for="invadr[oxuser__oxzip]" class="[{if $oView->isFieldRequired(oxuser__oxzip)}] req[{/if}]">[{oxmultilang ident="POSTAL_CODE"}]</label>
            </div>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxzip}]
        </div>
        <div class="col-7">
            <div class="form-floating">
                <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxcity]" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity )}][{$invadr.oxuser__oxcity}][{else}][{$oxcmp_user->oxuser__oxcity->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcity)}] required[{/if}]>
                <label for="invadr[oxuser__oxcity]" class="[{if $oView->isFieldRequired(oxuser__oxcity)}] req[{/if}]">[{oxmultilang ident="CITY"}]</label>
            </div>
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcity}]
        </div>
    </div>
</div>
[{block name="form_user_billing_country"}]
    <div class="mb-3 form-floating[{if $aErrors.oxuser__oxcountryid}] text-danger[{/if}]">
        <select class="form-select" id="invCountrySelect" name="invadr[oxuser__oxcountryid]"[{if $oView->isFieldRequired(oxuser__oxcountryid)}] required[{/if}]>
            [{if $oViewConf->getCountryList()|@count > 1}]
                <option value="">-</option>
            [{/if}]
            [{assign var="blCountrySelected" value=false}]
            [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                [{assign var="sCountrySelect" value=""}]
                [{if !$blCountrySelected}]
                    [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value) ||
                        (!isset($invadr.oxuser__oxcountryid) && $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value)}]
                        [{assign var="blCountrySelected" value=true}]
                        [{assign var="sCountrySelect" value="selected"}]
                    [{/if}]
                [{/if}]
                <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
            [{/foreach}]
        </select>
        <label for="invCountrySelect" class="[{if $oView->isFieldRequired(oxuser__oxcountryid)}] req[{/if}]">[{oxmultilang ident="COUNTRY"}]</label>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcountryid}]
    </div>
[{/block}]

<div class="row gx-2">
    <div class="col-md-8 mb-3[{if $aErrors.oxuser__oxcompany}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxcompany]" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany )}][{$invadr.oxuser__oxcompany}][{else}][{$oxcmp_user->oxuser__oxcompany->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcompany)}] required[{/if}]>
            <label for="invadr[oxuser__oxcompany]" class="[{if $oView->isFieldRequired(oxuser__oxcompany)}] req[{/if}]">[{oxmultilang ident="COMPANY"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcompany}]
    </div>

    <div class="col-md-4 mb-3[{if $aErrors.oxuser__oxustid}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="255" id="invadr[oxuser__oxustid]" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid )}][{$invadr.oxuser__oxustid}][{else}][{$oxcmp_user->oxuser__oxustid->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxustid)}] required[{/if}]>
            <label for="invadr[oxuser__oxustid]" class="[{if $oView->isFieldRequired(oxuser__oxustid)}] req[{/if}]">[{oxmultilang ident="VAT_ID_NUMBER"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]
    </div>
</div>

<div class="row gx-2">
    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxfon}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="128" id="invadr[oxuser__oxfon]" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{else}][{$oxcmp_user->oxuser__oxfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfon)}] required[{/if}]>
            <label for="invadr[oxuser__oxfon]" class="[{if $oView->isFieldRequired(oxuser__oxfon)}] req[{/if}]">[{oxmultilang ident="PHONE"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]
    </div>

    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxfax}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="128" id="invadr[oxuser__oxfax]" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax )}][{$invadr.oxuser__oxfax}][{else}][{$oxcmp_user->oxuser__oxfax->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfax)}] required[{/if}]>
            <label for="invadr[oxuser__oxfax]" class="[{if $oView->isFieldRequired(oxuser__oxfax)}] req[{/if}]">[{oxmultilang ident="FAX"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfax}]
    </div>
</div>

<div class="row gx-2">
    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxmobfon}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="64" id="invadr[oxuser__oxmobfon]" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon )}][{$invadr.oxuser__oxmobfon}][{else}][{$oxcmp_user->oxuser__oxmobfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxmobfon)}] required[{/if}]>
            <label for="invadr[oxuser__oxmobfon]" class="[{if $oView->isFieldRequired(oxuser__oxmobfon)}] req[{/if}]">[{oxmultilang ident="CELLUAR_PHONE"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxmobfon}]
    </div>

    <div class="col-md-6 mb-3[{if $aErrors.oxuser__oxprivfon}] text-danger[{/if}]">
        <div class="form-floating">
            <input class="form-control" placeholder=" " type="text" maxlength="64" id="invadr[oxuser__oxprivfon]" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon )}][{$invadr.oxuser__oxprivfon}][{else}][{$oxcmp_user->oxuser__oxprivfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxprivfon)}] required[{/if}]>
            <label for="invadr[oxuser__oxprivfon]" class="[{if $oView->isFieldRequired(oxuser__oxprivfon)}] req[{/if}]">[{oxmultilang ident="PERSONAL_PHONE"}]</label>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxprivfon}]
    </div>
</div>

[{if $oViewConf->showBirthdayFields()}]
    <div class="mb-3 oxDate[{if $aErrors.oxuser__oxbirthdate}] text-danger[{/if}]">
        <label class="[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] req[{/if}]">[{oxmultilang ident="BIRTHDATE"}]</label>
        <div class="row gx-2">
            <div class="col-3">
                <div class="form-floating">
                    <input id="oxDay" class="oxDay form-control" name="invadr[oxuser__oxbirthdate][day]" type="text" maxlength="2" value="[{if $iBirthdayDay > 0}][{$iBirthdayDay}][{/if}]" placeholder="[{oxmultilang ident="DAY"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required[{/if}]>
                    <label for="oxDay">[{oxmultilang ident="DAY"}]</label>
                </div>
            </div>
            <div class="col-6">
                <div class="form-floating">
                    <select id="oxMonth" class="oxMonth form-select" name="invadr[oxuser__oxbirthdate][month]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required[{/if}]>
                        <option value="" label="-">-</option>
                        [{section name="month" start=1 loop=13}]
                            <option value="[{$smarty.section.month.index}]" label="[{$smarty.section.month.index}]" [{if $iBirthdayMonth == $smarty.section.month.index}] selected="selected" [{/if}]>
                                [{oxmultilang ident="MONTH_NAME_"|cat:$smarty.section.month.index}]
                            </option>
                        [{/section}]
                    </select>
                    <label for="oxMonth">[{oxmultilang ident="MONTH"}]</label>
                </div>
            </div>
            <div class="col-3">
                <div class="form-floating">
                    <input id="oxYear" class="oxYear form-control" name="invadr[oxuser__oxbirthdate][year]" type="text" maxlength="4" value="[{if $iBirthdayYear}][{$iBirthdayYear}][{/if}]" placeholder="[{oxmultilang ident="YEAR"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required[{/if}]>
                    <label for="oxYear">[{oxmultilang ident="YEAR"}]</label>
                </div>
            </div>
        </div>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxbirthdate}]
    </div>
[{/if}]

<div class="mb-3 form-floating">
    <p class="req-waring">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
</div>

[{if !$noFormSubmit}]
    <div class="mb-3 form-floating">
        <button id="accUserSaveTop" type="submit" name="save" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
    </div>
[{/if}]
