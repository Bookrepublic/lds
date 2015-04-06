def update_records(klass, records)
  records.each { |r| klass.where(id: r[:id]).first_or_initialize.update_attributes!(r) }
  ActiveRecord::Base.connection.reset_pk_sequence! klass.table_name
end

update_records(Author, [
  {id: 1, first_name: 'Matteo', last_name: 'Scurati', biography: 'Un autore promettente, mai realmente sbocciato'},
  {id: 2, first_name: 'Giovanni', last_name: 'Arnone', biography: 'Voleva fare il grafico, ma ha poi fatto lo scrittore'},
  {id: 3, first_name: 'Matteo', last_name: 'Brambilla', biography: 'Scrivere poco. Ma poi perché?'}
])

update_records(User, [
  {id: 1, first_name: 'Severo', last_name: 'Utente', biography: "Fin da piccolo è stato considerato un personaggio severo, al limite dell'ostracismo verso se stesso.", email: 'severo@severo.it', password: 'password123', password_confirmation: 'password123'},
  {id: 2, first_name: 'Marco', last_name: 'Ferrario', biography: 'Gli anni 80 non sono \'epoca storica. Gli anni 80 sono uno stato mentale', email: 'marco@ferrario.it', password: 'password123', password_confirmation: 'password123'}
])

update_records(Collection, [
  {id: 1, name: 'Letteratura'},
  {id: 2, name: 'Saggistica'}
])

update_records(AuthorBook, [
  {id: 1, author_id: 1, book_id: 1},
  {id: 2, author_id: 1, book_id: 2},
  {id: 3, author_id: 1, book_id: 3},
  {id: 4, author_id: 2, book_id: 4},
  {id: 5, author_id: 2, book_id: 5},
  {id: 6, author_id: 3, book_id: 6}
])

update_records(Book, [
  {id: 1, title: 'Un primo libro', description: 'Questo è proprio un bel libro, a detta di tutti', price: 3.99, pages: 100, isbn: '9788812345678', pubblication_date: '2000-04-01', collection_id: 1},
  {id: 2, title: 'Un secondo libro', description: 'Questo è proprio un bel libro, a detta di tutti. Come il primo in effetti, o forse di più.', price: 4.99, pages: 200, isbn: '9788812345679', pubblication_date: '2001-04-01', collection_id: 1},
  {id: 3, title: 'Un terzo libro', description: 'Per questo libro, qualcuno grida al capolavoro', price: 5.99, pages: 300, isbn: '9788812345680', pubblication_date: '2001-04-01', collection_id: 1},
  {id: 4, title: 'Un quarto libro', description: "Un libro di mezzo, in un periodo di pace per l\'autore", price: 6.99, pages: 400, isbn: '9788812345681', pubblication_date: '2002-04-01', collection_id: 1},
  {id: 5, title: 'Un quinto libro', description: 'Un nuovo inizio? Difficile a dirsi', price: 7.99, pages: 500, isbn: '9788812345682', pubblication_date: '2003-04-01', collection_id: 2},
  {id: 6, title: 'Un sesto libro', description: 'Forse la fine di una carriera letteraria', price: 8.99, pages: 600, isbn: '9788812345683', pubblication_date: '2004-04-01', collection_id: 2}
])

update_records(Post, [
  {id:1, title: 'Un primo post', subtitle: 'Questo è solo un sottotitolo', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2000-01-01', status: true, user_id: 2}
])
