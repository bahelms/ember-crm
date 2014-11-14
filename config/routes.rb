Rails.application.routes.draw do
  root to: "home#index"

  namespace :api do
    namespace :v1 do
      resources :leads 
    end
  end

  get "/ember_crm", to: "home#ember_crm"
  get "*path", to: "home#index"
end

