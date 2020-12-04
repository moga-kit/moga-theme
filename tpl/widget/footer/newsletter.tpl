[{block name="dd_footer_newsletter_form"}]
    <form class="newsletter-form"  action="[{$oViewConf->getSslSelfLink()}]" method="post">
        <div class="mb-3">
            [{block name="dd_footer_newsletter_form_inner"}]
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="fnc" value="fill">
                <input type="hidden" name="cl" value="newsletter">
                [{if $oView->getProduct()}]
                    [{assign var="product" value=$oView->getProduct()}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]

                [{block name="dd_footer_newsletter_form_inner_group"}]
                    <label class="visually-hidden" for="footer_newsletter_oxusername">[{oxmultilang ident="NEWSLETTER"}]</label>
                    <div class="input-group">
                        <input class="form-control" type="email" id="footer_newsletter_oxusername" name="editval[oxuser__oxusername]" placeholder="[{oxmultilang ident="EMAIL"}]" aria-label="[{oxmultilang ident="EMAIL"}]">
                        <button class="btn btn-primary" type="submit">[{oxmultilang ident="SUBSCRIBE"}]</button>
                    </div>
                [{/block}]
            [{/block}]
        </div>
    </form>
[{/block}]
