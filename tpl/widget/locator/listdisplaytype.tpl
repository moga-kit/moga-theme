[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]

[{if $oView->canSelectDisplayType()}]
    <button type="button" class="btn btn-outline-primary dropdown-toggle" id="displayType" data-bs-toggle="dropdown" aria-expanded="false">
        <strong>[{oxmultilang ident="LIST_DISPLAY_TYPE"}]</strong> [{oxmultilang ident=$listType}] <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="displayType" role="menu">
        <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="dropdown-item[{if $listType eq 'grid'}] active[{/if}]">[{oxmultilang ident="grid"}]</a></li>
        <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="dropdown-item[{if $listType eq 'line'}] active[{/if}]">[{oxmultilang ident="line"}]</a></li>
    </ul>
[{/if}]
