$(document).on('turbolinks:load', function(){
  $(function(){
    function changeCapacity(viewing_time) {
      var id = viewing_time.id
      $('[data-id='+id+']').html(viewing_time.capacity);
    }

    $(function(){
      setInterval(update, 5000)
    })

    function update() {
      $('.capacity').each(function(i, ele){
        var id = $(this).data('id');
        var capacity = ele.textContent;
        $.ajax({
          url: '/time_table',
          type: 'GET',
          data: { 
            viewing_time: { id: id, capacity: capacity } 
            },
          dataType: 'json'
        })
        .always(function(data){
          $.each(data, function(i, data){
            changeCapacity(data)
          })
        })
      })
    }

    function changeBtn(data) {
      $(this).attr('data-reception-id', '1');
      $(this).html(
        `<button type="button" class="btn btn-secondary">受付済</button>`
      )
    }

    $(function(){
      setInterval(checkedInUser, 10000)
    });
    function checkedInUser() {
      $('.reception-btn').each(function() {
        if($(this).is('[data-reception-id=2]')){
          var userId = $(this).attr('data-userId');
          var viewingTimeId = $(this).attr('data-viewingTimeId');
          $.ajax({
            type: 'GET',
            url: `/admin/viewing_times/${viewingTimeId}`,
            data: { reception:
            { user_id: userId, viewing_time_id: viewingTimeId}
            },
            dataType: 'json'
          })
          .done(function(data){
            var userId = data.user_id
            $('[data-userId='+userId+']').attr('data-reception-id', '1').html(
              '<button type="button" class="btn btn-secondary">受付済</button>'
            )
          })
        }
      })
    }
  });
});