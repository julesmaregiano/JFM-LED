$(document).ready(function(){
  $('.btn-calendar-free').click(function(){
    if ($(this).hasClass('btn-calendar-free')){
    $(this).addClass('btn-calendar-selected')
    $(this).removeClass('btn-calendar-free')
  } else {
    $(this).addClass('btn-calendar-free')
    $(this).removeClass('btn-calendar-selected')
  }

    $('.availabilities-fields').html('')
    $('.btn-calendar-selected').each(function(index, availability){
      var availabilityId = $(availability).data('availability-id');
      $('.availabilities-fields').append('<input type="hidden" name="booking[availability_ids][]" value="'+ availabilityId +'" />')
    })
  })
});

$(document).ready(function(){
  $('.option_values-tobook').click(function(){
    if ($(this).hasClass('option_values-tobook')){
    $(this).addClass('option_values-booked')
    $(this).removeClass('option_values-tobook')
  } else {
    $(this).addClass('option_values-tobook')
    $(this).removeClass('option_values-booked')
  }

    $('.options-fields').html('')
    $('.option_values-booked').each(function(index, optionValue){
      var optionValueId = $(optionValue).data('option-value-id');
      $('.options-fields').append('<input type="hidden" name="options[option_value_ids][]" value="'+ optionValueId +'" />')
    })
  })
});

$(document).ready(function(){
  $('.mng-calendar-free').click(function(){
    console.log('lala')
    if ($(this).hasClass('mng-calendar-free')){
    $(this).addClass('mng-calendar-selected')
    $(this).removeClass('mng-calendar-free')
  } else {
    $(this).addClass('mng-calendar-free')
    $(this).removeClass('mng-calendar-selected')
  }

    $('.availabilities-fields').html('')
    $('.mng-calendar-selected').each(function(index, availability){
      var availabilityId = $(availability).data('availability-id');
      $('.availabilities-fields').append('<input type="hidden" name="booking[availability_ids][]" value="'+ availabilityId +'" />')
    })
  })
});

$(document).ready(function(){
  $('.mng-calendar-pending').click(function(){
    console.log('lala')
    if ($(this).hasClass('mng-calendar-pending')){
    $(this).addClass('mng-calendar-selected')
    $(this).removeClass('mng-calendar-pending')
  } else {
    $(this).addClass('mng-calendar-pending')
    $(this).removeClass('mng-calendar-selected')
  }
    $('.availabilities-fields').html('')
    $('.mng-calendar-selected').each(function(index, availability){
      var availabilityId = $(availability).data('availability-id');
      $('.availabilities-fields').append('<input type="hidden" name="booking[availability_ids][]" value="'+ availabilityId +'" />')
    })
  })
});

$(document).ready(function(){
  $('#booking_product_id').change(function() {
    console.log($(this).val());
    var productId = $(this).val();
    $('.options-container').addClass('hidden')
    $('#options-container-' + productId).removeClass('hidden')
  });
});
