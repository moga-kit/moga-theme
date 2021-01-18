[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_GIFT_REGISTRY"|oxmultilangassign}]
    [{if !$oView->getWishListUsers() && $oView->getWishListSearchParam()}]
        [{assign var="_statusMessage" value="MESSAGE_SORRY_NO_GIFT_REGISTRY"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    [{assign var="editval" value=$oView->getEnteredData()}]
    [{if $oView->isWishListEmailSent()}]
        [{assign var="_statusMessage" value="GIFT_REGISTRY_SENT_SUCCESSFULLY"|oxmultilangassign:$editval->rec_email}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{/if}]
    <div class="container-xxl py-5">
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">
                [{$oView->getTitle()}]
            </h3>
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="wishlist"}]
            </div>
        </div>

        <div class="wishlist-search">
            [{include file="form/wishlist_search.tpl" searchClass="account_wishlist"}]
        </div>

        <div class="wishlist">
            [{if $oView->getWishList()}]
                [{include file="form/wishlist_publish.tpl"}]
                [{include file="form/wishlist_suggest.tpl"}]
            [{/if}]
        </div>

        [{if $oView->getWishList()}]
            [{include file="widget/product/list.tpl" type="line" listId="wishlistProductList" title="" products=$oView->getWishProductList() removeFunction="towishlist" toBasketFunction="tobasket" owishid=$oxcmp_user->oxuser__oxid->value}]
        [{else}]
            <p class="alert alert-info">
                [{oxmultilang ident="GIFT_REGISTRY_EMPTY"}]
            </p>
        [{/if}]
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]
