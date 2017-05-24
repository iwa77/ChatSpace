$(function() {
  function buildHTML(message) {

    var insertImage = '';
    if (message.image.url) {
      insertImage = `<div class="chat-main__content__image"><img src="${message.image}"></div>`;
    }

    var html = `
    <div class="message" data-id=${message.id}>
      <div class="chat-main__content__name">${message.name}</div>
      <div class="chat-main__content__create-time">${message.date}</div>
      <div class="chat-main__content__message">${message.body}</div>
      ${insertImage}
    </div>`
    return html
  };

  function autoreload() {
    var lastid = $('.message').last().data('id');
    $.ajax({
      type: 'GET',
      url: './messages', 
      dataType: 'json',
      data: {lastId: lastid}
    })
    .done(function(data) {
      var appendHTML = '';
      $.each(data.messages, function(index, message) {
        console.log(data);
        appendHTML += buildHTML(message);
      });
      $('.message_list').append(appendHTML);
    })
    .fail(function(message) {
      alert('自動更新に失敗しました');
    });
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.message-box');
    var formData = new FormData($(this).get(0));

    $.ajax({
      type: 'POST',
      url: "./messages",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.message_list').append(html);
      textField.val('');
      $('input').prop("disabled", false);
    })
    .fail(function() {
      alert('メッセージを入力してください');
    });
  });
  
  // 自動更新機能
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      setInterval(autoreload , 3000)
    }
});

