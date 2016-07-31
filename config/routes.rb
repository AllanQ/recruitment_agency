Rails.application.routes.draw do
  root 'vacancies#index'
  resources :vacancies, :employees, :skills
  get 'skills/find_id'
  get 'skills/add'
end
