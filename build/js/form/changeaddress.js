document.getElementById('showShipAddress').addEventListener('change', showShipAddressAction);

function showShipAddressAction(evt) {
    evt.preventDefault();
    document.getElementById('shippingAddress').style.display = evt.target.checked ? 'none' : 'block';
}


document.getElementById('userChangeAddress').addEventListener('click', userChangeAddressAction);

function userChangeAddressAction(evt) {
    evt.preventDefault();
    document.querySelectorAll('#addressForm, #addressText').forEach((item) => {item.style.display = item.style.display === 'none' ? 'block' : 'none'});
    return false;
}

var userChangeShippingAddress = document.getElementById('userChangeShippingAddress')

if (userChangeShippingAddress) {
    userChangeShippingAddress.addEventListener('click', userChangeShippingAddressAction);
}

function userChangeShippingAddressAction(evt) {
    evt.preventDefault();
    var showShipAddressCheckbox = document.getElementById('showShipAddress');
    showShipAddressCheckbox.checked = false;
    showShipAddressCheckbox.dispatchEvent(new Event('change'));
}
