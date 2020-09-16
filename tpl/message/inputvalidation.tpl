[{foreach from=$aErrors item="oError"}]
    <div class="invalid-feedback">[{$oError->getMessage()}]</div>
[{/foreach}]
