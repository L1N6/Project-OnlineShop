<!DOCTYPE html>
<html>
<head>
  <title>Date Range Filter Example</title>
  <!-- Include Bootstrap and DataTables CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css">
</head>
<body>
  <div class="container">
    <h1>Date Range Filter Example</h1>
    
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="startDate">Start Date</label>
          <input type="date" class="form-control" id="startDate" name="startDate">
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label for="endDate">End Date</label>
          <input type="date" class="form-control" id="endDate" name="endDate">
        </div>
      </div>
    </div>
    
    <table id="myTable" class="table table-striped table-bordered">
      <thead>
        <tr>
          <th>Date</th>
          <th>Value</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2022-03-01</td>
          <td>10</td>
        </tr>
        <tr>
          <td>2022-03-10</td>
          <td>20</td>
        </tr>
        <tr>
          <td>2022-03-15</td>
          <td>30</td>
        </tr>
        <tr>
          <td>2022-03-25</td>
          <td>40</td>
        </tr>
      </tbody>
    </table>
  </div>
  
  <!-- Include jQuery, Bootstrap and DataTables JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>
  
  <script>
    $(document).ready(function() {
      // Initialize DataTable
      var table = $('#myTable').DataTable();
      
      // Add event listener for the date range filter
      $('#startDate, #endDate').on('change', function() {
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        
        // Perform date range filtering
        table.draw();
      });
      
      // Add custom date range filtering function
      $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex) {
          var startDate = $('#startDate').val();
          var endDate = $('#endDate').val();
          var currentDate = new Date(data[0]);
          
          if (startDate && endDate) {
            var start = new Date(startDate);
            var end = new Date(endDate);
            return (currentDate >= start && currentDate <= end);
          }
          
          return true;
        }
      );
    });
  </script>
</body>
</html>