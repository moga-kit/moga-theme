[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]

    [{block name="layout_header"}]
        [{include file="layout/header.tpl"}]
    [{/block}]

    <div id="wrapper" class="wrapper[{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        [{$smarty.capture.loginErrors}]

        [{if $sidebar && $sidebar != "Right"}]
            <div class="[{$oView->getClassName()}]">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]

        <div class="content">
            [{block name="content_main"}]
                [{include file="message/errors.tpl"}]

                [{if $oView->getClassName() == "details" || $oView->getClassName() == "content" && !$blHideBreadcrumb}]
                    [{block name="layout_breadcrumb"}]
                        <div class="container-xxl d-none d-md-block pt-3">
                            [{include file="widget/breadcrumb.tpl"}]
                        </div>
                    [{/block}]
                [{/if}]

                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            [{/block}]
        </div>

        [{if $sidebar && $sidebar == "Right"}]
            <div class="[{$oView->getClassName()}]">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]
    </div>

    [{include file="layout/footer.tpl"}]
    [{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
    [{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
    [{/block}]
    [{block name="layout_init_social"}]
    [{/block}]
[{/capture}]
[{include file="layout/base.tpl"}]
