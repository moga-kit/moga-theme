[{assign var="template_title" value="REGISTER"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]
    <div class="container-xxl">
        <h1>[{oxmultilang ident="LOGIN"}]</h1>
        [{include file="form/login_account.tpl"}]
    </div>

[{/capture}]

[{include file="layout/page.tpl"}]
