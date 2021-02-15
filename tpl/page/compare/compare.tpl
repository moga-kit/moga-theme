[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="COMPARE"|oxmultilangassign}]

    [{$oView->setNoPaging()}]

    [{assign var="articleList" value=$oView->getCompArtList()}]
    [{assign var="atributeList" value=$oView->getAttributeList()}]
    <div class="container-xxl py-5">
        [{*oxscript include="js/pages/compare.min.js"*}]
        <div class="row">
            <h3 class="page-header col pl-0 ml-3">[{$template_title}]</h3>

            [{if $oxcmp_user->oxuser__oxpassword->value}]
            <div class="col-12 col-sm-3 button-col">
                [{include file="page/account/inc/account_menu.tpl" active_link="dashboard"}]
            </div>
            [{/if}]
        </div>



        [{if $oView->getCompareItemsCnt() >= 1}]
            <div id="comparePlayground" class="compare">
                <div id="compareLandscape" class="table-responsive">
                    <table class="table table-sm">
                        <tbody>
                            <tr class="compare-products">
                                [{foreach from=$articleList key=iProdNr item="product" name="compareArticles"}]
                                    [{if $smarty.foreach.compareArticles.first}]
                                        <th class="attrib-title no-border" scope="row">&nbsp;</th>
                                    [{/if}]

                                    <td class="item-wrapper text-center compare-item-wrapper">
                                        [{include file="page/compare/inc/compareitem.tpl" product=$product testid=$smarty.foreach.comparelist.iteration}]
                                    </td>
                                [{/foreach}]
                            </tr>
                            [{foreach from=$atributeList key=iProdNr item="oAttrib" name="compareAttributes"}]
                                <tr>
                                    <th class="attrib-title" scope="row">[{$oAttrib->title}]:</th>

                                    [{foreach from=$articleList key="iProdNr" item="product" name="compareArticles"}]
                                        <td class="attrib-text">
                                            [{if $oAttrib->aProd.$iProdNr && $oAttrib->aProd.$iProdNr->value}]
                                                [{$oAttrib->aProd.$iProdNr->value}]
                                            [{else}]
                                                -
                                            [{/if}]
                                        </td>
                                    [{/foreach}]
                                </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        [{else}]
            <p class="alert alert-danger">[{oxmultilang ident="MESSAGE_SELECT_AT_LEAST_ONE_PRODUCT"}]</p>
        [{/if}]
    </div>
[{/capture}]


[{include file="layout/page.tpl"}]
