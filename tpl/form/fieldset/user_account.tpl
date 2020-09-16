<div class="mb-3[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    [{block name="user_account_username"}]
        <label class="req" for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <input id="userLoginName" class="form-control" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" required="required">
    [{/block}]
</div>
<div class="mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_password"}]
        <label class="req" for="userPassword">[{oxmultilang ident="PASSWORD"}]</label>
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
        <input id="userPassword" class="form-control" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" required="required">
    [{/block}]
</div>
<div class="mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_confirmpwd"}]
        <label class="req">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <input id="userPasswordConfirm" class="form-control" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" required="required">
    [{/block}]
</div>
[{*block name="user_account_newsletter"}]
    <input type="hidden" name="blnewssubscribed" value="0">
    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="blnewssubscribed" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>

        <label class="form-check-label" for="blnewssubscribed">
            [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
        </label>
        <p class="text-muted">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</p>
    </div>
[{/block*}]
