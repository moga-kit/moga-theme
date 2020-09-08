[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]

[{block name="sidebar"}]
    [{block name="sidebar_categoriestree"}]
        [{if $oView->getClassName() == 'alist' }]
            <div class="box card categorytree">
                <section>
                    <div class="page-header h3">
                        <div class="visible-sm">
                            <i class="moga-down toggleTree"></i>
                        </div>
                        [{oxmultilang ident="CATEGORIES"}]
                    </div>
                    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() deepLevel=0 noscript=1 nocookie=1}]
                </section>
            </div>
        [{/if}]
    [{/block}]

    [{block name="sidebar_tags"}]
    [{/block}]

    [{block name="sidebar_partners"}]
        [{if $oView->getClassName() eq "start"}]
            [{include file="widget/sidebar/partners.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_boxproducts"}][{/block}]

    [{block name="sidebar_news"}]
        [{if $oxcmp_news}]
            [{if $oxcmp_news|count}]
                [{include file="widget/sidebar/news.tpl" oNews=$oxcmp_news}]
            [{/if}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_social"}]
    [{/block}]
[{/block}]

