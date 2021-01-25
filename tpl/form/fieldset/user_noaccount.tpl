<div class="mb-3 form-floating[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    [{block name="user_noaccount_email"}]
        <label class="form-label req">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <input id="userLoginName" class="form-control" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]">
        <div class="help-block">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        </div>
    [{/block}]
</div>
[{*block name="user_noaccount_newsletter"}]
<div class="mb-3 form-floating">

        <div class="col-lg-9 offset-lg-3">
            <input type="hidden" name="blnewssubscribed" value="0">
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]> [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                </label>
            </div>
            <span class="help-block">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
        </div>

</div>
    [{/block*}]
