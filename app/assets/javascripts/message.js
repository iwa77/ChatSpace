$(function() {
  function buildHTML(message) {
    var html = {};
    html.name = $('<li class="chat-main__content__name">').append(message.name);
    html.date = $('<li class="chat-main__content__create-time">').append(message.created_at);
    html.body = $('<li class="chat-main__content__body">').append(message.body)
    return html;
  }

  $('.js-message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.message-box');
    var formData = new FormData.get()[0];
    $.ajax({
      type: 'POST',
      url: "./messages.json",
      data: formData,
      dataType: 'json',
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.message_list').append(html.name, html.date, html.body);
      textField.val('');
    })
    .fail(function() {
      alert('メッセージを入力してください');
    });
  });
});
