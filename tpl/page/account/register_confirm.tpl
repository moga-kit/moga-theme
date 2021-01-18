[{capture append="oxidBlock_content"}]
    <div class="container-xxl">
        [{assign var="template_title" value="MESSAGE_WELCOME_REGISTERED_USER"|oxmultilangassign}]
        <h3>[{oxmultilang ident="MESSAGE_WELCOME_REGISTERED_USER"}]</h3>
        <div class="box info">
          [{oxmultilang ident="MESSAGE_ACCOUNT_REGISTRATION_CONFIRMED"}]
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]

