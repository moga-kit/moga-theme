[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    <div class="container-xxl">
        [{if $oView->isActive('PsLogin')}]
            [{include file="message/errors.tpl"}]
        [{/if}]

        <h1 id="openAccHeader">[{oxmultilang ident="OPEN_ACCOUNT"}]</h1>
        [{include file="form/register.tpl"}]
    </div>
[{/capture}]

[{if $oView->isActive('PsLogin')}]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl" sidebar="Right"}]
[{/if}]
