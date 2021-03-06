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

update_records(AdminUser, [
  {id: 1, email:'admin@admin.it', password: 'password123', password_confirmation: 'password123'}
])

update_records(Collection, [
  {id: 1, name: 'Letteratura'},
  {id: 2, name: 'Saggistica'}
])

update_records(Tag, [
  {id: 1, tag: "Storia del mondo"},
  {id: 2, tag: 'Storie di Granieri'},
  {id: 3, tag: 'Storie di Sgarzi'}
])

update_records(PostTag, [
  {id: 1, tag_id: 1, post_id: 1},
  {id: 2, tag_id: 1, post_id: 2},
  {id: 3, tag_id: 2, post_id: 3},
  {id: 4, tag_id: 2, post_id: 4},
  {id: 5, tag_id: 3, post_id: 5},
  {id: 6, tag_id: 3, post_id: 1},
  {id: 7, tag_id: 2, post_id: 2},
  {id: 8, tag_id: 3, post_id: 3},

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
  {id: 1, title: 'Un primo libro', description: 'Questo è proprio un bel libro, a detta di tutti', price: 3.99, pages: 100, isbn: '9788812345678', pubblication_date: '2000-04-01', collection_id: 1, number: 1, public: true},
  {id: 2, title: 'Un secondo libro', description: 'Questo è proprio un bel libro, a detta di tutti. Come il primo in effetti, o forse di più.', price: 4.99, pages: 200, isbn: '9788812345679', pubblication_date: '2001-04-01', collection_id: 1, number: 2, public: true},
  {id: 3, title: 'Un terzo libro', description: 'Per questo libro, qualcuno grida al capolavoro', price: 5.99, pages: 300, isbn: '9788812345680', pubblication_date: '2001-04-01', collection_id: 1, number: 3, public: true},
  {id: 4, title: 'Un quarto libro', description: "Un libro di mezzo, in un periodo di pace per l\'autore", price: 6.99, pages: 400, isbn: '9788812345681', pubblication_date: '2002-04-01', collection_id: 1, number: 4, public: true},
  {id: 5, title: 'Un quinto libro', description: 'Un nuovo inizio? Difficile a dirsi', price: 7.99, pages: 500, isbn: '9788812345682', pubblication_date: '2003-04-01', collection_id: 2, number: 5, public: true},
  {id: 6, title: 'Un sesto libro', description: 'Forse la fine di una carriera letteraria', price: 8.99, pages: 600, isbn: '9788812345683', pubblication_date: '2004-04-01', collection_id: 2, number: 6, public: true},
])

update_records(Post, [
  {id:1, title: 'Un primo post', subtitle: 'Questo è solo un sottotitolo', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2000-01-01', status: true, user_id: 2},
  {id:2, title: 'Un secondo post, più intimista del precedente', subtitle: 'Come definire la propria vita se non in relazione a quella degli altri?', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2001-01-01', status: true, user_id: 2},
  {id:3, title: 'Un terzo posto di un nuovo autore', subtitle: 'Perché fare scrivere un solo autore? Ecco qui un nuovo incredibile scrittore.', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2002-01-01', status: true, user_id: 1},
  {id:3, title: 'Un terzo posto di un nuovo autore', subtitle: 'Perché fare scrivere un solo autore? Ecco qui un nuovo incredibile scrittore.', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2002-01-01', status: true, user_id: 1},
  {id:4, title: 'Un quarto post dedicato al sentimento più bello che esista', subtitle: 'Quale sia nessun lo sa, meno che mai io', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2003-01-01', status: true, user_id: 1},
  {id:5, title: 'Un articolo in bozza', subtitle: 'Tanto è una bozza, scrivo poi quel cavolo che voglio', excerpt: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", article: "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.</p>", date: '2004-01-01', status: false, user_id: 2},
])

update_records(Video, [
  {id:1, video: "https://youtube.com/embed/Skpu5HaVkOc", title: 'Un video recuperato', description: 'Questo è un video proprio bellino'},
  {id: 2, video: 'https://www.youtube.com/embed/8gqqX7ZdwyI', title: 'Ancora un video tanto bellino capace di attirare click come non mai', description: 'In questo caso possiamo dire, senza, indugio che il titolo dice già tutto da sé'},
  {id: 3, video: 'https://www.youtube.com/embed/Sf242s0YwpY', title: 'Ultimo cortometraggio di un grande cineasta', description: 'Come ricordare il lavoro di un grande artista? Forse questo video basterà a dircelo. Forse no. E allora sarà tutto finito. Per sempre.'}
])

update_records(BookVideo, [
  {id:1, book_id: 1, video_id: 1},
  {id:2, book_id: 2, video_id: 2},
  {id:3, book_id: 2, video_id: 3},
])

update_records(AuthorVideo, [
  {id:1, author_id: 1, video_id: 1},
  {id:2, author_id: 2, video_id: 2},
  {id:3, author_id: 2, video_id: 3},
])

update_records(VideoTag, [
  {id:1, tag_id: 1, video_id: 1},
  {id:2, tag_id: 2, video_id: 2},
  {id:3, tag_id: 1, video_id: 2},
  {id:4, tag_id: 3, video_id: 3}
])

update_records(Sponsor, [
  {id:1, first_name: 'Friedrich', last_name: 'Nietzsche', biography: "Tra i massimi filosofi e prosatori di ogni tempo, Nietzsche ebbe un'influenza controversa, ma indiscutibile, sul pensiero filosofico, letterario, politico e scientifico del Novecento. La sua filosofia, appartenente al filone delle filosofie della vita, è considerata da alcuni uno spartiacque fra la filosofia tradizionale e un nuovo modello di riflessione, informale e provocatorio. In ogni caso, si tratta di un pensatore unico nel suo genere, sì da giustificare l'enorme influenza da lui esercitata sul pensiero posteriore."},
  {id:2, first_name: 'George Wilhelm Friedrich', last_name: 'Hegel', biography: "È autore di una delle linee di pensiero più profonde e complesse della tradizione occidentale. Partendo dal lavoro dei suoi predecessori nell'idealismo (Fichte e Schelling) e con influenze e suggestioni di altri sistemi di pensiero, sviluppò una filosofia innovativa, profonda e articolata. La sua visione storicista e idealista della realtà nel suo complesso ha rivoluzionato il pensiero europeo, gettando le basi della filosofia continentale e del marxismo successivi."},
  {id:3, first_name: 'Friedrich', last_name: 'Schelling', biography: "Schelling nacque a Leonberg, in Germania, da un colto sacerdote protestante. Ragazzo precoce, gli fu concesso di entrare a soli quindici anni nel Tübinger Stift, il seminario di Tubinga, dove studiò teologia assieme a Friedrich Hölderlin e Georg W. F. Hegel, coi quali si legò in amicizia. L'entusiasmo suscitato in lui dal rinnovamento culturale che sembrava innescato dal pensiero kantiano e dalla rivoluzione francese, lo spinse ad accogliere e assimilare rapidamente la filosofia di Fichte. Nel 1796 si trasferì come precettore a Lipsia, dove si occupò di scienze naturali. Il successo delle sue prime opere gli fece ottenere nel 1798 una cattedra a Jena, dove frequentò il circolo romantico legandosi ai maggiori esponenti del Romanticismo: Goethe, Novalis, Schiller, Hölderlin, i fratelli Wilhelm e Friedrich Schlegel, e Fichte, della cui cattedra diventò ben presto il successore, dopo che quegli era stato costretto alle dimissioni. Sempre a Jena Schelling ritrovò anche Hegel; insieme, i due collaborarono alla pubblicazione del Giornale critico della filosofia. All'interno del circolo romantico Schelling conobbe Caroline Michaelis, sposata con Wilhelm August von Schlegel, ma da cui ella si separerà per diventare sua moglie. Cominciarono intanto a manifestarsi gravi dissapori e polemiche con Fichte, dovute più che altro all'incapacità di ciascuno dei due di comprendere il punto di vista dell'altro."}
])

update_records(SponsorVideo, [
  {id:1, sponsor_id: 1, video_id: 1},
  {id:2, sponsor_id: 2, video_id: 2},
  {id:3, sponsor_id: 1, video_id: 2},
  {id:4, sponsor_id: 3, video_id: 3}
])

update_records(Pubblication, [
  {id: 1, title:"Un anno sull'altipiano"},
  {id: 2, title:"La montagna incantata"},
  {id: 3, title:"Moby dick"},
  {id: 4, title: "Nudge"},
  {id: 5, title: 'Un libro inventato senza autore'}
])

update_records(Writer, [
  {id: 1, first_name: "Emilio", last_name: "Lussu"},
  {id: 2, first_name: 'Thomas', last_name: 'Mann'},
  {id: 3, first_name: 'Herman', last_name: 'Melville'},
  {id: 4, first_name: 'Cass', last_name: 'Sunstein'},
  {id: 5, first_name: 'Richard', last_name: 'Thaler'},
  {id: 6, first_name: 'Autore', last_name: 'Inventato'}
])

update_records(PubblicationWriter, [
  {id: 1, pubblication_id: 1, writer_id: 1},
  {id: 2, pubblication_id: 2, writer_id: 2},
  {id: 3, pubblication_id: 3, writer_id: 3},
  {id: 4, pubblication_id: 4, writer_id: 4},
  {id: 5, pubblication_id: 4, writer_id: 5}
])

update_records(VideoPubblication, [
  {id: 1, pubblication_id: 1, video_id: 1},
  {id: 2, pubblication_id: 2, video_id: 1},
  {id: 3, pubblication_id: 3, video_id: 2},
  {id: 4, pubblication_id: 5, video_id: 3}
])

update_records(VideoWriter, [
  {id: 1, writer_id: 4, video_id: 1},
  {id: 2, writer_id: 6, video_id: 2}
])
