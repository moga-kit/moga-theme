[{if $oxcmp_user}]
    [{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
    [{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
    [{assign var="recommListCount" value=$oxcmp_user->getRecommListsCount()}]
[{else}]
    [{assign var="noticeListCount" value="0"}]
    [{assign var="wishListCount" value="0"}]
    [{assign var="recommListCount" value="0"}]
[{/if}]
[{math equation="a+b+c+d" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount d=$recommListCount assign="notificationsCounter"}]
<div class="btn-group" role="group">
    <button type="button" aria-label="Usercenter" class="btn dropdown-toggle" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
        [{block name="dd_layout_page_header_icon_menu_account_button"}]
            [{*if !$oxcmp_user->oxuser__oxpassword->value}]
                [{oxmultilang ident="LOGIN"}]
            [{else}]
                [{oxmultilang ident="MY_ACCOUNT"}]
            [{/if*}]
            <i class="moga-person d-inline-block"></i>
        [{/block}]
    </button>
    [{if !$oxcmp_user->oxuser__oxpassword->value}]
        [{include file="widget/header/loginbox.tpl"}]
    [{else}]
        [{block name="dd_layout_page_header_icon_menu_account_list"}]
            [{include file="widget/header/servicebox.tpl"}]
        [{/block}]
    [{/if}]
</div>
