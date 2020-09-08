[{capture append="oxidBlock_content"}]
    [{if $oView->getContactSendStatus()}]
        [{assign var="_statusMessage" value="PAGE_DETAILS_THANKYOUMESSAGE1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessageSuffix" value="PAGE_DETAILS_THANKYOUMESSAGE2"|oxmultilangassign}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage|cat:$_statusMessageSuffix}]
    [{/if}]

    [{assign var="sGoogleMapsAddr" value=$oViewConf->getViewThemeParam('sGoogleMapsAddr')}]
    [{if $sGoogleMapsAddr}]
        [{*oxscript include="js/libs/pages/contact.min.js" priority=10*}]

        <div class="google-maps mb-5">
            <iframe width="100%" height="400" style="width:100%;" frameborder="0" src="https://www.google.de/maps?t=m&amp;q=[{$sGoogleMapsAddr|urlencode}]&amp;ie=UTF8&amp;hq=[{$sGoogleMapsAddr|urlencode}]&amp;output=embed"></iframe>
        </div>

    [{/if}]
    <div class="container-xxl mb-5">
        <div class="row">
            <div class="col-12">
                <h1 class="page-header">[{oxmultilang ident="DD_CONTACT_PAGE_HEADING"}]</h1>
            </div>
            <div class="col-12 col-lg-3 order-2">
                <h2 class="page-header">[{oxmultilang ident="ADDRESS"}]</h2>
                <div itemscope itemtype="http://schema.org/Organization">
                    <address>
                        <strong itemprop="name">[{$oxcmp_shop->oxshops__oxcompany->value}]</strong><br>
                        <span class="d-block" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
                            <span itemprop="streetAddress">[{$oxcmp_shop->oxshops__oxstreet->value}]</span><br>
                            <span itemprop="postalCode">[{$oxcmp_shop->oxshops__oxzip->value}]</span> [{$oxcmp_shop->oxshops__oxcity->value}]<br>
                            [{$oxcmp_shop->oxshops__oxcountry->value}]<br>
                            <span itemprop="addressLocality">[{$oxcmp_shop->oxshops__oxcity->value}], [{$oxcmp_shop->oxshops__oxcountry->value}]</span>
                        </span>
                        [{if $oxcmp_shop->oxshops__oxtelefon->value}]
                            <strong>[{oxmultilang ident="PHONE" suffix="COLON"}]</strong> <span itemprop="telephone">[{$oxcmp_shop->oxshops__oxtelefon->value}]</span><br>
                        [{/if}]
                        [{if $oxcmp_shop->oxshops__oxtelefax->value}]
                            <strong>[{oxmultilang ident="FAX" suffix="COLON"}]</strong> <span itemprop="faxNumber">[{$oxcmp_shop->oxshops__oxtelefax->value}]</span><br>
                        [{/if}]
                        [{if $oxcmp_shop->oxshops__oxinfoemail->value}]
                            <strong>[{oxmultilang ident="EMAIL" suffix="COLON"}]</strong> <span itemprop="email">[{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value}]</span><br>
                        [{/if}]
                        <span itemprop="url">[{$oViewConf->getHomeLink()}]</span>
                    </address>
                </div>
            </div>
            <div class="col-12 col-lg-9 order-1">
                <h2 class="page-header">[{oxmultilang ident="DD_CONTACT_FORM_HEADING"}]</h2>
                [{include file="form/contact.tpl"}]
            </div>
        </div>
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]
