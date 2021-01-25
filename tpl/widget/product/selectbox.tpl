[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
<div class="mb-3 dropDown">
    [{if !$blHideLabel}]
    <label class="form-label">[{$oSelectionList->getLabel()}]</label>
    [{/if}]

    <select class="form-select" aria-label="[{$oSelectionList->getLabel()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]"[{if $blSubmitOnChange}] onchange="this.form.submit()"[{/if}]>
        <option value="">
        [{if $sFieldName == "sel"}]
        [{oxmultilang ident="PLEASE_CHOOSE"}]
        [{else}]
        [{oxmultilang ident="CHOOSE_VARIANT"}]
        [{/if}]</option>

        [{foreach from=$oSelections item=oSelection}]
            <option[{if $oSelection->isActive()}] selected[{/if}] value="[{$oSelection->getValue()}]">[{$oSelection->getName()}]</option>
        [{/foreach}]
    </select>
</div>
[{/if}]
