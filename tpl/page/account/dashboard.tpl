[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]
    <h1 class="h2">[{oxmultilang ident="MY_ACCOUNT"}]
        "[{$oxcmp_user->oxuser__oxusername->value}]"</h1>

    [{if $oView->getAccountDeletionStatus() === false}]
    [{assign var="statusMessage" value="DD_DELETE_MY_ACCOUNT_ERROR"|oxmultilangassign}]
    [{include file="message/error.tpl" statusMessage=$statusMessage}]
    [{/if}]

    <div class="row row-cols-1 row-cols-md-2">
        [{block name="account_dashboard_col1"}]
            <div class="col mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">[{oxmultilang ident="ORDER_HISTORY"}]</div>
                        <div class="card-text">
                            [{oxmultilang ident="ORDERS"}] [{$oView->getOrderCnt()}]
                        </div>
                        <a class="btn btn-outline-primary stretched-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]">
                            [{oxmultilang ident="MORE"}]
                        </a>
                    </div>
                </div>
            </div>

            [{if $oView->isEnabledDownloadableFiles()}]
                <div class="col mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                [{oxmultilang ident="MY_DOWNLOADS"}]
                            </div>
                            <div class="card-text">
                                [{oxmultilang ident="MY_DOWNLOADS_DESC"}]
                            </div>
                            <a class="btn btn-outline-primary stretched-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">
                                [{oxmultilang ident="MORE"}]
                            </a>
                        </div>
                    </div>
                </div>
            [{/if}]

        [{/block}]
        <div class="col mb-3">
            [{block name="account_dashboard_col2"}]
            <div class="card">
                <div class="card-header">
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">[{oxmultilang ident="MY_WISH_LIST"}]</a>
                </div>
                <div class="card-body">
                    [{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getNoticeListArtCnt()}][{else}]0[{/if}]
                </div>
            </div>
            [{if $oViewConf->getShowWishlist()}]
            <div class="card">
                <div class="card-header">
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">[{oxmultilang ident="MY_GIFT_REGISTRY"}]</a>
                </div>
                <div class="card-body">
                    [{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getWishListArtCnt()}][{else}]0[{/if}]
                </div>
            </div>
            [{/if}]
            [{if $oViewConf->getShowCompareList()}]
            <div class="card">
                <div class="card-header">
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</a>
                </div>
                <div class="card-body">[{oxmultilang ident="PRODUCT"}] [{if $oView->getCompareItemsCnt()}][{$oView->getCompareItemsCnt()}][{else}]0[{/if}]</div>
            </div>
            [{/if}]

            [{if $oView->isUserAllowedToManageOwnReviews()}]
            <div class="card">
                <div class="card-header">
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_reviewlist"}]">[{oxmultilang ident="MY_REVIEWS"}]</a>
                </div>
                <div class="card-body">[{oxmultilang ident="MY_REVIEWS"}] [{if $oView->getReviewAndRatingItemsCount()}][{$oView->getReviewAndRatingItemsCount()}][{else}]0[{/if}]</div>
            </div>
            [{/if}]
            [{/block}]
        </div>
    </div>

    <div class="row">
        [{block name="account_dashboard_delete_my_account"}]
        <div class="col-6">
            [{if $oView->isUserAllowedToDeleteOwnAccount()}]
            <button
                    class="btn btn-danger"
                    data-toggle="modal"
                    data-target="#delete_my_account_confirmation"
            >
                <i class="moga-trash"></i>
                [{oxmultilang ident="DD_DELETE_MY_ACCOUNT"}]
            </button>
            [{include file="page/account/delete_my_account_confirmation.tpl"}]
            [{/if}]
        </div>
        [{/block}]
        <div class="col-6 text-end">
            <a href="[{$oViewConf->getLogoutLink()}]" class="btn btn-outline-primary" role="getLogoutLink">
                [{oxmultilang ident="LOGOUT"}]
            </a>
        </div>
        <p>&nbsp;</p>
    </div>
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
