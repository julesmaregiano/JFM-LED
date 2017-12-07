$(document).ready(function(){
  $('.btn-calendar-tobook').click(function(){
    console.log('lala')
    if ($(this).hasClass('btn-calendar-tobook')){
    $(this).addClass('btn-calendar-selected')
    $(this).removeClass('btn-calendar-tobook')
  } else {
    $(this).addClass('btn-calendar-tobook')
    $(this).removeClass('btn-calendar-selected')
  }

    $('.availabilities-fields').html('')
    $('.btn-calendar-selected').each(function(index, availability){
      var availabilityId = $(availability).data('availability-id');
      $('.availabilities-fields').append('<input type="hidden" name="booking[availability_ids][]" value="'+ availabilityId +'" />')
    }

      )
  })
});
