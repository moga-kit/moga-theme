[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="aRegParams" value=$oView->getRegParams()}]
<form class="max-600" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="fnc" value="send">
    <input type="hidden" name="cl" value="newsletter">
    <input type="hidden" name="editval[oxuser__oxcountryid]" value="[{$oView->getHomeCountryId()}]">

    <div class="mb-3">
        <label class="form-label">[{oxmultilang ident="TITLE"}]</label>

        [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$aRegParams.oxuser__oxsal class="form-control show-tick"}]
    </div>
    <div class="mb-3">
        <label class="form-label">[{oxmultilang ident="FIRST_NAME"}]</label>

        <input class="form-control" id="newsletterFname" type="text" name="editval[oxuser__oxfname]" maxlength="40" value="[{if $aRegParams.oxuser__oxfname}][{$aRegParams.oxuser__oxfname}][{/if}]">
    </div>
    <div class="mb-3">
        <label class="form-label">[{oxmultilang ident="LAST_NAME"}]</label>

        <input class="form-control" id="newsletterLname" type="text" name="editval[oxuser__oxlname]" maxlength="40" value="[{if $aRegParams.oxuser__oxlname}][{$aRegParams.oxuser__oxlname}][{/if}]">
    </div>
    <div class="mb-3[{if $aErrors}] oxInValid[{/if}]">
        <label class="req form-label">[{oxmultilang ident="EMAIL"}]</label>

        <input id="newsletterUserName" type="email" class="form-control" name="editval[oxuser__oxusername]" maxlength="40" value="[{if $aRegParams.oxuser__oxusername}][{$aRegParams.oxuser__oxusername}][{/if}]" required="required">
        <div class="help-block"></div>
    </div>
    <div class="mb-3">
        <label for="newsletterSubscribeOn" class="checkbox-inline">
            <input id="newsletterSubscribeOn" type="radio" name="subscribeStatus" value="1" checked> [{oxmultilang ident="SUBSCRIBE"}]
        </label>
        <label for="newsletterSubscribeOff" class="checkbox-inline">
            <input id="newsletterSubscribeOff" type="radio" name="subscribeStatus" value="0"> [{oxmultilang ident="UNSUBSCRIBE"}]
        </label>
    </div>
    <div class="mb-3">
        <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
        <button id="newsLetterSubmit" class="btn btn-primary" type="submit">[{oxmultilang ident="SUBMIT"}]</button>
    </div>
</form>
