$(function(){
   
  $("input[type = 'checkbox']").click(function(){
    $("input[type = 'checkbox']").prop('checked', false).val("false")
    $(this).prop('checked', true).val("true")
    console.log($("input[value = 'true']").parents(".cardList__data").attr("data-id"))
  });
   
  $("#default_card_submitBtn").on("click",function(e){
    e.preventDefault()
    var cards_table_id = $("input[value = 'true']").parents(".cardList__data").attr("data-id");
    console.log(cards_table_id)
    $.ajax({
      url:"/cards/id:"+cards_table_id+"/cards/",
      type: "PATCH",
      data:{cards_table_id },
      dataType: "html"
    })
    .done(function(){
      console.log("成功")
      location.reload();
    })
    .fail(function(){
      console.log("失敗")
    })
      
    
    // $("#default_card_changeForm"),submit();
  });
});