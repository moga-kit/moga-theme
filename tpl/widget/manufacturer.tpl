[{oxstyle include="css/manufacturer.min.css"}]

[{assign var="manufacturerWidth" value=$oViewConf->getViewThemeParam('sManufacturerWidth')}]
[{if $manufacturerWidth == 'container'}]
<div class="container-xxl">
[{/if}]

    <div id="manufacturer" class="manufacturer">
        <div class="container[{if $manufacturerWidth == 'w100cContainer'}]-xxl[{else}]-fluid[{/if}]">
            <h3>[{oxmultilang ident="OUR_BRANDS"}]</h3>
            <span class="subhead">[{oxmultilang ident="MANUFACTURERSLIDER_SUBHEAD"}]</span>

            <div class="row justify-content-center">
                [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
                [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                    <a href="[{$oManufacturer->getLink()}]" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]" class="manufacturer-item">
                        [{if $oViewConf->isModuleActive('cnc/imagebutler')}]
                        <picture>
                            <source type="image/webp" data-srcset="[{$oViewConf->getDynamicImage($oManufacturer->getIconUrl(), 100, 100, 'webp')}]">
                            <source type="image/jpg" data-srcset="[{$oViewConf->getDynamicImage($oManufacturer->getIconUrl(), 100, 100, 'jpg')}]">
                            <img data-src="[{$oViewConf->getDynamicImage($oManufacturer->getIconUrl(), 100, 100, 'webp')}]" alt="[{$oBanner->oxactions__oxtitle->value}]" class="img-fluid lazyload">
                        </picture>
                        [{else}]
                            <img  class="img-fluid lazyload" data-src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                        [{/if}]
                    </a>
                </div>
                [{/if}]
                [{/foreach}]
            </div>
        </div>
    </div>
[{if $manufacturerWidth == 'container'}]
</div>
[{/if}]
