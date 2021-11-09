Rails.application.routes.draw do
  namespace :admin do
    resources :items, only: [:index, :new, :create, :destroy]
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:password], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: 'public' do
    root 'homes#top'
    get '/about' => 'homes#about'
  end

end