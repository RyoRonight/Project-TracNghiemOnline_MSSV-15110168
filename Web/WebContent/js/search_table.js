$(document).ready(function(){
  $("#searchTable").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

$(document).ready(function() {
    $('#example').DataTable( {
        "example_length": [[10, 15, 20, -1], [10, 15, 20, "All"]]
    } );
} );