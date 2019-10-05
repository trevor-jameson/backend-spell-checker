Rails.application.routes.draw do
resources '/spells', to: 'api/v1/spells#index'

post '/characters', to: 'api/v1/chars#create'
resources '/characters', to: 'api/v1/chars#index'
resources '/login', to: 'auth#create'
resources '/create-user', to: 'api/v1/users#create'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
