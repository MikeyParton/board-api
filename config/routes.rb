Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api' do
    resources :boards, except: [:edit, :new]
    resources :lists, except: [:edit, :new]
    resources :cards, except: [:edit, :new]
  end
end
