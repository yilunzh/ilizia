Rails.application.routes.draw do
  resources :domain_email_formats
  resources :person_email_searches
  resources :email_formats
  resources :domains
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
