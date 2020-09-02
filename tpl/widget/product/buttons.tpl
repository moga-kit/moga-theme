[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="mb-3 dropDown">
        [{if !$blHideLabel}]
        <label class="control-label">[{$oSelectionList->getLabel()}]</label>
        [{/if}]
        <div class="dropdown">
            [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
            [{if $editable !== false}]
                <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">

                [{foreach from=$oSelections item=oSelection}]
                    <a href="[{$oSelection->getLink()}]" data-selection-id="[{$oSelection->getValue()}]" class="btn btn-outline-primary[{if $oSelection->isActive()}] active[{/if}][{if $oSelection->isDisabled()}] disabled[{/if}]">[{$oSelection->getName()}]</a>
                [{/foreach}]
            [{/if}]
        </div>

    </div>

    [{*}]
    <select class="form-select" aria-label="[{$oSelectionList->getLabel()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" onchange="this.form.submit()">
        <option value="">
        [{if $sFieldName == "sel"}]
        [{oxmultilang ident="PLEASE_CHOOSE"}]
        [{else}]
        [{oxmultilang ident="CHOOSE_VARIANT"}]
        [{/if}]</option>

        [{foreach from=$oSelections item=oSelection}]
        <option[{if $oSelection->isActive()}] selected[{/if}] value="[{$oSelection->getValue()}]">[{$oSelection->getName()}]</option>
        [{/foreach}]
    </select>[{*}]
    [{/if}]
