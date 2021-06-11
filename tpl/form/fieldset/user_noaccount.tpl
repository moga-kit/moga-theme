<div class="mb-3 form-floating[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    [{block name="user_noaccount_email"}]
        <input id="userLoginName" class="form-control" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]">
        <label for="userLoginName" class="req">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <div class="help-block">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        </div>
    [{/block}]
</div>
[{block name="user_noaccount_newsletter"}]
    <input type="hidden" name="blnewssubscribed" value="0">
    <div class="mb-3 form-check">
        <input type="checkbox" id="blnewssubscribed" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]> [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
        <label class="form-check-label" for="blnewssubscribed">
            [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
        </label>
        <p class="text-muted">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</p>
    </div>
[{/block}]
