<div class="mb-3 form-floating[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    <label class="req form-label col-lg-3">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername )}][{$invadr.oxuser__oxusername}][{else}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" size="37">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
        <div class="help-block"></div>
    </div>
</div>

[{if $oxcmp_user->oxuser__oxpassword->value}]
    <div class="oxValidate_pwd mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]"[{if !$aErrors.oxuser__oxpassword}] style="display:none;"[{/if}]>
        <label class="req form-label col-lg-3">[{oxmultilang ident="PASSWORD"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="password" size="37" name="user_password">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
            <div class="help-block"></div>
        </div>
    </div>
[{/if}]
