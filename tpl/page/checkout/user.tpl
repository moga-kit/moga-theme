[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value=""}]
    [{if !$oxcmp_user}]
        <div class="container-xxl py-5">
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-10 col-xl-9">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card">
                                <h4 class="card-header card-title">
                                    [{oxmultilang ident="MY_ACCOUNT"}]
                                </h4>
                                <div class="card-body">
                                    [{block name="checkout_user_main"}]
                                        [{if !$oView->getLoginOption()}]
                                            [{include file="page/checkout/inc/options.tpl"}]
                                        [{/if}]

                                        [{block name="checkout_user_noregistration"}]
                                            [{if $oView->getLoginOption() == 1}]
                                                [{include file="form/user_checkout_noregistration.tpl"}]
                                            [{/if}]
                                        [{/block}]

                                        [{block name="checkout_user_registration"}]
                                            [{if $oView->getLoginOption() == 3}]
                                                [{include file="form/user_checkout_registration.tpl"}]
                                            [{/if}]
                                        [{/block}]
                                    [{/block}]
                                </div>
                            </div>

                            <div class="card mt-n2">
                                <h4 class="card-header card-title disabled">
                                    Adressen
                                </h4>
                            </div>
                            <div class="card mt-n2">
                                <h4 class="card-header card-title disabled">
                                    Versand & Zahlung
                                </h4>
                            </div>
                            <div class="card mt-n2">
                                <h4 class="card-header card-title disabled">
                                    Überprüfen
                                </h4>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            [{include file="page/checkout/inc/summary_sidebar.tpl"}]
                        </div>
                    </div>
                </div>
            </div>
        </div>
    [{else}]

        [{block name="checkout_user_change"}]
            [{include file="form/user_checkout_change.tpl"}]
        [{/block}]

    [{/if}]
[{/capture}]

[{include file="layout/page.tpl"}]

