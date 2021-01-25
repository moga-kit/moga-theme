<form action="[{$oViewConf->getSelfActionLink()}]" name="newsletter" class="max-600" method="post">
    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="fnc" value="subscribe">
    <input type="hidden" name="cl" value="account_newsletter">

    <div class="mb-3 form-floating">
        <select name="status" id="status" class="form-select">
            <option value="1"[{if $oView->isNewsletter()}] selected[{/if}] >[{oxmultilang ident="YES"}]</option>
            <option value="0"[{if !$oView->isNewsletter()}] selected[{/if}] >[{oxmultilang ident="NO"}]</option>
        </select>
        <label for="status">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>
    </div>

    <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</p>
    <button id="newsletterSettingsSave" type="submit" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
</form>
