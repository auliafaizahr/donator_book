$(document).on('turbolinks:load', function() {
  // $('#myTable_donates thead tr').clone(true).appendTo( '#myTable_donates thead' );
  // $('#myTable_donates thead tr:eq(1) th').each( function (i) {
  //   var title = $(this).text();
  //   $(this).html( '<input type="text" placeholder="Search '+title+'" />' );

  //   $( 'input', this ).on( 'keyup change', function () {
  //     if ( table.column(i).search() !== this.value ) {
  //       table
  //           .column(i)
  //           .search( this.value )
  //           .draw();
  //     }
  //   } );
  // } );

  var table = $('#myTable_donates').DataTable( {
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

} );

