[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="CHANGE_PASSWORD"|oxmultilangassign}]

    [{if $oView->isPasswordChanged()}]
        <div class="alert alert-success">
            [{oxmultilang ident="MESSAGE_PASSWORD_CHANGED"}]
        </div>
    [{/if}]
    [{if $Errors|is_array && $Errors.user|is_array && !empty($Errors.user)}]
        <div class="alert alert-danger">
            [{foreach from=$Errors.user item=oEr key=key}]
                <p>[{$oEr->getOxMessage()}]</p>
            [{/foreach}]
        </div>
    [{/if}]
    <div class="container-xxl py-5">
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">
                [{oxmultilang ident="CHANGE_PASSWORD"}]
            </h3>
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="password"}]
            </div>
        </div>

        [{include file="form/user_password.tpl"}]
    </div>

[{/capture}]

[{include file="layout/page.tpl"}]
