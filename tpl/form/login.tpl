[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]
    <form id="optionLogin" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post"  novalidate>

        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        [{block name="checkout_options_login_text"}]
        [{/block}]
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        <div class="mb-3 [{if $aErrors}]oxInValid[{/if}]">
            <label for="lgn_usr">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
            <input type="text" id="lgn_usr" name="lgn_usr" autocomplete="email" class="form-control textbox" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]" required>
        </div>
        <div class="mb-3 [{if $aErrors}]oxInValid[{/if}]">
            <label for="lgn_pwd">[{oxmultilang ident="PASSWORD"}]</label>
            <div class="input-group">
                <input type="password" id="lgn_pwd" name="lgn_pwd" autocomplete="current-password" class="form-control textbox stepsPasswordbox" placeholder="[{oxmultilang ident="PASSWORD"}]" required>
                <a class="btn btn-outline-primary forgotPasswordOpener" id="step2PswdOpener" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" title="[{oxmultilang ident="FORGOT_PASSWORD"}]">?</a>
            </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Einloggen</button>
    </form>
