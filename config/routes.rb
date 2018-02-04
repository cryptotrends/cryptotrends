Rails.application.routes.draw do
  root 'pages#home'

  get '/:symbol' => 'pages#show'
end
