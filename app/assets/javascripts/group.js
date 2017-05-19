$(document).on('turbolinks:load', function() {

    // インクリメンタルサーチHTML構築
    function buildSearchHTML(user) {
      var html =
        `<div class="chat-group-user clearfix">
          <p class="chat-group-user__name">${user.name}</p>
          <div class="chat-group-user__btn chat-group-user__btn--add" data-user-name='${user.name}' data-user-id='${user.id}'>追加</div>
        </div>`;
      return html
    };

    // 追加ボタンクリック時のHTML構築
    function buildMemberHTML(id, name) {
      var html =
        `<div class="chat-group-user clearfix">
          <input type="hidden" name="group[user_ids][]" value="${id}">
          <p class="chat-group-user__name">${name}</p>
          <a class="chat-group-user__btn chat-group-user__btn--remove" data-user-id='${id}'>削除</a>
        </div>`;
      return html
    };
    // インクリメンタルサーチ
  $('#user-search-field').on('keyup', function() {
    $.ajax({
       type: 'GET',
       url: '/groups/search',
       data: {
        name: $(this).val()
       },
       dataType: 'json'
    })
    .done(function(data) {   
      var html = "";
      data.forEach(function(data) {
        html += buildSearchHTML(data);
      });
      $('#user-search-result').html(html);
    })
    .fail(function(data) {
      alert("失敗しました");
    });
　　});
  // メンバーの追加
  $('#user-search-result').on('click', '.chat-group-user__btn--add', function(e) {
    e.preventDefault();
    var id = $(this).attr('data-user-id');
    var name = $(this).attr('data-user-name');
    var html = buildMemberHTML(id,name);
    $('#chat-group-users').append(html);
    $(this).parent().remove();
  });
  // メンバーの削除
  $('#chat-group-users').on('click', '.chat-group-user__btn--remove', function() {

    $(this).parent().remove();
    // console.log("aaa")
    // var id = ($(this).attr('data-user-id'));
    // console.log(id);
    // $(`#chat-group-user-${id}`).remove();
  })
});





// console.log("eee");
