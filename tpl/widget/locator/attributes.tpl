[{block name="widget_locator_attributes"}]
    [{if $attributes}]

        <div class="list-filter">
            <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_filterlist">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                <input type="hidden" name="fnc" value="executefilter">
                <input type="hidden" name="fname" value="">

                [{if $oView->getClassName() == 'alist'}]
                    <strong>[{oxmultilang ident="DD_LISTLOCATOR_FILTER_ATTRIBUTES" suffix="COLON"}]</strong>
                [{/if}]
                [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                    [{assign var="sActiveValue" value=$oFilterAttr->getActiveValue()}]
                    <select class="form-select" aria-label="[{$oFilterAttr->getTitle()}]" name="attrfilter[[{$sAttrID}]]" onchange="this.form.submit()">
                        <option[{if !$sActiveValue}] selected[{/if}] value="">[{$oFilterAttr->getTitle()}]</option>
                        [{foreach from=$oFilterAttr->getValues() item=sValue}]
                        <option[{if $sActiveValue == $sValue}] selected[{/if}] value="[{$sValue}]">[{$sValue}]</option>
                        [{/foreach}]
                    </select>
                    [{if $sActiveValue}][{assign var="hasActiveValue" value=$sActiveValue}][{/if}]
                [{/foreach}]
            </form>

            [{if $hasActiveValue}]
                <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_resetFilter" id="resetFilter">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                    <input type="hidden" name="fnc" value="resetFilter">
                    <button type="submit" class="btn btn-outline-primary">[{oxmultilang ident="DD_CATEGORY_RESET_BUTTON"}]</button>
                </form>
            [{/if}]
        </div>

    [{/if}]
[{/block}]
