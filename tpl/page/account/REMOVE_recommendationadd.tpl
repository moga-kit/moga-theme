[{capture append="oxidBlock_content"}]
[{assign var="product" value=$oView->getProduct()}]
[{assign var="template_title" value=$product->oxarticles__oxtitle->value|cat:" "|cat:$product->oxarticles__oxvarselect->value}]

<h1>[{$template_title}]</h1>

[{oxid_include_dynamic file="form/recommendation_add.tpl" testid=""}]

[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
