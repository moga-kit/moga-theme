[{block name="dd_widget_header_categorylist"}]
    [{if $oxcmp_categories}]
        [{assign var="homeSelected" value="false"}]
        [{if $oViewConf->getTopActionClassName() == 'start'}]
            [{assign var="homeSelected" value="true"}]
        [{/if}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]
        [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

        <nav id="mainnav" class="navbar navbar-expand-lg" role="navigation">
            <div class="container[{if $headerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
            [{block name="dd_widget_header_categorylist_navbar"}]

                <div class="navbar-collapse" id="navbarSupportedContent">
                    <ul id="navigation" class="navbar-nav">
                        [{block name="dd_widget_header_categorylist_navbar_list"}]
                            [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                                [{if $ocat->getIsVisible()}]
                                    [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                        <li class="nav-item">
                                            <a class="nav-link[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] active[{/if}]"[{if $oContent->oxcontents__oxloadid->value === $oTopCont->oxcontents__oxloadid->value}] aria-current="page"[{/if}] href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                        </li>
                                    [{/foreach}]

                                    <li class="nav-item[{if $ocat->getSubCats()}] dropdown[{/if}]">
                                        <a class="nav-link[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}][{if $ocat->getSubCats()}] dropdown-toggle[{/if}]"[{if $homeSelected == 'false' && $ocat->expanded}] aria-current="page"[{/if}][{if $ocat->getSubCats()}] href="#" data-href="[{$ocat->getLink()}]" role="button" data-toggle="dropdown" aria-expanded="false"[{else}] href="[{$ocat->getLink()}]"[{/if}]>
                                            [{$ocat->oxcategories__oxtitle->value}]
                                        </a>

                                        [{if $ocat->getSubCats()}]
                                            <ul class="dropdown-menu">
                                                [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                                    [{if $osubcat->getIsVisible()}]
                                                        [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                            <li class="dropdown-item[{if $oViewConf->getContentId() == $ocont->getId()}] active[{/if}]">
                                                                <a class="dropdown-link[{if $oViewConf->getContentId() == $ocont->getId()}] current[{/if}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                                            </li>
                                                        [{/foreach}]

                                                        [{if $osubcat->getIsVisible()}]
                                                            <li class="dropdown-item[{if $homeSelected == 'false' && $osubcat->expanded}] active[{/if}]">
                                                                <a class="dropdown-link[{if $homeSelected == 'false' && $osubcat->expanded}] current[{/if}]" href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a>
                                                            </li>
                                                        [{/if}]
                                                    [{/if}]
                                                [{/foreach}]
                                            </ul>
                                        [{/if}]
                                    </li>
                                [{/if}]
                            [{/foreach}]
                        [{/block}]
                    </ul>
                </div>
            [{/block}]
            </div>
        </nav>
    [{/if}]
[{/block}]
