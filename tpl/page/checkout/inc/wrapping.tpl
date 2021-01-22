[{oxscript include="js/wrapping.min.js" priority=10}]

[{assign var="currency" value=$oView->getActCurrency()}]

<div class="modal fade gift-options" id="giftoptions" tabindex="-1" role="dialog" aria-labelledby="giftoptions_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                [{block name="checkout_wrapping_header"}]
                <span class="h4 modal-title float-start" id="giftoptions_modal_label">[{oxmultilang ident="GIFT_OPTION"}]</span>
                [{/block}]

                <span class="close float-end" data-bs-dismiss="modal" aria-hidden="true"><i class="moga-times"></i> </span>
            </div>
            <div class="modal-body">
                <p>[{oxmultilang ident="WRAPPING_DESCRIPTION"}]</p>
            </div>
            [{block name="checkout_wrapping_contents"}]
                <h5 class="px-3">[{oxmultilang ident="ADD_WRAPPING"}]</h5>

                [{if !$oxcmp_basket->getProductsCount()}]
                    <div class="alert alert-danger">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                [{else}]
                    <form name="basket" action="[{$oViewConf->getSelfActionLink()}]" method="post" id="giftoptions_modal_form">
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="basket">
                        <input type="hidden" name="fnc" value="changewrapping">
                        <div class="list-group list-group-flush">
                            [{assign var="oWrapList" value=$oView->getWrappingList()}]
                            [{if $oWrapList->count()}]
                                [{* basket items *}]
                                [{assign var="icounter" value="0"}]
                                [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
                                [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=wrappArt}]
                                    [{block name="checkout_wrapping_item"}]
                                        <div class="list-group-item">
                                            <div class="row">
                                                [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                                                <div class="col-4 col-md-3 col-lg-2">
                                                    [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                        <picture>
                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($basketproduct->getIconUrl(), 100, 100, 'webp', true)}]">
                                                            <img loading="lazy" src="[{$oViewConf->getDynamicImage($basketproduct->getIconUrl(), 100, 100, '', true)}]" alt="[{$basketitem->getTitle()|strip_tags}]" class="cart-img img-fluid">
                                                        </picture>
                                                    [{else}]
                                                        <img loading="lazy" src="[{$basketproduct->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]" class="cart-img img-fluid">
                                                    [{/if}]
                                                </div>

                                                <div class="col-8 col-md-9 col-lg-10">
                                                    <p><strong>[{$basketitem->getTitle()}]</strong></p>
                                                    <div class="btn-group-vertical w-100 wrapping-select" role="group">
                                                        <input type="radio" class="btn-check" name="wrapping[[{$basketindex}]]" id="wrapping_[{$basketindex}]" autocomplete="off" checked>
                                                        <label class="btn" for="wrapping_[{$basketindex}]">
                                                            <span class="img"></span>
                                                            [{oxmultilang ident="NONE"}]
                                                            <strong>0,00 [{$currency->sign}]</strong>
                                                        </label>

                                                        [{assign var="ictr" value="1"}]
                                                        [{foreach from=$oView->getWrappingList() item=wrapping name=Wraps}]
                                                            <input type="radio" class="btn-check" name="wrapping[[{$basketindex}]]" id="wrapping_[[{$basketindex}]][{$wrapping->oxwrapping__oxid->value}]" autocomplete="off" value="[{$wrapping->oxwrapping__oxid->value}]"[{if $basketitem->getWrappingId() == $wrapping->oxwrapping__oxid->value}] checked[{/if}]>
                                                            <label class="btn" for="wrapping_[[{$basketindex}]][{$wrapping->oxwrapping__oxid->value}]">
                                                                [{if $wrapping->oxwrapping__oxpic->value}]
                                                                <span class="img">
                                                                    [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                                        <picture>
                                                                            <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($wrapping->getPictureUrl(), 50, 50, 'webp', false)}]">
                                                                            <img data-bs-target="wrapping_[{$wrapping->oxwrapping__oxid->value}]" loading="lazy" src="[{$oViewConf->getDynamicImage($wrapping->getPictureUrl(), 50, 50, '', false)}]" alt="[{$wrapping->oxwrapping__oxname->value}]" class="wrappingTargetImg">
                                                                        </picture>
                                                                    [{else}]
                                                                        <img data-bs-target="wrapping_[{$wrapping->oxwrapping__oxid->value}]" loading="lazy" src="[{$wrapping->getPictureUrl()}]" alt="[{$wrapping->oxwrapping__oxname->value}]" class="wrappingTargetImg">
                                                                    [{/if}]
                                                                </span>
                                                                [{/if}]
                                                                [{$wrapping->oxwrapping__oxname->value}]
                                                                <strong>[{$wrapping->getFPrice()}] [{$currency->sign}]</strong>
                                                            </label>
                                                            [{assign var="ictr" value="`$ictr+1`"}]
                                                        [{/foreach}]
                                                    </div>
                                                </div>
                                            </div>
                                            [{assign var="icounter" value="`$icounter+1`"}]
                                        </div>
                                    [{/block}]
                                [{/foreach}]
                            [{/if}]
                        </div>
                        [{assign var="oCardList" value=$oView->getCardList()}]
                        [{if $oCardList->count()}]
                            [{block name="checkout_wrapping_cards"}]
                                <h5 class="px-3">[{oxmultilang ident="GREETING_CARD"}]</h5>
                                <div class="list-group list-group-flush wrappingCard" id="wrappCard">
                                    <div class="list-group-item">
                                        <div class="row">
                                            <div class="col-8 col-md-9 col-lg-10 offset-4 offset-md-3 offset-lg-2">
                                                <div class="form-check">
                                                    <input type="radio" class="radiobox form-check-input" name="chosencard" id="chosencard" value="0" [{if !$oxcmp_basket->getCardId()}]CHECKED[{/if}]>
                                                    <label class="form-check-label" for="chosencard">
                                                        [{oxmultilang ident="NO_GREETING_CARD"}]
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    [{assign var="icounter" value="0"}]
                                    [{counter start=0 print=false}]
                                    [{assign var="icounter" value="0"}]
                                    [{foreach from=$oCardList item=card name=GreetCards}]

                                    <div class="list-group-item">
                                        <div class="row">
                                            [{if $card->oxwrapping__oxpic->value}]

                                            <div class="col-4 col-md-3 col-lg-2">
                                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                                    <picture>
                                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($card->getPictureUrl(), 80, 100, 'webp', false)}]">
                                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($card->getPictureUrl(), 80, 100, '', false)}]" alt="[{$card->oxwrapping__oxname->value}]">
                                                    </picture>
                                                [{else}]
                                                    <img loading="lazy" src="[{$card->getPictureUrl()}]" alt="[{$card->oxwrapping__oxname->value}]">
                                                [{/if}]
                                            </div>
                                            <div class="col-8 col-md-9 col-lg-10">

                                            [{else}]

                                            <div class="col-12">

                                            [{/if}]

                                                <div class="mb-3">
                                                    <div class="form-check">
                                                        <input class="radiobox form-check-input" type="radio" name="chosencard" id="chosen_[{$card->oxwrapping__oxid->value}]" value="[{$card->oxwrapping__oxid->value}]" [{if $oxcmp_basket->getCardId() == $card->oxwrapping__oxid->value}]CHECKED[{/if}]>
                                                        <label class="form-check-label" for="chosen_[{$card->oxwrapping__oxid->value}]">
                                                            [{$card->oxwrapping__oxname->value}] <strong>[{$card->getFPrice()}] [{$currency->sign}]</strong>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    [{assign var="icounter" value="`$icounter+1`"}]
                                    [{/foreach}]
                                </div>
                            [{/block}]
                            [{block name="checkout_wrapping_comment"}]
                                <div class="modal-body">
                                    <div class="mb-3 wrappingComment">
                                        <h5>[{oxmultilang ident="GREETING_MESSAGE"}]</h5>
                                        <textarea cols="102" rows="5" name="giftmessage" id="giftmessage" class="form-control">[{$oxcmp_basket->getCardMessage()}]</textarea>
                                    </div>
                                </div>
                            [{/block}]
                        [{/if}]
                    </form>
                [{/if}]
            [{/block}]
            <div class="modal-footer">
                [{block name="checkout_wrapping_submit"}]
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">[{oxmultilang ident="CANCEL"}]</button>
                    <button type="submit" class="btn btn-primary" onclick="window.giftoptions_modal_form.submit();return false;">[{oxmultilang ident="APPLY"}]</button>
                [{/block}]
            </div>
        </div>
    </div>
</div>
