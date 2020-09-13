$(function() {
  Payjp.setPublicKey("pk_test_b5dabc417590a29c092cb137");
  $("#card_new_submit").on("click",function(e){
    e.preventDefault()
    
    const card = {
      number: $("#card_num_input").val(),
      exp_month: $("#exp_month_input").val(),
      exp_year: $("#exp_year_input").val(),
      cvc: $("#cvc_input").val()
    };

    Payjp.createToken(card, function (status, response){
      if (status === 200) {
        $("#card_num_input").removeAttr("name");
        $("#exp_month_input").removeAttr("name");
        $("#exp_year_input").removeAttr("name");
        $("#cvc_input").removeAttr("name");
        var token = response.id;
        $("#card_token").append(`<input type="hidden" name="card_token" class="payjp-token" value=${token} />`)
        $("#card_new_formfield").submit();

        alert("カード情報を登録しました");
      }else{
        alert("正しいカード情報を入力してください");
      }
    });
  });
});