<div class="mb-3[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    <div class="form-floating">
        <input class="form-control" placeholder=" " type="text" id="invadr[oxuser__oxusername]" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername )}][{$invadr.oxuser__oxusername}][{else}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" size="37">
        <label for="invadr[oxuser__oxusername]" class="req">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
    </div>
    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]

        <div class="help-block"></div>
</div>

[{if $oxcmp_user->oxuser__oxpassword->value}]
    <div class="oxValidate_pwd mb-3[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]"[{if !$aErrors.oxuser__oxpassword}] style="display:none;"[{/if}]>
        <label class="req form-label col-lg-3">[{oxmultilang ident="PASSWORD"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="password" size="37" name="user_password">
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
        </div>
    </div>
[{/if}]
