[{block name="footer_services"}]
    <nav class="nav flex-column">
        [{block name="footer_services_items"}]
            <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a>
            [{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
                <a class="nav-link" href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="HELP"}]</a>
            [{/if}]
            [{if $oViewConf->getViewThemeParam('blFooterShowLinks')}]
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">[{oxmultilang ident="LINKS"}]</a>
            [{/if}]
            [{if $oView->isActive('Invitations')}]
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=invite"}]">[{oxmultilang ident="INVITE_YOUR_FRIENDS"}]</a>
            [{/if}]
            [{oxhasrights ident="TOBASKET"}]
                [{block name="footer_services_cart"}]
                    <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
                        [{oxmultilang ident="CART"}]
                        [{if $oxcmp_basket && $oxcmp_basket->getItemsCount() > 0}] <span class="badge bg-secondary rounded-pill">[{$oxcmp_basket->getItemsCount()}]</span>[{/if}]
                    </a>
                [{/block}]
            [{/oxhasrights}]
            <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="ACCOUNT"}]</a>

            <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">
                [{oxmultilang ident="WISH_LIST"}]
                [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge bg-secondary rounded-pill">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]
            </a>

            [{if $oViewConf->getShowWishlist()}]
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
                    [{oxmultilang ident="MY_GIFT_REGISTRY"}]
                    [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge bg-secondary rounded-pill">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]
                </a>
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$oView->getWishlistUserId()}]">
                    [{oxmultilang ident="PUBLIC_GIFT_REGISTRIES"}]
                </a>
            [{/if}]
            [{if $oView->isEnabledDownloadableFiles()}]
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
            [{/if}]
        [{/block}]
    </nav>
[{/block}]
