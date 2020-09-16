[{block name="checkout_user_options"}]
    [{oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
    [{oxscript add="$(window).on('load', function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.checkoutOptions .card-body' ) ); } });"}]

    [{assign var="sColClass" value="col-lg-6"}]
    [{if $oView->getShowNoRegOption()}]
        [{assign var="sColClass" value="col-lg-4"}]
    [{/if}]
	<div class="accordion" id="accordionExample">
		<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
			[{block name="checkout_options_noreg"}]
			[{if $oView->getShowNoRegOption()}]
			<form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="optionNoRegistration">
				[{$oViewConf->getHiddenSid()}]
				[{$oViewConf->getNavFormParams()}]
				<input type="hidden" name="cl" value="user">
				<input type="hidden" name="fnc" value="">
				<input type="hidden" name="option" value="1">
				[{block name="checkout_options_noreg_text"}]
				[{if $oView->isDownloadableProductWarning()}]
				<p class="errorMsg">[{oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT"}]</p>
				[{/if}]
				[{/block}]
				<button class="btn btn-outline-primary btn-block mb-2" type="submit">[{oxmultilang ident="PURCHASE_WITHOUT_REGISTRATION"}]</button>
			</form>
			[{/if}]
			[{/block}]

			[{block name="checkout_options_reg"}]
			<form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="optionRegistration">
				[{$oViewConf->getHiddenSid()}]
				[{$oViewConf->getNavFormParams()}]
				<input type="hidden" name="cl" value="user">
				<input type="hidden" name="fnc" value="">
				<input type="hidden" name="option" value="3">
				<button class="btn btn-outline-primary btn-block mb-2" type="submit">[{oxmultilang ident="OPEN_ACCOUNT"}]</button>
			</form>
			[{/block}]

			<button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
				Einloggen
			</button>
		</div>

		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
			[{block name="checkout_options_login"}]
			[{include file="form/login.tpl"}]
			[{/block}]

			<button class="btn btn-outline-primary my-2 btn-block collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				Zurück
			</button>
		</div>
	</div>



[{/block}]
