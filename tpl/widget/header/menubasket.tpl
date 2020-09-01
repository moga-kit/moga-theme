<li class="fixed-header-item">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" rel="nofollow" class="fixed-header-link">
        <i class="moga-bag"></i>
        [{if isset($oxcmp_basket) && $oxcmp_basket->getItemsCount() > 0}]
            [{ $oxcmp_basket->getItemsCount() }]
        [{/if}]
    </a>
</li>
