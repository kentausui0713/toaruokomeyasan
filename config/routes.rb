Rails.application.routes.draw do

  namespace :admin do
    resources :items, only: [:index, :new, :create, :destroy]
  end

  scope module: 'public' do
    root 'homes#top'
    get '/about' => 'homes#about'
    resource :customer, only: [:show, :edit, :update]
    get '/customer/withdraw' => 'public/customers#withdraw'
    resources :items, only: [:index, :show]
  end



  devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
  }

  devise_for :customer, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

end