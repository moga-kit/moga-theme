[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="oxloadid" value=$oViewConf->getActContentLoadId()}]
    [{assign var="template_title" value=$oView->getTitle()}]

    <h1>[{$template_title}]</h1>
    <article class="cmsContent">
        [{$oView->getParsedContent()}]
    </article>


[{/capture}]
[{include file="layout/page.tpl"}]
