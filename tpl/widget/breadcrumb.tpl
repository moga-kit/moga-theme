[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        [{block name="dd_widget_breadcrumb_list_inner"}]
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-3 d-none d-md-flex">
                [{block name="dd_widget_breadcrumb_list"}]
                    [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                        <li class="breadcrumb-item[{if $smarty.foreach.breadcrumb.last}] active[{/if}]">
                            <a href="[{if $sCrum.link}][{$sCrum.link}][{else}]#[{/if}]" class="breadcrumb-link" title="[{$sCrum.title|escape:'html'}]">
                                [{$sCrum.title}]
                            </a>
                        </li>
                    [{/foreach}]
                [{/block}]
            </ol>
        </nav>
        [{/block}]
    [{/strip}]
[{/block}]
