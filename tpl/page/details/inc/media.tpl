[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{if $oDetailsProduct->oxarticles__oxfile->value}]
    <a id="productFile" href="[{$oConfig->getPictureUrl('media/')}][{$oDetailsProduct->oxarticles__oxfile->value}]">[{$oDetailsProduct->oxarticles__oxfile->value}]</a>
[{/if}]

[{if $oView->getMediaFiles()}]
    [{foreach from=$oView->getMediaFiles() item="oMediaUrl" name="mediaURLs"}]
        [{assign var="sUrl" value=$oMediaUrl->oxmediaurls__oxurl->value}]
        [{assign var="blIsYouTubeMedia" value=false}]
        [{if $sUrl|strpos:'youtube.com' || $sUrl|strpos:'youtu.be'}]
            [{assign var="blIsYouTubeMedia" value=true}]
        [{/if}]

        [{if !$smarty.foreach.mediaURLs.first}]
        [{/if}]
        <div class="[{if $blIsYouTubeMedia}]ratio ratio-16x9[{/if}]">
            [{$oMediaUrl->getHtml()}]
        </div>
    [{/foreach}]
[{/if}]
