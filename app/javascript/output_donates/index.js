$(document).on('turbolinks:load', function() {
  var table = $('#myTable_output').DataTable( {
      orderCellsTop: true,
      fixedHeader: true,
      responsive: true,
      autoWidth: false,

      "footerCallback": function ( row, data, start, end, display ) {
      var api = this.api(), data;

      // Remove the formatting to get integer data for summation
      var intVal = function ( i ) {
          return typeof i === 'string' ?
              i.replace(/[\$,]/g, '')*1 :
              typeof i === 'number' ?
                  i : 0;
      };

      // Total over all pages
      total = api
          .column( 2 )
          .data()
          .reduce( function (a, b) {
              return intVal(a) + intVal(b);
          }, 0 );

      // Total over this page
      pageTotal = api
          .column( 2, { page: 'current'} )
          .data()
          .reduce( function (a, b) {
              return intVal(a) + intVal(b);
          }, 0 );

      // Update footer
    $( api.column( 2 ).footer() ).html(
          'Rp'+pageTotal +' ( Rp '+ total +' total)'
      );
    }
  } );

  window.onresize = function() {
    table.columns.adjust().responsive.recalc();
  }

  setTimeout(function() {
    $('.alert').slideUp();
  }, 1000);


} );

