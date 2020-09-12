$(function(){
  $(".card_delete_btn").on("click",function(){

    $('.js_delete_modal').fadeIn();  
      return false;
  });
  $(".js_cancel_btn").on("click",function(){
    $('.js_delete_modal').fadeOut();
        return false;
  });
});