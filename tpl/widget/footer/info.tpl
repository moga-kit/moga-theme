[{block name="footer_information"}]
    <nav class="nav flex-column">
        [{oxifcontent ident="oximpressum" object="_cont"}]
            <a class="nav-link" href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxagb" object="_cont"}]
            <a class="nav-link" href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
            <a class="nav-link" href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <a class="nav-link" href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
            <a class="nav-link" href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxorderinfo" object="oCont"}]
            <a class="nav-link" href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{oxifcontent ident="oxcredits" object="oCont"}]
            <a class="nav-link" href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a>
        [{/oxifcontent}]
        [{if $oViewConf->getViewThemeParam('blFooterShowNewsletter')}]
            <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter"}]">[{oxmultilang ident="NEWSLETTER"}]</a>
        [{/if}]
        [{if $oViewConf->getViewThemeParam('blFooterShowNews')}]
            <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news"}]">[{oxmultilang ident="NEWS"}]</a>
        [{/if}]
    </nav>
[{/block}]
