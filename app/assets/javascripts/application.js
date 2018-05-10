// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-datepicker
//= require moment
//= require jquery_ujs
//= require_tree .


 $(document).ready(function(){
 	  $('.submit_booking').hide();
    $('.datepicker').datepicker({
    	format: "dd/mm/yyyy"
    });

  $('#check_status').on('click',function(){
    var fromDate = $('#booking_from_date').val()
 	  var toDate = $('#booking_to_date').val()
 	  var hotelId = $('select[name="booking[hotel_id]"]').val()
 	  var roomId = $('select[name="booking[room_id]"]').val()
 	  var categoryId = $('select[name="booking[category_id]"]').val()

 	  if (fromDate === '') {
 	  	return alert ('from date is required field');
 	  }
 	  if (toDate === ''){
 	    	return alert ('to date is required field');	
 	  }
    if (categoryId === ''){
 	    	return alert ('please select category is required field');	
 	  }
 	  var data = {
 	 	fromDate: fromDate,
 	 	toDate: toDate,
 	 	hotelId: hotelId,
 	 	roomId: roomId,
 	 	categoryId: categoryId,
 	 }

	  $.ajax({
	    url:   '/api/v1/bookings/rooms_are_available',
	    type: 'get',
	    data: data,
	    success: function(data) {
	      $('.available').html(data.message);
	      $('.submit_booking').show();
	    }
	  });
  })
});