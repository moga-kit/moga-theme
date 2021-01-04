<form class="max-600" action="[{$oViewConf->getSelfActionLink()}]" name="changepassword" method="post" novalidate>
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="fnc" value="changePassword">
    <input type="hidden" name="cl" value="account_password">
    <input type="hidden" name="CustomError" value='user'>
    <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">

    <div class="mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <label class="form-label" for="passwordOld">[{oxmultilang ident="OLD_PASSWORD"}]</label>
        <input type="password" id="passwordOld" name="password_old" class="form-control" required="">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </div>
    <div class="mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <label class="form-label" for="passwordNew">[{oxmultilang ident="NEW_PASSWORD"}]</label>
        <input type="password" id="passwordNew" name="password_new" class="form-control" required="">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </div>
    <div class="mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
        <label class="form-label" for="passwordNewConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <input type="password" id="passwordNewConfirm" name="password_new_confirm" class="form-control" required="" data-validation-matches-match="password_new" data-validation-matches-message="[{oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH"}]">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
    </div>
    <div class="mb-3">
        <button id="savePass" type="submit" class="btn btn-primary" >[{oxmultilang ident="SAVE"}]</button>
    </div>
</form>
