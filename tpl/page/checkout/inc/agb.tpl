<div class="agb card mb-3">
    [{if !$hideButtons}]

        [{if !$oView->isActive('PsLogin')}]
            [{if $oView->isConfirmAGBActive()}]
                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                   <h3 class="card-header card-title card-header-edit">[{$oContent->oxcontents__oxtitle->value}]</h3>
                [{/oxifcontent}]
            [{else}]
                [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                    <h3 class="card-header card-title card-header-edit">[{$oContent->oxcontents__oxtitle->value}]</h3>
                [{/oxifcontent}]
            [{/if}]
        [{/if}]

        <div class="card-body">
            [{if !$oView->isActive('PsLogin')}]
                [{if $oView->isConfirmAGBActive()}]
                    [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                        <div class="form-check">
                            <input id="checkAgbTop" class="form-check-input" type="checkbox" name="ord_agb" value="1">
                            <label for="checkAgbTop" class="form-check-label">
                                 [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </div>
                    [{/oxifcontent}]
                [{else}]
                    [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                        <p class="agbConfirmation">
                            [{$oContent->oxcontents__oxcontent->value}]
                        </p>
                    [{/oxifcontent}]
                [{/if}]
            [{/if}]

            [{if $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement') }]
                [{assign var="oExplanationMarks" value=$oView->getBasketContentMarkGenerator() }]
                [{if $oxcmp_basket->hasArticlesWithDownloadableAgreement() }]
                    [{oxifcontent ident="oxdownloadableproductsagreement" object="oContent"}]
                        <p id="noteForDownloadableArticles" class="agbConfirmation checkbox">
                            <label>
                                <input id="oxdownloadableproductsagreement" type="checkbox" name="oxdownloadableproductsagreement" value="1">
                                [{$oExplanationMarks->getMark('downloadable')}] [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </p>
                    [{/oxifcontent}]
                [{/if}]
                [{if $oxcmp_basket->hasArticlesWithIntangibleAgreement() }]
                    [{oxifcontent ident="oxserviceproductsagreement" object="oContent"}]
                        <p id="noteForIntangibleArticles" class="agbConfirmation checkbox">
                            <label>
                                <input id="oxserviceproductsagreement" type="checkbox" name="oxserviceproductsagreement" value="1">
                                [{$oExplanationMarks->getMark('intangible')}] [{$oContent->oxcontents__oxcontent->value}]
                            </label>
                        </p>
                    [{/oxifcontent}]
                [{/if}]
            [{/if}]

            [{if $oViewConf->isFunctionalityEnabled("blShowTSInternationalFeesMessage")}]
                [{oxifcontent ident="oxtsinternationalfees" object="oTSIFContent"}]
                    [{$oTSIFContent->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            [{/if}]

            [{if $payment->oxpayments__oxid->value eq "oxidcashondel" && $oViewConf->isFunctionalityEnabled("blShowTSCODMessage")}]
                [{oxifcontent ident="oxtscodmessage" object="oTSCODContent"}]
                    [{$oTSCODContent->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            [{/if}]
        </div>
    [{/if}]
</div>

[{oxscript include="js/agb.min.js" priority=10}]
