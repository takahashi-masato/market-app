$(function(){
   
  $("input[type = 'checkbox']").click(function(){
    $("input[type = 'checkbox']").prop('checked', false).val("false")
    $(this).prop('checked', true).val("true")
  });
   
  $("#default_card_submitBtn").on("click",function(e){
    e.preventDefault()
    var cards_table_id = $("input[value = 'true']").parents(".cardList__data").attr("data-id");
    $.ajax({
      url:"/cards/id:"+cards_table_id+"/cards",
      type: "PATCH",
      data:{cards_table_id },
      dataType: "html"
    })
    .done(function(){
      location.reload();
    })
    .fail(function(){
      alert("失敗しました")
    })
  });
});