Rails.application.routes.draw do

  resources :proyectos

  root 'proyectos#index'

end
