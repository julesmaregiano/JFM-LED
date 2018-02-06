$(document).ready(function() {
  var canvas = document.querySelector("canvas");
  if (canvas){
    canvas.height = canvas.offsetHeight;
    canvas.width = canvas.offsetWidth;
    signature_pad = new SignaturePad(canvas);
    $('.signature_pad_clear').click(function() { signature_pad.clear() });
    $('.signature_pad_save').click(function(event) {
      if (signature_pad.isEmpty()){
        alert('Attention, vous n\'avez pas fait signer le rapport.');
        $('.signature_pad_input').val(signature_pad.toDataURL());
      } else {
        $('.signature_pad_input').val(signature_pad.toDataURL());
      }
    });
  }
});
