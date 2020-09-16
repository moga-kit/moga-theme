[{block name="checkout_steps_main"}]
    <div class="progress">
        <div class="progress-bar bg-success" role="progressbar" id="progress" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>

    <div class="row g-0 text-center my-3">
        [{if $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{*block name="checkout_steps_basket"}]
            <li class="nav-item">
                [{if $showStepLinks}]
                 <a class="nav-link[{if $active == 1}] active [{elseif $active > 1}] disabled [{/if}]" href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
                [{/if}]
                <div class="num">1</div>
                <div class="text">
                    [{oxmultilang ident="STEPS_BASKET"}]
                </div>
                [{if $showStepLinks}]
                 </a>
                [{/if}]
            </li>
        [{/block*}]

        <script>
            [{if $active == 2}]
                document.getElementById('progress').setAttribute("style","width: 16.6666%");
            [{elseif $active == 3}]
                document.getElementById('progress').setAttribute("style","width: 49.9999%");
            [{else}]
                document.getElementById('progress').setAttribute("style","width: 83.3333%");
            [{/if}]
        </script>

        [{assign var=showStepLinks value=false}]
        [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_send"}]
            <div class="col[{if $active == 2}] text-success[{/if}]">
                [{oxmultilang ident="STEPS_SEND"}]
            </div>
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_pay"}]
            <div class="col[{if $active == 3}] text-success[{else}] text-muted[{/if}]">
                [{oxmultilang ident="STEPS_PAY"}]
            </div>
            [{*[{oxscript add="$('#paymentStep').click( function() { $('#userNextStepBottom').click();return false;});"}]*}]
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_order"}]
            <div class="col[{if $active == 4}] text-success[{else}] text-muted[{/if}]">
                [{oxmultilang ident="STEPS_ORDER"}]
            </div>
            [{*[{oxscript add="$('#orderStep').click( function() { $('#paymentNextStepBottom').click();return false;});"}]*}]
        [{/block}]

        [{*block name="checkout_steps_laststep"}]
            <li class="nav-item">
                <span  class="nav-link disabled">
                    <div class="num">5</div>
                    <div class="text">
                        [{oxmultilang ident="READY"}]
                    </div>
                </span>
            </li>
        [{/block*}]
    </div>
[{/block}]
