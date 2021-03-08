Rails.application.routes.draw do
  resources :doctors, only: [:index]
  resources :surgeries, only: [:show]
  post "/surgeries/:id", to: "doctor_surgeries#create"
end
