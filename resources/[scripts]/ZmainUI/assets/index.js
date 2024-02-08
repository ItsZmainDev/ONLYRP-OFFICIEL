$('body').hide();
window.addEventListener('message', function (event) {
    var data = event.data;

    if (data.action === 'show') {
        $('#overflow-box-text').html('')
        $('body').fadeIn()

        const headerDiv = document.querySelector('.header');

        const spanElement = headerDiv.querySelector('span');
        
        spanElement.textContent = data.title;

        data.data.forEach(function(item) {
            var boxText = '<div class="box-text"> <span>' + item.title + '</span> <span>' + item.subtitle + '</span> </div>';
            $('#overflow-box-text').append(boxText);
          });
    }

    if (data.action === 'hide') {
        $('body').fadeOut()
    }
});