[{capture append="oxidBlock_content"}]
    <div class="container-xxl">
        <div class="row">
            <div class="col-12">
                <h1>[{$oView->getTitle()}]</h1>

                <ol>
                    <li>[{oxmultilang ident="MESSAGE_ENTER_YOUR_ADDRESS_AND_MESSAGE"}]</li>
                    <li>[{oxmultilang ident="MESSAGE_RECOMMEND_CLICK_ON_SEND"}]</li>
                </ol>

                [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
                    <p>[{oxmultilang ident="MESSAGE_READ_DETAILS"}] <a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></p>
                [{/oxifcontent}]

                [{include file="form/suggest.tpl"}]
            </div>
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Right"}]
