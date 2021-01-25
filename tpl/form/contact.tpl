[{*oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"*}]
[{assign var="editval" value=$oView->getUserData()}]
<form class="max-600 needs-validation" action="[{$oViewConf->getSslSelfLink()}]" method="post" novalidate>
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send"/>
        <input type="hidden" name="cl" value="contact"/>

    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]

    [{block name="contact_form_fields"}]
        <div class="mb-3 form-floating">
            [{include
            file="form/fieldset/salutation.tpl"
            name="editval[oxuser__oxsal]"
            value=$editval.oxuser__oxsal
            class="form-select"
            required=$contactFormFields.salutation.isRequired
            }]
            <label class="form-label[{if $contactFormFields.salutation.isRequired}] req[{/if}]">
                [{oxmultilang ident="TITLE"}]
            </label>
        </div>
        <div class="mb-3 form-floating[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
            <input type="text"
               name="editval[oxuser__oxfname]"
               id="editval[oxuser__oxfname]"
               maxlength="255" placeholder=" "
               value="[{$editval.oxuser__oxfname}]"
               class="form-control"[{if $contactFormFields.firstName.isRequired}] required[{/if}]>
            <label class="[{if $contactFormFields.firstName.isRequired}]req[{/if}]" for="editval[oxuser__oxfname]">
                [{oxmultilang ident="FIRST_NAME"}]
            </label>
        </div>
        <div class="mb-3 form-floating[{if $aErrors.oxuser__oxlname}] oxInValid[{/if}]">
            <input type="text"
               name="editval[oxuser__oxlname]"
               id="editval[oxuser__oxlname]"
               maxlength=255
               value="[{$editval.oxuser__oxlname}]"
               class="form-control" placeholder=" "
               [{if $contactFormFields.lastName.isRequired}] required[{/if}]>
            <label class="[{if $contactFormFields.lastName.isRequired}]req[{/if}]" for="editval[oxuser__oxlname]">
                [{oxmultilang ident="LAST_NAME"}]
            </label>
        </div>
        <div class="mb-3 form-floating[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
            <input id="contactEmail"
               type="email"
               name="editval[oxuser__oxusername]"
               maxlength=255 placeholder=" "
               value="[{$editval.oxuser__oxusername}]"
               class="form-control"
               [{if $contactFormFields.email.isRequired}] required[{/if}]>
            <label class="[{if $contactFormFields.email.isRequired}]req[{/if}]" for="contactEmail">
                [{oxmultilang ident="EMAIL"}]
            </label>
        </div>
        <div class="mb-3 form-floating[{if $aErrors && !$oView->getContactSubject()}] oxInValid[{/if}]">
            <input type="text"
               name="c_subject"
               id="c_subject"
               maxlength=80 placeholder=" "
               value="[{$oView->getContactSubject()}]"
               class="form-control"
            [{if $contactFormFields.subject.isRequired}] required[{/if}]>
            <label class="[{if $contactFormFields.subject.isRequired}]req [{/if}]" for="c_subject">
                [{oxmultilang ident="SUBJECT"}]
            </label>
        </div>
        <div class="mb-3 form-floating">
            <textarea rows="15" placeholder=" "
                name="c_message"
                id="c_message"
                class="form-control"
                [{if $contactFormFields.message.isRequired}] required[{/if}]>
                [{$oView->getContactMessage()}]
            </textarea>
            <label class="[{if $contactFormFields.message.isRequired}]req [{/if}]" for="c_message">
                [{oxmultilang ident="MESSAGE"}]
            </label>
        </div>
    [{/block}]

    [{block name="captcha_form"}][{/block}]

    [{block name="contact_form_buttons"}]
        <div class="mb-3 form-floating">
            <div class="col-lg-offset-2 col-lg-10">
                 <p class="req-waring">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
                <button class="btn btn-primary" type="submit">
                    [{oxmultilang ident="SEND"}]
                </button>
            </div>
        </div>
    [{/block}]
</form>
