Rails.application.routes.draw do
  root 'vacancies#index'
  resources :vacancies, :employees, :skills
  get 'skills/find_id'
  get 'vacancy/remove_skill'
end
