if($('#user_terms_agree').is(':checked')){
  $('.terms-required').removeClass('disabled');
}else{
  $('.terms-required').addClass('disabled');
}

$(function(){
  $('#user_terms_agree').change(function(){
    if($(this).is(':checked')){
      $('.terms-required').removeClass('disabled');
    }else{
      $('.terms-required').addClass('disabled');
    }
  });
});
