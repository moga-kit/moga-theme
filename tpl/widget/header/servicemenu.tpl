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

<div class="btn-group service-menu [{if !$oxcmp_user}]showLogin[{/if}]">
    <button type="button" aria-label="Usercenter" class="btn dropdown-toggle" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
        [{block name="dd_layout_page_header_icon_menu_account_button"}]
            <span class="d-none d-lg-inline-block">
            [{if !$oxcmp_user}]
                [{oxmultilang ident="LOGIN"}]
            [{else}]
                [{oxmultilang ident="MY_ACCOUNT"}]
            [{/if}]
            </span>
            <i class="moga-person d-inline-block d-md-none"></i>
        [{/block}]
    </button>
    <ul class="dropdown-menu dropdown-menu-right login-menu" role="menu">
        [{block name="dd_layout_page_header_icon_menu_account_list"}]
            <li>
                <div class="row">
                    <div class="[{if !$oxcmp_user}]col-12 col-sm-5[{else}]col-12[{/if}] order-1 order-md-2">
                        <div class="service-menu-box">
                            [{include file="widget/header/servicebox.tpl"}]
                            [{if $oxcmp_user}]
                                <div class="divider"></div>
                                <div class="text-right">
                                    <a class="btn btn-danger" role="button" href="[{$oViewConf->getLogoutLink()}]" title="[{oxmultilang ident="LOGOUT"}]">
                                        [{oxmultilang ident="LOGOUT"}]
                                    </a>
                                </div>
                            [{/if}]
                        </div>
                    </div>
                    [{if !$oxcmp_user}]
                        <div class="col-12 col-sm-7 order-2 order-md-1">
                            <div class="service-menu-box">
                                [{include file="widget/header/loginbox.tpl"}]
                            </div>
                        </div>
                    [{/if}]
                </div>
            </li>
        [{/block}]
    </ul>
</div>
