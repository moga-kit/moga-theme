[{assign var="currency" value=$oView->getActCurrency()}]


<p><strong>[{oxmultilang ident="BLOCK_PRICE"}]</strong></p>

<dl class="row">
    [{foreach from=$oDetailsProduct->loadAmountPriceInfo() item=priceItem name=amountPrice}]
        <dt class="col-sm-4">
            [{oxmultilang ident="FROM"}] [{$priceItem->oxprice2article__oxamount->value}] [{oxmultilang ident="PCS"}]
        </dt>
        <dd class="col-sm-8">
            [{if $priceItem->oxprice2article__oxaddperc->value}]
                [{$priceItem->oxprice2article__oxaddperc->value}]% [{oxmultilang ident="DISCOUNT"}]
            [{else}]
                [{block name="details_productmain_price"}]
                    [{$priceItem->fbrutprice}] [{$currency->sign}]
                    [{if $oDetailsProduct->getUnitName() and $priceItem->fbrutamountprice}]
                        &nbsp;([{$priceItem->fbrutamountprice}] [{$currency->sign}] / [{$oDetailsProduct->getUnitName()}])
                    [{/if}]
                [{/block}]
            [{/if}]
        </dd>
    [{/foreach}]
</dl>

