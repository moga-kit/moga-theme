    <form name="login" class="needs-validation" action="[{$oViewConf->getSslSelfLink()}]" method="post" id="private-sales-login">
        [{oxscript include="js/private_sales.min.js" priority=11}]

        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
        [{if $oView->getArticleId()}]
          <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
        [{/if}]
        [{if $oView->getProduct()}]
          [{assign var="product" value=$oView->getProduct()}]
          <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
        [{/if}]
        <input type="hidden" name="ord_agb" value="0">

        <div class="form-check">
            <input type="checkbox" id="ord_agb" name="ord_agb" value="1" class="form-check-input agb-check">
            <label class="form-check-label" for="ord_agb">
                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                [{$oContent->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            </label>
        </div>
        <button type="submit" class="submitButton btn btn-outline-primary" disabled id="ord_agb_accept">[{oxmultilang ident="LOGIN"}]</button>
    </form>
