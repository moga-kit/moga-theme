[{block name="widget_locator_attributes"}]
    [{if $attributes}]
        <div class="sidebar-filter mb-3">
            <div class="sidebar-header"><strong>[{oxmultilang ident="DD_LISTLOCATOR_FILTER_ATTRIBUTES"}]</strong></div>
            [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                [{assign var="sActiveValue" value=$oFilterAttr->getActiveValue()}]
                [{if $sActiveValue}][{assign var="hasActiveValue" value=$sActiveValue}][{/if}]
            [{/foreach}]

            [{if $hasActiveValue}]
                <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_resetFilter" id="resetFilter">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                    <input type="hidden" name="fnc" value="resetFilter">
                    <button type="submit" class="btn btn-outline-primary btn-reset">[{oxmultilang ident="DD_CATEGORY_RESET_BUTTON"}]</button>
                </form>
            [{/if}]

            [{assign var="categoryWidth" value=$oViewConf->getViewThemeParam('sCategoryWidth')}]

            <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_filterlist">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                <input type="hidden" name="fnc" value="executefilter">
                <input type="hidden" name="fname" value="">
                [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                        <select class="form-select mb-3" aria-label="[{$oFilterAttr->getTitle()}]" name="attrfilter[[{$sAttrID}]]" onchange="this.form.submit()">
                            <option[{if !$sActiveValue}] selected[{/if}] value="">[{$oFilterAttr->getTitle()}]</option>
                            [{foreach from=$oFilterAttr->getValues() item=sValue}]
                            <option[{if $sActiveValue == $sValue}] selected[{/if}] value="[{$sValue}]">[{$sValue}]</option>
                            [{/foreach}]
                        </select>
                [{/foreach}]
            </form>
        </div>
    [{/if}]
[{/block}]
