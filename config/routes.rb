Rails.application.routes.draw do

  namespace :public do

    resources :items
    resources :cart_items
    resources :orders
    resources :destinations
    get "/" => "homes#top"
    get "/about" => "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/infomation/edit" => "customers#edit"
    patch "customers/infomasion" => "customers#update"
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
