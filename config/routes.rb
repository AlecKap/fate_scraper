Rails.application.routes.draw do
  
  root 'welcome#index'

  get '/riddle', to: 'riddles#show'
  get '/game', to: 'game#index'
end
