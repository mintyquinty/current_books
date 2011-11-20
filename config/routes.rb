CurrentBooks::Application.routes.draw do
  #resources :books

  resources :reviews

  match 'books' => 'books#index'
  match 'books/:id' => 'books#show'
  match 'books/isbn/:ISBN' => 'books#show_from_isbn'
  match 'books/title/:Title' => 'books#show_from_title'
  match 'books/fulltitle/:TitleArticle/:Title' => 'books#show_from_full_title'
  match 'books/author/:AuthorLastName' => 'books#show_from_author_last_name'
  match 'books/author/:AuthorFirstName/:AuthorLastName' => 'books#show_from_author_full_name'
  match 'books/:id/edit' => 'books#edit'

end
