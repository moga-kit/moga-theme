[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
[{*
    <div class="mb-3 dropDown">
        [{if !$blHideLabel}]
            <label class="form-label">[{$oSelectionList->getLabel()}]</label>
        [{/if}]
        <div class="dropdown">
            <button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">
                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                [{if $oActiveSelection}]
                    [{$oActiveSelection->getName()}]
                [{elseif !$blHideDefault}]
                    [{if $sFieldName == "sel"}]
                        [{oxmultilang ident="PLEASE_CHOOSE"}]
                    [{else}]
                        [{$oSelectionList->getLabel()}] [{oxmultilang ident="CHOOSE_VARIANT"}]
                    [{/if}]
                [{/if}]
            </button>
            [{if $editable !== false}]
                <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
                <ul class="dropdown-menu [{$sJsAction}][{if $sFieldName != "sel"}] vardrop[{/if}]" role="menu">
                    [{if $oActiveSelection && !$blHideDefault}]
                        <li>
                            <a href="#" rel="" class="dropdown-item">
                                [{if $sFieldName == "sel"}]
                                    [{oxmultilang ident="PLEASE_CHOOSE"}]
                                [{else}]
                                    [{oxmultilang ident="CHOOSE_VARIANT"}]
                                [{/if}]
                            </a>
                        </li>
                    [{/if}]
                    [{foreach from=$oSelections item=oSelection}]
                        <li class="[{if $oSelection->isDisabled()}] disabled[{/if}]">
                            <a href="[{$oSelection->getLink()}]" data-selection-id="[{$oSelection->getValue()}]" class="dropdown-item[{if $oSelection->isActive()}] active[{/if}]">[{$oSelection->getName()}]</a>
                        </li>
                    [{/foreach}]
                </ul>
            [{/if}]
        </div>

    </div>
*}]

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
