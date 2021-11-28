Rails.application.routes.draw do

  namespace :admin do
    root 'sessions#new'
    resources :items, only: [:index, :new, :create,:show, :destroy]
    resources :customers, only: [:index, :show] do
      collection do
        patch :withdraw
      end
    end
    resources :orders, only: [:index, :show] do
      collection do
        get :index_all
      end
    end
    resources :informations, only: [:index, :show, :create, :delete]
  end

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resource :customer, only: [:show, :edit, :update] do
      collection do
        patch :withdraw
      end
    end

    resources :items, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    resources :carts,  only: [:index, :create, :update, :destroy] do
      collection do
        delete :destroy_all
      end
    end

    resources :orders, only: [:index, :show, :create] do
      collection do
        get :confirm
        get :complete
      end
    end

    resources :informations, only: [:index, :show]
  end



  devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
  }

  devise_for :customer, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

end