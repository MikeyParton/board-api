Rails.application.routes.draw do
  scope 'api' do
    post 'auth/login', to: 'users#login'
    post 'auth/signup', to: 'users#signup'
    get  'profile', to: 'users#profile'

    # As per advice in the rails docs, don't nest any resources deeper than one
    # level. In a lot of cases, we only need the parent to create the resource.
    # It can become very cumbersome to pass in parent and grandparent ids to
    # perform member actions

    resources :boards, except: [:edit, :new] do
      resources :lists, only: [:create], controller: 'board/lists'
      resources :cards, only: [:create], controller: 'board/cards'
    end

    resources :lists, only: [:update, :destroy]

    resources :cards, only: [:show, :update, :destroy] do
      resources :checklists, only: [:create], controller: 'card/checklists'
      member do
        post 'add_user'
        post 'remove_user'
      end
    end

    resources :checklists, only: [:update, :destroy] do
      resources :checklist_items, only: [:create], controller: 'checklist/checklist_items'
    end

    resources :checklist_items, only: [:update, :destroy] do
      member do
        put 'complete'
        put 'undo'
      end
    end
  end
end
