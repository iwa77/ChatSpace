$(document).on('turbolinks:load', function() {
   function buildHTML(user) {
    // console.log("vvv 1 vvv");
    // console.log(user);

    // console.log("vvv 2 vvv");
    // console.log(user.name);
    var html = `<p class='chat-group-user__name'> "${user.name}" </p>`
    return html
  };

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
      console.log("vvv 3 vvv");
      console.log(data)
    
      var html = "";
      data.forEach(function(data) {
        html += buildHTML(data);
        console.log.data
      });
      $('#user-search-result').html(html);
    })
    .fail(function(data) {
      alert("失敗しました");
    });
  });
});
console.log("eee");
