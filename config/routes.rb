Rails.application.routes.draw do
resources '/spells', to: 'api/v1/spells#index'
resources '/login', to: 'auth#create'
resources '/logout', to: 'auth#destroy'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
