[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MESSAGE_WELCOME_REGISTERED_USER"|oxmultilangassign}]
    <h1 class="h2">[{oxmultilang ident="MESSAGE_WELCOME_REGISTERED_USER"}]</h1>
    <div class="box info">
      [{oxmultilang ident="MESSAGE_ACCOUNT_REGISTRATION_CONFIRMED"}]
    </div>

[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]

