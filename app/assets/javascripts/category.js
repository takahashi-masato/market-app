$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml =  `<select id="child_category", class="category", name="item[category_id]">
                          ${insertHTML}
                        </select>`;
    $('#category_area').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select id="grandchild_category", class="category" name="item[category_id]">
                              ${insertHTML}
                            </select>`;
    $('#category_area').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#item_category_id').on('change', function(){
    var parentCategory = document.getElementById('item_category_id').value; //選択された親カテゴリーの名前を取得
    $('#child_category').remove(); //親が変更された時、子以下を削除する
    $('#grandchild_category').remove();
    if (parentCategory != "選択してください"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchild_category').remove(); //子が変更された時、孫以下を削除するする
    }
  });
  // 子カテゴリー選択後のイベント
  $('#category_area').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').val(); //選択された子カテゴリーのidを取得
    $('#grandchild_category').remove(); //子が変更された時、孫以下を削除するする
    if (childId != "選択してください"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
    }
  });
});