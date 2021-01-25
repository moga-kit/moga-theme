[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]
[{assign var="aRegParams" value=$oView->getRegParams()}]
<form class="max-600" action="[{$oViewConf->getSslSelfLink()}]" method="post" novalidate>
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="fnc" value="send">
    <input type="hidden" name="cl" value="newsletter">
    <input type="hidden" name="editval[oxuser__oxcountryid]" value="[{$oView->getHomeCountryId()}]">

    <div class="mb-3 form-floating">
        [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$aRegParams.oxuser__oxsal}]
        <label>[{oxmultilang ident="TITLE"}]</label>
    </div>
    <div class="mb-3 form-floating">
        <input class="form-control" id="newsletterFname" placeholder=" " type="text" name="editval[oxuser__oxfname]" maxlength="40" value="[{if $aRegParams.oxuser__oxfname}][{$aRegParams.oxuser__oxfname}][{/if}]">
        <label for="newsletterFname">[{oxmultilang ident="FIRST_NAME"}]</label>
    </div>
    <div class="mb-3 form-floating">
        <input class="form-control" placeholder=" " id="newsletterLname" type="text" name="editval[oxuser__oxlname]" maxlength="40" value="[{if $aRegParams.oxuser__oxlname}][{$aRegParams.oxuser__oxlname}][{/if}]">
        <label for="newsletterLname">[{oxmultilang ident="LAST_NAME"}]</label>
    </div>
    <div class="mb-3 form-floating[{if $aErrors}] oxInValid[{/if}]">
        <input id="newsletterUserName" type="email" placeholder=" " class="form-control" name="editval[oxuser__oxusername]" maxlength="40" value="[{if $aRegParams.oxuser__oxusername}][{$aRegParams.oxuser__oxusername}][{/if}]" required>
        <label for="newsletterUserName" class="req">[{oxmultilang ident="EMAIL"}]</label>
    </div>
    <div class="form-check">
        <input id="newsletterSubscribeOn" class="form-check-input" type="radio" name="subscribeStatus" value="1" checked>
        <label for="newsletterSubscribeOn" class="form-check-label">[{oxmultilang ident="SUBSCRIBE"}]</label>
    </div>
    <div class="form-check">
        <input id="newsletterSubscribeOff" class="form-check-input" type="radio" name="subscribeStatus" value="0">
        <label for="newsletterSubscribeOff" class="form-check-label">[{oxmultilang ident="UNSUBSCRIBE"}]</label>
    </div>
    <div class="mb-3">
         <p class="req-waring">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
        <button id="newsLetterSubmit" class="btn btn-primary" type="submit">[{oxmultilang ident="SUBMIT"}]</button>
    </div>
</form>
