[{if $editable}]
<div id="basket_list" class="basket card[{if $oViewConf->getActiveClassName() == 'order'}] orderBasketItems[{/if}]">

    <h4 class="card-header card-title">[{oxmultilang ident="CART"}]</h4>
    <div class="list-group list-group-flush">
    [{/if}]
        [{* basket items *}]
        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            <div class="list-group-item">
                [{block name="checkout_basketcontents_basketitem"}]
                    [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                    [{assign var="oArticle" value=$basketitem->getArticle()}]
                    [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]
                    <div class="row" id="list_cartItem_[{$smarty.foreach.basketContents.iteration}]">
                        <div class="col-md-5 col-lg-2">
                            [{block name="checkout_basketcontents_basketitem_image"}]
                            [{assign var="oBasketitemArticle" value=$basketitem->getArticle()}]

                            [{if $editable}]<a class="d-block text-center" href="[{$basketitem->getLink()}]">[{/if}]

                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                    <picture>
                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oBasketitemArticle->getIconUrl(), 100, 100, 'webp', true)}]">
                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($oBasketitemArticle->getIconUrl(), 100, 100, '', true)}]" alt="[{$basketitem->getTitle()|strip_tags}]" class="cart-img img-fluid">
                                    </picture>
                                [{else}]
                                    <img loading="lazy" src="[{$oBasketitemArticle->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}] [{$product->oxarticles__oxvarselect->value}]" class="cart-img img-fluid">
                                [{/if}]

                            [{if $editable}]</a>[{/if}]

                            [{/block}]
                        </div>

                        <div class="col-md-7 col-lg-10">
                            <div class="d-flex justify-content-between">
                                <div>
                                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                                        [{block name="checkout_basketcontents_basketitem_title"}]
                                            <div class="h4">
                                                [{if !$editable}]
                                                    [{$basketitem->getAmount()}] x
                                                [{/if}]
                                                [{$basketitem->getTitle()}]
                                            </div>
                                            [{if $basketitem->isSkipDiscount()}] <sup><a href="#SkipDiscounts_link" >**</a></sup>[{/if}]
                                        [{/block}]

                                        [{block name="checkout_basketcontents_basketitem_artnum"}]
                                            <div class="small">
                                                [{oxmultilang ident="PRODUCT_NO"}] [{$basketproduct->oxarticles__oxartnum->value}]
                                            </div>
                                        [{/block}]

                                        [{block name="checkout_basketcontents_basketitem_attributes"}]
                                            [{if $oAttributes->getArray()}]
                                                <div class="small">
                                                    [{assign var=sep value=", "}]
                                                    [{assign var=result value=""}]
                                                    [{foreach key="oArtAttributes" from=$oAttributes->getArray() item="oAttr" name="attributeContents"}]
                                                        [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                                                        [{assign var=result value=$result|cat:$temp|cat:$sep}]
                                                    [{/foreach}]
                                                    [{$result|trim:$sep}]
                                                </div>
                                            [{/if}]
                                        [{/block}]

                                        [{block name="checkout_basketcontents_basketitem_selectlists"}]
                                            [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                                [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
                                                [{if $oSelections}]
                                                    <div class="selectorsBox" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
                                                        [{foreach from=$oSelections item=oList name=selections}]
                                                            [{if $oViewConf->showSelectListsInList()}]
                                                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                                                            [{else}]
                                                                [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
                                                                [{if $oActiveSelection}]
                                                                    <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{$oActiveSelection->getValue()}]">
                                                                    <div>[{$oList->getLabel()}]: [{$oActiveSelection->getName()}]</div>
                                                                [{/if}]
                                                            [{/if}]
                                                        [{/foreach}]
                                                    </div>
                                                [{/if}]
                                            [{/if}]
                                        [{/block}]

                                        [{block name="checkout_basketcontents_basketitem_persparams"}]
                                            [{if !$editable && $basketitem->getPersParams()}]
                                                <p class="persparamBox">
                                                    <small>
                                                        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                            [{if !$smarty.foreach.persparams.first}]<br>[{/if}]
                                                            [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                                [{oxmultilang ident="LABEL"}]
                                                            [{else}]
                                                                [{$sVar}] :
                                                            [{/if}]
                                                            [{$aParam}]
                                                        [{/foreach}]
                                                    </small>
                                                </p>
                                            [{else}]
                                                [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                                                    [{if $basketitem->getPersParams()}]
                                                        <br>
                                                        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                            <p>
                                                                <input class="textbox persParam form-control" type="text" name="aproducts[[{$basketindex}]][persparam][[{$sVar}]]" value="[{$aParam}]" placeholder="[{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}][{oxmultilang ident="LABEL"}][{else}][{$sVar}][{/if}]">
                                                            </p>
                                                        [{/foreach}]
                                                    [{else}]
                                                        <p>
                                                            <input class="textbox persParam form-control" type="text" name="aproducts[[{$basketindex}]][persparam][details]" value="" placeholder="[{oxmultilang ident="LABEL"}]">
                                                        </p>
                                                    [{/if}]
                                                [{/if}]
                                            [{/if}]
                                        [{/block}]

                                    [{/block}]
                                    <div>

                                        [{block name="checkout_basketcontents_basketitem_unitprice"}]
                                        [{* product price *}]
                                            <small class="unitPrice">
                                                [{if $basketitem->getUnitPrice()}]
                                                    [{oxmultilang ident="UNIT_PRICE"}]: [{oxprice price=$basketitem->getUnitPrice() currency=$currency}]
                                                [{/if}]
                                            </small>
                                        [{/block}]

                                        [{block name="checkout_basketcontents_basketitem_amount"}]
                                        [{* product amount}]
                                        <span class="amount">
                                            <small>
                                                [{if $basketitem->getFUnitPrice()}] | [{/if}]
                                                [{if $basketitem->oxarticles__oxunitname->value}]
                                                    [{$basketitem->getAmount()}] [{$basketitem->oxarticles__oxunitname->value}]
                                                [{else}]
                                                    [{$basketitem->getAmount()}] [{oxmultilang ident="PCS"}]
                                                [{/if}]
                                            </small>
                                            </span>
                                            [{* product amount *}]
                                        [{/block}]
                                        [{block name="checkout_basketcontents_basketitem_vat"}]
                                        <small class="article-vat">
                                            [{$basketitem->getVatPercent()}]% [{oxmultilang ident="VAT"}]
                                        </small>
                                        [{/block}]
                                    </div>
                                </div>
                                <div[{if !$editable}] class="d-none"[{/if}]>
                                    [{block name="checkout_basketcontents_basketitem_quantity"}]
                                    <div class="quantity">
                                        [{if $editable}]
                                            <input type="hidden" name="aproducts[[{$basketindex}]][aid]" value="[{$basketitem->getProductId()}]">
                                            <input type="hidden" name="aproducts[[{$basketindex}]][basketitemid]" value="[{$basketindex}]">
                                            <input type="hidden" name="aproducts[[{$basketindex}]][override]" value="1">
                                            [{if $basketitem->isBundle()}]
                                                <input type="hidden" name="aproducts[[{$basketindex}]][bundle]" value="1">
                                            [{/if}]

                                            [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                                <div class="input-group justify-content-end">
                                                    <input id="am_[{$smarty.foreach.basketContents.iteration}]" type="number" class="form-control text-center" name="aproducts[[{$basketindex}]][am]" value="[{$basketitem->getAmount()}]" size="3" min="0" style="width:60px;float:right;"[{if $oConfig->getConfigParam('blAllowUnevenAmounts')}] step="any"[{/if}]>
                                                    [{if !$oViewConf->isModuleActive('cnc/dynamicshopping')}]
                                                    <button class="btn btn-outline-primary" id="basketUpdate-[{$smarty.foreach.basketContents.iteration}]" type="submit" name="updateBtn" title="[{oxmultilang ident="UPDATE"}]">
                                                        <i class="moga-sync"></i>
                                                    </button>
                                                    [{/if}]
                                                </div>
                                            [{/if}]
                                        [{else}]
                                            [{$basketitem->getAmount()}]
                                        [{/if}]
                                        [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle())}]
                                        +[{$basketitem->getdBundledAmount()}]
                                        [{/if}]
                                    </div>
                                    [{/block}]
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                [{block name="checkout_basketcontents_basketitem_wrapping"}]
                                [{* product wrapping *}]
                                [{if $oView->isWrapping()}]
                                    <div class="wrapping">
                                        [{if !$basketitem->getWrappingId()}]
                                            [{if $editable}]
                                                <a href="#" class="btn btn-remove btn-sm" title="[{oxmultilang ident="ADD"}]" data-bs-toggle="modal" data-bs-target="#giftoptions">
                                                    <i class="moga-gift"></i> [{oxmultilang ident="WRAPPING"}] [{oxmultilang ident="ADD"}]
                                                </a>
                                            [{else}]
                                                <small>[{oxmultilang ident="WRAPPING"}]: [{oxmultilang ident="NONE"}]</small>
                                            [{/if}]
                                        [{else}]
                                            [{assign var="oWrap" value=$basketitem->getWrapping()}]
                                            [{if $editable}]
                                                <small>[{oxmultilang ident="WRAPPING"}]:</small>
                                                <a class="btn btn-remove" href="#" title="[{oxmultilang ident="ADD"}]" data-bs-toggle="modal" data-bs-target="#giftoptions">
                                                    <i class="moga-pencil"></i>
                                                    [{if $oWrap->oxwrapping__oxname}]
                                                        [{$oWrap->oxwrapping__oxname->value}]
                                                    [{else}]
                                                        [{oxmultilang ident="NONE"}]
                                                    [{/if}]
                                                </a>
                                            [{else}]
                                                <small>[{oxmultilang ident="WRAPPING"}]: [{$oWrap->oxwrapping__oxname->value}]</small>
                                            [{/if}]
                                        [{/if}]
                                    </div>
                                [{/if}]
                                [{/block}]

                                [{block name="checkout_basketcontents_basketitem_removecheckbox"}]
                                    [{if $editable}]
                                        <input type="hidden" name="aproducts[[{$basketindex}]][remove]" id="aproducts_[{$basketindex}]_remove" value="0">
                                        <button type="submit" name="removeBtn" class="btn btn-remove me-3" onclick="document.getElementById( 'aproducts_[{$basketindex}]_remove' ).value = '1';">
                                            <i class="moga-trash"></i> [{oxmultilang ident="REMOVE"}]
                                        </button>

                                        [{if $oxcmp_user}]
                                            <button type="submit" name="removeBtn" class="btn btn-remove" onclick="addToNoticelist('[{$oArticle->getId()}]');document.getElementById( 'aproducts_[{$basketindex}]_remove' ).value = '1';">
                                                <i class="moga-heart-fill"></i> [{oxmultilang ident="MOVE_TO_WISH_LIST"}]
                                            </button>
                                        [{/if}]
                                    [{/if}]
                                [{/block}]
                                </div>
                                [{block name="checkout_basketcontents_basketitem_totalprice"}]
                                [{* product quantity * price *}]
                                <div class="totalPrice text-end">
                                    <strong class="text-nowrap h5">[{oxprice price=$basketitem->getPrice() currency=$currency}]</strong>
                                </div>
                                [{/block}]
                            </div>
                        </div>
                    </div>
                [{/block}]

                [{* packing unit *}]

                [{block name="checkout_basketcontents_itemerror"}]
                    [{foreach from=$Errors.basket item=oEr key=key}]
                        [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
                            [{* display only the exceptions for the current article *}]
                            [{if $basketindex == $oEr->getValue('basketIndex')}]
                                <tr class="basketError">
                                    [{if $editable}]<td></td>[{/if}]
                                    <td colspan="5">
                                        <span class="inlineError">[{$oEr->getOxMessage()}] <strong>[{$oEr->getValue('remainingAmount')}]</strong></span>
                                    </td>
                                    [{if $oView->isWrapping()}]<td></td>[{/if}]
                                    <td></td>
                                </tr>
                            [{/if}]
                        [{/if}]
                        [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
                            [{if $basketitem->getProductId() == $oEr->getValue('productId')}]
                                <tr class="basketError">
                                    [{if $editable}]<td></td>[{/if}]
                                    <td colspan="5">
                                        <span class="inlineError">[{$oEr->getOxMessage()}]</span>
                                    </td>
                                    [{if $oView->isWrapping()}]<td></td>[{/if}]
                                    <td></td>
                                </tr>
                            [{/if}]
                        [{/if}]
                    [{/foreach}]
                [{/block}]
                [{*  basket items end  *}]
            </div>
        [{/foreach}]

        [{block name="checkout_basketcontents_giftwrapping"}]
            [{if $oViewConf->getShowGiftWrapping()}]
                [{assign var="oCard" value=$oxcmp_basket->getCard()}]
                [{if $oCard}]
                    <div class="list-group-item">
                        <div class="row">
                            <div class="col-md-5 col-lg-2">
                                [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                                    <picture>
                                        <source type="image/webp" srcset="[{$oViewConf->getDynamicImage($oCard->getPictureUrl(), 80, 100, 'webp', false)}]">
                                        <img loading="lazy" src="[{$oViewConf->getDynamicImage($oCard->getPictureUrl(), 80, 100, '', false)}]" alt="[{$oCard->oxwrapping__oxname->value}]">
                                    </picture>
                                [{else}]
                                    <img loading="lazy" src="[{$card->getPictureUrl()}]" alt="[{$card->oxwrapping__oxname->value}]">
                                [{/if}]
                            </div>
                            <div class="col-md-7 col-lg-10">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="h4">[{oxmultilang ident="GREETING_CARD"}] "[{$oCard->oxwrapping__oxname->value}]"</div>
                                        <div class="small">
                                            [{oxmultilang ident="YOUR_MESSAGE"}]<br>
                                            [{$oxcmp_basket->getCardMessage()|nl2br}]
                                        </div>

                                        [{if $editable}]
                                        <a href="#" class="btn btn-remove btn-sm" title="[{oxmultilang ident="ADD"}]" data-bs-toggle="modal" data-bs-target="#giftoptions">
                                            <i class="moga-pencil"></i> [{oxmultilang ident="EDIT"}]
                                        </a>
                                        [{/if}]

                                        [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                        [{oxmultilang ident="PROPORTIONALLY_CALCULATED"}]
                                        [{else}]
                                        [{if $oxcmp_basket->getGiftCardCostVat()}][{$oxcmp_basket->getGiftCardCostVatPercent()}]%[{/if}]
                                        [{/if}]
                                    </div>
                                    <div class="totalPrice text-end">
                                        <strong class="text-nowrap h5">[{$oCard->getFPrice()}]&nbsp;[{$currency->sign}]</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                [{/if}]
            [{/if}]
        [{/block}]

        [{block name="checkout_basketcontents_basketfunctions"}][{/block}]
[{if $editable}]
    </div>
</div>
[{/if}]
