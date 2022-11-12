Rails.application.routes.draw do

  namespace :public do
    root to:"homes#top"
    get "/items" => "items#index"
    get "/items/:id" => "items#show"
    get "/cart_items" => "cart_items#index"
    patch "cart_items/:id" => "cart_items#update"
    post "/cart_items" => "cart_items#create"
    delete "cart_items/:id" => "cart_items#destroy"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders
    resources :destinations
    get "/about" => "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/infomation/edit" => "customers#edit"
    patch "customers/infomasion" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    get "/customers/withdrawal" => "customers#withdrawal"
  end


  namespace :admin do

    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details

  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
