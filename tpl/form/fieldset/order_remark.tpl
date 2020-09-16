[{if $blOrderRemark}]
    <div class="mb-3">
        <label for="orderRemark" class="form-label">[{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]</label>
        <textarea id="orderRemark" rows="4" name="order_remark" class="form-control" placeholder="[{oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE"}]">[{$oView->getOrderRemark()}]</textarea>
    </div>
[{/if}]
