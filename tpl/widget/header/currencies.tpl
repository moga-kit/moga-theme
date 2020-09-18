[{if $oView->loadCurrency()}]
    [{if $oxcmp_cur|@count > 1}]
        [{assign var="currency" value=$oView->getActCurrency()}]
        <div class="btn-group">
            <button type="button" aria-label="Currencys" class="btn dropdown-toggle" data-toggle="dropdown" data-display="static">
                [{block name="dd_layout_page_header_icon_menu_currencies_button"}]
                    [{$currency->name}]
                [{/block}]
            </button>
            <ul class="dropdown-menu dropdown-menu-md-right">
                [{block name="dd_layout_page_header_icon_menu_currencies_list"}]
                    [{foreach from=$oxcmp_cur item=_cur}]
                        [{if $_cur->selected}]
                            [{assign var="selectedCurrency" value=$_cur->name}]
                            [{capture name="currencySelected"}]
                                <a class="dropdown-item" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]"><span>[{$_cur->name}]</span></a>
                            [{/capture}]
                        [{/if}]
                        <li>
                            <a class="dropdown-item[{if $_cur->selected}] active[{/if}]" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]">[{$_cur->name}]</a>
                        </li>
                    [{/foreach}]
                [{/block}]
            </ul>
        </div>
    [{/if}]
[{/if}]
