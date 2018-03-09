Rails.application.routes.draw do
  resources :search_results
  resources :domain_formats
  resources :person_searches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
