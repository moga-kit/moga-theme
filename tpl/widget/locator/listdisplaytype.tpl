[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]

[{if $oView->canSelectDisplayType()}]
    <div class="btn-group" role="group" aria-label="Basic example">
        <a title="[{oxmultilang ident="grid"}]" href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-outline-primary btn-icon[{if $listType eq 'grid'}] active[{/if}]">
            <i class="moga-grid-fill"></i>
        </a>
        <a title="[{oxmultilang ident="line"}]" href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-outline-primary btn-icon[{if $listType eq 'line'}] active[{/if}]">
            <i class="moga-list-ul"></i>
        </a>
    </div>
[{/if}]
