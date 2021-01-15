[{block name="widget_locator_attributes"}]
    [{if $attributes}]
        <button type="button" class="btn btn-outline-primary btn-icon"  data-bs-toggle="collapse" href="#filter">
            <i class="moga-sliders"></i>
        </button>

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
        <div class="list-filter collapse p-3" id="filter">

            [{assign var="categoryWidth" value=$oViewConf->getViewThemeParam('sCategoryWidth')}]
            [{if $categoryWidth == 'container'}]
                <div class="container-xxl">
            [{/if}]

                    <form method="get" action="[{$oViewConf->getSelfActionLink()}]" name="_filterlist">
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
                        <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
                        <input type="hidden" name="fnc" value="executefilter">
                        <input type="hidden" name="fname" value="">
                        <div class="row gy-2 gx-3 align-items-center">
                        [{foreach from=$attributes item=oFilterAttr key=sAttrID name=attr}]
                            <div class="col-auto">
                                <select class="form-select" aria-label="[{$oFilterAttr->getTitle()}]" name="attrfilter[[{$sAttrID}]]" onchange="this.form.submit()">
                                    <option[{if !$sActiveValue}] selected[{/if}] value="">[{$oFilterAttr->getTitle()}]</option>
                                    [{foreach from=$oFilterAttr->getValues() item=sValue}]
                                    <option[{if $sActiveValue == $sValue}] selected[{/if}] value="[{$sValue}]">[{$sValue}]</option>
                                    [{/foreach}]
                                </select>
                            </div>
                        [{/foreach}]
                        </div>
                    </form>

            [{if $categoryWidth == 'container'}]
                </div>
            [{/if}]

        </div>
    [{/if}]
[{/block}]
