Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [:destroy ] 
  # outside of nesting because we don't talk about reviews, we just find reviews within
  # restaurant and destroy
  # nest collection actions (those that do not need an id), don't nest member actions
  #generates only two crud actions new, create and will nest within restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
