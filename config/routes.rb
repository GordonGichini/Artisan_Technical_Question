Rails.application.routes.draw do
  root 'books#index'

  # Books: list and show 
  resources :books, only: [:index, :show] do
    # Route for borrowing a book
    post 'borrow', on: :member, to: 'borrowings#create'
  end

  # Borrowings: only the return action is needed
  resources :borrowings, only: [] do
    patch 'return', on: :member, to: 'borrowings#update'
  end

  # Users for sign up and profile page
  resources :users, only: [:new, :create, :show]

  # Simple session routes for login/logout
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
