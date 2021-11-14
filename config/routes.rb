Rails.application.routes.draw do

  namespace :admin do
    resources :items, only: [:index, :new, :create, :destroy]
  end

  scope module: 'public' do
    root 'homes#top'
    get '/about' => 'homes#about'
    resource :customer, only: [:show, :edit, :update]
    patch '/customer/withdraw' => 'public/customers#withdraw'
    resources :items, only: [:index, :show]
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
  end



  devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
  }

  devise_for :customer, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

end