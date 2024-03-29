[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getSuggestData()}]
[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]

<form class="max-600 suggest" action="[{$oViewConf->getSslSelfLink()}]" method="post" novalidate>
    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="fnc" value="send">
    <input type="hidden" name="cl" value="suggest">
    <input type="hidden" name="anid" value="[{$_oProduct->oxarticles__oxnid->value}]">
    <input type="hidden" name="CustomError" value='suggest'>

    <h3>[{oxmultilang ident="CARD_TO" suffix="COLON"}]</h3>
    <div class="mb-3 form-floating">
        <input class="form-control" id="rec_name" type="text" name="editval[rec_name]" size="73" maxlength="73" value="[{$editval->rec_name}]" required>
        <label class="form-label req" for="rec_name">[{oxmultilang ident="RECIPIENT_NAME" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>
    <div class="mb-3 form-floating">
        <input id="rec_mail" class="form-control" type="email" name="editval[rec_email]" size="73" maxlength="73" value="[{$editval->rec_email}]" required>
        <label for="rec_mail" class="form-label req">[{oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>

    <h3>[{oxmultilang ident="FROM" suffix="COLON"}]</h3>
    <div class="mb-3 form-floating">
        <input id="send_name" class="form-control" type="text" name="editval[send_name]" size=73 maxlength=73 value="[{$editval->send_name}]" required>
        <label for="send_name" class="form-label req">[{oxmultilang ident="SENDER_NAME" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>
    <div class="mb-3 form-floating">
        <input id="send_email" class="form-control" type="email" name="editval[send_email]" size=73 maxlength=73 value="[{$editval->send_email}]" required>
        <label for="send_email" class="form-label req">[{oxmultilang ident="SENDER_EMAIL" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>
    <div class="mb-3 form-floating">
        <input id="send_subject" class="form-control" type="text" name="editval[send_subject]" size=73 maxlength=73 value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{oxmultilang ident="HAVE_A_LOOK" suffix="COLON"}] [{$_oProduct->oxarticles__oxtitle->value|strip_tags}][{/if}]" required>
        <label for="send_subject" class="form-label req">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>
    <div class="mb-3 form-floating">
        <textarea id="send_message" cols="70" rows="15" name="editval[send_message]" class="areabox form-control" required>[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
        <label for="send_message" class="form-label req">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
        <div class="help-block"></div>
    </div>

    [{block name="captcha_form"}][{/block}]

    <div class="mb-3 form-floating">
        <p class="req-waring">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
        <button class="btn btn-primary" type="submit">
            [{oxmultilang ident="SEND"}]
        </button>
    </div>
</form>
