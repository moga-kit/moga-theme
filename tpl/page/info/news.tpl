[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="LATEST_NEWS_AND_UPDATES_AT"|oxmultilangassign}]
    [{assign var="oNews" value=$oView->getNews()}]
    <h1>[{oxmultilang ident="LATEST_NEWS_AND_UPDATES_AT"}] [{$oxcmp_shop->oxshops__oxname->value}]</h1>

    [{foreach from=$oNews item=oNews}]
        [{if !empty($oNews) && !empty($oNews->oxnews__oxshortdesc->value)}]
            <h3>
                <span>[{$oNews->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNews->oxnews__oxshortdesc->value}]
            </h3>
            [{$oNews->getLongDesc() force=1}]
        [{else}]

        [{/if}]
    [{/foreach}]
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]

[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
