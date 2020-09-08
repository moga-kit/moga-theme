<dl class="attributes dl-horizontal">
    [{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
        <dt id="attrTitle_[{$smarty.foreach.attribute.iteration}]">[{$oAttr->title}]</dt>
        <dd id="attrValue_[{$smarty.foreach.attribute.iteration}]">[{$oAttr->value}]</dd>
    [{/foreach}]
</dl>
