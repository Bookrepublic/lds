def update_records(klass, records)
  records.each { |r| klass.where(id: r[:id]).first_or_initialize.update_attributes!(r) }
  ActiveRecord::Base.connection.reset_pk_sequence! klass.table_name
end

update_records(Author, [
  {id: 1, first_name: 'Matteo', last_name: 'Scurati', biography: 'Un autore promettente, mai realmente sbocciato'},
  {id: 2, first_name: 'Giovanni', last_name: 'Arnone', biography: 'Voleva fare il grafico, ma ha poi fatto lo scrittore'},
  {id: 3, first_name: 'Matteo', last_name: 'Brambilla', biography: 'Scrivere poco. Ma poi perché?'}
])

update_records(Collection, [
  {id: 1, name: 'Letteratura'},
  {id: 2, name: 'Saggistica'}
])

update_records(AuthorBook, [
  {author_id: 1, book_id: 1},
  {author_id: 1, book_id: 2},
  {author_id: 1, book_id: 3},
  {author_id: 2, book_id: 4},
  {author_id: 2, book_id: 5},
  {author_id: 3, book_id: 6}
])

update_records(Book, [
  {id: 1, title: 'Un primo libro', description: 'Questo è proprio un bel libro, a detta di tutti', price: 3.99, pages: 100, isbn: '9788812345678', pubblication_date: '2000-04-01', collection_id: 1},
  {id: 2, title: 'Un secondo libro', description: 'Questo è proprio un bel libro, a detta di tutti. Come il primo in effetti, o forse di più.', price: 4.99, pages: 200, isbn: '9788812345679', pubblication_date: '2001-04-01', collection_id: 1},
  {id: 3, title: 'Un terzo libro', description: 'Per questo libro, qualcuno grida al capolavoro', price: 5.99, pages: 300, isbn: '9788812345680', pubblication_date: '2001-04-01', collection_id: 1},
  {id: 4, title: 'Un quarto libro', description: "Un libro di mezzo, in un periodo di pace per l\'autore", price: 6.99, pages: 400, isbn: '9788812345681', pubblication_date: '2002-04-01', collection_id: 1},
  {id: 5, title: 'Un quinto libro', description: 'Un nuovo inizio? Difficile a dirsi', price: 7.99, pages: 500, isbn: '9788812345682', pubblication_date: '2003-04-01', collection_id: 2},
  {id: 6, title: 'Un sesto libro', description: 'Forse la fine di una carriera letteraria', price: 8.99, pages: 600, isbn: '9788812345683', pubblication_date: '2004-04-01', collection_id: 2}
])
