var myCollapsible = document.getElementById('searchCollapse');
myCollapsible.addEventListener('shown.bs.collapse', function () {
    document.getElementById('searchParam').focus();
})
