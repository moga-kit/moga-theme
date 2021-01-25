<div class="mb-3 form-floating[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    [{block name="user_account_username"}]
        <input id="userLoginName" class="form-control" placeholder=" " type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" required>
        <label class="req" for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
    [{/block}]
</div>
<div class="mb-3 form-floating[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_password"}]
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
        <input id="userPassword" class="form-control" placeholder=" " type="password" name="lgn_pwd" value="[{$lgn_pwd}]" required>
        <label class="req" for="userPassword">[{oxmultilang ident="PASSWORD"}]</label>
    [{/block}]
</div>
<div class="mb-3 form-floating[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_confirmpwd"}]
        <input id="userPasswordConfirm" class="form-control" placeholder=" " type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" required>
        <label class="req" for="userPasswordConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
    [{/block}]
</div>
[{*block name="user_account_newsletter"}]
    <input type="hidden" name="blnewssubscribed" value="0">
    <div class="mb-3 form-floating form-check">
        <input type="checkbox" class="form-check-input" id="blnewssubscribed" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>

        <label class="form-check-label" for="blnewssubscribed">
            [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
        </label>
        <p class="text-muted">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</p>
    </div>
[{/block*}]
