Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api' do
    post 'auth/login', to: 'users#login'
    post 'auth/signup', to: 'users#signup'

    resources :boards, except: [:edit, :new] do
      resources :lists, except: [:edit, :new], controller: 'board/lists'
      resources :cards, except: [:edit, :new], controller: 'board/cards'
    end
  end
end
