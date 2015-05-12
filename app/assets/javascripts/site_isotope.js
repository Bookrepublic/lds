$( function() {
  var qsRegex;

  var $container = $('.isotope').isotope({
    itemSelector: '.shelf__item',
    layoutMode: 'fitRows',
    filter: function() {
      return qsRegex ? $(this).text().match( qsRegex ) : true;
    }
  });

  var $quicksearch = $('#quicksearch').keyup( debounce( function() {
    qsRegex = new RegExp( $quicksearch.val(), 'gi' );
    $container.isotope();
  }, 200 ) );

  $('#filters').on( 'click', '.dialog__filter', function() {
    var $this = $(this);
    var $buttonGroup = $this.parents('.dialog__filters');
    var filterGroup = $buttonGroup.attr('data-filter-group');
    // set filter for group
    filters[ filterGroup ] = $this.attr('data-filter');
    // combine filters
    var filterValue = '';
    for ( var prop in filters ) {
      filterValue += filters[ prop ];
    }
    // set filter for Isotope
    $container.isotope({ filter: filterValue });
  });

  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });
});

function debounce( fn, threshold ) {
  var timeout;
  return function debounced() {
    if ( timeout ) {
      clearTimeout( timeout );
    }
    function delayed() {
      fn();
      timeout = null;
    }
    timeout = setTimeout( delayed, threshold || 100 );
  }
}
