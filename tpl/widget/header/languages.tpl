[{if $oView->isLanguageLoaded()}]
    [{if $oxcmp_lang|@count > 1}]
        <div class="btn-group" role="group">
            <button type="button" aria-label="Language" class="btn dropdown-toggle" data-bs-toggle="dropdown" data-display="static">
                [{assign var="sLangImg" value="lang/"|cat:$oViewConf->getActLanguageAbbr()|cat:".png"}]
                [{block name="dd_layout_page_header_icon_menu_languages_button"}]
                    <img src="[{$oViewConf->getImageUrl($sLangImg)}]" alt="[{$sLangImg}]">
                [{/block}]
            </button>
            <ul class="dropdown-menu dropdown-menu-md-end">
                [{block name="dd_layout_page_header_icon_menu_languages_list"}]
                    [{foreach from=$oxcmp_lang item=_lng}]
                        [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
                        [{if $_lng->selected}]
                            [{capture name="languageSelected"}]
                                <a class="flag dropdown-link [{$_lng->abbr}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')" >[{$_lng->name}]</span></a>
                            [{/capture}]
                        [{/if}]
                        <li class="dropdown-item[{if $_lng->selected}] active[{/if}]">
                            <a class="flag dropdown-link [{$_lng->abbr}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]">
                                <img src="[{$oViewConf->getImageUrl($sLangImg)}]" alt="[{$sLangImg}]"> [{$_lng->name}]
                            </a>
                        </li>
                    [{/foreach}]
                [{/block}]
            </ul>
        </div>
    [{/if}]
[{/if}]
