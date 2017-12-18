$(document).ready(function(){
  $('.btn-calendar-free').click(function(){
    console.log('lala')
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
    }

      )
  })
});
