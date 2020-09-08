[{assign var="iManufacturerLimit" value="20"}]
[{assign var="manufacturers" value=$oView->getManufacturerlist()}]
[{if $manufacturers}]
    [{if $manufacturers|count}]
        [{block name="footer_manufacturers"}]
            <nav class="nav flex-column">
                [{assign var="rootManufacturer" value=$oView->getRootManufacturer()}]
                <a class="nav-link" href="[{$rootManufacturer->getLink()}]">[{oxmultilang ident="ALL_BRANDS"}]</a>
                [{foreach from=$manufacturers item=_mnf name=manufacturers}]
                    [{if $smarty.foreach.manufacturers.index < $iManufacturerLimit}]
                        <a class="nav-link" href="[{$_mnf->getLink()}]">
                            [{$_mnf->oxmanufacturers__oxtitle->value}]
                        </a>
                    [{/if}]
                [{/foreach}]
            </nav>
        [{/block}]
    [{/if}]
[{/if}]
