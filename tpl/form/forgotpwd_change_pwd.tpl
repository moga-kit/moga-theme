[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]

<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" novalidate>
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="updatePassword">
        <input type="hidden" name="uid" value="[{$oView->getUpdateId()}]">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">

    <div class="mb-3 form-floating[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <input type="password" id="password_new" placeholder=" " name="password_new" class="form-controltextbox">
        <label for="password_new">[{oxmultilang ident="NEW_PASSWORD"}]</label>
    </div>
    <div class="mb-3 form-floating[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <input type="password" name="password_new_confirm" placeholder=" " id="password_new_confirm" class="form-control textbox">
        <label for="password_new_confirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
    </div>
    <button class="btn btn-primary submitButton" type="submit" name="save" value="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</button>
</form>
