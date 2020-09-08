[{block name="widget_header_servicebox_flyoutbox"}]
    [{block name="widget_header_servicebox_items"}]
        <ul class="dropdown-menu dropdown-menu-right">
            <li>
                <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="MY_ACCOUNT"}]</a>
            </li>
            [{if $oViewConf->getShowCompareList()}]
                <li>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</a> [{if $oView->getCompareItemsCnt()}]<span class="badge bg-secondary">[{$oView->getCompareItemsCnt()}]</span>[{/if}]
                </li>
            [{/if}]
            <li>
                <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">
                    [{oxmultilang ident="MY_WISH_LIST"}]
                    [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge bg-secondary">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]
                </a>
            </li>
            [{if $oViewConf->getShowWishlist()}]
                <li>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
                        [{oxmultilang ident="MY_GIFT_REGISTRY"}]
                        [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge bg-secondary">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]
                    </a>
                </li>
            [{/if}]
            [{if $oViewConf->getShowListmania()}]
                <li>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]">
                        [{oxmultilang ident="MY_LISTMANIA"}]
                        [{if $oxcmp_user && $oxcmp_user->getRecommListsCount()}] <span class="badge bg-secondary">[{$oxcmp_user->getRecommListsCount()}]</span>[{/if}]
                    </a>
                </li>
            [{/if}]
            [{if $oViewConf->isFunctionalityEnabled( "blEnableDownloads" )}]
                <li>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">
                        [{oxmultilang ident="MY_DOWNLOADS"}]
                    </a>
                </li>
            [{/if}]
            <li><hr class="dropdown-divider"></li>
            <li>
                <a class="dropdown-item" href="[{$oViewConf->getLogoutLink()}]" title="[{oxmultilang ident="LOGOUT"}]">
                    [{oxmultilang ident="LOGOUT"}]
                </a>
            </li>
        </ul>
    [{/block}]
[{/block}]
