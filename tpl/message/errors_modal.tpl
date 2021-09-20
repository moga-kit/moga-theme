<div class="modal fade" id="error-popup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="visually-hidden-focusable">Close</span>
                </button>
                <div class="h4 modal-title" id="basketModalLabel">Error</div>
            </div>
            <div class="modal-body">
                <div id="modalbasketFlyout" class="basketFlyout">
                    [{foreach from=$Errors.popup item=oEr key=key}]
                    <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
                    [{/foreach}]
                </div>
            </div>
        </div>
    </div>
</div>
[{oxscript add="$('#error-popup').modal('show');"}]
