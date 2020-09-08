[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value=$oView->getTitle()}]
    <h1>[{$oView->getTitle()}]</h1>
    <div class="cmsContent">
        <p>
            [{oxifcontent ident="oxcookiesexplanation" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        </p>
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
