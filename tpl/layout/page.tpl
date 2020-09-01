[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]

    [{block name="layout_header"}]
        [{include file="layout/header.tpl"}]
    [{/block}]

    <div id="wrapper"[{if $sidebar}] class="sidebar[{$sidebar}]"[{/if}]>
        [{$smarty.capture.loginErrors}]

        [{if $sidebar && $sidebar != "Right"}]
            <div class="[{$oView->getClassName()}]" id="sidebar">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]

        <div class="content" id="content">
            [{block name="content_main"}]
                [{include file="message/errors.tpl"}]

                [{foreach from=$oxidBlock_content item="_block"}]
                    [{$_block}]
                [{/foreach}]
            [{/block}]
        </div>

        [{if $sidebar && $sidebar == "Right"}]
            <div id="sidebar" class="[{$oView->getClassName()}]">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]
    </div>

    [{include file="layout/footer.tpl"}]

    [{block name="layout_init_social"}]
    [{/block}]
[{/capture}]
[{include file="layout/base.tpl"}]
