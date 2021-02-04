$(document).on('turbolinks:load', function(){
  $(function(){
    var users_list = $('.js-users_info');
    
    function appendUser(user) {
      var user_id = `<th scope="row">${user.id}</th>`
      var link_to_user = `<td><a style="color: white;" href="/admin/users/${user.id}">${user.name}</a></td>`
      var user_email = `<td>${user.email}</td>`
      
      if(user.viewing_time_id){
        var html = `<tr class="js-user_info">
                    ${user_id}
                    ${link_to_user}
                    ${user_email}
                    <td>${user.hold_at}</td>
                    <td>${user.program_name}</td>
                    </tr>
                   `
      }else{
        var html = `<tr class="js-user_info">
                    ${user_id}
                    ${link_to_user}
                    ${user_email}
                    <td>予約なし</td>
                    <td></td>
                    <td></td>
                    </tr>
                    `
                  }
      users_list.append(html)
    }

    function appendErrMsgToHTML(text) {
      var users_table = $('.js-search_form');
      var html = `<div class="err-search">
                       ${text}
                  </div>`
      users_table.before(html);
    }

    $('.js-search_form').on('keyup', function(){

      var userName = $.trim($(this).val());
      $.ajax({
        type: 'GET',
        url: '/admin/searches',
        data: { name: userName},
        dataType: 'json'
      })
      .done(function(users){
        users_list.empty();
        $('.pagination').remove();
        if(users.length !== 0){
          users.forEach(function(user){
            appendUser(user)
          });
        }else{
          appendErrMsgToHTML('一致する予約者はいません')
          $('.err-search').remove();

        }
      })

    });
  });

});