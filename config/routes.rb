Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'vacancies#index'
  resources :vacancies, :employees
  resources :skills, only: :create
end
