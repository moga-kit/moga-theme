<div id="basket_list" class="card [{if $oViewConf->getActiveClassName() == 'order'}] orderBasketItems[{/if}]">
    <h4 class="card-header card-title">[{oxmultilang ident="CART"}]</h4>
    <div class="card-body">
        [{* basket items *}]
        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            <div class="py-2">
                [{block name="checkout_basketcontents_basketitem"}]
                    [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                    [{assign var="oArticle" value=$basketitem->getArticle()}]
                    [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]
                    <div class="row" id="list_cartItem_[{$smarty.foreach.basketContents.iteration}]">
                        <div class="col-md-5 col-lg-3 col-xl-3">
                            [{block name="checkout_basketcontents_basketitem_image"}]
                            [{assign var="oBasketitemArticle" value=$basketitem->getArticle()}]

                            [{* product image *}]
                            [{*if $editable}]<a href="[{$basketitem->getLink()}]">[{/if*}]

                            <img class="cart-img" loading="lazy" src="[{$oBasketitemArticle->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]">
                            [{*if $editable}]</a>[{/if*}]
                            [{/block}]
                        </div>

                        <div class="col-md-7 col-lg-9 col-xl-9">
                            <div class="d-flex justify-content-between">
                                <div>
                                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                                    [{block name="checkout_basketcontents_basketitem_title"}]
                                        <div class="card-title">[{$basketitem->getTitle()}]</div>
                                        [{if $basketitem->isSkipDiscount()}] <sup><a href="#SkipDiscounts_link" >**</a></sup>[{/if}]
                                    [{/block}]

                                    [{block name="checkout_basketcontents_basketitem_artnum"}]
                                        <div class="small">
                                            [{oxmultilang ident="PRODUCT_NO"}] [{$basketproduct->oxarticles__oxartnum->value}]
                                        </div>
                                    [{/block}]

                                    [{block name="checkout_basketcontents_basketitem_attributes"}]
                                        <div class="small">
                                            [{assign var=sep value=", "}]
                                            [{assign var=result value=""}]
                                            [{foreach key="oArtAttributes" from=$oAttributes->getArray() item="oAttr" name="attributeContents"}]
                                                [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                                                [{assign var=result value=$result|cat:$temp|cat:$sep}]
                                            [{/foreach}]
                                            [{$result|trim:$sep}]
                                        </div>
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
                                        [{if !$editable}]
                                            <p class="persparamBox">
                                                <small>
                                                    [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                        [{if !$smarty.foreach.persparams.first}]<br />[{/if}]
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
                                                    <br />
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
                                <div>
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
                                            <button class="btn btn-outline-primary" id="basketUpdate-[{$smarty.foreach.basketContents.iteration}]" type="submit" name="updateBtn" title="[{oxmultilang ident="UPDATE"}]">
                                                <i class="moga-sync"></i>
                                            </button>
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
                                [{block name="checkout_basketcontents_basketitem_wrapping"}]
                                [{* product wrapping *}]
                                [{if $oView->isWrapping()}]
                                <div class="wrapping">
                                    [{if !$basketitem->getWrappingId()}]
                                    [{if $editable}]
                                    <a href="#" class="btn btn-outline-primary btn-sm" title="[{oxmultilang ident="ADD"}]" data-toggle="modal" data-target="#giftoptions">[{oxmultilang ident="WRAPPING"}] [{oxmultilang ident="ADD"}]</a>
                                    [{else}]
                                    <small>[{oxmultilang ident="WRAPPING"}]: [{oxmultilang ident="NONE"}]</small>
                                    [{/if}]
                                    [{else}]
                                    [{assign var="oWrap" value=$basketitem->getWrapping()}]
                                    [{if $editable}]
                                    <small>[{oxmultilang ident="WRAPPING"}]:</small> <a class="btn btn-outline-primary btn-sm" href="#" title="[{oxmultilang ident="ADD"}]" data-toggle="modal" data-target="#giftoptions"><i class="moga-pencil"></i> [{$oWrap->oxwrapping__oxname->value}]</a>
                                    [{else}]
                                    <small>[{oxmultilang ident="WRAPPING"}]: [{$oWrap->oxwrapping__oxname->value}]</small>
                                    [{/if}]
                                    [{/if}]
                                </div>
                                [{/if}]
                                [{/block}]

                                [{block name="checkout_basketcontents_basketitem_removecheckbox"}]
                                [{if $editable}]
                                    <div>
                                        <input type="hidden" name="aproducts[[{$basketindex}]][remove]" id="aproducts_[{$basketindex}]_remove" value="0">
                                        <button type="submit" name="removeBtn" class="btn btn-remove mr-3" onclick="document.getElementById( 'aproducts_[{$basketindex}]_remove' ).value = '1';">
                                            <i class="moga-trash"></i> [{oxmultilang ident="REMOVE"}]
                                        </button>

                                        [{if $oxcmp_user}]
                                            <button type="submit" name="moveBtn" class="btn btn-remove" onclick="document.getElementById( 'aproducts_[{$basketindex}]_remove' ).value = '1';">
                                                <i class="moga-heart-fill"></i> [{oxmultilang ident="MOVE_TO_WISH_LIST"}]
                                            </button>
                                        [{/if}]
                                    </div>
                                [{/if}]
                                [{/block}]

                                [{block name="checkout_basketcontents_basketitem_totalprice"}]
                                [{* product quantity * price *}]
                                <div class="totalPrice text-right">
                                    <strong>[{oxprice price=$basketitem->getPrice() currency=$currency}]</strong>
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
                    <tr>
                        [{if $editable}]<td></td>[{/if}]
                        <td id="orderCardTitle" colspan="3">[{oxmultilang ident="GREETING_CARD"}] "[{$oCard->oxwrapping__oxname->value}]"
                            <br>
                            <b>[{oxmultilang ident="YOUR_MESSAGE"}]</b>
                            <br>
                            <div id="orderCardText">[{$oxcmp_basket->getCardMessage()|nl2br}]</div>
                        </td>
                        <td id="orderCardPrice">[{$oCard->getFPrice()}]&nbsp;[{$currency->sign}]</td>
                        <td>
                            [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                [{oxmultilang ident="PROPORTIONALLY_CALCULATED"}]
                            [{else}]
                                [{if $oxcmp_basket->getGiftCardCostVat()}][{$oxcmp_basket->getGiftCardCostVatPercent()}]%[{/if}]
                            [{/if}]
                        </td>
                        <td id="orderCardTotalPrice" align="right">[{$oCard->getFPrice()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/if}]
        [{/block}]

        [{block name="checkout_basketcontents_basketfunctions"}][{/block}]
    </div>
</div>
