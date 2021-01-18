[{capture append="oxidBlock_content"}]
    <div class="container-xxl py-5">
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">
                [{$oView->getTitle()}]
            </h3>
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
            </div>
        </div>

        [{block name="account_user_form"}]
            [{include file="form/user.tpl"}]
        [{/block}]
    </div>
[{/capture}]

[{include file="layout/page.tpl"}]
