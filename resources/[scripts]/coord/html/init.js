$(document).ready(function(){
  window.addEventListener('message', function(event) {

    if (event.data.type == "copy") {
      var node = document.createElement('textarea');
      var selection = document.getSelection();

      node.textContent = event.data.coords;
      document.body.appendChild(node);

      selection.removeAllRanges();
      node.select();
      document.execCommand('copy');

      selection.removeAllRanges();
      document.body.removeChild(node);
    }

    if (event.data.type == "openUrl") {
      window.invokeNative("openUrl", event.data.link)
    }
  });
});