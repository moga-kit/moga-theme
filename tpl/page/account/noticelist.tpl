[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_WISH_LIST"|oxmultilangassign}]
    <div class="container-xxl py-5">
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">
                [{oxmultilang ident="MY_WISH_LIST"}]
            </h3>
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="noticelist"}]
            </div>
        </div>

        [{if $oView->getNoticeProductList()}]
            [{include file="widget/product/list.tpl" type="line" listId="noticelistProductList" title="" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
        [{else}]
            <p class="alert alert-info">[{oxmultilang ident="WISH_LIST_EMPTY"}]</p>
        [{/if}]
    </div>

[{/capture}]

[{include file="layout/page.tpl"}]
