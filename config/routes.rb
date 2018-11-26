Rails.application.routes.draw do
resources '/spells', to: 'api/v1/spells#index'
resources '/create-user', to: 'api/v1/users#create'
resources '/login', to: 'auth#create'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
