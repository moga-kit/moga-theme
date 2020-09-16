var paymentInputs = document.querySelectorAll('#payment dl dt input[type=radio]');

if (paymentInputs) {
    paymentInputs.forEach((item) => {
        item.addEventListener('click', function (evt) {
            document.querySelectorAll('dd', evt.target).forEach((item) => {item.style.display = 'none'});
            var targetParentDl = evt.target.parentNode.parentNode;
            targetParentDl.querySelectorAll('dd').forEach((item) => {item.style.display = 'block'});
        });
    });
}
