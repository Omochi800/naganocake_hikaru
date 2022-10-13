Rails.application.routes.draw do
  namespace :public do
    root to:'homes#top'
    resources :items
    resources :registrations
    resources :customers
    resources :cart_items
    resources :orders
    resources :destinations
    
  end
  namespace :admin do
    resources :items
    resources :genres
    resources :cutomers
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
