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
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require bootstrap
//= require jquery.validate
//= require jquery.validate.additional-methods 
//= require toastr
//= require_tree .


$( document ).on('turbolinks:load', function() {
	getLocation();
  capturePicture();
  validateUserForm();
 });


function getLocation() {
  $('#locationBtn').on('click', function(e){
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition);
	  }
  });
}

function showPosition(position) {
	$.ajax({
      url: "/user_location",
      type: "get",
      dataType: 'script',
      data: { latitude: position.coords.latitude, longitude: position.coords.longitude}
    });
}

function capturePicture(){
  $('#captureBtn').on('click', function(e){
    const webcamElement = document.getElementById('webcam');
    const canvasElement = document.getElementById('canvas');
    const webcam = new Webcam(webcamElement, 'user', canvasElement);
    webcam.start().then(result =>{
      $('#capturePicture, .pictureBox').removeClass('d-none');
    }).catch(err => {
      console.log(err);
    });
    captureImage(webcam);
  });

}


function captureImage(webcam){
  $('#capturePicture').on('click', function(e){
    let picture = webcam.snap();
    webcam.stop();
    $('.image_url').val(picture);
    $(this).addClass('d-none');
    $('.pictureBox').addClass('d-none');
    $('#capturedPicture').attr('src', picture);
  });
}

function validateUserForm(){
  if($('#new_user').length > 0){
    $.validator.setDefaults({ 
      ignore: [],
    });
    $('#new_user').validate({
      rules: {
          'user[email]':{
              required: true
          },
          'user[latitude]':{
              required: true
          },
          'image':{
              required: true
          }
      },
      messages: {
          'user[email]': "Please Enter email address",
          'user[latitude]': "Please Set your current location",
          'image': "Please Capture your picture"
      }
    });
  }
}