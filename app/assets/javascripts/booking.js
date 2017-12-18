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
    }

      )
  })
});

$(document).ready(function(){
  $('.grid-type').click(function(){
    if ($(this).hasClass('grid-type')){
    $(this).addClass('grid-type-selected')
    $(this).removeClass('grid-type')
  } else {
    $(this).addClass('grid-type')
    $(this).removeClass('grid-type-selected')
  }

    $('.gridtypes-fields').html('')
    $('.grid-type-selected').each(function(index, gridType){
      var gridtypeId = $(gridType).data('gridtype-id');
      $('.gridtypes-fields').append('<input type="hidden" name="booking[gridtypes_ids][]" value="'+ gridtypeId +'" />')
    }

      )
  })
});
