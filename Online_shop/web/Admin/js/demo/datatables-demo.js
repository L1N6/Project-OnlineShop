// Call the dataTables jQuery plugin
$(document).ready(function() {
  
    $('#dataTable').DataTable({
        "columnDefs": [
            { "searchable": false, "targets": [0, 2, 3] } // disable search for some columns
        ]
    });

   
});
