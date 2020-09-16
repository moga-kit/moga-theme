[{if $blSubscribeNews}]
    <div class="mb-3">
        [{block name="user_billing_newsletter"}]
            <input type="hidden" name="blnewssubscribed" value="0">
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="blnewssubscribed" id="subscribeNewsletter" [{if $oView->isNewsSubscribed()}]checked[{/if}] value="1">
                <label for="subscribeNewsletter" class="form-check-label">
                    [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                </label>
            </div>
            <span class="help-block">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
        [{/block}]
    </div>
[{/if}]
