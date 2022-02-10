[{assign var="currency" value=$oView->getActCurrency()}]

<button class="btn btn-outline-primary btn-sm dd-action"
        data-bs-toggle="modal"
        data-bs-target="#modal_priceinfo_[{$oDetailsProduct->oxarticles__oxartnum->value}]"
        type="button">
    [{oxmultilang ident="BLOCK_PRICE"}]
</button>

<div class="modal fade"
     id="modal_priceinfo_[{$oDetailsProduct->oxarticles__oxartnum->value}]"
     tabindex="-1"
     role="dialog"
     aria-labelledby="modal_priceinfo_[{$oDetailsProduct->oxarticles__oxartnum->value}]"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                [{block name="delete_shipping_address_modal_header"}]
                    <span class="h4 modal-title">[{oxmultilang ident="BLOCK_PRICE"}]</span>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                [{/block}]
            </div>
            <div class="modal-body">
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
            </div>
        </div>
    </div>
</div>
