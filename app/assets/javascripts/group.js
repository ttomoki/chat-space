$(function() {

	function searchedUserList(user) {
    var html = `<div class="chat-group-user searched clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`;
    $('#user-search-result').append(html);
  }

  function addedUserList(name, id) {
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name="group[user_ids][]" value="${id}" type="hidden">
                  <p class="chat-group-user__name"> ${name} </p>
                    <a class="chat-group-user__btn chat-group-user__btn--remove"> 削除 </a>
                </div>`;
    $('#chat-group-users').append(html);
  }




  var Input = '';

  $('#search').on('keyup', function() {
    var input = $('#search').val();
    if(Input !== input){
      $('.searched').remove();
      $.ajax({
        type: 'get',
        url: '/users/search',
        data: {keyword: input},
        datatype: 'json'
      })
      .done(function(data) {
        $.each(data, function(i,user) {
          searchedUserList(user);
        });
      })
      .fail(function() {
        alert('ユーザー検索に失敗しました');
      });
      Input = input;
    }
  });


  $(document).on('click','.chat-group-user__btn--add', function(){
    var input = $(this);
    var user_name = $(input.data('user-name'));
    var user_id = $(input.data('user-id'));
    var name = user_name.selector
    var id = user_id[0]
    addedUserList(name, id);
    input.parent().remove();
  });

  $(document).on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent().remove();
  });




});