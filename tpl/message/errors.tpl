[{if $Errors|is_array && $Errors.default|is_array && !empty($Errors.default)}]
    <div class="container-xxl">
        [{foreach from=$Errors.default item=oEr key=key}]
            <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
        [{/foreach}]
    </div>
[{/if}]
[{if $Errors.popup|is_array && !empty($Errors.popup)}]
    [{include file="message/errors_modal.tpl"}]
[{/if}]
