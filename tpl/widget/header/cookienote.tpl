[{if $oView->isEnabled() && $smarty.cookies.displayedCookiesNotification != '1'}]
    [{*oxscript include="js/libs/jquery.cookie.min.js"}]
    [{oxscript add="$.cookie('testing', 'yes'); if(!$.cookie('testing')) $('#cookieNote').hide(); else{ $('#cookieNote').show(); $.cookie('testing', null, -1);}"}]
    [{oxscript include="js/widgets/oxcookienote.min.js"*}]
    <div id="cookieNote">
        <div class="alert alert-info" style="margin: 0;">
            <button type="button" class="btn-close" data-bs-dismiss="alert">
                <span aria-hidden="true"></span><span class="visually-hidden-focusable">[{oxmultilang ident='CLOSE'}]</span>
            </button>
            [{oxmultilang ident='COOKIE_NOTE'}]
            <span class="cancelCookie"><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=clearcookies"}]" title="[{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]">[{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]</a></span>
        </div>
    </div>
    [{*oxscript add="$('#cookieNote').oxCookieNote();"*}]
[{/if}]
[{oxscript widget=$oView->getClassName()}]
