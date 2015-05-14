$( function() {
  // quick search regex
  var qsRegex;
  var buttonFilter;
  if ($('#fit_shelf').length > 0) {
    var $layout = 'fitRows'
  } else {
    var $layout = 'masonry'
  }

  // init Isotope
  var $container = $('.isotope').isotope({
    itemSelector: '.shelf__item',
    layoutMode: $layout,
    masonry: {
      isFitWidth: true,
    },
    getSortData: {
      title: '[data-title]',
      id: '[data-id]',
      author: '[data-author]',
    },
    sortAscending: {
      title: true,
      id: false,
    },
    filter: function() {
      var $this = $(this);
      var searchResult = qsRegex ? $this.text().match( qsRegex ) : true;
      var buttonResult = buttonFilter ? $this.is( buttonFilter ) : true;
      return searchResult && buttonResult;
    }
  });

  $('#sorts').on( 'click', '.search__sort__item', function() {
    var sortValue = $(this).attr('data-sort-value');
    $container.isotope({ sortBy: sortValue });
  });

  var filters = {};

  $('#filters').on( 'click', '.dialog__filter', function() {
    var $this = $(this);
    // get group key
    var $buttonGroup = $this.parents('.dialog__filters');
    var filterGroup = $buttonGroup.attr('data-filter-group');
    // set filter for group
    filters[ filterGroup ] = $this.attr('data-filter');
    // combine filters
    var filterValue = '';
    for ( var prop in filters ) {
      filterValue += filters[ prop ];
    }
    buttonFilter = filterValue;
    // set filter for Isotope
    $container.isotope();
  });

  // use value of search field to filter
  var $quicksearch = $('#quicksearch').keyup( debounce( function() {
    qsRegex = new RegExp( $quicksearch.val(), 'gi' );
    $container.isotope();
  }) );

  $('.dialog__filters').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', '.dialog__filter', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });

  $('.search__sort__items').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', '.search__sort__item', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });
});

// debounce so filtering doesn't happen every millisecond
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
    setTimeout( delayed, threshold || 100 );
  };
}
