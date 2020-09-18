[{block name="widget_header_search_form"}]
    [{if $oView->showSearch()}]
        <form class="search collapse order-xl-1" id="searchCollapse"  action="[{$oViewConf->getSelfActionLink()}]" method="get" name="search">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="search">

            [{block name="dd_widget_header_search_form_inner"}]
                <div class="input-group">
                    [{block name="header_search_field"}]
                        <label class="sr-only" for="searchParam">[{oxmultilang ident="SEARCH"}]</label>
                        <input class="form-control" type="text" id="searchParam" name="searchparam" value="[{$oView->getSearchParamForHtml()}]" placeholder="[{oxmultilang ident="SEARCH"}]">
                    [{/block}]

                    [{block name="dd_header_search_button"}]
                        <button class="btn btn-primary" type="submit" title="[{oxmultilang ident="SEARCH_SUBMIT"}]"><i class="moga-search"></i></button>
                    [{/block}]
                </div>
            [{/block}]
        </form>
    [{/if}]
[{/block}]
