script type="text/javascript">
$("#admin_show_start_time").change(function()
{
  m = new moment($("#admin_show_start_time").val(), 'HH:mm:ss');
  n = new moment($("#admin_show_start_time").val(), 'HH:mm:ss');
  m._d;
  n._d;
  m.add(3,'hours');
  m._d;
  $("#admin_show_end_time").val(m);
  $("#admin_show_start_time").val(n);
});
</script>

<script>
   $('#reveal').on('click', function() {
      $.ajax({
       url: "<%= display_orders_url %>",
       type: 'GET',
       dataType: 'HTML',
       success: function (response) {
               $('#ajax-content').html(response.responseText);
       },
        error: function(){
       }
     });
     $('button').hide();
})


<script>
    $(".js-data-example-ajax").select2({
      ajax: {
        url: "<%= admin_shows_search_path %>",
        dataType: 'json',
        data: function (params) {
          var query = {
            movie_id: params.term
          }
        }
        
      }
    });
--------------------------------------------------------------
    $('#reveal').on('click', function(e) {
            e.preventDefault();
            var movie_id = $('#myselect21').select2('val');
            var theatre_id = $('#myselect22').select2('val');
            alert(movie_id);
            alert(theatre_id);
            $.ajax({
              url: "<%= admin_shows_url %>",
              data: {'movie_id' : movie_id, 'theatre_id' : theatre_id},
              type: 'GET',
              dataType: "html",
              success: function (response) {
                alert("success");
                alert($('#ajax-content').html(response.d));
              },
              //processResults: function(data)
              //{
                //return{
                  //results: data,
                //};
              //},
              error: function(xhr,textStatus,errorThrown){
                alert(errorThrown);
              }
            });

            -------------------------------------------------------------
            $('#reveal').on('click', function(e) {
            e.preventDefault();
            var movie_id = $('#myselect21').select2('val');
            var theatre_id = $('#myselect22').select2('val');
            alert(movie_id);
            alert(theatre_id);
            $.ajax({
              url: "<%= admin_shows_url %>",
              data: {'movie_id' : movie_id, 'theatre_id' : theatre_id},
              type: 'GET',
              dataType: "html",
              success: function (response) {
                alert("success");
                alert($('#ajax-content').html(response.d));
              },
              //processResults: function(data)
              //{
                //return{
                  //results: data,
                //};
              //},
              error: function(xhr,textStatus,errorThrown){
                alert(errorThrown);
              }
            });


            #####################
            <%= form_for(:admin_show, remote: true ) do |f| %>
    <script>
      $(document).ready(function() {
          $('#myselect21').select2();
          $('#myselect22').select2();
          
            //$('button').hide();
          });
      });
    </script>
    <div>
      <%= f.label :movie_id %>
      <%= f.select("movie_id", @m.collect { |m| [m.name, m.id]}, {prompt: @m.first},{id: "myselect21"}) %>
    </div>
    <div>
      <%= f.label :theatre_id %>
      <%= f.select("theatre_id", @t.collect { |t| [t.name, t.id]}, {prompt: @t.first},{id: "myselect22", multiple: "multiple


        "}) %>
    </div>

    <%= button_tag "Apply",:id => 'reveal' %>


    <div id="ajax-content">


    <%= #will_paginate @admin_shows %>
<p id="notice"><%= notice %></p>

<%= #will_paginate @admin_shows %>