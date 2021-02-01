[{block name="dd_widget_sidebar_categorytree"}]
    [{if $oxcmp_categories}]
        [{assign var="categories" value=$oxcmp_categories->getClickRoot()}]
        [{assign var="act" value=$oxcmp_categories->getClickCat()}]
        [{if $categories}]
            [{assign var="deepLevel" value=$oView->getDeepLevel()}]
            <div class="categoryBox hidden-sm">
                <div class="sidebar-header"><strong>[{oxmultilang ident="CATEGORIES"}]</strong></div>
                [{block name="dd_widget_sidebar_categorytree_inner"}]
                    <ol class="nav flex-column">
                        [{block name="dd_widget_sidebar_categorytree_list"}]
                            [{defun name="tree" categories=$categories}]
                                [{assign var="deepLevel" value=$deepLevel+1}]
                                [{assign var="oContentCat" value=$oView->getContentCategory()}]
                                [{foreach from=$categories item="_cat"}]
                                    [{if $_cat->getIsVisible()}]
                                        [{* CMS category *}]
                                        [{if $_cat->getContentCats() && $deepLevel > 1}]
                                            [{foreach from=$_cat->getContentCats() item="_oCont"}]
                                                <li class="nav-item[{if $oContentCat && $oContentCat->getId()==$_oCont->getId()}] active[{else}] end[{/if}]" >
                                                    <a href="nav-link[{$_oCont->getLink()}]" title="[{$_oCont->oxcontents__oxtitle->value}]"><i></i>[{$_oCont->oxcontents__oxtitle->value}]</a>
                                                </li>
                                            [{/foreach}]
                                        [{/if}]

                                        [{* subcategories *}]
                                        [{assign var="oSubCats" value=$_cat->getSubCats()}]
                                        <li class="nav-item[{if !$oContentCat && $act && $act->getId()==$_cat->getId()}] active[{elseif $_cat->expanded}] exp[{/if}][{if !$_cat->hasVisibleSubCats}] end[{/if}]">
                                            <a class="nav-link" href="[{$_cat->getLink()}]" title="[{$_cat->oxcategories__oxtitle->value}]">
                                                <i class="moga-[{if $_cat->expanded && $oSubCats}]down[{else}]right[{/if}]"></i> [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($_cat->getNrOfArticles() > 0)}] ([{$_cat->getNrOfArticles()}])[{/if}]
                                            </a>
                                            [{if $oSubCats && $_cat->expanded}]
                                                <ul class="nav flex-column">[{fun name="tree" categories=$oSubCats}]</ul>
                                            [{/if}]
                                        </li>
                                    [{/if}]
                                [{/foreach}]
                            [{/defun}]
                        [{/block}]
                    </ol>
                [{/block}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
