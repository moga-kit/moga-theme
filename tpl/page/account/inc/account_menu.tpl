<div class="dropdown">
    <button class="btn btn-outline-primary btn-sm dropdown-toggle float-end" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Wo Willst du hin?
    </button>
    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
        [{block name="account_menu"}]
        <a class="dropdown-item[{if $active_link == "dashboard"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]" title="Übersicht">Übersicht</a>
        <a class="dropdown-item[{if $active_link == "password"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" title="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
        <a class="dropdown-item[{if $active_link == "newsletter"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" title="[{oxmultilang ident="NEWSLETTER_SETTINGS"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
        <a class="dropdown-item[{if $active_link == "billship"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" title="[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
        <a class="dropdown-item[{if $active_link == "orderhistory"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" title="[{oxmultilang ident="ORDER_HISTORY"}]">[{oxmultilang ident="ORDER_HISTORY"}]</a>
        [{if $oViewConf->getShowCompareList()}]
        <a class="dropdown-item[{if $active_link == "compare"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]" title="[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}][{if $oView->getCompareItemCount() > 0}] <span class="badge">[{$oView->getCompareItemCount()}]</span>[{/if}]</a>
        [{/if}]

        [{if $oViewConf->getShowWishlist()}]
        <a class="dropdown-item[{if $active_link == "wishlist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]" title="[{oxmultilang ident="MY_GIFT_REGISTRY"}]">[{oxmultilang ident="MY_GIFT_REGISTRY"}][{if $oxcmp_user && $oxcmp_user->getWishListArtCnt() > 0}] <span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]</a>
        [{/if}]
        [{if $oViewConf->getShowListmania()}]
        <a class="dropdown-item[{if $active_link == "recommendationlist"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]" title="[{oxmultilang ident="MY_LISTMANIA"}]">[{oxmultilang ident="MY_LISTMANIA"}]</a>
        [{/if}]
        [{if $oView->isEnabledDownloadableFiles()}]
        <a class="dropdown-item[{if $active_link == "downloads"}] active[{/if}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]" title="[{oxmultilang ident="MY_DOWNLOADS"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
        [{/if}]
        [{/block}]
    </div>
</div>
