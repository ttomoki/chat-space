$(function(){
  function buildHTML(message){
    var html = $(`<div class="messages">
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
      console.log(data.flash)
      var flashMessage = buildFLASH(data.flash);
      console.log(flashMessage)
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
});