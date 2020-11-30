[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="oxloadid" value=$oViewConf->getActContentLoadId()}]
    [{assign var="template_title" value=$oView->getTitle()}]

    [{if !$oContent->oxcontents__ddhidetitle->value}]
        <h1>[{$template_title}]</h1>
    [{/if}]

    <article class="cmsContent pb-5">
        [{$oView->getParsedContent()}]
    </article>


[{/capture}]
[{include file="layout/page.tpl"}]
