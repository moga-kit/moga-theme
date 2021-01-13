[{capture append="oxidBlock_content"}]
    <div class="container-xxl">
        <h1 class="list-heading">[{oxmultilang ident="CATEGORY_OVERVIEW"}]</h1>

        [{assign var="_navcategorytree" value=$oView->getCategoryTree()}]
        [{assign var="_iCategoriesPerRow"  value=3}]
        [{assign var="iSubCategoriesCount" value=0}]
        [{if $_navcategorytree|count}]
            [{*oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
            [{oxscript add="$(window).on('load', function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.subcatList .row .panel' ) ); } });"*}]
            <div class="mb-3">
                <div class="row">
                    [{foreach from=$_navcategorytree item=category name=MoreSubCat}]
                        [{* TOP categories *}]
                        [{if $category->getIsVisible()}]
                            [{* CMS top categories *}]
                            [{if $category->getContentCats()}]
                                [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                    [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                                    <div class="box">
                                        <h3>
                                            <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                        </h3>
                                        <ul class="content"></ul>
                                    </div>
                                [{/foreach}]
                            [{/if}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <div class="col-12 col-sm-6 col-md-4 mb-3">
                                <div class="list-group">
                                    <a href="[{$category->getLink()}]" class="list-group-item list-group-item-action list-group-item-primary">
                                        [{$category->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                    </a>
                                    [{if $category->getHasVisibleSubCats()}]

                                        [{foreach from=$category->getSubCats() item=subcategory}]
                                            [{if $subcategory->getIsVisible()}]
                                                [{* CMS subcategories  *}]
                                                [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                                    <a href="[{$ocont->getLink()}]" class="list-group-item list-group-item-action">[{$ocont->oxcontents__oxtitle->value}]</a>
                                                [{/foreach}]
                                                <a href="[{$subcategory->getLink()}]" class="list-group-item list-group-item-action">
                                                    [{$subcategory->oxcategories__oxtitle->value}]

                                                    [{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0)}]
                                                        <span class="badge bg-primary rounded-pill">[{$subcategory->getNrOfArticles()}]</span>
                                                    [{/if}]
                                                </a>


                                                [{foreach from=$subcategory->getSubCats() item=subsubcategory}]
                                                    [{if $subsubcategory->getIsVisible()}]
                                                        <a href="[{$subsubcategory->getLink()}]" class="list-group-item list-group-item-action ps-5">
                                                            [{$subsubcategory->oxcategories__oxtitle->value}]
                                                            [{if $oView->showCategoryArticlesCount() && ($subsubcategory->getNrOfArticles() > 0)}]
                                                                <span class="badge bg-primary rounded-pill">[{$subsubcategory->getNrOfArticles()}]</span>
                                                            [{/if}]
                                                        </a>
                                                    [{/if}]
                                                [{/foreach}]
                                            [{/if}]
                                        [{/foreach}]
                                    [{/if}]
                                </div>
                            </div>
                        [{/if}]

                    [{/foreach}]
                </div>
            </div>
        [{/if}]
    </div>
[{/capture}]


[{include file="layout/page.tpl"}]
