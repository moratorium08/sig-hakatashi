Rails.application.routes.draw do
  root 'hello#show'

  get '/days', to: 'hello#show_days'
  post '/days', to: 'hello#calc_days'
end
