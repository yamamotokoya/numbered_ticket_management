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
            viewing_time: { id: id,capacity: capacity } 
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
  });
});