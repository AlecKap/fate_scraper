Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/riddle', to: 'riddles#show'
  get '/game', to: 'game#index'
  get '/game/over', to: 'game#over'
end
