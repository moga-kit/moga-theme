[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value=""}]
    [{if !$oView->getLoginOption() && !$oxcmp_user}]
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
                                        [{include file="page/checkout/inc/options.tpl"}]
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
        <div class="container-xxl py-5">
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-10 col-xl-9">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card done done-1">
                                <h4 class="card-header card-title disabled">
                                    [{oxmultilang ident="MY_ACCOUNT"}]
                                </h4>
                            </div>
                            <div class="card mt-n2 active">
                                <h4 class="card-header card-title">
                                    Adressen
                                </h4>
                                <div class="card-body">
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

                                    [{block name="checkout_user_change"}]
                                        [{if $oxcmp_user}]
                                            [{include file="form/user_checkout_change.tpl"}]
                                        [{/if}]
                                    [{/block}]
                                </div>
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
    [{/if}]
[{/capture}]

[{include file="layout/page.tpl"}]

