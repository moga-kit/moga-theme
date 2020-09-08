[{if $oxcmp_categories}]
    [{assign var="categories" value=$oxcmp_categories}]
    [{block name="footer_categories"}]
        <nav class="nav flex-column">
            [{foreach from=$categories item=_cat}]
                [{if $_cat->getIsVisible()}]
                    [{if $_cat->getContentCats()}]
                        [{foreach from=$_cat->getContentCats() item=_oCont}]
                            <a class="nav-link" href="[{$_oCont->getLink()}]">[{$_oCont->oxcontents__oxtitle->value}]</a>
                        [{/foreach}]
                    [{/if}]
                    <a class="nav-link" href="[{$_cat->getLink()}]">
                        [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ( $_cat->getNrOfArticles() > 0 )}] ([{$_cat->getNrOfArticles()}])[{/if}]
                    </a>
                [{/if}]
            [{/foreach}]
        </nav>
    [{/block}]
[{/if}]
