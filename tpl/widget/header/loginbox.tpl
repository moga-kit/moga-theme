[{assign var="bIsError" value=0}]
[{capture name="loginErrors"}]
    [{foreach from=$Errors.loginBoxErrors item=oEr key=key}]
        <p id="errorBadLogin" class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
        [{assign var="bIsError" value=1}]
    [{/foreach}]
[{/capture}]
<div class="dropdown-menu dropdown-menu-end">
    <form class="px-3 py-2" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" style="width: 270px">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oViewConf->getTopActiveClassName() eq "content"}]
            <input type="hidden" name="oxcid" value="[{$oViewConf->getContentId()}]">
        [{/if}]
        <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
        <input type="hidden" name="CustomError" value="loginBoxErrors">
        [{if $oViewConf->getActArticleId()}]
            <input type="hidden" name="anid" value="[{$oViewConf->getActArticleId()}]">
        [{/if}]

        <div class="mb-3 form-floating">
            <input id="loginEmail" type="email" name="lgn_usr" autocomplete="email" class="form-control" placeholder=" ">
            <label for="loginEmail">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        </div>

        <div class="mb-3 form-floating">
            <input id="loginPasword" type="password" name="lgn_pwd" autocomplete="current-password" class="form-control">
            <label for="loginPasword">[{oxmultilang ident="PASSWORD"}]</label>
            <a class="small forgotPasswordOpener" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=forgotpwd"}]" title="[{oxmultilang ident="FORGOT_PASSWORD"}]">[{oxmultilang ident="FORGOT_PASSWORD"}]</a>
        </div>

        [{if $oViewConf->isFunctionalityEnabled( "blShowRememberMe" )}]
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" value="1" name="lgn_cook" id="remember">
                <label class="form-check-label" for="remember">
                    [{oxmultilang ident="REMEMBER_ME"}]
                </label>
            </div>
        [{/if}]

        <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>

        <a class="btn btn-outline-primary" id="registerLink"  href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]" title="[{oxmultilang ident="REGISTER"}]">[{oxmultilang ident="REGISTER"}]</a>

        [{block name="thirdparty_login"}][{/block}]
    </form>
</div>
