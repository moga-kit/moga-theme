[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="NEWSLETTER_SETTINGS"|oxmultilangassign}]
    [{if $oView->getSubscriptionStatus() != 0}]
        [{if $oView->getSubscriptionStatus() == 1}]
            <div class="alert alert-success">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_SUCCESS"}]</div>
        [{else}]
            <div class="alert alert-success">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION_CANCELED"}]</div>
        [{/if}]
    [{/if}]
    <div class="container-xxl py-5">
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">
                [{oxmultilang ident="NEWSLETTER_SETTINGS"}]
            </h3>
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="newsletter"}]
            </div>
        </div>

        [{include file="form/account_newsletter.tpl"}]
    </div>

[{/capture}]

[{include file="layout/page.tpl"}]
