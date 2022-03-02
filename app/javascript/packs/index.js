$(document).ready(function() {
  $('.noti-id').hide();
  $('.noti-created').hide();

  var id = parseInt($('.noti-id').text())
  var date1 = $('.noti-created').text()
  $('.time-before'+"-"+id).html(before_time(parseInt(Date.now()/1000) - parseInt(date1)));
  function before_time(time){
    if(time > 60*60*24*30*11){
      return parseInt(time/(60*60*24*30*11)) + I18n.t("js.time.year");
    } else if (time > 60*60*24*30){
      return parseInt(time/(60*60*24*30)) + I18n.t("js.time.month");
    } else if (time > 60*60*24){
      return parseInt(time/(60*60*24)) + I18n.t("js.time.day");
    } else if (time > 60*60){
      return parseInt(time/ (60*60)) + I18n.t("js.time.hour");
    } else if (time > 59){
      return parseInt(time/60) + I18n.t("js.time.minute");
    } else {
      return I18n.t("js.time.one_minute");
    }
  }

  $(".js-btn-add").on("click", function() {
      addAddressField();
    })
    function addAddressField() {
      var mainBody = $('.guest-container')
      var length = $(".street-field").length;
      var div = $('<div class="row"></div>');
      var div1 = $('<div class="form-group"></div>');
      var div2 = $('<div class="form-group"></div>');
      var div3 = $('<div class="form-group"></div>');
      var div4 = $('<div class="form-group"></div>');
      var div5 = $('<div class="col-12"></div>');
      var div6 = $('<div class="col-md-4 col-sm-12"></div>');
      var div7 = $('<div class="col-md-4 col-sm-12"></div>');
      var div8 = $('<div class="col-md-4 col-sm-12"></div>');

      var title_name = $('.label-name').text();
      var title_dob = $('.label-dob').text();
      var title_passport = $('.label-passport').text();
      var title_phone = $('.label-phone').text();

      div1.append('<label class="required">' + title_name +'</label>')
      div1.append('<input type="text" name="booking[guests_attributes]['+ length +'][name]" class="street-field form-control" id="booking-guests_attributes_' + length + '_name" >')
      div2.append('<label class="required">' + title_dob +'</label>')
      div2.append('<input type="date" name="booking[guests_attributes]['+ length +'][dob]" class="form-control" id="booking-guests_attributes_' + length + '_dob" >')
      div3.append('<label>' + title_passport +'</label>')
      div3.append('<input type="text" name="booking[guests_attributes]['+ length +'][passport]" class="form-control" id="booking-guests_attributes_' + length + '_passport" >')
      div4.append('<label>' + title_phone +'</label>')
      div4.append('<input type="text" name="booking[guests_attributes]['+ length +'][phone_number]" class="form-control" id="booking-guests_attributes_' + length + '_phone_number" >')

      div5.append(div1)
      div6.append(div2)
      div7.append(div3)
      div8.append(div4)

      div.append(div5)
      div.append(div6)
      div.append(div7)
      div.append(div8)
      mainBody.append(div);
    }
    var myModal = document.getElementById('myModal')
    var myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', function () {
      myInput.focus()
    })
});
