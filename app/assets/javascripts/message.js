$(function(){
  function buildHTML(message){
    var html = $(`<div class="messages" data-message-id="${message.id}">
                    <ul class="massege">
                      <li class="massege__name">
                        ${message.name}
                      </li>
                      <li class="massege__date">
                        ${message.created_at}
                      </li>
                    </ul>
                    <div class="message_field">
                      <h4>
                        ${message.body}
                      </h4>
                    </div>
                  </div>`);
    if(message.image){
      html.find('.message_field').append(`<img src="${message.image}">`);
    }
    return html;
  }

  function buildFLASH(flash) {
    var flashMessage;
    $.each(flash, function(key, value){
      flashMessage = `<div class="flash flash__${key}">
                        ${value}
                      </div>`;
    });
    return flashMessage;
  }

  function deleteFLASH(){
    $(".flash").remove();
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var form = $('#new_message').get()[0];
    var formData = new FormData(form);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var flashMessage = buildFLASH(data.flash);
      setTimeout(deleteFLASH, 2000);
      $('body').prepend(flashMessage);
      var html = buildHTML(data);
      $('#messagebox').append(html)
      var height = $('.messageslist').height();
      $("#messagebox").animate({scrollTop: height});
      form.reset();
      $('.send_button').attr('disabled', false);
    })
    .fail(function(){
      alert('error');
      $('.send_button').attr('disabled', false);
    })
  })

  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      var messageId = $('.messages').last().data('message-id');
      $.ajax({
        url: 'messages.json',
        type: 'GET',
        data: {
          message_id: messageId
        },
        dataType: 'json'
      })
      .done(function(data){
        $.each(data, function(i, data) {
          var html = buildHTML(data);
          $('.messageslist').append(html)
          var height = $('.messageslist').height();
          $("#messagebox").animate({scrollTop: height});
        });
      })
      .fail(function(){
        alert('自動更新に失敗しました');
      });
    } else {
      clearInterval(interval);
  }},  5000);
});
