[{block name="widget_locator_sort"}]
    [{if $oView->showSorting()}]
        [{assign var="_listType" value=$oView->getListDisplayType()}]
        [{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
        [{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
        [{assign var="_sortColumnVarName" value=$oView->getSortOrderByParameterName()}]
        [{assign var="_sortDirectionVarName" value=$oView->getSortOrderParameterName()}]
        <button type="button" class="btn btn-outline-primary btn-icon dropdown-toggle" id="sort" data-bs-toggle="dropdown" aria-expanded="false">
            [{if $oView->getListOrderBy()}]
                [{if $oView->getListOrderBy()=='oxtitle' || $oView->getListOrderBy()=='oxvarminprice'}]
                    <i class="moga-[{$oView->getListOrderBy()}][{if $oView->getListOrderDirection() == 'asc'}]-up[{else}]-down[{/if}]"></i>
                [{else}]
                    [{oxmultilang ident=$oView->getListOrderBy()|upper }]
                [{/if}]
            [{else}]
                [{oxmultilang ident="SORT"}]
            [{/if}]
        </button>
        <ul class="dropdown-menu" aria-labelledby="sort" role="menu">
            [{foreach from=$oView->getSortColumns() item=sColumnName}]
                <li>
                    <a class="dropdown-item[{if $oView->getListOrderDirection() == 'desc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]" href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=desc&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_DESC"}]">
                        [{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_DESC"}]
                    </a>
                </li>
                <li>
                    <a class="dropdown-item[{if $oView->getListOrderDirection() == 'asc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]" href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_ASC"}]">
                        [{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_ASC"}]
                    </a>
                </li>
            [{/foreach}]
        </ul>
    [{/if}]
[{/block}]
