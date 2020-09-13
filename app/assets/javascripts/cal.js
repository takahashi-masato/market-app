$(document).on('turbolinks:load', function(){


  $('#price').on('input', function() {

    var fee = $('#fee-cal').val();
    var pro = $('#pro-cal').val();

    var s = $('#price').val();
    var si = parseInt(s);
  
    var fee_result = si * 0.1
    var pro_result = si - fee_result
  
    $('#fee-cal').val(fee_result)
    $('#pro-cal').val(pro_result)
  });
  

})

